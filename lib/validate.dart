import 'dart:async';
class Validate{
  final validateEmail = StreamTransformer<String, String>.fromHandlers(handleData: (username, sink){
    if(username.contains('@')){
      sink.add(username);
    }else {
      sink.addError('Isilah username anda dengan benar');
    }
  });
  final validatePassword = StreamTransformer<String, String>.
  fromHandlers(handleData: (password, sink){
    if(password.length >= 6){
      sink.add(password);
    }else{
      sink.addError('minimal password 6 karakter');
    }
  });
}