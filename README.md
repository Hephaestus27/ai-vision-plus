<div align='center'>

<h1>Ai Vision Plus</h1>
<p>Using Tensorflow's TFLITE model technology and flutter , I made an android application that detects objects that are near the user using the front or back camera and play the objects names using TTS feature</p>

<h4> <span> · </span> <a href="https://github.com/Hephaestus27/Ai Vision Plus /blob/master/README.md"> Documentation </a> <span> · </span> <a href="https://github.com/Hephaestus27/Ai Vision Plus /issues"> Report Bug </a> <span> · </span> <a href="https://github.com/Hephaestus27/Ai Vision Plus /issues"> Request Feature </a> </h4>


</div>

# :notebook_with_decorative_cover: Table of Contents

- [About the Project](#star2-about-the-project)
- [FAQ](#grey_question-faq)
- [License](#warning-license)
- [Contact](#handshake-contact)
- [Acknowledgements](#gem-acknowledgements)


## :star2: About the Project

### :dart: Features
- Real-time Object detection using front or back camera
- TTS
- Object detection for an already saved image


### :art: Color Reference
| Color | Hex |
| --------------- | ---------------------------------------------------------------- |
| Primary Color | ![#6f3bab](https://via.placeholder.com/10/6f3bab?text=+) #6f3bab |
| Secondary Color | ![#402dba](https://via.placeholder.com/10/402dba?text=+) #402dba |
| Accent Color | ![#d6e3e4](https://via.placeholder.com/10/d6e3e4?text=+) #d6e3e4 |
| Text Color | ![#EEEEEE](https://via.placeholder.com/10/EEEEEE?text=+) #EEEEEE |

## :toolbox: Getting Started

### :bangbang: Prerequisites
  
Before you can build this project, you must install and configure the following dependencies on your machine:

1. windows config :
- Download flutter for windows version : flutter_windows_3.0.4-stable, you can install Flutter<a href="https://docs.flutter.dev/get-started/install">Here</a>
- extract in folder tools (example C:\dev\stage\tools => C:\dev\stage\tools\flutter)
- set envrionnment variable : FLUTTER_HOME = C:\dev\stage\tools\flutter
  and add %FLUTTER_HOME%\bin to the 'path'
- open a new terminal (cmd) and try :  flutter --version

2. Mac & Linux Config :
   - Flutter's official setup guide on <a href="https://docs.flutter.dev/get-started/install/macos/desktop">MacOs</a> and <a href="https://docs.flutter.dev/get-started/install/linux">Linux</a>
  
### :running: Run Locally

Clone the project

```bash
https://github.com/Hephaestus27/ai-vision-plus
```
Go to the root directory
```bash
cd ai-vision-plus
```
Install flutter dependencies
```bash
flutter pub get
```
Run the application
```bash
flutter run
```
### 📓Note

For Vs code users, it is preferable to install the extensions : "Flutter" and "Dart" so you can run the project

## 🌠Features:

* ObjectDetection
* Text to speech

### ✔️ Up-Coming Features:

* Connectivity Support
* Background Fetch Support

### 📚 Libraries & Tools Used

*  camera: V0.9.4+1
*  image_picker: V0.8.4+11

### 📁 Folder Structure

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
pages - All different pages of the application is located in this folder. This directory contains the following pages  `home page`, `camera page`.

```


## Fix ':tflite'  No signature of method .android() is applicable for argument types
Update android/build.gradle  : use  com.android.tools.build:gradle:4.1.0
```
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

```

## utils
flutter pub get
flutter pub add package
flutter pub remove package
flutter pub cache clean

## :wave: Contributing

<a href="https://github.com/Hephaestus27/ai-vision-plus/graphs/contributors"> <img src="https://contrib.rocks/image?repo=Louis3797/awesome-readme-template" /> </a>

Contributions are always welcome!

### :scroll: Code of Conduct

Please read the [Code of Conduct](https://github.com/Hephaestus27/ai-vision-plus/blob/master/CODE_OF_CONDUCT.md)

## :grey_question: FAQ

- What libraries & tools are being used ?
- I used : camera: V0.9.4+1 and image_picker: V0.8.4+11 which can both be downloaded in the flutter pub website : https://pub.dev/


## :warning: License

Distributed under the no License. See LICENSE.txt for more information.

## :handshake: Contact

Hephy - [My twitter](http://twitter.com/h3ph1_) - yassinesindel@gmail.com

Project Link: [https://github.com/Hephaestus27/ai-vision-plus](https://github.com/Hephaestus27/ai-vision-plus)

## :gem: Acknowledgements

Use this section to mention useful resources and libraries that you have used in your projects.

- [Flutter documentation](https://docs.flutter.dev/)
- [Tensorflow Lite documentation](https://www.tensorflow.org/lite/api_docs?hl=fr)
