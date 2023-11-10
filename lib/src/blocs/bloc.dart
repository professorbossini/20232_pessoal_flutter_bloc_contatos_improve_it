import 'validators.dart';
import 'dart:async';
class Bloc with Validators {
  final _nomeController = StreamController<String>();
  final _numeroController = StreamController<String>();
  Stream<String> get nome => _nomeController.stream.transform(validarNome);
  Stream<String> get numero => _numeroController.stream.transform(validarNumero);
  Function(String) get mudarNome => _nomeController.sink.add;
  Function(String) get mudarNumero => _numeroController.sink.add;
  void dispose(){
    _nomeController.close();
    _numeroController.close();
  }
}

final bloc = Bloc();