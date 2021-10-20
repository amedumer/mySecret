import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';

class ShowSecret extends StatefulWidget {
  String message, password, crypted;
  ShowSecret({this.message, this.password, this.crypted});
  @override
  _ShowSecretState createState() => _ShowSecretState();
}

class _ShowSecretState extends State<ShowSecret> {
  bool isObsecure = true;

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
                Text("Your Secret",
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
                Text("is now buried with you",
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
                    "your key",
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
                  onTap: () {
                    FlutterClipboard.copy(widget.crypted).then((value) => {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.white70,
                            content: const Text(
                                "your secret key is copied to the clipboard"),
                            duration: const Duration(seconds: 3),
                          ))
                        });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.8, color: Colors.white)),
                    width: width * 0.75,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.center,
                        initialValue: widget.crypted,
                        enabled: false,
                        readOnly: true,
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
                        maxLines: 2,
                        maxLength: 256,
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
                    "your password",
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
                  onLongPress: () {
                    FlutterClipboard.copy(widget.message).then((value) => {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.white70,
                            content: const Text(
                                "your password is copied to the clipboard"),
                            duration: const Duration(seconds: 3),
                          ))
                        });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.8, color: Colors.white)),
                    width: width * 0.75,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                      child: TextFormField(
                        obscureText: isObsecure,
                        textAlign: TextAlign.center,
                        initialValue: widget.password,
                        enabled: false,
                        readOnly: true,
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
                    "your secret",
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
                    FlutterClipboard.copy(widget.message).then((value) => {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.white70,
                            content: const Text(
                                "your secret is copied to the clipboard"),
                            duration: const Duration(seconds: 3),
                          ))
                        });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.8, color: Colors.white)),
                    width: width * 0.75,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: TextFormField(
                        enabled: false,
                        readOnly: true,
                        initialValue: widget.message,
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
                        showHelp();
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
                            'what do I do?',
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
