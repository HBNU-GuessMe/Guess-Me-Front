import 'package:flutter/material.dart';
import 'package:information/questNew.dart';

class ComCode extends StatelessWidget {
  const ComCode({super.key});

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
          //crossAxisAlignment: CrossAxisAlignment.center,
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
                      '환영해요!\n이제 연결된 가족과 함께\n해피가 주는 질문에 답하며\n행복한 대화 나누어 보세요 :)',
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
              child: Image.asset('assets/GuessMe_happy_smile.gif'),
            ),
            SizedBox(
                child: Row(
              children: <Widget>[
                const SizedBox(
                  width: 220,
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(foregroundColor: Colors.black),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const NewQuest()));
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20.0,
                  ),
                  label: const Text(
                    '질문 받으러 가기',
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
