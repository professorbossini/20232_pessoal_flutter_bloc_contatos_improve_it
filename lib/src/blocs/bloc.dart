import 'validators.dart';
import 'dart:async';
import '../models/contato_model.dart';
class Bloc with Validators {
  //streams de validação
  final _nomeController = StreamController<String>();
  final _numeroController = StreamController<String>();
  
  Stream<String> get nome => _nomeController.stream.transform(validarNome);

  Stream<String> get numero => _numeroController.stream.transform(validarNumero);

  Function(String) get mudarNome => _nomeController.sink.add;

  Function(String) get mudarNumero => _numeroController.sink.add;

  //stream que lida com uma lista de contatos
  final _contatosController = StreamController<List<Contato>>();

  Stream<List<Contato>> get contatos => _contatosController.stream;
  //a lista de contatos
  List<Contato> _contatos = [];
  //adicionamos na lista e o sink a absorve a seguir
  void adicionarContato(Contato contato) {
    _contatos.add(contato);
    _contatosController.sink.add(_contatos);
  }

  void dispose(){
    _nomeController.close();
    _numeroController.close();
    _contatosController.close();
  }
}

//instância global do bloc
final bloc = Bloc();