import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class StaticImage extends StatefulWidget {

  @override
  _StaticImageState createState() => _StaticImageState();
}

class _StaticImageState extends State<StaticImage> {
  File? _image;
  List? _recognitions;
  bool? _busy;
  double? _imageWidth;
  double _imageHeight =1;

  final picker = ImagePicker();

  // this function loads the model
  loadTfModel() async {
    await Tflite.loadModel(
      model: "assets/models/ssd_mobilenet.tflite",
      labels: "assets/models/labels.txt",
    );
  }

  // this function detects the objects on the image
  detectObject(File image) async {
    var recognitions = await Tflite.detectObjectOnImage(
      path: image.path,       // required
      model: "SSDMobileNet",
      imageMean: 127.5,     
      imageStd: 127.5,      
      threshold: 0.4,       // defaults to 0.1
      numResultsPerClass: 10,// defaults to 5
      asynch: true          // defaults to true
    );
    FileImage(image)
        .resolve(const ImageConfiguration())
        .addListener((ImageStreamListener((ImageInfo info, bool _) {
          setState(() {
            _imageWidth = info.image.width.toDouble();
            _imageHeight = info.image.height.toDouble();
          });
        }))); 
    setState(() {
      _recognitions = recognitions;
    });
  }

  @override
  void initState() { 
    super.initState();
    _busy = true;
    loadTfModel().then((val) {{
      setState(() {
        _busy = false;
      });
    }});

  }
  // display the bounding boxes over the detected objects
  List<Widget> renderBoxes(Size screen) {
    if (_recognitions == null) return [];
    if (_imageWidth == null || _imageHeight == null) return [];

    double factorX = screen.width;
    double factorY = _imageHeight / _imageHeight * screen.width;

    Color blue = Colors.blue;

    return _recognitions!.map((re) {
      return Container(
        child: Positioned(
          left: re["rect"]["x"] * factorX,
          top: re["rect"]["y"] * factorY,
          width: re["rect"]["w"] * factorX,
          height: re["rect"]["h"] * factorY,
          child: ((re["confidenceInClass"] > 0.50))? Container(
              decoration: BoxDecoration(
                border: Border.all(
                color: blue,
                width: 3,
              )
            ),
            child: Text(
              "${re["detectedClass"]} ${(re["confidenceInClass"] * 100).toStringAsFixed(0)}%",
              style: TextStyle(
                background: Paint()..color = blue,
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ) : Container()
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<Widget> stackChildren = [];

    stackChildren.add(
      Positioned(
        // using ternary operator
        child: _image == null ? 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
             Text("Please Select an Image"),
          ],
        )
      : // if not null then 
        Container(
          child:Image.file(_image!)
        ),
      )
    );

    stackChildren.addAll(renderBoxes(size));

    if (_busy!) {
      stackChildren.add(
        const Center(
          child: CircularProgressIndicator(),
        )
      );
    }
       var screen = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
       toolbarHeight: 50,
        title: const Text("Object Detector"),
      ),
     body: Center(
        child: Column(
          
          children: <Widget>[
  
         ButtonTheme(

         child:  MaterialButton(
               color: Colors.deepPurple,
               minWidth: screen.width,
               height: (screen.height-100)/2,
            onPressed: getImageFromCamera,
            child: const Text("TAKE A PICTURE",style: TextStyle(
              fontSize: 30
            ),
            ),
          ),
         ),
         
          ButtonTheme(child: const SizedBox(width: 10,),
          ),
          
          ButtonTheme(
            child:MaterialButton(
               color: Colors.lightBlue,
               minWidth: screen.width,
               height: (screen.height-100)/2,
              onPressed: getImageFromGallery,
               child: const Text("IMPORT A PICTURE",style: TextStyle(
              fontSize: 30
            ),
            ),
          ),
          )
        ],
      ),
    
    )
    );
  }
  // gets image from camera and runs detectObject
  Future getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if(pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print("No image Selected"); 
      }
    });
    detectObject(_image!);
  }
  // gets image from gallery and runs detectObject
  Future getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if(pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print("No image Selected");
      }
    });
    detectObject(_image!);
  }
}