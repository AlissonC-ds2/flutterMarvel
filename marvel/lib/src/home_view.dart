import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marvel/model/models.dart';
import 'package:marvel/src/hero_page.dart';
import 'package:marvel/src/repository_marvel.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  RepositoryMarvel repository = RepositoryMarvel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Heróis'),
      ),
      drawer: _constroiDrawer(),
    );
  }

  Widget _constroiDrawer() {
    return  Drawer(
        child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: Text('Menu'),
          ),
          ListTile(
            title: const Text('Herois'),
            onTap: () {
              Navigator.pushNamed(context, '/hero');

            },
          ),
          ListTile(
            title: const Text('Quadrinhos'),
            onTap: () {
              // Update the state of the app.
              // ...

              Navigator.pop(context);
            },
          ),
        ],
        ),
      );
  }
}