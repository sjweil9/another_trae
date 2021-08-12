# Another Trae

A Twitter bot that retweets and likes all posts from Trae Young that say
"Another Day, Another Opportunity 💯"

## Use

Create a Twitter developer account (https://developer.twitter.com). Generate API Keys. Create yourself a .env file.

```
export TWITTER_CONSUMER_KEY=(Your API Key)
export TWITTER_CONSUMER_SECRET=(Your API Key Secret)
export TWITTER_ACCESS_TOKEN=(Your Access Token)
export TWITTER_ACCESS_TOKEN_SECRET (Access Token Secret). 
```

You can source this file from your `~/.bash_profile` or equivalent on whatever machine you plan to run the bot, or whatever other approach you prefer to make sure all the above variable names are successfully set in your ENV. 

Make sure to create a twitter_ids.txt file in the directory with the script.

The simplest way to run is to set up a cron to run the script every day / hour / however frequently you want to check. Edit `/etc/crontab` to add a cron with `ruby /path/to/script`. 
