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

class _GamePageState extends State<GamePage> {
  static const int _gameDuration = 10;
  late int _timeLeft;
  int _score = 0;
  double _xPos = 0.5, _yPos = 0.5;
  Timer? _gameTimer;

  @override
  void initState() {
    super.initState();
    _startGame();
  }

  void _startGame() {
    _score = 0;
    _timeLeft = _gameDuration;
    _moveTarget();

    _gameTimer?.cancel();
    _gameTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
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
    _xPos = rnd.nextDouble() * 0.8 + 0.1;
    _yPos = rnd.nextDouble() * 0.8 + 0.1;
  }

  void _onTapTarget() {
    if (_timeLeft > 0) {
      setState(() {
        _score++;
        _moveTarget();
      });
    }
  }

  void _showEndDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (_) => AlertDialog(
            title: const Text('Time’s Up!'),
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tap the Circle'), centerTitle: true),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 16,
            left: 16,
            child: Text(
              'Time: $_timeLeft',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: Text('Score: $_score', style: const TextStyle(fontSize: 20)),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              final w = constraints.maxWidth;
              final h = constraints.maxHeight;
              return Positioned(
                left: _xPos * w,
                top: _yPos * h,
                child: GestureDetector(
                  onTap: _onTapTarget,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
