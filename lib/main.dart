import 'package:flutter/material.dart';
//import 'package:information/infoIntro.dart';
import 'package:information/preOnboarding.dart';
//import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
//카카오 패키지 import

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: const MaterialApp(
        home: OnboardingScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}


//---------------------기본 UI구현 복붙용----------------------

/*

  final _valueList = ['첫번째', '두번째', '세번째'];
  final _selectedValue = '첫번째';

DropdownButton(
              value: _selectedValue,
              items: _valueList.map(
                (value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedValue = value!;
                });
              },
            ),

//사전정보수집5 관심사
//사전정보수집6 고민
//사전정보수집7 완료
*/