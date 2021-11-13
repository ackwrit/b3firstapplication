import 'package:b3firstproject/helper/firestore_helper.dart';
import 'package:b3firstproject/retour.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool valeur= true;
  String message="Bienvenue";
  String passcode="";
  late String? email;
  List tableau = ["Valeur","coucou","Je m'appelle","coucou","Je m'appelle","coucou","Je m'appelle","coucou","Je m'appelle","coucou","Je m'appelle"];



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(

            padding: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
              ),
              onChanged: (String text){
                setState(() {
                  email = text;

                });
              },



            ),
          ),


          Container(

            padding: EdgeInsets.all(20),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(

                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
              ),
              onChanged: (String text){
                setState(() {
                  passcode = text;

                });
              },



            ),
          ),
          




          ElevatedButton(

            onPressed: (){
              print("appuyer");
              Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context){
                    return Retour(mail:email!,password: passcode,);
                  }
              ));
            },
            child: const Text('Connexion'),
          ),


          ElevatedButton(

            onPressed: (){
              Firestorehelper().register(email!, passcode, 'Dissingar', 'Djino');

            },
            child: const Text('Inscription'),
          ),


        ],
      )

















      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
