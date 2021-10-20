import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:crypto/crypto.dart';
import 'package:my_secret/showSecret.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:convert';
import 'package:random_password_generator/random_password_generator.dart';

class CreateSecret extends StatefulWidget {
  @override
  _CreateSecretState createState() => _CreateSecretState();
}

class _CreateSecretState extends State<CreateSecret> {
  String password = '';
  String message = '';

  void createSecret() {
    if (message.length == 0) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.white70,
        content: const Text("You must have secrets, don't be scared."),
        duration: const Duration(seconds: 4),
      ));
    } else {
      if (password.length == 0) {
        password = RandomPasswordGenerator().randomPassword(
            letters: true,
            uppercase: true,
            specialChar: true,
            passwordLength: 10);
      }
      var key = utf8.encode(password);
      var bytes = utf8.encode(message);

      var hmacSha256 = Hmac(sha256, key);
      var digest = hmacSha256.convert(bytes);
      print(message);
      print(password);
      print("HMAC digest as bytes: ${digest.bytes}");
      print("HMAC digest as hex string: $digest");
      Navigator.pushReplacement(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child: ShowSecret(
                  message: message,
                  password: password,
                  crypted: digest.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        /*This method here will hide the soft keyboard.*/
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          backgroundColor: Colors.white24,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.2,
                ),
                Text("Create A Secret",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 2),
                    )),
                SizedBox(
                  height: 5,
                ),
                Text("\"sic mundus creatus est\"",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.white60,
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 2),
                    )),
                SizedBox(
                  height: height * 0.07,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.8, color: Colors.white)),
                  height: height * 0.27,
                  width: width * 0.75,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                      onChanged: (text) {
                        message = text;
                      },
                      style: TextStyle(
                          color: Colors.white60,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 0.5),
                      decoration: new InputDecoration(
                        hintText: 'Bury your secrets here',
                        hintStyle: TextStyle(
                            color: Colors.white60,
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 0.5),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 10, bottom: 11, top: 11, right: 10),
                      ),
                      maxLines: 10,
                      maxLength: 256,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.8, color: Colors.white)),
                  height: height * 0.07,
                  width: width * 0.75,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                      onChanged: (text) {
                        password = text;
                      },
                      style: TextStyle(
                          color: Colors.white60,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 0.5),
                      obscureText: true,
                      decoration: new InputDecoration(
                        hintText: 'Lock your secret with a password',
                        hintStyle: TextStyle(
                            color: Colors.white60,
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 0.5),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 10, bottom: 11, top: 11, right: 10),
                      ),
                      maxLines: 1,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                InkWell(
                  onTap: () => createSecret(),
                  enableFeedback: false,
                  child: Container(
                    height: height * 0.05,
                    width: width * 0.5,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.8, color: Colors.white)),
                    child: Center(
                      child: Text(
                        'create your secret',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 2.5),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
