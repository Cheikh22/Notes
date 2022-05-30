import 'package:design/custom/constants.dart';
import 'package:design/custom/default_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: body()),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
          ),
          Center(
            child: Container(
              alignment: Alignment.center,
              color: Colors.grey[50],
              height: 120,
              width: 300,
              child: Text(
                "Login Page",
                style: textstyle.copyWith(
                    color: Colors.deepPurple,
                    fontSize: 50,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(35, 40, 20, 0),
            child: Text(
              'Entrez votre Email',
              style: textstyle,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
            child: Form(
              key: _formKey1,
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  autofocus: true,
                  controller: emailcontroller,
                  decoration: textFormDecoration.copyWith(
                      prefixIcon: Icon(
                    Icons.email,
                    color: Colors.deepPurple,
                  )),
                  validator: (val) =>
                      (val!.isEmpty ? 'Ce champs est obligatire' : null),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(35, 5, 20, 0),
            child: Text(
              'Entrez votre mot de passe',
              style: textstyle,
            ),
          ),
          spaceHeight(10),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
            child: Form(
              key: _formKey2,
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  autofocus: true,
                  controller: passwordcontroller,
                  decoration: textFormDecoration.copyWith(
                      prefixIcon: Icon(
                    Icons.password_rounded,
                    color: Colors.deepPurpleAccent,
                  )),
                  validator: (val) =>
                      (val!.isEmpty ? 'Ce champs est obligatire' : null),
                ),
              ),
            ),
          ),
          Center(
              child: DefaultButton(
            text: "connexion",
            onTap: () {},
            width: 325,
            borderRadius: 20,
          )),
          spaceHeight(20),
          Center(
            child: RichText(
              text: TextSpan(
                  text: "Mot de passe oublie?",
                  style: textstyle.copyWith(color: Colors.black),
                  children: [
                    TextSpan(
                        text: " Registre",
                        style: textstyle.copyWith(
                            color: Colors.deepPurpleAccent,
                            fontSize: 16,
                            fontWeight: FontWeight.w500))
                  ]),
            ),
          ),
          spaceHeight(35),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                  ),
                  child: Text(
                    "Github",
                    style:
                        textstyle.copyWith(color: Colors.white, fontSize: 16),
                  ),
                ),
                DefaultButton(
                  onTap: () {},
                  text: "Gmail",
                  buttoncolor: Colors.white,
                  textcolor: Colors.red,
                  hasborder: true,
                  borderRadius: 20,
                  height: 50,
                  width: 130,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
