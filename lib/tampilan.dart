import 'package:flutter/material.dart';
import 'Bloc.dart';
import 'provider.dart';
class Tampilan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      height: 1000.0,
      margin: EdgeInsets.only(
        top: 50.0,
        right: 10.0,
        left: 10.0,
      ),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              emailField(bloc),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
              ),
              passwordField(bloc),
              Container(
                margin: EdgeInsets.only(top: 25.0),
              ),
              submitButton(bloc),
            ],
          )
        ],
      ),
    );
  }
}
Widget emailField(Bloc bloc){
  return StreamBuilder(

      stream: bloc.username,
      builder: (context, snapshot){
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: 'asepbensin@gmail.com',
              labelText: 'Email Address',
              errorText: snapshot.error,
             ),
        );
      });
}
Widget passwordField(Bloc bloc){
  return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot){
        return TextField(
          obscureText: true,
          onChanged: bloc.changePassword,
          decoration: InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
              errorText: snapshot.error,
             ),
        );
      });
}
Widget submitButton(Bloc bloc){
  return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot){
        return FlatButton(
          child: Text('Login'),
          color: Colors.blue,
          onPressed: snapshot.hasData ? bloc.submit : null,
        );
      });
}
