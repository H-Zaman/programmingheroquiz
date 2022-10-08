import 'package:flutter/material.dart';
import 'package:programmingheroquiz/my_app.dart';
import 'package:programmingheroquiz/src/utilities/local_storage.dart';

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await LocalStorage.initialize();

  runApp(const MyApp());
}