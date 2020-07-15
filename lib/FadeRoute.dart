import 'package:flutter/material.dart';

class FadeRoute extends PageRoute {
  FadeRoute({
    this.barrierColor,
  }) : super();
  @override
  final Color barrierColor;

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return null;
  }

  @override
  bool get maintainState => null;

  @override
  Duration get transitionDuration => null;
}
