import 'package:car_rental/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Flutter is fully ready before running any code
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseFirestore db = FirebaseFirestore.instance; //  initializes the Firestore database
  final TextEditingController firstName = TextEditingController(); // value 
  final TextEditingController lastName = TextEditingController(); // value

  void _incrementCounter() {
    final user = {
      "firstName": firstName.text,
      "lastName": lastName.text,
      "born": DateTime(2002, 09, 27),
    };

    //  adds a new document (user data) to a Firestore collection called users
    db.collection("users").add(user).then((DocumentReference doc) =>
      print("User add with ID: ${doc.id}")
    );

    setState((){ // updating text
      firstName.text;
      lastName.text;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Enter firstname'),
              controller: firstName,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Enter lastname'),
              controller: lastName,
            ),
             ElevatedButton(
              onPressed: _incrementCounter,
              child: Text("CLICK"),
            ),
          
            Text('${firstName.text}'),
            Text('${lastName.text}')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
