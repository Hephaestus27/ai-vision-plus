import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:ai_vision_plus/realtime/bounding_box.dart';
import 'package:ai_vision_plus/realtime/camera.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:math' as math;
import 'package:tflite/tflite.dart';

class LiveFeed extends StatefulWidget {
  final List<CameraDescription> cameras;
  LiveFeed(this.cameras);
  @override
  _LiveFeedState createState() => _LiveFeedState();
}

class _LiveFeedState extends State<LiveFeed> {
  List<dynamic>? _recognitions;
  int _imageHeight = 0;
  int _imageWidth = 0;
  
  
  final FlutterTts tts = FlutterTts();
  
  speak() async{
    await tts.setLanguage('en');
    await tts.setSpeechRate(0.4);
    /*_recognitions.map((re) {
    }).toList();*/
    _recognitions?.forEach((element) => tts.speak(element["detectedClass"]));
    //await tts.speak(text);
  }

  initCameras() async {

  }
  loadTfModel() async {
    await Tflite.loadModel(
      model: "assets/models/ssd_mobilenet.tflite",
      labels: "assets/models/labels.txt",
    );
  }
  /* 
  The set recognitions function assigns the values of recognitions, imageHeight and width to the variables defined here as callback
  */
  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  @override
  void initState() { 
    super.initState();
    loadTfModel();
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Real Time Object Detection"),
      ),
      body: Stack(
        children: <Widget>[
          CameraFeed(widget.cameras, setRecognitions),
          BoundingBox(
            _recognitions ?? [],
            math.max(_imageHeight, _imageWidth),
            math.min(_imageHeight, _imageWidth),
            screen.height,
            screen.width,
          ),
            
              Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                color: Colors.amber,
                minWidth: screen.width,
                height: screen.height/10,
              onPressed: () => speak(), // TEXT TO SPEECH FUNCTION HERE
              child: const Text("TEXT TO SPEECH"),
              ),
              )
            ],
           )
             

      );

  }
}