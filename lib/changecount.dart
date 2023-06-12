import 'package:flutter/material.dart';

class AnimatedSwitcherCounterRoute extends StatefulWidget {
  const AnimatedSwitcherCounterRoute({Key? key}) : super(key: key);

  @override
  _AnimatedSwitcherCounterRouteState createState() =>
      _AnimatedSwitcherCounterRouteState();
}

class _AnimatedSwitcherCounterRouteState
    extends State<AnimatedSwitcherCounterRoute>
    with SingleTickerProviderStateMixin {
  int _count = 0;
  double _progress = 0.0;
  bool _showSuccess = false;

  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _colorAnimation = ColorTween(
      begin: Colors.yellow,
      end: Colors.blue,
    ).animate(_controller);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateProgress() {
    _progress = _count / 100;
    if (_progress == 1.0) {
      _controller.forward();
      _showSuccess = true;
    } else {
      _controller.reverse();
      _showSuccess = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              //执行缩放动画
              return ScaleTransition(scale: animation, child: child);
            },
            child: _showSuccess
                ? const Text(
                    '成功啦！',
                    key: Key('successText'),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Text(
                    '$_count',
                    //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
                    key: ValueKey<int>(_count),
                    style: Theme.of(context).textTheme.headline4,
                  ),
          ),
          ElevatedButton(
            child: const Text('+1'),
            onPressed: () {
              setState(() {
                _count += 1;
                _updateProgress();
              });
            },
          ),
          const SizedBox(height: 20),
          Container(
            width: 300,
            height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey,
            ),
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  left: 0,
                  top: 0,
                  bottom: 0,
                  width: 300 * _progress,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('计数器动画'),
      ),
      body: const AnimatedSwitcherCounterRoute(),
    ),
  ));
}
