import 'package:flutter/material.dart';

class NoAnimationRoute<T> extends PageRouteBuilder<T> {
  final Widget Function(BuildContext context) myPageBuilder;

  NoAnimationRoute({required this.myPageBuilder})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              myPageBuilder(context),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              child,
        );
}
