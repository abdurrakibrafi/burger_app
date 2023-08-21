import 'package:burgerapp/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  User? user =FirebaseAuth.instance.currentUser;
  UserModel loggedInUser=UserModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
    .collection('users')
    .doc(user!.uid)
    .get()
    .then((value) {
      this.loggedInUser=UserModel.fromMap(value.data());
      setState((){

      });
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Welcome'),
        centerTitle: true,  
      ),
      body: Center(
        child: Padding(padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
           children: [
            Text("${loggedInUser.firstName} ${loggedInUser.secondName}"),
            Text('${loggedInUser.email}'),
            SizedBox(
              height: 15,
            ),
            ActionChip(label: Text("Logout"),onPressed: (){
              logout(context);
            },)
           ],
        ),
        
        ),
      ),
    );
  }

  Future <void> logout (BuildContext context)async{
    await FirebaseAuth.instance.signOut();
    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> IntroPage()));
  }
}