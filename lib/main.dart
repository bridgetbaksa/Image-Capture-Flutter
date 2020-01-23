import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: Text('Image Capture'),
              backgroundColor: Color(0xFF045D71),
            ),
            body: Center(
                child: MyImagePicker()
            )
        )
    );
  }
}


class MyImagePicker extends StatefulWidget {
  @override
  MyImagePickerState createState() => MyImagePickerState();
}

class MyImagePickerState extends State {

  // Holds Image Path
  File imageURI;

  Future getImageFromCamera() async {

    //Opens Android/iOS camera and waits for user to take a picture.
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      imageURI = image;
    });
  }

  Future getImageFromGallery() async {

    //Opens Android/iOS Photo Gallery and waits for user to select an image
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      imageURI = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  imageURI == null
                      ? Image(image: AssetImage('assets/image-placeholder.png'), width: 300, height: 200, fit: BoxFit.cover,)
                      : Image.file(imageURI, width: 300, height: 200, fit: BoxFit.cover),

                  Container(
                      margin: EdgeInsets.fromLTRB(0, 40, 0, 20),
                      //padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      child: RaisedButton(
                        onPressed: () => getImageFromCamera(),
                        child: Text('Select Image From Camera'),
                        textColor: Colors.white,
                        color: Color(0xFF045D71),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      )),

                  Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: RaisedButton(
                        onPressed: () => getImageFromGallery(),
                        child: Text('Select Image From Gallery'),
                        textColor: Colors.white,
                        color: Color(0xFF045D71),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ))
                ]))
    );
  }
}