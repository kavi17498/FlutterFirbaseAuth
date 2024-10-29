import 'package:firebasetest2/constans/colors.dart';
import 'package:firebasetest2/constans/description.dart';
import 'package:firebasetest2/constans/styles.dart';
import 'package:flutter/material.dart';
import '../../services/auth.dart';

class Sign_In extends StatefulWidget {
  //funtion
  final Function toggle;
  const Sign_In({super.key, required this.toggle});

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  final Authservices _auth = Authservices();

  //form key

  final _formKey = GlobalKey<FormState>();

  //email password states
  String email = "";
  String password = "";
  String error = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgblack,
        appBar: AppBar(
          title: Text('Sign in'),
          backgroundColor: bgblack,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                //decscription
                Text(
                  description,
                  style: descriptionStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: Image.asset(
                  'assets/12.png',
                  height: 200,
                )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          //email
                          TextFormField(
                            decoration: textInputDecoration,
                            validator: (val) => val?.isEmpty == true
                                ? "Enter A valid Email"
                                : null,
                            onChanged: ((val) {
                              setState(() {
                                email = val;
                              });
                            }),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //password
                          TextFormField(
                            obscureText: true,
                            decoration: textInputDecoration.copyWith(
                                hintText: "Password"),
                            validator: (val) => val!.length < 6
                                ? "Enter A valid Password"
                                : null,
                            onChanged: ((val) {
                              setState(() {
                                password = val;
                              });
                            }),
                          ),
                          Text(
                            error,
                            style: TextStyle(color: Colors.red),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //google
                          Text(
                            "Login with social accounts",
                            style: descriptionStyle,
                          ),
                          GestureDetector(
                            //sign in with google
                            onTap: () => {},
                            child: Center(
                                child: Image.asset(
                              'assets/social.png',
                              height: 200,
                            )),
                          ),
                          //registerr
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Do not have an account ?",
                                style: descriptionStyle,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                //Navigate to register page
                                onTap: () {
                                  widget.toggle();
                                },
                                child: Text(
                                  "REGISTER",
                                  style: TextStyle(color: mainBlue),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          //button
                          GestureDetector(
                            //method for login user
                            onTap: () async {
                              dynamic result = await _auth
                                  .signInUsingEmailAndPassword(email, password);
                              if (result == null) {
                                setState(() {
                                  error =
                                      "Could not signin with those credentials";
                                });
                              }
                            },
                            child: Container(
                              height: 40,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: textlight,
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(
                                      width: 1, color: Colors.yellow)),
                              child: Center(
                                  child: Text(
                                "Log In",
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          ),

                          SizedBox(
                            height: 10,
                          ),

                          GestureDetector(
                            //method for login user
                            onTap: () async {
                              await _auth.signInAnonymously();
                            },
                            child: Container(
                              height: 40,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: textlight,
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(
                                      width: 1, color: Colors.yellow)),
                              child: Center(
                                  child: Text(
                                "Log In Guest",
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          ),
                          //anon
                        ],
                      )),
                )
              ],
            ),
          ),
        ));
  }
}

// ElevatedButton(
//         onPressed: () async {
//           try {
//             dynamic result = await _auth.signInAnonymously();
//             if (result == null) {
//               print("Error Occurred");
//             } else {
//               print("Sign in anonymously Done");
//               print(result.uid);
//             }
//           } catch (e) {
//             print('Error: $e');
//           }
//         },
//         child: Text("Sign In Anonymously"),
//       ),
