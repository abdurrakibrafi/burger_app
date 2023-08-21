import 'dart:typed_data';

import 'package:burgerapp/controllers/image_picker.dart';
import 'package:burgerapp/data/profile_data.dart';
import 'package:burgerapp/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';



class MyDrwerHerader extends StatefulWidget {
   String ? userId;
   MyDrwerHerader ({Key ? key,this.userId}): super(key:key);

  @override
  State<MyDrwerHerader> createState() => _MyDrwerHeraderState();
}

class _MyDrwerHeraderState extends State<MyDrwerHerader> {
 
  Uint8List? _image;
  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  void saveProfile() async {
    String resp = await StoreProfileImgData().saveData(file: _image!);
  }



  //firebase auth biniding
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFF7A21),
      width: double.infinity,
      height: 300,
      padding: EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              _image != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 38.0),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: MemoryImage(_image!),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 38.0),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            'https://e7.pngegg.com/pngimages/84/165/png-clipart-united-states-avatar-organization-information-user-avatar-service-computer-wallpaper.png'),
                      ),
                    ),
              Positioned(
                child: IconButton(
                  onPressed: selectImage,
                  icon: Icon(Icons.add_a_photo),
                  iconSize: 30,
                  color: Colors.white,
                ),
                bottom: 0,
                left: 60,
              ),
            ],
          ),
          ElevatedButton(onPressed:saveProfile , child: Text('Upload Image')),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(
              "${loggedInUser.firstName} ${loggedInUser.secondName}",
              style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Text(
            "${loggedInUser.email}",
            style: TextStyle(fontSize: 16, color: Colors.white),
          )
        ],
      ),
    );
  }
}
