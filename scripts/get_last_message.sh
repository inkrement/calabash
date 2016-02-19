#!/bin/bash
#
# This script searches for the newest message from `Telegram` and extracts the confirmation code.
# It is necessary that the telegram-cli tool (https://github.com/vysheng/tg) is installed and configured
#
# Edit the `TELEGRAM_PATH` variable to point to your telegram-cli client and the key
USER_NAME='Dominik_Pichler'
TELEGRAM_PATH='~/.telegram-cli'

TELEGRAM="$TELEGRAM_PATH/bin/telegram-cli -k $TELEGRAM_PATH/server.pub"
#echo -e "search Telegram code\nsearch Telegram code\n" | eval "$TELEGRAM" 2> /dev/null | egrep "Your login code: ([0-9]*)" | tail -n 1 | sed 's/.*code: //' | xargs echo -n

# Due to a bug in the telegram-cli it is necessary to request the contact list once and then perform the actual command
(sleep 1; echo "contact_list"; sleep 1; echo "history $USER_NAME 1") | eval "$TELEGRAM" | egrep "\[[0-9]*:[0-9]*\]" | tail -n 1 | perl -pe 's/\e\[?.*?[\@-~]//g' |xargs echo -n
