import 'package:flutter/material.dart';

class ProfilPage extends StatefulWidget{
  String identifiant;
  ProfilPage({required String this.identifiant});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProfilPageState();
  }

}

class ProfilPageState extends State<ProfilPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        centerTitle: true,
      ),
      body: Text(widget.identifiant),
    );
  }

}