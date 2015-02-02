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
#   beer - replies with random beer quote
#
# Author:
#   bhankus

module.exports = (robot) ->
  robot.respond /standup/i, (msg) ->
    msg.send "Standups happen at 8am PT on Mon (alt), Tue, Wed and Thur. The etherpad is https://etherpad.mozilla.org/haeLwWEkZV"

  robot.respond /loop wiki/i, (msg) ->
    msg.send "Loop's wiki page is https://wiki.mozilla.org/Loop"

