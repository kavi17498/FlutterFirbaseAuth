import 'package:firebasetest2/constans/colors.dart';
import 'package:firebasetest2/constans/description.dart';
import 'package:firebasetest2/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Authservices _auth = Authservices();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: bgblack,
        appBar: AppBar(
          title: Text("Home"),
          actions: [
            ElevatedButton(
                onPressed: () async {
                  await _auth.signout();
                },
                child: Icon(Icons.logout))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  "Home",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w800),
                ),
                Text(
                  description,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: Image.asset(
                  'assets/12.png',
                  height: 200,
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
