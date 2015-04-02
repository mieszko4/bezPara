var express = require('express')
  , logger = require('express-logger')
  , cookieParser = require('cookie-parser')
  , bodyParser = require('body-parser')
  , methodOverride = require('express-method-override')
  , session = require('express-session')
  , passport = require('passport')
  , util = require('util')
  , TwitterStrategy = require('passport-twitter').Strategy
  , Sequelize = require('sequelize')
  , fs = require('fs');

// configuration
var fs = require('fs');
var buf = fs.readFileSync('configuration.json');
var config = JSON.parse(buf.toString());

console.log(config);

var sequelize = new Sequelize(config.db.name, config.db.username, config.db.password, {
  host: config.db.host
});

/*
// Passport session setup.
//   To support persistent login sessions, Passport needs to be able to
//   serialize users into and deserialize users out of the session.  Typically,
//   this will be as simple as storing the user ID when serializing, and finding
//   the user by ID when deserializing.  However, since this example does not
//   have a database of user records, the complete Twitter profile is serialized
//   and deserialized.
passport.serializeUser(function(user, done) {
  done(null, user);
});

passport.deserializeUser(function(obj, done) {
  done(null, obj);
});

// Use the TwitterStrategy within Passport.
//   Strategies in passport require a `verify` function, which accept
//   credentials (in this case, a token, tokenSecret, and Twitter profile), and
//   invoke a callback with a user object.
passport.use(new TwitterStrategy({
    consumerKey: config.twitter.TWITTER_CONSUMER_KEY,
    consumerSecret: config.twitter.TWITTER_CONSUMER_SECRET,
    callbackURL: config.twitter.callbackURL //"http://bezpara.listup.co/api/auth/twitter/callback"
  },
  function(token, tokenSecret, profile, done) {
    // asynchronous verification, for effect...
    process.nextTick(function () {
      
      // To keep the example simple, the user's Twitter profile is returned to
      // represent the logged-in user.  In a typical application, you would want
      // to associate the Twitter account with a user record in your database,
      // and return that user instead.
      return done(null, profile);
    });
  }
));
*/
var app = express();
// configure Express
app.use(logger({path: 'output.log'}));
app.use(cookieParser());
app.use(bodyParser());
app.use(methodOverride());
app.use(session({ secret: 'keyboard cat' }));
// Initialize Passport!  Also use passport.session() middleware, to support
// persistent login sessions (recommended).

/*
app.use(passport.initialize());
app.use(passport.session());
*/
  

app.get('/account', ensureAuthenticated, function(req, res){
  res.render('account', { user: req.user });
});

app.get('/login', function(req, res){
  res.render('login', { user: req.user });
});

// GET /auth/twitter
//   Use passport.authenticate() as route middleware to authenticate the
//   request.  The first step in Twitter authentication will involve redirecting
//   the user to twitter.com.  After authorization, the Twitter will redirect
//   the user back to this application at /auth/twitter/callback
app.get('/api/auth/twitter',
  passport.authenticate('twitter'),
  function(req, res){
    // The request will be redirected to Twitter for authentication, so this
    // function will not be called.
  });

// GET /auth/twitter/callback
//   Use passport.authenticate() as route middleware to authenticate the
//   request.  If authentication fails, the user will be redirected back to the
//   login page.  Otherwise, the primary route function function will be called,
//   which, in this example, will redirect the user to the home page.
app.get('/api/auth/twitter/callback', 
  passport.authenticate('twitter', { failureRedirect: '/login' }),
  function(req, res) {
    console.log(req.user);    
    res.redirect('/');
  });

app.get('/api/auth/logout', function(req, res){
  req.logout();
  console.log('logged out');
  res.redirect('/');
});

app.post('/api/gift/:id/disable', function(req, res) {
  var username = req.query.username;

  var query = "UPDATE gift SET enabled = 0 WHERE ID = " + req.params.id;

  sequelize.query(query).success(function() {
	  res.json({});
	});
});

