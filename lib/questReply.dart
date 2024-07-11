import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'shared_data.dart';
import 'package:guessme/questNew.dart';

class AnswerReply extends StatefulWidget {
  const AnswerReply({super.key});

  @override
  State<AnswerReply> createState() => _AnswerReplyState();
}

class _AnswerReplyState extends State<AnswerReply> {
  String? question = "해피 피드백 질문";
  int? questionId = QuestionManager().questionId;
  final TextEditingController _controller = TextEditingController();

  String _submittedText = '';

  void _handleSubmitted(String text) {
    _controller.clear();
    setState(() {
      _submittedText = text;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).primaryColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.camera_alt, color: Colors.black),
              onPressed: () {
                // Add your camera functionality here
              },
            ),
            IconButton(
              icon: const Icon(Icons.image, color: Colors.black),
              onPressed: () {
                // Add your gallery functionality here
              },
            ),
            Flexible(
              child: TextField(
                controller: _controller,
                onSubmitted: _handleSubmitted,
                decoration:
                    const InputDecoration.collapsed(hintText: '댓글을 입력하세요'),
                style: const TextStyle(fontSize: 18.0),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: const Icon(Icons.send, color: Colors.black),
                onPressed: () => _handleSubmitted(_controller.text),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const NewQuest()),
            (Route<dynamic> route) => false,
          );
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('댓글'),
            elevation: 0.0,
          ),
          body: Center(
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 355,
                        minHeight: 70,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: ShapeDecoration(
                          color: const Color(0xFFF8BBD0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: IntrinsicHeight(
                          child: Text(
                            question ?? '',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontFamily: 'Pretendard JP',
                              fontWeight: FontWeight.w600,
                            ),
                            softWrap: true,
                          ),
                        ),
                      ),
                    ),
                    const Divider(height: 1.0),
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: _buildTextComposer(),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 90,
                  left: 220,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      _submittedText,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
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
