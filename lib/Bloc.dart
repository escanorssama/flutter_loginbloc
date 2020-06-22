import 'dart:async';
import 'validate.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validate {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
// Add data to stream
  Stream<String> get username =>
      _emailController.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);
  Stream<bool> get submitValid => Observable.combineLatest2(username,
      password, (u, p) => true);
// change data
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  submit() {
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;
    print('Email is $validEmail, and password is $validPassword');
  }
  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
