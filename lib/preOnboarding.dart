import 'dart:async';
import 'package:flutter/material.dart';
import 'package:information/infoPosition.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          Container(
            color: Colors.red,
            child: const Center(
              child: Text(
                '앱 소개 1',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            //decoration: Image(image: image),
          ),
          Container(
            color: Colors.blue,
            child: const Center(
              child: Text(
                '앱 소개 2',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ],
      ),
      bottomSheet: SizedBox(
        width: double.infinity,
        height: 110,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PositionPage()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(248, 187, 208, 1),
              padding: const EdgeInsets.all(5),
            ),
            child: const Text(
              '시작하기',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
