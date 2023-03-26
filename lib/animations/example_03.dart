import 'dart:math';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class ExampleThree extends StatefulWidget {
  const ExampleThree({super.key});

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

const widthAndHeight = 100.0;

class _ExampleThreeState extends State<ExampleThree>
    with TickerProviderStateMixin {
  late AnimationController _xController;
  late AnimationController _yController;
  late AnimationController _zController;

  late Tween<double> _animation;

  @override
  void initState() {
    super.initState();

    _xController =
        AnimationController(vsync: this, duration: const Duration(seconds: 20));
    _yController =
        AnimationController(vsync: this, duration: const Duration(seconds: 30));
    _zController =
        AnimationController(vsync: this, duration: const Duration(seconds: 40));

    _animation = Tween<double>(begin: 0, end: pi * 2);
  }

  @override
  void dispose() {
    super.dispose();
    _xController.dispose();
    _yController.dispose();
    _zController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _xController
      ..reset()
      ..repeat();
    _yController
      ..reset()
      ..repeat();
    _zController
      ..reset()
      ..repeat();

    return Scaffold(
        appBar: AppBar(title: const Text('3D Animations')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: widthAndHeight + widthAndHeight,
              width: double.infinity,
            ),
            AnimatedBuilder(
              animation:
                  Listenable.merge([_xController, _yController, _zController]),
              builder: (context, child) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..rotateX(_animation.evaluate(_xController))
                    ..rotateY(_animation.evaluate(_yController))
                    ..rotateZ(_animation.evaluate(_zController)),
                  child: Stack(
                    children: [
                      //Back
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..translate(Vector3(0, 0, -widthAndHeight) ),
                        child: Container(
                          color: Colors.purple,
                          height: widthAndHeight,
                          width: widthAndHeight,
                          child: const Center(child: Text('Back')),
                        ),
                      ),
                      //Left Handside
                      Transform(
                        alignment: Alignment.centerLeft,
                        transform: Matrix4.identity()..rotateY(pi/2.0),
                        child: Container(
                          color: Colors.red,
                          height: widthAndHeight,
                          width: widthAndHeight,
                          child: const Center(child: Text('Left')),
                        ),
                      ),
                      //Right Handside
                      Transform(
                        alignment: Alignment.centerRight,
                        transform: Matrix4.identity()..rotateY(-pi/2.0),
                        child: Container(
                          color: Colors.blue,
                          height: widthAndHeight,
                          width: widthAndHeight,
                          child: const Center(child: Text('Right')),
                        ),
                      ),
                      

                      //Front
                      Container(
                        color: Colors.green,
                        height: widthAndHeight,
                        width: widthAndHeight,
                        child: const Center(child: Text('Front')),
                      ),
                      //Top Side
                      Transform(
                        alignment: Alignment.topCenter,
                        transform: Matrix4.identity()..rotateX(-pi/2.0),
                        child: Container(
                          color: Colors.pinkAccent,
                          height: widthAndHeight,
                          width: widthAndHeight,
                          child:  const Center(child: Text('Top')),
                        ),
                      ),
                      //Bottom Side
                      Transform(
                        alignment: Alignment.bottomCenter,
                        transform: Matrix4.identity()..rotateX(pi/2.0),
                        child: Container(
                          color: Colors.amber,
                          height: widthAndHeight,
                          width: widthAndHeight,
                          child: const Center(child: Text('Bottom' )),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ));
  }
}
