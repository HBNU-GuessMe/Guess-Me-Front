import 'package:flutter/material.dart';
import 'package:information/conGenerator.dart';

class InfoOutroPage extends StatelessWidget {
  const InfoOutroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: SizedBox(
          width: 200,
          child: Image.asset('assets/GuessMe_AppBar_newLogo.png'),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 300,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/GuessMe_talkBox.jpg',
                    fit: BoxFit.contain,
                  ),
                  const Positioned(
                    top: 95,
                    left: 20,
                    right: 20,
                    child: Text(
                      '답변을 완료해주셔서 감사해요!\n이제 저 해피가 질문을\n잘 만들어낼 수 있을거에요!\n이제 가족과 연결하고,\n해피의 질문을 받으러 가볼까요?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 350,
              child: Image.asset('assets/GuessMe_happy_Complete.gif'),
            ),
            SizedBox(
                child: Row(
              children: <Widget>[
                const SizedBox(
                  width: 200,
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(foregroundColor: Colors.black),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const GenCode()));
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20.0,
                  ),
                  label: const Text(
                    '가족 연결하러 가기',
                    style: TextStyle(fontSize: 22.0),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
