import 'dart:async';
mixin Validators{
  static final regExpNome = RegExp(r'^[A-Z][a-z]{2,} [A-Za-z]+$');
  static final regExpNumero = RegExp(r'^(\d\d)[0-9]{5}-[0-9]{4}$');
  final validarNome = StreamTransformer<String, String>.fromHandlers(
    handleData: (nome, sink){
      if (regExpNome.hasMatch(nome)){
        sink.add(nome);
      } 
      else {
        sink.addError('Nome deve começar com letra maiúscula, ter pelo menos 3 letras e um sobrenome');
      }
    }
  );
  final validarNumero = StreamTransformer<String, String>.fromHandlers(
    handleData: (numero, sink){
      if (regExpNumero.hasMatch(numero)){
        sink.add(numero);
      } 
      else {
        sink.addError('Número deve estar no formato (xx)xxxxx-xxxx');
      }
    }
  );
}