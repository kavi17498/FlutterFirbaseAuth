import 'package:firebasetest2/screens/authentication/authenticate.dart';
import 'package:firebasetest2/screens/authentication/register.dart';
import 'package:firebasetest2/screens/authentication/sign_in.dart';
import 'package:firebasetest2/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/usermodels.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool signinPage = true;
  void switchPages() {
    setState(() {
      signinPage = !signinPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Usermodel?>(context);
    if (user == null) {
      // Toggle between Sign_In and Register based on the signinPage state.
      return signinPage
          ? Sign_In(toggle: switchPages)
          : Register(toggle: switchPages);
    } else {
      return Home();
    }
  }
}
