import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_secret/createSecret.dart';
import 'package:crypto/crypto.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mySecret',
      theme: ThemeData(
        brightness: Brightness.light,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark,
      /* ThemeMode.system to follow system theme,
         ThemeMode.light for light theme,
         ThemeMode.dark for dark theme
      */
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.vpn_key,
              color: Colors.white,
              size: 140,
            ),
            SizedBox(
              height: height * 0.005,
            ),
            Text(
              'mySecret',
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2),
              ),
            ),
            SizedBox(
              height: height * 0.2,
            ),
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade, child: CreateSecret())),
              enableFeedback: false,
              child: Container(
                height: height * 0.08,
                width: width * 0.6,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.8, color: Colors.white)),
                child: Center(
                  child: Text(
                    'create a secret',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 2.5),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            InkWell(
              onTap: () => print('OnTap'),
              enableFeedback: false,
              child: Container(
                height: height * 0.08,
                width: width * 0.6,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.8, color: Colors.white)),
                child: Center(
                  child: Text(
                    'reveal a secret',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
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
    );
  }
}
