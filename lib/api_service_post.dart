import 'dart:convert';
import 'package:http/http.dart' as http;
import 'auth_service.dart';

class ApiService {
  final String _baseUrl = "http://43.202.246.248:8000";

  Future<String?> get accessToken async => await AuthService.getAccessToken();

  Future<void> _sendRequestToServer({
    required String path,
    required Map<String, dynamic> body,
  }) async {
    String? token = await accessToken;
    try {
      var response = await http.post(
        Uri.parse('$_baseUrl/$path'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        print('Data successfully sent to the server');
      } else {
        print('Failed to send data to the server: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending data to the server: $e');
    }
  }

  Future<void> sendUserInfoToServer(
      String role, String nickname, String gender, String birth) async {
    await _sendRequestToServer(
      path: 'user/info/register',
      body: {
        'role': role,
        'nickname': nickname,
        'gender': gender,
        'birth': birth,
      },
    );
  }

  Future<void> sendUserInfo2ToServer(
      List<String?> interest, List<String?> gomin) async {
    await _sendRequestToServer(
      path: 'user/ward/info/register',
      body: {
        'interest': interest,
        'worry': gomin,
      },
    );
  }

  Future<void> sendConnectionToServer(String code, List<String?> family) async {
    await _sendRequestToServer(
      path: 'family/connection',
      body: {
        'code': code,
        'userIds': family,
      },
    );
  }

  Future<void> requestQuestionToServer(int familyId) async {
    await _sendRequestToServer(
      path: 'family/today/question?familyId=$familyId',
      body: {},
    );
  }

  Future<void> sendAnswerToServer(int? questionId, String content) async {
    await _sendRequestToServer(
      path: 'answer/register',
      body: {
        'questionId': questionId,
        'content': content,
      },
    );
  }

  Future<void> sendChattingToServer() async {
    await _sendRequestToServer(
      path: 'chat/send',
      body: {},
    );
  }
}
