import 'dart:typed_data';

import 'package:b3firstproject/helper/firestore_helper.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:file_picker/file_picker.dart';
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
  String nameImage ="";
  late Uint8List? byteImage;
  String pathImage="";
  DateTime dateNaissance = DateTime.now();
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
          padding: const EdgeInsets.only(left: 20,right: 20),
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


              recuperDate(),
              recupererImage()

            ],

          ),

        ),


        ElevatedButton(
            onPressed: (){
              Map <String,dynamic> map ={
                "PRENOM":prenom,
                "NOM":nom,
                "BIRTHDAY":dateNaissance,
                "IMAGE":pathImage
              };
              Firestorehelper().register(widget.mail, widget.password, map);
            },
            child: const Text('Enregistrement')
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
          prenom = text;
        });
      },

    );
  }


  Widget recuperDate(){
    return Container(
      height: 100,
      child: ElevatedButton.icon(
        onPressed: (){

          dialogHeure();
        },
        icon: Icon(Icons.access_time),
        label: Text('Date'),
      )
    );

  }



  dialogHeure(){
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context){
          return AlertDialog(
            content: Container(
              height: 100,
              width: 400,
              color: Colors.white,
              child:  DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectedTextColor: Colors.black,
                onDateChange: (date){
                  setState(() {
                    dateNaissance = date;
                  });
                },
              ),
            ),

            actions: [
              ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text('Annuler'),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text('Valider'),
              ),


            ],
          );
        }
    );





  }



  recupererImage(){
    return Container(
        height: 100,
        child: ElevatedButton.icon(
          onPressed: (){
            importImage();


          },
          icon: Icon(Icons.upload),
          label: Text('Image'),
        )
    );

  }


  importImage() async {
    //sélectionner image
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true
    );
    if(result!=null){
      setState(() {
        byteImage = result.files.first.bytes;
        nameImage = result.files.first.name;
      });

      afficherImage();


    }
  }

  afficherImage(){
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context){
          return AlertDialog(
            content: Image.memory(byteImage!,width: 250,height: 250,),
            actions: [
              ElevatedButton(
                  onPressed: (){
                   Navigator.pop(context);
                  },
                  child: Text('Annuler')
              ),
              ElevatedButton(
                  onPressed: (){
                    //Stocker l'image dans la base donnée
                    Firestorehelper().stockageImage(nameImage, byteImage!).then((value){
                      setState(() {
                        pathImage = value;
                      });
                    });
                    Navigator.pop(context);
                  },
                  child: Text('Enregistrer')
              ),

            ],
          );
        }
    );
  }

}

