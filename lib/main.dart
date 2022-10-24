import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:ai_vision_plus/realtime/live_camera.dart';
import 'package:ai_vision_plus/static%20image/static.dart';
List<CameraDescription>? cameras;

Future<void> main() async {
  // initialize the cameras when the app starts
  WidgetsFlutterBinding.ensureInitialized();
  cameras ??= await availableCameras();
  
  // running the app
  runApp(
    MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    )
  );
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
       var screen = MediaQuery.of(context).size;
      
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        toolbarHeight: 50,
        title: Text("Object Detector App"),
        
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info),
            onPressed: aboutDialog,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

           
            ButtonTheme(
              
              height: (screen.height -100.0)/2,
              
              child: MaterialButton(
                color: Colors.amber,
                minWidth: screen.width,
                 child: const Text("Detect in Image",style: TextStyle(
                  fontSize: 40,
                  ),), 
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => StaticImage(),
                    ),
                  );
                },
              ),
            ),
            ButtonTheme(
              height: (screen.height -100)/2,
              child: MaterialButton(
                color : Colors.purple,
                minWidth: screen.width,
                child: const Text("Real Time Detection",style: TextStyle(
                  fontSize: 40,
                  ),), 
                
                onPressed:() {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => LiveFeed(cameras!),
                    ),
                  );
                  
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  aboutDialog(){
     showAboutDialog(
      context: context,
      applicationName: "Ai Vision+",
      applicationLegalese: "By DEVAKTUS",
      applicationVersion: "1.0",
      children: <Widget>[
        Text("www.devaktus.com"),
      ],
    );
  }

}