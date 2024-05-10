import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AnswerQuest extends StatefulWidget {
  const AnswerQuest({super.key});

  @override
  State<AnswerQuest> createState() => _AnswerQuestState();
}

class _AnswerQuestState extends State<AnswerQuest> {
  final String _user = '금쪽';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: 355,
              height: 70,
              padding: const EdgeInsets.all(24),
              decoration: ShapeDecoration(
                color: const Color(0xFFF8BBD0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: SizedBox(
                width: 303,
                child: Text(
                  'Q1. $_user이는 어떤걸 할 때 가장 행복해?',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontFamily: 'Pretendard JP',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              width: 330,
              height: 200,
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 6,
                maxLength: 150,
                decoration: InputDecoration(
                  counterText: '',
                  hintText: '답변을 입력해주세요.(최대 100자 입력 가능)',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(255, 240, 246, 1),
                      width: 3.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
                child: Row(
              children: <Widget>[
                const SizedBox(
                  width: 280,
                ),
                SizedBox(
                  width: 110,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      showToast();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(248, 187, 208, 1),
                      padding: const EdgeInsets.all(5),
                    ),
                    child: const Text(
                      '답변 완료',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
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
    msg: '답변이 기록되었어요.',
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.grey,
    fontSize: 18,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT,
  );
}
