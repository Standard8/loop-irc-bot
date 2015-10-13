# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:
#   hubot ping - Reply with pong
#   hubot echo <text> - Reply back with <text>
#   hubot time - Reply with current time

TIMEZONE = "US/Pacific"
# On fridays pretend it is standup
STANDUP_TIME_1 = '50 7 * * 1,2,3,4' # M,T,W,Th 07:50
STANDUP_TIME_2 = '58 7 * * 1,2,3,4' # M,T,W,Th 07:58
STANDUP_TIME_3 = '00 8 * * 1,2,3,4' # M,T,W,Th 08:00
STANDUP_TIME_1F = '20 7 * * 5' # F 07:20
STANDUP_TIME_2F = '28 7 * * 5' # F 07:28
STANDUP_TIME_3F = '30 7 * * 5' # F 07:30

#MEETING_TIME_1 = '50 7 * * 2' # T 07:50
#MEETING_TIME_2 = '58 7 * * 2' # T 07:58
ROOM = "#loop"

cronJob = require('cron').CronJob

module.exports = (robot) ->
  standup1 = new cronJob STANDUP_TIME_1,
    ->
      robot.messageRoom ROOM, "Standard8: dmose: abr: shell: mikedeboer: andrei: fcampo: Mardak: mancas: dcritch: crafuse: ianbicking: Standup in 10 mins"
    null
    true
    TIMEZONE

  standup1F = new cronJob STANDUP_TIME_1F,
    ->
      robot.messageRoom ROOM, "Standard8: dmose: abr: shell: mikedeboer: andrei: fcampo: Mardak: mancas: dcritch: crafuse: ianbicking: Standup in 10 mins"
    null
    true
    TIMEZONE

  standup2 = new cronJob STANDUP_TIME_2,
    ->
      robot.messageRoom ROOM, "Standard8: dmose: abr: shell: mikedeboer: andrei: fcampo: Mardak: mancas: dcritch: crafuse: ianbicking: Standup in 2 mins"
      robot.messageRoom ROOM, "https://docs.google.com/document/d/1zTRjghpxL_znjE8BJTiZgOsYUuUrtkpYsajodeT9aiA/edit"
    null
    true
    TIMEZONE

  standup2F = new cronJob STANDUP_TIME_2F,
    ->
      robot.messageRoom ROOM, "Standard8: dmose: abr: shell: mikedeboer: andrei: fcampo: Mardak: mancas: dcritch: crafuse: ianbicking: Standup in 2 mins"
    null
    true
    TIMEZONE

  standup3 = new cronJob STANDUP_TIME_3,
    ->
      robot.messageRoom ROOM, "Standard8: dmose: abr: shell: mikedeboer: andrei: fcampo: Mardak: mancas: dcritch: crafuse: ianbicking: Standup now!"
    null
    true
    TIMEZONE

  standup3F = new cronJob STANDUP_TIME_3F,
    ->
      robot.messageRoom ROOM, "Standard8: dmose: abr: shell: mikedeboer: andrei: fcampo: Mardak: mancas: dcritch: crafuse: ianbicking: Standup now!"
    null
    true
    TIMEZONE

#  meeting1 = new cronJob MEETING_TIME_1,
#    ->
#      robot.messageRoom ROOM, "Standard8: NiKo`: tOkeshu: dmose: shell: abr: mikedeboer:"
#      robot.messageRoom ROOM, "Planning meeting in 10 mins"
#    null
#    true
#    TIMEZONE

#  meeting2 = new cronJob MEETING_TIME_2,
#    ->
#      robot.messageRoom ROOM, "Standard8: NiKo`: tOkeshu: dmose: shell: abr: mikedeboer:"
#      robot.messageRoom ROOM, "Planning meeting in 2 mins"
#    null
#    true
#    TIMEZONE
