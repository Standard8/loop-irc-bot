# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:
#   hubot ping - Reply with pong
#   hubot echo <text> - Reply back with <text>
#   hubot time - Reply with current time

TIMEZONE = "US/Pacific"
# On fridays pretend it is standup
STANDUP_TIME_1 = '50 7 * * 1,2,3,4,5' # M,T,W,Th,F 07:50
STANDUP_TIME_2 = '58 7 * * 1,2,3,4' # M,T,W,Th 07:58
STANDUP_TIME_2a = '58 7 * * 5' # F 07:58
STANDUP_TIME_3 = '00 8 * * 1,2,3,4,5' # M,T,W,Th,F 08:00

#MEETING_TIME_1 = '50 7 * * 2' # T 07:50
#MEETING_TIME_2 = '58 7 * * 2' # T 07:58
ROOM = "#loop"

cronJob = require('cron').CronJob

module.exports = (robot) ->
  standup1 = new cronJob STANDUP_TIME_1,
    ->
      robot.messageRoom ROOM, "Standard8: NiKo`: tOkeshu: dmose: mreavy: shell: mikedeboer: jaws: MattN: gavin: Standup in 10 mins"
    null
    true
    TIMEZONE

  standup2 = new cronJob STANDUP_TIME_2,
    ->
      robot.messageRoom ROOM, "Standard8: NiKo`: tOkeshu: dmose: mreavy: shell: mikedeboer: jaws: MattN: gavin: Standup in 2 mins"
      robot.messageRoom ROOM, "https://etherpad.mozilla.org/haeLwWEkZV"
    null
    true
    TIMEZONE

  standup2a = new cronJob STANDUP_TIME_2a,
    ->
      robot.messageRoom ROOM, "Standard8: NiKo`: tOkeshu: dmose: mreavy: shell: mikedeboer: jaws: MattN: gavin: Standup in 2 mins"
    null
    true
    TIMEZONE

  standup3 = new cronJob STANDUP_TIME_3,
    ->
      robot.messageRoom ROOM, "Standard8: NiKo`: tOkeshu: dmose: mreavy: shell: mikedeboer: jaws: MattN: gavin: Standup now!"
    null
    true
    TIMEZONE

#  meeting1 = new cronJob MEETING_TIME_1,
#    ->
#      robot.messageRoom ROOM, "Standard8: NiKo`: tOkeshu: dmose: mreavy: shell: abr: mikedeboer:"
#      robot.messageRoom ROOM, "Planning meeting in 10 mins"
#    null
#    true
#    TIMEZONE

#  meeting2 = new cronJob MEETING_TIME_2,
#    ->
#      robot.messageRoom ROOM, "Standard8: NiKo`: tOkeshu: dmose: mreavy: shell: abr: mikedeboer:"
#      robot.messageRoom ROOM, "Planning meeting in 2 mins"
#    null
#    true
#    TIMEZONE
