import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  bool result, isObsecure = true;
  String message, key_, password;

  ResultScreen({this.result, this.message, this.password, this.key_});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                result == true ? Icons.done : Icons.close,
                color: Colors.white70,
                size: width * 0.5,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                  result == true
                      ? "Given combination confirms the secret.\n\nThis is a valid secret."
                      : "Such combination does not reveal a secret.\n\nThis is not a valid secret.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
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
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.8, color: Colors.white)),
                  width: width * 0.75,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                      enabled: false,
                      readOnly: true,
                      initialValue: message,
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
                height: height * 0.05,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                enableFeedback: false,
                child: Container(
                  height: height * 0.05,
                  width: width * 0.33,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.8, color: Colors.white)),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
