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
  PageController controller = PageController(initialPage: 0);
  String nom = "";
  String prenom = "";
  var imageProfil;
  var dateNaissance;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deuxième page'),
        centerTitle: true,
      ),
      body: bodyPage(),

    );
  }



  Widget bodyPage(){
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height/1.5,
          width: MediaQuery.of(context).size.width,
          child: PageView(
            controller: controller,
            children: [
              Center(
                child:  recuperNom(),
              ),
              Center(
                child: recuperPrenom(),
              ),


              Text("Afficher date de naissance"),
              Text("Afficher image"),

            ],

          ),

        ),


        ElevatedButton(
            onPressed: (){
              print("élement suivant");
            },
            child: const Text('Suivant')
        )
      ],
    );
  }



  Widget recuperNom(){
    return TextField(
      decoration: InputDecoration(
        hintText: 'Entrer votre nom',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        )
      ),
      onChanged: (text){
        setState(() {
          nom = text;
        });
      },

    );
  }




  Widget recuperPrenom(){
    return TextField(
      decoration: InputDecoration(
          hintText: 'Entrer votre prénom',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )
      ),
      onChanged: (text){
        setState(() {
          nom = text;
        });
      },

    );
  }

}