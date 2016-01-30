# Calabash Tests

Run for android:

 * start emulator
 * run:

 > calabash-android run ~/Documents/dipl/TelegramAndroid/TMessagesProj/build/outputs/apk/TMessagesProj-release.apk -p android features/firststeps.feature

Run for ios:

> cucumber -p ios features/firststeps.feature


## Relevant Configuration
Some parts of the configuration can be found in config/cucumber.yml. Furthermore
Android specific Configuration is in .calabash_settings
