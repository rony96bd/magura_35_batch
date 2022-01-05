import 'package:flutter/material.dart';
import 'package:flutter_magura/pages/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoute.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Image.asset("assets/images/login.png"),
            ),
            const Text(
              "Login Page",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 30,
              ),
              child: Column(
                children: [
                  Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    shadowColor: Colors.blue,
                    // elevation: 2.0,
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.grey.withOpacity(0.5), width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                            borderSide: BorderSide(color: Colors.blue)),
                        filled: true,
                        prefixIcon: Icon(Icons.person),
                        hintStyle:
                            TextStyle(color: Colors.grey.withOpacity(0.8)),
                        hintText: "Type your Username",
                        fillColor: Colors.white70,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "User name is Empty";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    shadowColor: Colors.blue,
                    // elevation: 2.0,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.5),
                                width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)),
                              borderSide: BorderSide(color: Colors.blue)),
                          filled: true,
                          prefixIcon: Icon(Icons.password),
                          hintStyle:
                              TextStyle(color: Colors.grey.withOpacity(0.8)),
                          hintText: "Type your Password",
                          fillColor: Colors.white70),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password is Empty";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Material(
              borderRadius: BorderRadius.circular(changeButton ? 25 : 8),
              color: Colors.blue,
              child: InkWell(
                borderRadius: BorderRadius.circular(changeButton ? 25 : 8),
                splashColor: Colors.red,
                onTap: () => moveToHome(context),
                child: AnimatedContainer(
                    alignment: Alignment.center,
                    width: changeButton ? 50 : 120,
                    height: 50,
                    duration: Duration(seconds: 1),
                    child: changeButton
                        ? Icon(
                            Icons.done,
                            color: Colors.white,
                          )
                        : Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          )),
              ),

              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.pushNamed(context, MyRoute.homeRoute);
              //   },
              //   child: Text("Login"),
              //   style: TextButton.styleFrom(
              //       minimumSize: Size(100, 50), backgroundColor: Colors.blue),
              // )
            )
          ],
        ),
      ),
    );
  }
}
