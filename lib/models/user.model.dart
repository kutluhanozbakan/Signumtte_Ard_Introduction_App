// ignore_for_file: camel_case_types

class userData {
  String? token;
  String? expration;

  userData({this.token, this.expration});
  userData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expration = json['expration'];
  }
}

class UserResult {
  userData? data;
  int? statusCode;
  bool? success;
  String? message;

  UserResult({this.data, this.statusCode, this.success, this.message});
}
