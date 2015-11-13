var Twit = require('twit')

var T = new Twit({
    consumer_key:         'zb8z7z7cqeQ3Wz1ZdZNUyxJCj'
  , consumer_secret:      'FcxjfHgjGfOedMjWvIXlwE7SuFQGQ4snVd6NfFWgxKW2ev3hJ1'
  , access_token:         '166312715-JHFN4Xmv0GYLqmSZTfKmNjryAftSMGfSzeXuFgpZ'
  , access_token_secret:  'l3kXEmj7cCd4XoqZBsPz9WyYP1hoVB10iG42sAbtbpvnw'
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

  // other params:
  // tweet.id - id of tweet
  // tweet.user.screen_name - twitter name
});