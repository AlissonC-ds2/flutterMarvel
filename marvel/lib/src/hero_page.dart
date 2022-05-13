import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:marvel/model/models.dart';
import 'package:marvel/src/repository_marvel.dart';
import 'package:http/http.dart' as http;

class HeroPage extends StatefulWidget {  
  const HeroPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HeroPage(); 
}

class _HeroPage extends State<HeroPage> {
  bool _carregando = false;
  late Data _datawrapper;
  RepositoryMarvel repository = RepositoryMarvel();
  List<String> nomeDescricao = []; 
  Widget customSearchBar = const Text('Herois da Marvel');
  Icon customIcon = const Icon(Icons.search);
  final TextEditingController _filter = TextEditingController();
  Timer? _timerInputSearch;


  @override
  void initState() {
    super.initState();
    _init();
    _registerListenerInputSearch();
  }

  void _registerListenerInputSearch() {
    _filter.addListener(_changeInputSearch);
  }

  Future<void> _init() async {
    setState(() {
      _carregando = true;
    });
    final result = await repository.getHeroes();
    setState(() {
      _datawrapper = result;
      _carregando = false;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customSearchBar,
        automaticallyImplyLeading: false,
        actions :[
          IconButton(
            onPressed: () {
              setState(() {
                if (customIcon.icon == Icons.search) {
                  customIcon = const Icon(Icons.close);
                  customSearchBar = TextField(
                    controller: _filter,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Procure...'
                    ),
                  );
                } else {
                  customIcon = const Icon(Icons.search);
                  customSearchBar = const Text('Pesquisar Herois');
                  //filteredNames = names;
                  _filter.clear();
                }
              });        
            },
            icon: customIcon,
          )
        ],
        centerTitle: true,
      ),
      drawer: _constroiDrawer(),
      body: _constroiBody(),
    );
  }


  Widget _constroiBody() {
    if (_carregando) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return ListView.builder(
      itemCount: _datawrapper.results.length,
      itemBuilder: (context, index) => _buildText(index),
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
              // Update the state of the app.
              // ...
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            title: const Text('Quadrinhos'),
            onTap: () {
              // Update the state of the app.
              // ...

              //Navigator.pop(context);
            },
          ),
        ],
        ),
      );
  }
  
  Widget _buildText(int index) {
    final heroi = _datawrapper.results[index];

    return ListTile(
      leading: _constroiImagem(heroi),
      title: Text(heroi.name),
      subtitle: Text(heroi.description),
    );
  }
  
  Widget _constroiImagem(heroi) {
    return Image.network('${heroi.thumbnail.path}.${heroi.thumbnail.extension}');
  }
  
  

  void _changeInputSearch() async {
    if (_timerInputSearch != null) {
      _timerInputSearch!.cancel();
    } 
    _timerInputSearch = Timer(const Duration(milliseconds: 700), () async {
      print('pesquisou');
      if (_filter.text.isEmpty) {
        final result2 = await repository.getHeroes();
        setState(() {
          _datawrapper = result2;
        });
      }  else {
        final result = await repository.getHeroes(_filter.text);
        setState(() {
          _datawrapper = result;
        });
      }
    });
    
  }
}