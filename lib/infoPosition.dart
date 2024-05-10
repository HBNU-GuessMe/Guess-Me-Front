import 'package:flutter/material.dart';
import 'package:information/infoNickname.dart';

//사전정보수집 부모or자녀
class PositionPage extends StatefulWidget {
  const PositionPage({super.key});

  @override
  State<PositionPage> createState() => _PositionPageState();
}

class _PositionPageState extends State<PositionPage> {
  bool isPressed1 = false;
  bool isPressed2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 240, 246, 1),
      appBar: AppBar(
        title: SizedBox(
          width: 200,
          height: 200,
          child: Image.asset('assets/GuessMe_AppBar_newLogo.png'),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(255, 240, 246, 1),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            const Text(
              '본인에게 해당하는 것을 선택해주세요!',
              style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 1.5,
                  fontSize: 21.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 150,
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isPressed1 = true; // 버튼 A를 선택하면 true로 설정
                    isPressed2 = false; // 동시에 버튼 B는 false로 설정하여 선택 해제
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isPressed1
                      ? const Color.fromRGBO(248, 187, 208, 1)
                      : Colors.white,
                  padding: const EdgeInsets.all(5),
                ),
                child: Text(
                  '부모/보호자(보호하는 사람)',
                  style: TextStyle(
                    color: isPressed1 ? Colors.white : Colors.black,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isPressed1 = false; // 버튼 B를 선택하면 버튼 A는 false로 설정하여 선택 해제
                    isPressed2 = true; // 동시에 버튼 B를 true로 설정
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isPressed2
                      ? const Color.fromRGBO(248, 187, 208, 1)
                      : Colors.white,
                  padding: const EdgeInsets.all(5),
                ),
                child: Text(
                  '자녀/피보호자(보호받는 사람)',
                  style: TextStyle(
                    color: isPressed2 ? Colors.white : Colors.black,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 80,
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
                            builder: (_) => const NicknamePage()));
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
