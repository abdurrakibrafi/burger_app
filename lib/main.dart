import 'package:burgerapp/pages/intro_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key,});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return ProviderScope(
      
      child: MaterialApp(
        title: 'Flutter Demo',
       
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // ignore: prefer_const_constructors
        home: MyHomePage(title: '',),
     
         debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 8)).then((value) {
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (ctx) =>  IntroPage()));
    });
  }

  Widget build(BuildContext context) {
     double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              
              children: [
                Positioned(
                  width: double.infinity,
                
                  child: Container(
    height: MediaQuery.of(context).size.height*0.55,
      // height: w*0.99,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft:  Radius.circular(70),bottomRight:  Radius.circular(70),),
        color: Color(0xFFFF7A21),
        
        border: Border.all(width: 3,color: Colors.grey,style: BorderStyle.solid)
      ),
      child: Center(child: Text('')),
    ),
                )
              ],
            ),
            
            Padding(
              padding: const EdgeInsets.only(top:180),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  height: h*0.5,
                  child: Image(
                    image: AssetImage(
                      'images/burger-removebg-preview.png',
                    ),
                    width: 290,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 65),
                  child: Column(
                    children: [
                      Text(
                        'Get Ready For Taste',
                        style: TextStyle(letterSpacing: 1.8),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              SpinKitSquareCircle(
                  color: Color(0xFFFF7A21),
                  size: 40.0,
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
