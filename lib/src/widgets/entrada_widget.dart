import 'package:flutter/material.dart';
class EntradaWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          nomeField(),
          numeroField(),
          Container(
            margin: EdgeInsets.only(top: 12.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    child: Text('Salvar'),
                    onPressed: (){},
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    ); 
  }

  Widget nomeField(){
    return TextField(
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        labelText: 'Nome',
        hintText: 'Digite seu nome',
      ),
    );
  }

  Widget numeroField(){
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Número',
        hintText: 'Digite seu número',
      ),
    );
  }

  Widget submitField(){
    return ElevatedButton(
      child: Text('Salvar'),
      onPressed: (){},
    );
  }
}