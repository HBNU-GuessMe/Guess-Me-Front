import 'package:flutter/material.dart';
import 'package:information/questAnswer.dart';

class NewQuest extends StatefulWidget {
  const NewQuest({super.key});

  @override
  State<NewQuest> createState() => _NewQuestState();
}

class _NewQuestState extends State<NewQuest> {
  var _index = 0;
  List<Map<String, dynamic>> answerList = [
    {
      "type": "question",
      "content": "Q1. _user이는 어떤걸 할 때 가장 행복해?",
    },
    {
      "type": "myAnswer",
      "username": "username1",
      "answer": "answer1",
    },
    {
      "type": "memberAnswer",
      "username": "username2",
      "answer": "answer2",
    },
    {
      "type": "memberAnswer",
      "username": "username3",
      "answer": "answer4",
    },
    {
      "type": "memberAnswer",
      "username": "username4",
      "answer": "answer4",
    },
    {
      "type": "memberAnswer",
      "username": "username5",
      "answer": "answer6",
    },
  ];

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
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 230,
              child: Image.asset('assets/GuessMe_question1.gif'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: answerList.length,
                itemBuilder: (BuildContext con, int index) {
                  final item = answerList[index];
                  switch (item["type"]) {
                    case "question":
                      return questionContainer(item["content"] as String);
                    case "myAnswer":
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const AnswerQuest()));
                        },
                        child: answerContainer(
                          username: item["username"] as String,
                          answer: item["answer"] as String,
                        ),
                      );
                    case "memberAnswer":
                      return answerContainer(
                        username: item["username"] as String,
                        answer: item["answer"] as String,
                      );
                    default:
                      return const SizedBox.shrink();
                  }
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        currentIndex: _index,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/GuessMe_bottomBar11.png"),
              size: 30.0,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/GuessMe_bottomBar21.png"),
              size: 30.0,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/GuessMe_bottomBar31.png"),
              size: 30.0,
            ),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget questionContainer(String question) {
    return Center(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                question,
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
        ],
      ),
    );
  }

  Widget answerContainer({String username = '', String answer = ''}) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              username,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: 355,
            height: 70,
            padding: const EdgeInsets.all(24),
            decoration: ShapeDecoration(
              color: const Color(0xFFFFF0F6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: SizedBox(
              width: 303,
              child: Text(
                answer,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF7C7C7C),
                  fontSize: 16,
                  fontFamily: 'Pretendard JP',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
