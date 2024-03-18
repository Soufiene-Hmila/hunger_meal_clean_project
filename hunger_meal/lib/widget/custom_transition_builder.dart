import 'package:flutter/material.dart';

class CustomTransitionBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
      PageRoute<T> route, BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return ScaleTransition(scale: Tween<double>(begin: 1.0, end: 1.0,).animate(
        CurvedAnimation(parent: animation, curve: Curves.decelerate,),), child: child,);
  }
}