import 'dart:async';

import 'package:login_bloc/src/blocs/validators.dart';
import 'package:rxdart/rxdart.dart';

// can be class Bloc extends Object with Validators{ OR
class Bloc extends Validators{ 
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  //Add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid => Rx.combineLatest2(email,password, (e,p)=>true);

  //Change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  submit(){
    final validEmail = _email.value;
    final validPassword = _password.value;
  }

  dispose(){
    _email.close();
    _password.close();
  }
}