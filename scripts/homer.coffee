# Description:
#   Homer Simpson quotes - Modified from original to remove try, food & internet quotes
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   beer - replies with random beer quote
#
# Author:
#   bhankus

beerQuotes = [
  "Beer... Now there's a temporary solution.",
  "All right, brain. You don't like me and I don't like you, but let's just do this and I can get back to killing you with beer.",
  "Mmmm... beer",
  "Beer: The cause of, and solution to, all of life's problems.",
  "Beer, beer, beer, bed, bed, bed.",
  "I would kill everyone in this room for a drop of sweet beer."
]

module.exports = (robot) ->
  robot.hear /beer/i, (msg) ->
    msg.send msg.random beerQuotes
