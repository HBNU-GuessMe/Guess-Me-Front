import 'package:flutter/material.dart';
//import 'package:guessme/preLogin.dart';
import 'package:guessme/questAnswer.dart';
import 'package:guessme/questChat.dart';
import 'package:guessme/questMypage.dart';
import 'package:guessme/questStorage.dart';
import 'shared_data.dart';
import 'package:provider/provider.dart';

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
      "content": "쓔리쓔리걸, 여행을 좋아하는데, 다음 목적지로 생각 중인 곳이 어디인지 말해줘.",
    },
    {
      "type": "myAnswer",
      "username": "username1",
      "answer": "answer1",
    },
    {
      "type": "memberAnswer",
      "username": "데디",
      "answer": "쓔리 저번부터 일본여행가고싶어하던데 일본 아닐까? 우리 가족도 일본 가자!",
    },
    {
      "type": "memberAnswer",
      "username": "맘",
      "answer": "쓔리 여행 좋아했어? 엄마랑도 여행가자!",
    },
  ];

  @override
  void initState() {
    super.initState();
    updateQuestionContent();
  }

  void updateQuestionContent() {
    String question = "쓔리쓔리걸, 여행을 좋아하는데, 다음 목적지로 생각 중인 곳이 어디인지 말해줘.";
    // String? question = QuestionManager().question;
    //if (question != null) {
    for (var i = 0; i < answerList.length; i++) {
      if (answerList[i]["type"] == "question") {
        answerList[i]["content"] = question;
        break;
      }
    }
    //}
  }

  @override
  Widget build(BuildContext context) {
    final sharedData = Provider.of<SharedData>(context);
    String myAnswer = sharedData.myanswerData;
    String myNickname = sharedData.nicknameData;

    if (myAnswer == "답변을 입력해주세요.") {
      for (var i = 0; i < answerList.length; i++) {
        if (answerList[i]["type"] == "memberAnswer") {
          answerList[i]["answer"] = "답변을 입력해주세요.";
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _index,
        children: [
          Center(
//----------------------------------------1페이지----------------------------------------
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 230,
                  child: Image.asset(myAnswer != "답변을 입력해주세요."
                      ? 'assets/GuessMe_question3.gif'
                      : 'assets/GuessMe_question1.gif'),
                ),
                const SizedBox(
                  height: 20,
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
                              username: myNickname,
                              answer: myAnswer,
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
//----------------------------------------2페이지----------------------------------------
          const StoragePage(),
//----------------------------------------3페이지----------------------------------------
          const OptionPage(),
        ],
      ),
      floatingActionButton: myAnswer != "답변을 입력해주세요."
          ? Padding(
              padding: const EdgeInsets.only(bottom: 80.0, right: 10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ChatScreen()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.pink[200],
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: const Text(
                    '속마음 토크하기',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            )
          : null,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: SizedBox(
          height: kBottomNavigationBarHeight * 1.65,
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (index) {
              setState(() {
                _index = index;
              });
            },
            currentIndex: _index,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: _index == 0
                    ? const ImageIcon(
                        AssetImage("assets/GuessMe_bottomBar13.png"),
                        size: 55.0,
                      )
                    : const ImageIcon(
                        AssetImage("assets/GuessMe_bottomBar11.png"),
                        size: 55.0,
                      ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: _index == 1
                    ? const ImageIcon(
                        AssetImage("assets/GuessMe_bottomBar23.png"),
                        size: 55.0,
                      )
                    : const ImageIcon(
                        AssetImage("assets/GuessMe_bottomBar21.png"),
                        size: 55.0,
                      ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: _index == 2
                    ? const ImageIcon(
                        AssetImage("assets/GuessMe_bottomBar33.png"),
                        size: 55.0,
                      )
                    : const ImageIcon(
                        AssetImage("assets/GuessMe_bottomBar31.png"),
                        size: 55.0,
                      ),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget questionContainer(String question) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 355,
            padding: const EdgeInsets.all(24),
            decoration: ShapeDecoration(
              color: const Color(0xFFF8BBD0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
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
            padding: const EdgeInsets.all(24),
            decoration: ShapeDecoration(
              color: const Color(0xFFFFF0F6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
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
        ],
      ),
    );
  }
}
