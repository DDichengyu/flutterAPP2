import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: StaggerRoute(),
      ),
    );
  }
}

class StaggerRoute extends StatefulWidget {
  const StaggerRoute({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _StaggerRouteState createState() => _StaggerRouteState();
}

class _StaggerRouteState extends State<StaggerRoute>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
  }

  _playAnimation() async {
    try {
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      // Handle the exception. It may occur when the widget is disposed.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () => _playAnimation(),
            child: const Text("颜色变换"),
          ),
          Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            child: StaggerAnimation(controller: _controller),
          ),
        ],
      ),
    );
  }
}

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;
  late final Animation<double> _opacityAnimation;
  late final Animation<double> _sizeAnimation;
  late final Animation<Color?> _colorAnimation;

  StaggerAnimation({Key? key, required this.controller})
      : _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.1, curve: Curves.ease),
          ),
        ),
        _sizeAnimation = Tween<double>(begin: 0.0, end: 300.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.1, 0.6, curve: Curves.ease),
          ),
        ),
        _colorAnimation = ColorTween(
          begin: Colors.green,
          end: Colors.red,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.1, 0.6, curve: Curves.ease),
          ),
        ), super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: Container(
            width: _sizeAnimation.value,
            height: _sizeAnimation.value,
            color: _colorAnimation.value,
          ),
        );
      },
    );
  }
}
