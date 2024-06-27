// storage_appbar.dart

import 'package:flutter/material.dart';

PreferredSizeWidget buildCustomAppBar(String title) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(80.0), // 앱바 높이 조정
    child: AppBar(
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false, // 기본 뒤로가기 버튼 제거
      backgroundColor: Colors.white, // 앱바 배경색 변경
      flexibleSpace: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0), // 좌우 여백 조정
        child: Container(
          margin: const EdgeInsets.only(top: 10.0), // 상단 여백 조정
          decoration: BoxDecoration(
            color: Color(0xFFCAECFF),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 19.0,
                fontWeight: FontWeight.bold, // 볼드체 적용
                color: Colors.black,
              ),
              textAlign: TextAlign.center, // 텍스트 가운데 정렬
            ),
          ),
        ),
      ),
    ),
  );
}
