import 'package:flutter/material.dart';

class Retour extends StatefulWidget{
  String mail;
  String password;
  Retour({required String this.mail,required String this.password});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RetourState();
  }

}


class RetourState extends State<Retour>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deuxième page'),
        centerTitle: true,
      ),
      body: Text("mon adresse mail est la suivante : ${widget.mail} et le mot passe est ${widget.password}",
        style: const TextStyle(
            color: Colors.red,
          fontSize: 25
        ),
      ),
      backgroundColor: Colors.amber
    );
  }

}