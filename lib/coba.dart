import 'package:flutter/material.dart';
import 'package:flutterloginbloc/tampilan.dart';
import 'provider.dart';

class Coba extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Tampilan(),
      ),
    ));
  }
}
