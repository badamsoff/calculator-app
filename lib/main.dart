import 'package:badamsoff/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(240, 241, 243, 1),
        appBar: AppBar( 
          title: const Text('Badams Calculator',  
            style: TextStyle(
              fontSize: 24.0, 
              fontWeight: FontWeight.bold)
              ),

          backgroundColor: const Color.fromRGBO(157, 76, 241, 1), 
          ),
        body: const HomePage(),
      ),
    );
  }
}
