import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:information/infoGender.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NicknamePage extends StatefulWidget {
  const NicknamePage({super.key});

  @override
  State<NicknamePage> createState() => _NicknamePageState();
}

class _NicknamePageState extends State<NicknamePage> {
  final _contentEditController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _contentEditController.addListener(() {
      final text = _contentEditController.text;
      if (text.length == 10) {
        Fluttertoast.showToast(
          msg: "10자를 초과하였습니다!",
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey,
          fontSize: 18,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    });
  }

  @override
  void dispose() {
    _contentEditController.dispose();
    super.dispose();
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
      body: ListView(
        children: <Widget>[
          const SizedBox(
            height: 119,
          ),
          const Text(
            '가족에게 불리는 호칭을 입력해주세요!',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                letterSpacing: 1.5,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 3.0,
          ),
          const Text(
            '한글, 영어, 숫자로 최대 10자까지 가능합니다.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(
            height: 80.0,
          ),
          Padding(
            padding: const EdgeInsets.all(100.0),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp('[a-z A-Z ㄱ-ㅎ|가-힣|·|：]'),
                      ),
                    ],
                    textAlign: TextAlign.center,
                    maxLength: 10,
                    decoration: const InputDecoration(
                      counterText: '',
                      hintText: '호칭 입력하기',
                    ),
                    keyboardType: TextInputType.name,
                    controller: _contentEditController,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 60.0,
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const GenderPage()));
                  print(_contentEditController.text);
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
    );
  }
}
