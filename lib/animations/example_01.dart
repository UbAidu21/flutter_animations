
import 'package:flutter/material.dart';
import 'dart:math';

class ExampleOne extends StatefulWidget {
  const ExampleOne({super.key});

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0.0, end: 2 * pi).animate(_controller);
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Animations Builder'),
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   centerTitle: true,
      // ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (builder, child) {
                return Transform(
                  alignment: Alignment.center,
                  // origin: Offset(50, 50),
                  transform: Matrix4.identity()..rotateZ(_animation.value),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3))
                        ]),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()..rotateZ(_animation.value),
                      child: Icon(
                        Icons.settings,
                        size: 150,
                        color: Colors.cyanAccent,
                        shadows: [
                          BoxShadow(
                            offset: const Offset(0, 3),
                            color: Colors.black.withOpacity(0.8),
                            spreadRadius: 25,
                            blurRadius: 27,
                          ),
                        ],
                      ),
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()..rotateZ(-_animation.value),
                      child: Icon(
                        Icons.settings,
                        size: 150,
                        color: Colors.pink,
                        shadows: [
                          BoxShadow(
                            offset:const Offset(0, 3),
                            color: Colors.black.withOpacity(0.8),
                            spreadRadius: 25,
                            blurRadius: 27,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
              
            ),
            ElevatedButton(
              onLongPress: (){
                _controller.repeat();
              },
              onPressed: () {
                _controller.stop();
                
              },
              child:const Text('Start'),
            )
          ],
        ),
      ),
    );
  }
}
