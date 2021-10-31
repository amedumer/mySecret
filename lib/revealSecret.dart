import 'dart:convert';

import 'package:clipboard/clipboard.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:my_secret/showResult.dart';
import 'package:page_transition/page_transition.dart';

class RevealSecret extends StatefulWidget {
  @override
  _RevealSecretState createState() => _RevealSecretState();
}

class _RevealSecretState extends State<RevealSecret> {
  bool isObsecure = true;
  String key = "", password = "", message = "";

  void showHelp() {
    showOkAlertDialog(
        context: context,
        title: "How to handle your secret?",
        message: "This is your FIRST AND LAST time seeing your secret key.\n\n"
            "It is STRONGLY advised to keep a copy of all three values.\n\n"
            "In order to validate your secret in the future, you MUST remember what you've wrote in the EXACT form you've written.\n\n"
            "You can share your key anywhere you want. NO ONE can know and validate what your secret is, unless you share your password and what you've wrote.\n\n"
            "Anyone trying to validate your secret would need your message and your password. After getting the same key as the output, they would understand the secret is valid.\n\n"
            "Purpose of this application is to be able to make future claims without people knowing what your claim is. You are the only one who can reveal your secret claim.",
        okLabel: "Understood");
  }

  bool validateSecret() {
    if (message.length == 0) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.white70,
        content:
            const Text("You must have secrets to reveal, don't be scared."),
        duration: const Duration(seconds: 4),
      ));
    } else {
      if (password.length == 0) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.white70,
          content:
              const Text("You must have a password. Secrets are only yours."),
          duration: const Duration(seconds: 4),
        ));
      } else {
        if (key.length == 0) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.white70,
            content: const Text("You must have a key. Secrets are only yours."),
            duration: const Duration(seconds: 4),
          ));
        } else {
          var passwordVar = utf8.encode(password);
          var bytes = utf8.encode(message);

          var hmacSha256 = Hmac(sha256, passwordVar);
          var digest = hmacSha256.convert(bytes);

          if (digest.toString() == key) {
            print("it was said");
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade,
                    child: ResultScreen(
                      result: true,
                      message: message,
                      key_: key,
                      password: password,
                    )));
          } else {
            print("fake news.");
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade,
                    child: ResultScreen(
                      result: false,
                      message: message,
                      key_: key,
                      password: password,
                    )));
          }
        }
      }
    }
    return true;
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
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.13,
                ),
                Text("Reveal a Secret",
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
                Text("and it may live forever",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.white60,
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 2),
                    )),
                SizedBox(
                  height: height * 0.05,
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 4),
                  width: width * 0.75,
                  child: Text(
                    "the key",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.white60,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 2),
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.8, color: Colors.white)),
                    width: width * 0.75,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: TextFormField(
                        onChanged: (value) {
                          key = value;
                        },
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white60,
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 0.5),
                        decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 10, bottom: 0, top: 0, right: 10),
                        ),
                        maxLines: 3,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 4),
                  width: width * 0.75,
                  child: Text(
                    "the password",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.white60,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 2),
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isObsecure = !isObsecure;
                    });
                  },
                  onLongPress: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.8, color: Colors.white)),
                    width: width * 0.75,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                      child: TextFormField(
                        onChanged: (value) {
                          password = value;
                        },
                        obscureText: isObsecure,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white60,
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 1.5),
                        decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 10, bottom: 0, top: 0, right: 10),
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 4),
                  width: width * 0.75,
                  child: Text(
                    "the secret",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.white60,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 2),
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.8, color: Colors.white)),
                    width: width * 0.75,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: TextFormField(
                        onChanged: (value) {
                          message = value;
                        },
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(
                            color: Colors.white60,
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 0.5),
                        decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 10, bottom: 11, top: 11, right: 10),
                        ),
                        maxLines: 10,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      enableFeedback: false,
                      child: Container(
                        height: height * 0.05,
                        width: width * 0.33,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 0.8, color: Colors.white)),
                        child: Center(
                          child: Text(
                            'take me back',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 2.5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.07,
                    ),
                    InkWell(
                      onTap: () {
                        validateSecret();
                      },
                      enableFeedback: false,
                      child: Container(
                        height: height * 0.05,
                        width: width * 0.33,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 0.8, color: Colors.white)),
                        child: Center(
                          child: Text(
                            'reveal secret',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 2.5),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
