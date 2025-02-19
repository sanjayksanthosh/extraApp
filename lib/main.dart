import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/proviers/loginProvier.dart';
import 'package:testapp/proviers/taskProvier.dart';
import 'package:testapp/screen/loginScreen.dart';

void main() {
  runApp(  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Loginprovier()),
        ChangeNotifierProvider(create: (_) => Taskprovier()),
      ],
      child: const MainApp(),
    ),);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:Loginscreen()
    );
  }
}
