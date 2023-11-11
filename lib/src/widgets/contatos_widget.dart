import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../models/contato_model.dart';
import '../widgets/contato_widget.dart';
class ContatosWidget extends StatelessWidget{
  String nomeAtual = '';
  String numeroAtual = '';
  List<Contato> contatos = [Contato('Ana', '1')];
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
          contatosList()
        ],
      )
    ); 
  }

  Widget nomeField(){
    
    return StreamBuilder(
      stream: bloc.nome,
      builder: (context, snapshot){
        return TextField(
          onChanged: (valor){
            bloc.mudarNome(valor);
            nomeAtual = valor;
          },
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
          onChanged: (valor){
            bloc.mudarNumero(valor);
            numeroAtual = valor;
          },
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
      onPressed: () => bloc.adicionarContato(Contato(nomeAtual, numeroAtual)),
    );
  }

  Widget contatosList(){
    return Container(
      margin: EdgeInsets.only(top: 12.0),
      child: StreamBuilder(
        stream: bloc.contatos,
        builder: (context, snapshot){
          if (snapshot.hasData){
            return Column(
              children: snapshot.data!.map<Widget>(
                (contato) => ContatoWidget(contato.nome, contato.numero)).toList(),
            );
          }
          else {
            return Text('Nenhum contato adicionado');
          }
        },
      ),
    );
  }
}