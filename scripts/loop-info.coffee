# Description:
#   Information for Loop!
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   standup - Give information about standup
#   loop wiki - Give the loop wiki page
#   invite standup - How to add more people to the standup
#   repo, repository - What's my repository?
#
# Author:
#   bhankus

module.exports = (robot) ->
  robot.respond /standup/i, (msg) ->
    msg.send "Standups happen at 8am PT on Mon (alt), Tue, Wed and Thur. The notes place is https://docs.google.com/document/d/1zTRjghpxL_znjE8BJTiZgOsYUuUrtkpYsajodeT9aiA/edit"

  robot.respond /loop wiki/i, (msg) ->
    msg.send "Loop's wiki page is https://wiki.mozilla.org/Loop"

  robot.respond /invite.*standup/i, (msg) ->
    msg.send "Please create a pull request to https://github.com/Standard8/loop-irc-bot"

  robot.respond /repository/i, (msg) ->
    msg.send "My repository is https://github.com/Standard8/loop-irc-bot"

  robot.respond /repo/i, (msg) ->
    msg.send "My repository is https://github.com/Standard8/loop-irc-bot"
