import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:information/conInput.dart';
import 'package:information/conList.dart';

class GenCode extends StatefulWidget {
  const GenCode({super.key});

  @override
  State<GenCode> createState() => _GenCodeState();
}

class _GenCodeState extends State<GenCode> {
  String _newcode = '';

  @override
  void initState() {
    super.initState();
    _generateFamilycode();
  }

  void _generateFamilycode() {
    final random = Random();
    const characters =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    String newcode = '';
    for (int i = 0; i < 10; i++) {
      newcode += characters[random.nextInt(characters.length)];
    }
    setState(() {
      _newcode = newcode;
    });
  }

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
          children: [
            const SizedBox(
              height: 119,
            ),
            const Text(
              '가족을 연결하고\n행복한 대화를 시작해보세요.',
              style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 1.5,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 60,
            ),
            const Text('클릭해서 나의 코드 복사하기!'),
            SizedBox(
              width: 200,
              height: 45,
              child: TextButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: _newcode));
                  showToast();
                },
                child: Text(
                  _newcode,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // Text(
            //   _newcode,
            //   style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            // ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 250,
              height: 45,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(248, 187, 208, 1),
                  padding: const EdgeInsets.all(5),
                ),
                child: const Text(
                  '가족에게 초대장 보내기',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 250,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const InsCode()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(248, 187, 208, 1),
                  padding: const EdgeInsets.all(5),
                ),
                child: const Text(
                  '가족의 코드로 연결하기',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
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
                  width: 230,
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(foregroundColor: Colors.black),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const FamilyList()));
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20.0,
                  ),
                  label: const Text(
                    '우리 가족 목록',
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

void showToast() {
  Fluttertoast.showToast(
    msg: '나의 코드가 복사되었습니다!\n가족에게 초대장을 보내보세요!',
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.grey,
    fontSize: 18,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT,
  );
}
