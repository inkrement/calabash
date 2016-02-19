# Calabash Tests

Run for android:

 * start emulator (e.g. open `android avg` and start device)
 * run:

```
calabash-android run ../TelegramAndroid/TMessagesProj/build/outputs/apk/TMessagesProj-release.apk -p android features/firststeps.feature
```

Run for ios:

> cucumber -p ios features/firststeps.feature


## Relevant Configuration
Some parts of the configuration can be found in config/cucumber.yml. Furthermore
Android specific Configuration is in .calabash_settings
