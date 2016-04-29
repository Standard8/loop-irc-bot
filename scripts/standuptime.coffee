# Description:
#   Managing Standup times
# Commands:
#   teststanduptime - Test today's standup message (no names mentioned)

TIMEZONE = "US/Pacific"
# On fridays pretend it is standup
STANDUP_TIME_1 = '50 7 * * 1,2,3,4' # M,T,W,Th 07:50
STANDUP_TIME_2 = '58 7 * * 1,2,3,4' # M,T,W,Th 07:58
STANDUP_TIME_3 = '00 8 * * 1,2,3,4' # M,T,W,Th 08:00
STANDUP_TIME_1F = '20 7 * * 5' # F 07:20
STANDUP_TIME_2F = '28 7 * * 5' # F 07:28
STANDUP_TIME_3F = '30 7 * * 5' # F 07:30

ROOM = "#loop"

DEFAULT_PEOPLE = "/cc Standard8, dmose, fcampo, Mardak, mancas, dcritch, crafuse, ianbicking, fzzzy"

RANDOM_STANDUP_MESSAGES = [
  "Standup", "Standup", "Standup", "Standup", "Standup",
  "Standup", "Standup", "Standup", "Standup", "Standup",
  "Standup", "Standup", "Standup", "Standup", "Standup",
  "Standup", "Standup", "Standup", "Standup", "Standup",
  "Standup", "Standup", "Standup", "Standup", "Standup",
  "Standup", "Standup", "Standup", "Standup", "Standup",
  "Sit-down",
  "Time to battle with Vidyo",
  "Standup"
]

cronJob = require('cron').CronJob

getWeekNumber = (d) ->
  # Copy date so don't modify original
  d = new Date(+d)
  d.setHours(0,0,0)
  # Set to nearest Thursday: current date + 4 - current day number
  # Make Sunday's day number 7
  d.setDate(d.getDate() + 4 - (d.getDay()||7))
  # Get first day of year
  yearStart = new Date(d.getFullYear(),0,1)
  # Calculate full weeks to nearest Thursday
  weekNo = Math.ceil(( ( (d - yearStart) / 86400000) + 1)/7)
  # Return week number (year would be: d.getFullYear())
  weekNo

getMeetingInfo = (d) ->
  weekNo = getWeekNumber(d)

  if weekNo % 2 == 1 and d.getDay() == 2
    ["Firefox Desktop meeting", "https://wiki.mozilla.org/Firefox/Meeting"]
  else if weekNo % 2 == 0 and d.getDay() == 1
    ["Planning meeting"]
  else
    randomMessage = RANDOM_STANDUP_MESSAGES[ Math.floor(Math.random() * RANDOM_STANDUP_MESSAGES.length) ]
    [randomMessage, "https://docs.google.com/document/d/1zTRjghpxL_znjE8BJTiZgOsYUuUrtkpYsajodeT9aiA/edit"]

messageRoomWithTime = (robot, people, date, howLong, includeExtra) ->
  info = getMeetingInfo(date)
  robot.messageRoom ROOM, info[0] + " " + howLong + " " + people
  if includeExtra and info.length > 1
    robot.messageRoom ROOM, info[1]

module.exports = (robot) ->
  robot.hear /teststanduptime/i, (msg) ->
    msg.send messageRoomWithTime(robot, "<fake people>", new Date, "in test mins!", true)

  standup1 = new cronJob STANDUP_TIME_1,
    ->
      messageRoomWithTime(robot, DEFAULT_PEOPLE, new Date, "in 10 mins", true)
    null
    true
    TIMEZONE

  standup1F = new cronJob STANDUP_TIME_1F,
    ->
      robot.messageRoom ROOM, "Standup in 10 mins " + DEFAULT_PEOPLE
    null
    true
    TIMEZONE

  standup2 = new cronJob STANDUP_TIME_2,
    ->
      messageRoomWithTime(robot, DEFAULT_PEOPLE, new Date, "in 2 mins", false)
    null
    true
    TIMEZONE

  standup2F = new cronJob STANDUP_TIME_2F,
    ->
      robot.messageRoom ROOM, "Standup in 2 mins " + DEFAULT_PEOPLE
    null
    true
    TIMEZONE

  standup3 = new cronJob STANDUP_TIME_3,
    ->
      messageRoomWithTime(robot, DEFAULT_PEOPLE, new Date, "now!", false)
    null
    true
    TIMEZONE

  standup3F = new cronJob STANDUP_TIME_3F,
    ->
      robot.messageRoom ROOM, "Standup now! " + DEFAULT_PEOPLE
    null
    true
    TIMEZONE
