import 'package:flutter/material.dart';
import 'package:information/infoPosition.dart';

//사전정보수집1 시작화면
class InfoIntroPage extends StatelessWidget {
  const InfoIntroPage({super.key});

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
                      '안녕하세요!\n저는 당신을 위한\n질문을 만들어줄 AI 해피에요!\n제가 좋은 질문을 만들어낼 수 있도록\n간단한 질문 6가지만 물어볼게요 :)',
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
                  width: 300,
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(foregroundColor: Colors.black),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const PositionPage()));
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20.0,
                  ),
                  label: const Text(
                    '다음',
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
