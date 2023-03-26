  import 'package:flutter/material.dart';
  import 'package:flutter_animations/animations/example_03.dart';

  class ExampleFive extends StatefulWidget {
    const ExampleFive({super.key});

    @override
    State<ExampleFive> createState() => _ExampleFiveState();
  }

  const defaultWidth = 100.0;

  class _ExampleFiveState extends State<ExampleFive> {
    var _isZoomIn = false;
    var _buttonTitle = 'Zoom In';
    var _width = defaultWidth;
    var _curve = Curves.bounceOut;

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Animated Container'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: double.infinity,
              height: widthAndHeight,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 370),
              width: _width,
              curve: _curve,
              child: Image.network(
                'https://cdn.pixabay.com/photo/2016/04/04/14/12/monitor-1307227_960_720.jpg',
                fit: BoxFit.cover,
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _isZoomIn = !_isZoomIn; 
                  _buttonTitle = _isZoomIn ? 'Zoom Out' : 'Zoom In';
                  _width = _isZoomIn
                      ? MediaQuery.of(context).size.width
                      : defaultWidth;
                  _curve = _isZoomIn ? Curves.bounceInOut : Curves.bounceOut;
                });
              },
              child: Text(_buttonTitle),
            )
          ],
        ),
      );
    }
  }
