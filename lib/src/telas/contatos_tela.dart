import 'package:flutter/material.dart';
import '../widgets/contatos_widget.dart';
class ContatosTela extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
          ContatosWidget(),
        ],
      )
    );
  }
}