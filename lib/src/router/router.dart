import 'package:flutter/material.dart';

class CustomRouter {
  static push(BuildContext context, Widget screen) {
    Navigator.push(context, _createRoute(screen));
  }

  static pushAndRemoveUntil(BuildContext context, Widget screen) {
    Navigator.pushAndRemoveUntil(
        context, _createRoute(screen), (route) => false);
  }

  static pushReplacement(BuildContext context, Widget screen) {
    Navigator.pushReplacement(context, _createRoute(screen));
  }

  static pop(BuildContext context) {
    Navigator.pop(context);
  }
}

Route _createRoute(Widget screen) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
