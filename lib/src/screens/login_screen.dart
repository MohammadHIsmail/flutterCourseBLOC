import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:login_bloc/src/blocs/bloc.dart' ;

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<Bloc>(context);
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          emailField(bloc),
          passwordField(bloc),
          Container(margin: const EdgeInsets.only(top: 20),),
          submitButton(bloc)
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc){
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'you@example.com',
              labelText: "Email",
              errorText: snapshot.hasError? snapshot.error.toString() : null
            ),
          );
        }
      );
    
    
  }

  Widget passwordField(Bloc bloc){
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
            labelText: "Password",
            errorText: snapshot.error?.toString()
          ),
        );
      },
    );
    
  }

  Widget submitButton(Bloc bloc){
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot){
        return ElevatedButton(
          onPressed: snapshot.hasData ? (){
            print("hi there");
          }: null ,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue
          ),
          child: const Text('Login')
        );
      }
    );
    
  }

}