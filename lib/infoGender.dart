import 'package:flutter/material.dart';
import 'package:information/infoBirthday.dart';

//사전정보수집3 성별
class GenderPage extends StatefulWidget {
  const GenderPage({super.key});

  @override
  State<GenderPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<GenderPage> {
  bool isPressed1 = false;
  bool isPressed2 = false;
  bool isPressed3 = false;

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
              '성별을 선택해주세요!',
              style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 1.5,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 120,
            ),
            SizedBox(
              width: 105,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isPressed1 = true;
                    isPressed2 = false;
                    isPressed3 = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isPressed1
                      ? const Color.fromRGBO(248, 187, 208, 1)
                      : Colors.white,
                  padding: const EdgeInsets.all(5),
                ),
                child: Text(
                  '여자',
                  style: TextStyle(
                    color: isPressed1 ? Colors.white : Colors.black,
                    fontSize: 19.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 105,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isPressed1 = false;
                    isPressed2 = true;
                    isPressed3 = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isPressed2
                      ? const Color.fromRGBO(248, 187, 208, 1)
                      : Colors.white,
                  padding: const EdgeInsets.all(5),
                ),
                child: Text(
                  '남자',
                  style: TextStyle(
                    color: isPressed2 ? Colors.white : Colors.black,
                    fontSize: 19.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 105,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isPressed1 = false;
                    isPressed2 = false;
                    isPressed3 = true;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isPressed3
                      ? const Color.fromRGBO(248, 187, 208, 1)
                      : Colors.white,
                  padding: const EdgeInsets.all(5),
                ),
                child: Text(
                  '기타',
                  style: TextStyle(
                    color: isPressed3 ? Colors.white : Colors.black,
                    fontSize: 19.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 200,
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
                            builder: (_) => const BirthdayPage()));
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
