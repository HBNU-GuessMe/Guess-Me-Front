import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:guessme/conList.dart';
import 'package:provider/provider.dart';
import 'shared_data.dart';
import 'common_appbar.dart';

class InsCode extends StatefulWidget {
  const InsCode({super.key});

  @override
  State<InsCode> createState() => _InsCodeState();
}

class _InsCodeState extends State<InsCode> {
  String selectedFamilyCode = "";
  final _contentEditController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _contentEditController.addListener(() {
      selectedFamilyCode = _contentEditController.text;
    });
  }

  @override
  void dispose() {
    _contentEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sharedData = Provider.of<SharedData>(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 240, 246, 1),
      appBar: const CommonAppBar(),
      body: ListView(
        children: <Widget>[
          const SizedBox(
            height: 119,
          ),
          const Text(
            '가족의 코드를 입력해주세요!',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                letterSpacing: 1.5,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 80.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(100, 100, 100, 150),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp('[a-z A-Z 0-9]'),
                      ),
                    ],
                    textAlign: TextAlign.center,
                    maxLength: 10,
                    decoration: const InputDecoration(
                      counterText: '',
                      hintText: '코드 입력하기',
                    ),
                    keyboardType: TextInputType.name,
                    controller: _contentEditController,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
            child: ElevatedButton(
              onPressed: () {
                sharedData.connectFamilyCode(selectedFamilyCode);
                showToast();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(248, 187, 208, 1),
                padding: const EdgeInsets.all(5),
              ),
              child: const Text(
                '가족과 연결하기',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 70.0,
          ),
          SizedBox(
              child: Row(
            children: <Widget>[
              const SizedBox(
                width: 300,
              ),
              TextButton(
                style: TextButton.styleFrom(foregroundColor: Colors.black),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const FamilyList()));
                },
                child: const Row(
                  children: [
                    Text(
                      '다음',
                      style: TextStyle(fontSize: 22.0),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20.0,
                    ),
                  ],
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}

void showToast() {
  Fluttertoast.showToast(
    msg: '가족과 연결되었습니다.',
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.grey,
    fontSize: 18,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT,
  );
}

void showError() {
  Fluttertoast.showToast(
    msg: '존재하지 않는 코드입니다.',
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.grey,
    fontSize: 18,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT,
  );
}
