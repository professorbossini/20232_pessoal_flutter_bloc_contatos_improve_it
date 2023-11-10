import 'package:flutter/material.dart';

//mostrar um contato com nome e numero
//cada contato deve ter uma borda clara entre nome e numero
//cada par nome/numero deve ser englobado num card com sombra
class ContatoWidget extends StatelessWidget{
  final String nome;
  final String numero;
  ContatoWidget(this.nome, this.numero);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              nome,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              numero,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }    
}