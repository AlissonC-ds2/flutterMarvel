import 'package:marvel/src/hero_page.dart';
import 'package:marvel/src/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeView(),
      routes: {
        '/hero': (_) => const HeroPage(),
        //'/cadastro': (_) => const CadastroPage(),
      },
    );
  }
}