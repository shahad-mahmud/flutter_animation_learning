import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class ColorAnimation extends StatefulWidget {
  @override
  _ColorAnimationState createState() => _ColorAnimationState();
}

class _ColorAnimationState extends State<ColorAnimation>
    with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);

    animation = Tween<double>(begin: 100, end: 200)
        .animate(controller)
        ..addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          body: Center(
            child: Container(
              color: Colors.orange,
              height: animation.value,
              width: animation.value,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
