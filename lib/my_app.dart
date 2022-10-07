import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:programmingheroquiz/root_bindings.dart';
import 'package:programmingheroquiz/src/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Programming Hero Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.abelTextTheme()
      ),
      initialBinding: RootBindings(),
      home: const HomeScreen(),
    );
  }
}