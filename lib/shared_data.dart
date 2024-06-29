import 'package:flutter/foundation.dart';

class SharedData extends ChangeNotifier {
  String _birthdayData = ""; //사전정보 생년월일
  String _genderData = ""; //사전정보 성별
  String _positionData = ""; //사전정보 보호자/피보호자
  String _nicknameData = ""; //사전정보 닉네임
  List<String?> _interestData = []; //사전정보 관심사
  List<String?> _gominData = []; //사전정보 고민
  String _myanswerData = "답변을 입력해주세요."; //나의답변저장
  String _questionData = "";

  String get birthdayData => _birthdayData;
  String get genderData => _genderData;
  String get positionData => _positionData;
  String get nicknameData => _nicknameData;
  List<String?> get interestData => _interestData;
  List<String?> get gominData => _gominData;
  String get myanswerData => _myanswerData;
  String get questionData => _questionData;

  void updateBirthdayData(String newData) {
    _birthdayData = newData;
    notifyListeners();
    print('updateBirthdayData_provider: $_birthdayData');
  }

  void updateGenderData(String newData) {
    _genderData = newData;
    notifyListeners();
    print('updateGenderData_provider: $_genderData');
  }

  void updatePositionData(String newData) {
    _positionData = newData;
    notifyListeners();
    print('updatePositionData_provider: $_positionData');
  }

  void updateNicknameData(String newData) {
    _nicknameData = newData;
    notifyListeners();
    print('updateNicknameData_provider: $_nicknameData');
  }

  void updateInterestData(List<String?> newData) {
    _interestData = newData;
    notifyListeners();
    print('updateInterestData_provider: $_interestData');
  }

  void updateGominData(List<String?> newData) {
    _gominData = newData;
    notifyListeners();
    print('updateGominData_provider: $_gominData');
  }

  void updateMyAnswerData(String newData) {
    _myanswerData = newData;
    notifyListeners();
    print('updateMyAnswerData_provider: $_myanswerData');
  }

  void updateQuestionData(String newData) {
    _questionData = newData;
    notifyListeners();
    print('updateQuestionData_provider: $_questionData');
  }
}

class UserIdManager {
  static final UserIdManager _instance = UserIdManager._internal();

  int? _userId;

  factory UserIdManager() {
    return _instance;
  }

  UserIdManager._internal();

  int? get userId => _userId;

  void setUserId(int id) {
    _userId = id;
  }
}

class AccessTokenManager {
  static final AccessTokenManager _instance = AccessTokenManager._internal();

  String? _accessToken;

  factory AccessTokenManager() {
    return _instance;
  }

  AccessTokenManager._internal();

  String? get accessToken => _accessToken;

  void setAccessToken(String code) {
    _accessToken = code;
  }
}

class QuestionManager {
  static final QuestionManager _instance = QuestionManager._internal();

  String? _question;
  int? _questionId;

  factory QuestionManager() {
    return _instance;
  }

  QuestionManager._internal();

  String? get question => _question;
  int? get questionId => _questionId;

  void setQuestion(String question) {
    _question = question;
  }

  void setQuestionId(int questionId) {
    _questionId = questionId;
  }
}

class FamilyManager {
  static final FamilyManager _instance = FamilyManager._internal();

  String? _familyCode;
  int? _familyId;
  List<String> _familyList = [];

  factory FamilyManager() {
    return _instance;
  }

  FamilyManager._internal();

  String? get familyCode => _familyCode;
  int? get familyId => _familyId;
  List<String> get familyList => _familyList;

  void updateFamilyCode(String code) {
    _familyCode = code;
  }

  void updateFamilyId(int id) {
    _familyId = id;
  }

  void updateFamilyList(List<String> list) {
    _familyList = list;
    print("가족 리스트가 업데이트 되었어요.");
  }
}
