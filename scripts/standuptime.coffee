# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:
#   hubot ping - Reply with pong
#   hubot echo <text> - Reply back with <text>
#   hubot time - Reply with current time

TIMEZONE = "US/Pacific"
STANDUP_TIME_1 = '50 8 * * 2,4-5' # M,W-T 08:50
STANDUP_TIME_2 = '58 8 * * 2,4-5' # M,W-T 08:58
MEETING_TIME_1 = '50 7 * * 3' # T 07:50
MEETING_TIME_2 = '58 7 * * 3' # T 07:57
RETROSPECTIVE_TIME_1 = '20 7 * * 6' # F 07:20
RETROSPECTIVE_TIME_2 = '28 7 * * 6' # F 07:28
ROOM = "#talkilla"

cronJob = require('cron').CronJob

module.exports = (robot) ->
  standup1 = new cronJob STANDUP_TIME_1,
    ->
      robot.messageRoom ROOM, "Standard8: NiKo`: tOkeshu: dmose: flo-retina: Standup in 10 mins"
    null
    true
    TIMEZONE

  standup2 = new cronJob STANDUP_TIME_2,
    ->
      robot.messageRoom ROOM, "Standard8: NiKo`: tOkeshu: dmose: flo-retina: Standup in 2 mins"
    null
    true
    TIMEZONE

  meeting1 = new cronJob MEETING_TIME_1,
    ->
      robot.messageRoom ROOM, "Weekly meeting in 10 mins"
    null
    true
    TIMEZONE

  meeting2 = new cronJob MEETING_TIME_2,
    ->
      robot.messageRoom ROOM, "Weekly meeting in 2 mins, agenda & minutes: https://webrtc-apps.etherpad.mozilla.org/weekly"
    null
    true
    TIMEZONE

  standup1 = new cronJob RETROSPECTIVE_TIME_1,
    ->
      robot.messageRoom ROOM, "Weekly retrospective in 10 mins"
    null
    true
    TIMEZONE

  standup2 = new cronJob RETROSPECTIVE_TIME_2,
    ->
      robot.messageRoom ROOM, "Weekly retrospective in 2 mins, minutes: https://webrtc-apps.etherpad.mozilla.org/20"
    null
    true
    TIMEZONE
