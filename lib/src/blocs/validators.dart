import 'dart:async';
mixin Validators{
  //começa com maiúscula, tem, pelos menos, duas letras minúsculas antes de um espaço em branco obrigatório e um sobrenome a seguir (com pelo menos uma letra)
  static final regExpNome = RegExp('[A-Z][a-z]{2,} [A-Za-z]+');
  //começa com parênteses, tem dois dígitos, fecha parênteses, tem um espaço em branco, tem 5 dígitos, tem um traço, tem 4 dígitos
  static final regExpNumero = RegExp('^\\([0-9]{2}\\) [0-9]{5}-[0-9]{4}\$');
  final validarNome = StreamTransformer<String, String>.fromHandlers(
    handleData: (nome, sink){
      //busca por todas as ocorrências da expressão regular no nome e verifica se tem só uma
      if (regExpNome.allMatches(nome).length == 1){
        sink.add(nome);
      } 
      else {
        sink.addError('Nome deve começar com letra maiúscula, ter pelo menos 3 letras e um sobrenome');
      }
    }
  );
  final validarNumero = StreamTransformer<String, String>.fromHandlers(
    handleData: (numero, sink){
      //busca por todas as ocorrências da expressão regular no número e verifica se tem só uma
      if (regExpNumero.allMatches(numero).length == 1){
        sink.add(numero);
      } 
      else {
        sink.addError('Número deve estar no formato (xx)xxxxx-xxxx');
      }
    }
  );
}