import 'package:flutter/material.dart';
import 'storage_appbar.dart';

class Person {
  final String name;
  final String date;
  final String emoji;

  Person(this.name, this.date, this.emoji);
}

class DataCache {
  static final DataCache _instance = DataCache._internal();
  factory DataCache() => _instance;
  DataCache._internal();

  List<Person> get persons => [
        Person('Q1', '5월 1일', '💙'),
        Person('Q2', '5월 2일', '💙'),
        Person('Q3', '5월 3일', '💙'),
        Person('Q4', '5월 4일', '😢'),
        Person('Q5', '5월 5일', '💙'),
        Person('Q6', '5월 6일', '💙'),
        Person('Q7', '5월 7일', '💙'),
        Person('Q8', '5월 8일', '💙'),
        Person('Q9', '5월 9일', '💙'),
        Person('Q10', '5월 10일', '💙'),
        Person('Q11', '5월 11일', '💙'),
        Person('Q12', '5월 12일', '😢'),
      ];
}

class StoragePage extends StatelessWidget {
  const StoragePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar("쓔리쓔리걸네 가족이 서로를 알아간 시간"),
      body: const Padding(
        padding: EdgeInsets.only(top: 10.0), // 상단 패딩 추가
        child: GroupedScrollViewGridExample(),
      ),
    );
  }
}

class GroupedScrollViewGridExample extends StatelessWidget {
  const GroupedScrollViewGridExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0), // 좌우 패딩 추가
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 한 행에 3개의 항목
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemCount: DataCache._instance.persons.length,
        itemBuilder: (BuildContext context, int index) {
          final person = DataCache._instance.persons[index];
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xFFCAECFF),
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // 텍스트를 상단 정렬
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      bottom: 8.0), // 날짜를 더 상단으로 올리기 위해 마진 추가
                  child: Text(
                    person.date,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal, // 글씨 얇게 설정
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          person.emoji,
                          style: const TextStyle(fontSize: 24),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          person.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.normal), // 글씨 얇게 설정
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: StoragePage(),
  ));
}
