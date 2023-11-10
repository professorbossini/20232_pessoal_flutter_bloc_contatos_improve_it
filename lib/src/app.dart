import 'package:contatos_com_bloc/src/telas/contatos_tela.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contatos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: ContatosTela(),
      ),
    );
  }
}