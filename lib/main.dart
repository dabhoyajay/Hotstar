import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'demo.dart';
import 'firstpage.dart';

void main() {
  runApp(MaterialApp(
    home: splash(),
  ));
}

// class splashscreen extends StatefulWidget {
//   const splashscreen({Key? key}) : super(key: key);
//
//   @override
//   State<splashscreen> createState() => _splashscreenState();
// }
//
// class _splashscreenState extends State<splashscreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topRight,
//             end: Alignment.bottomRight,
//             colors: [
//               Color(0xff000923),
//               Color(0xff242c64)
//             ],
//           ),
//         ),
//         child: splash(),
//       ),
//     );
//   }
// }

splash() {
  return Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            stops: [0.2, 0.5, 0.9],
            end: Alignment.bottomCenter,
            colors: [
              Color(2064060980),
              Color(2064525715),
              Color(2069789415),
            ])),
    child: AnimatedSplashScreen(
      splash: Image.asset("images/splash.png"),
      nextScreen: firstpage(),
      splashIconSize: 170,
      backgroundColor: Colors.transparent,
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: Duration(seconds: 1),
    ),
  );
}
