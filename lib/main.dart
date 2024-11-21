import 'package:firebase_setup/Home_page.dart';
import 'package:firebase_setup/signin_screen.dart';
import 'package:firebase_setup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'CRUD/AddnewPost.dart';
import 'CRUD/DisplayPosts.dart';
import 'Weather_API/weather.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Check if Firebase is already initialized
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Web App',
      theme: ThemeData(primarySwatch: Colors.blue),
    //  home: ,
      initialRoute: '/', // This is the first screen
      routes: {
        '/': (context) => SignUpScreen(), // The home screen
        '/sign-in': (context) => SignInScreen(), // The sign-in screen
        '/weather' : (context) => WeatherScreen(),
        '/addPost' :(context) =>AddNewPost(),
        '/showPosts' :(context) => RetrievePosts(),

      },
    );
  }
}