// Gifts
app.get('/api/gift', function(req, res) {

  console.log(sequelize);
  console.log(req.query.type);

  var type = req.query.type;
  var username = req.query.username;

  console.log(username);
  // Default === all
  var query = "SELECT g.ID, t.name, u.twitter_screen_name AS username, NOW(), g.datetime_created, TIMESTAMPDIFF(SECOND, g.datetime_created, NOW()) AS time_ago  FROM gift AS g LEFT JOIN tag AS t ON t.ID = g.ID_tag LEFT JOIN user AS u ON g.ID_user = u.ID";

  if(type === 'my' && username != undefined) { 
    query = "SELECT g.ID, t.name, u.twitter_screen_name AS username, NOW(), g.datetime_created, TIMESTAMPDIFF(SECOND, g.datetime_created, NOW()) AS time_ago  FROM gift AS g LEFT JOIN tag AS t ON t.ID = g.ID_tag LEFT JOIN user AS u ON g.ID_user = u.ID WHERE u.twitter_screen_name = '" + username + "'";
  } else if (type === 'interested' && username != undefined) {
    query = "SELECT g.ID, t.name, u.twitter_screen_name AS username, NOW(), g.datetime_created, TIMESTAMPDIFF(SECOND, g.datetime_created, NOW()) AS time_ago  FROM gift AS g LEFT JOIN tag AS t ON t.ID = g.ID_tag LEFT JOIN user AS u ON g.ID_user = u.ID INNER JOIN user_tag AS ut ON ut.ID_tag = t.ID AND ut.ID_user = u.ID WHERE u.twitter_screen_name = '" + username + "'";

  }


  sequelize.query(query).success(function(gifts) {
    //console.log(gifts);
    res.json(gifts);
  });
});


app.post('/api/gift', function(req, res) {
  console.log(req.body);

  var username = req.query.username;
  
  var query = "INSERT IGNORE INTO user(twitter_screen_name) VALUES('" + username + "')";
  
  sequelize.query(query).success(function() {
	
	var query = "SELECT * FROM user WHERE twitter_screen_name = '" + username + "'";

	  sequelize.query(query).success(function(user) {
		
		
		
		if(user.length <= 0) {

			return;
		}
		
		var query = "SELECT * FROM tag WHERE name = '" + req.body.name + "'";
		console.log(query);
		
		sequelize.query(query).success(function(tag) {
		  if(tag.length > 0) {
			query = "INSERT INTO gift(ID_user, ID_tag, name, datetime_created) VALUES(" + user[0].ID + "," + tag[0].ID + ", '" + req.body.name + "', NOW())";
			console.log(query);
			sequelize.query(query).success(function() {
			  res.json(req.body);
			});
		  } else {
			query = "INSERT INTO tag(name) VALUES('" + req.body.name + "')";

			sequelize.query(query).success(function() {
			  var query = "SELECT * FROM tag WHERE name = '" + req.body.name + "'";

			  console.log(query);


				sequelize.query(query).success(function(tag) {
				  query = "INSERT INTO gift(ID_user, ID_tag, name, datetime_created) VALUES(" + user[0].ID + "," + tag[0].ID + ", '" + req.body.name + "', NOW())";
						console.log(query);
						sequelize.query(query).success(function() {
						  res.json(req.body);
						});

				});

	   
			});

		  }
		});
	 

		query = "INSERT INTO gift(ID_user, name, datetime_created) VALUES(" + user[0].ID + ", '" + req.body.name + "', NOW())";
		console.log(query);
		sequelize.query(query).success(function() {
		   res.json(req.body);
		});
	  });
	
  });
  
});

console.log(config.general.port);
app.listen(parseInt(config.general.port));


// Simple route middleware to ensure user is authenticated.
//   Use this route middleware on any resource that needs to be protected.  If
//   the request is authenticated (typically via a persistent login session),
//   the request will proceed.  Otherwise, the user will be redirected to the
//   login page.
function ensureAuthenticated(req, res, next) {
  if (req.isAuthenticated()) { return next(); }
  res.redirect('/login')
}
