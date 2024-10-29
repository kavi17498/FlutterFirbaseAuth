import 'package:firebasetest2/constans/colors.dart';
import 'package:firebasetest2/constans/description.dart';
import 'package:firebasetest2/constans/styles.dart';
import 'package:firebasetest2/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggle;
  const Register({super.key, required this.toggle});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final Authservices _auth = Authservices();

  // Form key
  final _formKey = GlobalKey<FormState>();

  // Email, password, and error states
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgblack,
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: bgblack,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              // Description
              Text(
                description,
                style: descriptionStyle,
              ),
              const SizedBox(height: 20),
              Center(
                child: Image.asset(
                  'assets/12.png',
                  height: 200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Email input
                      TextFormField(
                        decoration: textInputDecoration,
                        validator: (val) =>
                            val?.isEmpty == true ? "Enter a valid email" : null,
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                      ),
                      const SizedBox(height: 20),

                      // Password input
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: "Password"),
                        validator: (val) => val != null && val.length < 6
                            ? "Enter a valid password (6+ characters)"
                            : null,
                        obscureText: true, // Hide the password input
                        onChanged: (val) {
                          setState(() {
                            password =
                                val; // Fix: update password instead of email
                          });
                        },
                      ),
                      const SizedBox(height: 20),

                      // Display error messages
                      if (error.isNotEmpty)
                        Text(
                          error,
                          style: const TextStyle(color: Colors.red),
                        ),
                      const SizedBox(height: 10),

                      // Registration button
                      GestureDetector(
                        onTap: () async {
                          // Validate the form before submitting
                          if (_formKey.currentState?.validate() == true) {
                            setState(() {
                              error = ""; // Clear any previous error
                            });
                            dynamic result = await _auth
                                .registerWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error =
                                    "Please supply a valid email or check your network.";
                              });
                            }
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: textlight,
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(width: 1, color: Colors.yellow),
                          ),
                          child: const Center(
                            child: Text(
                              "Register",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Link to the login page
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: descriptionStyle,
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              widget.toggle();
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(color: mainBlue),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
