import "package:flutter/material.dart";

class CommonGradient extends StatelessWidget {
  const CommonGradient({required this.id, required this.child, super.key});

  final int id;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "gradient_$id",
      transitionOnUserGestures: true,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: kTextTabBarHeight,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Theme.of(context).scaffoldBackgroundColor.withOpacity(0.0),
                Theme.of(context).colorScheme.secondary,
              ],
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
