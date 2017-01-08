# Forgeddit

Forgeddit was an Iron Yard assignment in which we were tasked with creating a Reddit-style rails app. Users can post "shares" to the stream, comment on them, and up and down vote them. They can edit and delete their own comments and shares, and edit their own profile. The title of the post links to the webpage that is being shared. The title of a share may be no longer than 200 characters and the link must be a valid web link.

The site was published live to Heroku at https://secure-bastion-40242.herokuapp.com/

## Testing
The test suite can be run with the command '$rails test'

## DB Structure
Users have many shares and votes. Shares have many votes and votes belong to user and shares. A user may only up or down vote a share once. If they have upvoted a share, they may down vote to 0 and then down vote one more time to -1, at which point they can't down-vote a share anymore. Shares and users have many comments.
