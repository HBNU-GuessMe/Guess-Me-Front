import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter/widgets.dart';
import 'package:information/infoOutro.dart';

//사전정보수집4 생년월일
class BirthdayPage extends StatefulWidget {
  const BirthdayPage({super.key});

  @override
  State<BirthdayPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<BirthdayPage> {
  void _onPickerChanged(DateTime date) {
    final textDate = date.toString().split(' ').first;
    print(textDate);
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
              height: 100,
            ),
            const Text(
              '생년월일을 선택해주세요!',
              style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 1.5,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 340,
              height: 270,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
              ),
              child: CupertinoDatePicker(
                minimumYear: 1900,
                maximumYear: DateTime.now().year,
                initialDateTime: DateTime.now(),
                maximumDate: DateTime.now(),
                // dateOrder: DatePickerDateOrder.ymd,
                mode: CupertinoDatePickerMode.date,
                use24hFormat: true,
                onDateTimeChanged: _onPickerChanged,
              ),
            ),
            const SizedBox(
              height: 100,
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
                            builder: (_) => const InfoOutroPage()));
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
