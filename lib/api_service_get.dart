import 'dart:convert';
import 'package:http/http.dart' as http;
import 'shared_data.dart';
import 'auth_service.dart';

class ApiGet {
  final String _baseUrl = "http://43.202.246.248:8000";

  Future<String?> get accessToken async => await AuthService.getAccessToken();

  Future<dynamic> userInfoData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

  Future<void> requestQuestion(int familyId) async {
    const path = "family/today/question?familyId=2";
    final uri = Uri.parse('$_baseUrl/$path');
    String? token = await accessToken;
    final response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final decodedBody = utf8.decode(response.bodyBytes);
      final jsonResponse = jsonDecode(decodedBody);
      print(jsonResponse);
      if (jsonResponse.containsKey('data')) {
        final data = jsonResponse['data'];
        if (data.containsKey('content')) {
          String question = data['content'];
          print('Question: $question');
          QuestionManager().setQuestion(question);
        } else {
          print('data 객체에 content가 없습니다.');
        }
        if (data.containsKey('questionId')) {
          int questionId = data['questionId'];
          print('QuestionId: $questionId');
          QuestionManager().setQuestionId(questionId);
        } else {
          print('data 객체에 questionId가 없습니다.');
        }
      } else {
        print('응답에 data 객체가 없습니다.');
      }
    } else {
      print("Failed to fetch question: ${response.statusCode}");
    }
  }

  Future<void> checkFamilyCode(String familyCode) async {
    final path = "user/code/input/validate?code=$familyCode";
    final uri = Uri.parse('$_baseUrl/$path');
    String? token = await accessToken;
    final response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final decodedBody = utf8.decode(response.bodyBytes);
      final jsonResponse = jsonDecode(decodedBody);
      print(jsonResponse);
      if (jsonResponse.containsKey('data')) {
        final data = jsonResponse['data'];
        if (data.containsKey('content')) {
          String question = data['content'];
          print('Question: $question');
          QuestionManager().setQuestion(question);
        } else {
          print('data 객체에 content가 없습니다.');
        }
        if (data.containsKey('questionId')) {
          int questionId = data['questionId'];
          print('QuestionId: $questionId');
          QuestionManager().setQuestionId(questionId);
        } else {
          print('data 객체에 questionId가 없습니다.');
        }
      } else {
        print('응답에 data 객체가 없습니다.');
      }
    } else {
      print("Failed to fetch question: ${response.statusCode}");
    }
  }
}
