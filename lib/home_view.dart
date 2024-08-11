import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

const defaultWidth = 100.0;

class _HomePageState extends State<HomePage> {
  var _isZoomIn = false;
  var _buttonTitle = 'Zoom in';
  var _width = defaultWidth;
  var _curve = Curves.bounceOut;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Animated Container"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(
                    milliseconds: 370,
                  ),
                  width: _width,
                  curve: _curve,
                  child: Image.asset('assets/images/bg.png'),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    _isZoomIn = !_isZoomIn;
                    _buttonTitle = _isZoomIn ? "Zoom Out" : "Zoom In";
                    _width = _isZoomIn
                        ? MediaQuery.of(context).size.width
                        : defaultWidth;

                    _curve = _isZoomIn ? Curves.bounceInOut : Curves.bounceOut;
                  });
                },
                child: Text(
                  _buttonTitle,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
