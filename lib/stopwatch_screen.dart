import 'package:flutter/material.dart';
import 'dart:async';

class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({super.key});

  @override
  _StopwatchScreenState createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  Stopwatch _stopwatch = Stopwatch();
  late Timer _timer;
  List<String> _lapTimes = [];

  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {});
    });
  }

  void _startStopwatch() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
    } else {
      _stopwatch.start();
      _startTimer();
    }
  }

  void _resetStopwatch() {
    setState(() {
      _stopwatch.reset();
      _lapTimes.clear();
    });
  }

  String _formattedTime(Duration elapsed) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(elapsed.inMinutes.remainder(60));
    final seconds = twoDigits(elapsed.inSeconds.remainder(60));
    final milliseconds = (elapsed.inMilliseconds.remainder(1000) / 10)
        .toStringAsFixed(0)
        .padLeft(2, '0');
    return "$minutes:$seconds:$milliseconds";
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final elapsed = _formattedTime(_stopwatch.elapsed);

    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 255, 255, 255), // Background warna gelap
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 255, 254, 254),
        elevation: 0,
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back, color: Color.fromARGB(255, 0, 0, 0)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Stopwatch',
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.timer, color: Color.fromARGB(255, 0, 0, 0)),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            // Timer melingkar dengan border oranye dan teks putih di tengah
            Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromARGB(255, 255, 255,
                    255), // Latar belakang lingkaran berwarna hitam
                border: Border.all(
                  color: Colors.orange, // Warna border oranye
                  width: 8, // Ketebalan border
                ),
              ),
              child: Center(
                child: Text(
                  elapsed,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            const Spacer(flex: 2),

            // Tombol reset dan play/pause
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _resetStopwatch,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: const Color(0xFF2C2C2C),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                  ),
                  child: const Text('Reset',
                      style: TextStyle(color: Colors.white)),
                ),
                FloatingActionButton(
                  onPressed: _startStopwatch,
                  backgroundColor: Colors.orangeAccent,
                  child: Icon(
                    _stopwatch.isRunning ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
