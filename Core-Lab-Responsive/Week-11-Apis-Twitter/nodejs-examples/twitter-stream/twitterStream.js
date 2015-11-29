var Twit = require('twit')

var T = new Twit({
    consumer_key:         ''
  , consumer_secret:      ''
  , access_token:         ''
  , access_token_secret:  ''
})


//
// filter the public stream by english tweets containing `#christmas`
//
var stream = T.stream('statuses/filter', { track: '#christmas', language: 'en' })

stream.on('tweet', function (tweet) {
  // console.log(tweet);
  
  if(tweet.text.startsWith('RT ')){
  	// don't show retweets
  }else{
	  console.log("--------------------");
	  console.log(tweet.user.name);
	  console.log(tweet.text);
	  console.log(tweet.created_at);
  }

  var su = new SpeechSynthesisUtterance();
  su.lang = "es";
  su.text = "hola";
  //speechSynthesis.speak(su);
  // other params:
  // tweet.id - id of tweet
  // tweet.user.screen_name - twitter name
});