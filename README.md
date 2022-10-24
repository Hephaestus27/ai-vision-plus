# AiAssistantApp Project = Client Side

The AiAssistantApp project created in flutter (v3.0.4-stable). AiAssistantApp supports both web and mobile.


## Getting Started

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Development

Before you can build this project, you must install and configure the following dependencies on your machine:

1. windows config :
- Download flutter for windows version : flutter_windows_3.0.4-stable
- extract in folder tools (example C:\dev\stage\tools => C:\dev\stage\tools\flutter)
- set envrionnment variable : FLUTTER_HOME = C:\dev\stage\tools\flutter
  and add %FLUTTER_HOME%\bin to the 'path'
- open a new terminal (cmd) and try :  flutter --version

## How to Use

**Step 1:**

Download or clone the project repository

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies:

```
flutter pub get 
```

**Step 3:**

```
flutter run
```

## Note

For Vs code users, it is preferable to install the extensions : "Flutter" and "Dart" so you can run the project

## Features:

* ObjectDetection
* Text to speech

### Up-Coming Features:

* Connectivity Support
* Background Fetch Support

### Libraries & Tools Used

*  camera: V0.9.4+1
*  image_picker: V0.8.4+11

### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- assets
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- pages/
|- main.dart

```

Now, lets dive into the lib folder which has the main code for the application.

```
1- pages - All different pages of the application is located in this folder. This directory contains the following pages  `home page`, `camera page`.

```


## Fix ':tflite'  No signature of method .android() is applicable for argument types
Update android/build.gradle  : use  com.android.tools.build:gradle:4.1.0
dependencies {
classpath 'com.android.tools.build:gradle:4.1.0'
...
}
Update android/app/build.gradle => set minSdkVersion to 19
defaultConfig {
...
minSdkVersion 19
...
}

## utils
flutter pub get
flutter pub add package
flutter pub remove package
flutter pub cache clean