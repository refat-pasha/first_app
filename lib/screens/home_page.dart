import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const TapGameApp());
}

class TapGameApp extends StatelessWidget {
  const TapGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tap Game',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
      if (counter >= 15) {
        Navigator.of(
          context,
        ).pushReplacement(MaterialPageRoute(builder: (_) => const GamePage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome!'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Hi 👋, I'm Refat Pasha!",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'This is my first Flutter app.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 32),
            Text(
              'Button pressed $counter times.',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: incrementCounter,
              icon: const Icon(Icons.add),
              label: const Text('Tap me!'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> with TickerProviderStateMixin {
  static const int _gameDuration = 10;
  late int _timeLeft;
  int _score = 0;
  double _xPos = 0.5, _yPos = 0.5;
  Timer? _gameTimer;

  // Animated +1 entries at absolute positions
  final List<_ScoreMarker> _markers = [];

  // Key to get Stack's context for coordinate conversion
  final GlobalKey _stackKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _startGame();
  }

  void _startGame() {
    _score = 0;
    _timeLeft = _gameDuration;
    // dispose existing markers
    for (var m in _markers) m.controller.dispose();
    _markers.clear();
    _moveTarget();

    _gameTimer?.cancel();
    _gameTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() {
        _timeLeft--;
        if (_timeLeft <= 0) {
          timer.cancel();
          _showEndDialog();
        }
      });
    });
  }

  void _moveTarget() {
    final rnd = Random();
    setState(() {
      _xPos = rnd.nextDouble() * 0.8 + 0.1;
      _yPos = rnd.nextDouble() * 0.8 + 0.1;
    });
  }

  void _onTapDown(TapDownDetails details) {
    if (_timeLeft <= 0) return;
    // Get tap position relative to the Stack
    final RenderBox box =
        _stackKey.currentContext!.findRenderObject() as RenderBox;
    final Offset local = box.globalToLocal(details.globalPosition);
    setState(() {
      _score++;
      // add marker
      final controller = AnimationController(
        duration: const Duration(milliseconds: 800),
        vsync: this,
      )..forward();
      _markers.add(_ScoreMarker(position: local, controller: controller));
      // remove after animation
      controller.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.dispose();
          setState(() {
            _markers.removeWhere((m) => m.controller == controller);
          });
        }
      });
      _moveTarget();
    });
  }

  void _showEndDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (_) => AlertDialog(
            title: const Text("Time's Up!"),
            content: Text('Your score: $_score'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const HomePage()),
                  );
                },
                child: const Text('Restart'),
              ),
            ],
          ),
    );
  }

  @override
  void dispose() {
    _gameTimer?.cancel();
    for (var m in _markers) {
      m.controller.dispose();
    }
    _markers.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tap the Circle'), centerTitle: true),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: _onTapDown,
        child: Stack(
          key: _stackKey,
          fit: StackFit.expand,
          children: [
            // Timer & score
            Positioned(
              top: 16,
              left: 16,
              child: Text(
                'Time: $_timeLeft',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: Text(
                'Score: $_score',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Moving circle
            LayoutBuilder(
              builder: (context, c) {
                final w = c.maxWidth, h = c.maxHeight;
                return Positioned(
                  left: _xPos * w - 30,
                  top: _yPos * h - 30,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 4),
                      ],
                    ),
                  ),
                );
              },
            ),
            // +1 markers
            ..._markers.map((m) {
              return AnimatedBuilder(
                animation: m.controller,
                builder: (context, child) {
                  final dy = -50 * m.controller.value;
                  final opacity = 1 - m.controller.value;
                  return Positioned(
                    left: m.position.dx - 10,
                    top: m.position.dy + dy - 20,
                    child: Opacity(
                      opacity: opacity,
                      child: const Text(
                        '+1',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          shadows: [
                            Shadow(color: Colors.black38, blurRadius: 2),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _ScoreMarker {
  final Offset position;
  final AnimationController controller;
  _ScoreMarker({required this.position, required this.controller});
}
