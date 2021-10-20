import 'package:flutter/material.dart';

class ShowSecret extends StatefulWidget {
  String message, password, crypted;
  ShowSecret({this.message, this.password, this.crypted});
  @override
  _ShowSecretState createState() => _ShowSecretState();
}

class _ShowSecretState extends State<ShowSecret> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.crypted),
            Text(widget.message),
            Text(widget.password)
          ],
        ),
      ),
    );
  }
}
