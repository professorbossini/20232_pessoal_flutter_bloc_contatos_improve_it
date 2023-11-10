import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
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
                  child: submitButton(),
                ),
              ],
            ),
          ),
        ],
      )
    ); 
  }

  Widget nomeField(){
    
    return StreamBuilder(
      stream: bloc.nome,
      builder: (context, snapshot){
        return TextField(
          onChanged: bloc.mudarNome,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            labelText: 'Nome',
            hintText: 'Digite seu nome',
            errorText: snapshot.hasError ? snapshot.error.toString() : null,
          ),
        );
      },
    );
    
  }

  Widget numeroField(){
    return StreamBuilder(
      stream: bloc.numero,
      builder: (context, snapshot){
        return TextField(
          onChanged: bloc.mudarNumero,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Número',
            hintText: 'Digite seu número',
            errorText: snapshot.hasError ? snapshot.error.toString() : null,
          ),
        );
      },
    );
  }

  Widget submitButton(){
    return ElevatedButton(
      child: Text('Salvar'),
      onPressed: (){},
    );
  }
}