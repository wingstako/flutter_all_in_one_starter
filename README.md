# Flutter All In One Starter

Flutter starter pack integrated with common features trying to remove the boilerplate development experience.

## 📋 Features

- Firebase Email Login
- Firebase Crashlytics
- Localization
- Provider-based Authentication / Navigation

### Todo:
- Third-parties login (Apple, Google, etc)
- Dynamic theme control

## 📱 Screenshots

<p>
<img src="/screenshots/ios-login.png" width="150"> 
<img src="/screenshots/ios-lang.png" width="150">
<img src="/screenshots/ios-feature.png" width="150">
</p>

## 🔥 Getting Started

### Rename the application

First change the ```name``` in ```pubspec.yaml```.

Then you can global search for ``` com.wingstako.flutterallinone ``` and replace with your application id.

### Firebase configuraion
Firebase settings can be found in **firebase_options.dart**. I recommend using the <a href="https://firebase.flutter.dev/docs/cli/">*flutterfire*</a> CLI for generating the setting file.

Run ```flutterfire configure``` after installing the CLI. 


### Localization configuration
This project use **EasyLocalization** for handling locales. You can checkout their <a href="https://github.com/aissat/easy_localization">*repository*</a> for more information. 

