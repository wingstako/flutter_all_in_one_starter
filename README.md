# Flutter All In One Starter

Flutter starter pack integrated with common features trying to remove the boilerplate development experience.

## 📋 Features
---

- [x] Firebase Email Login
- [x] Firebase Crashlytics
- [x] Localization
- [x] Provider-based Authentication / Navigation
- [] Third-parties login (Apple, Google, etc)
- [] Dynamic theme control

## 📱 Screenshots
---

<p>
<img src="/screenshots/ios-login.png" width="150"> 
<img src="/screenshots/ios-lang.png" width="150">
<img src="/screenshots/ios-feature.png" width="150">
</p>

## 🔥 Getting Started
---

### Rename the application

First change the ```name``` in ```pubspec.yaml```.

Then you can global search for ``` com.wingstako.flutterallinone ``` and replace with your application id.

### Firebase configuraion
Firebase settings can be found in **firebase_options.dart**. I recommend using the [ *flutterfire* ]('https://firebase.flutter.dev/docs/cli/') CLI for generating the setting file.

Run ```flutterfire configure``` after installing the CLI. 


### Localization configuration
This project use **EasyLocalization** for handling locales. You can checkout their [*repository*]('https://github.com/aissat/easy_localization') for more information. 

