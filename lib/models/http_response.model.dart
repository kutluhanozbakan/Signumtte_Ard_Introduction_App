// ignore_for_file: camel_case_types, non_constant_identifier_names

//HTTP SONUC MODELİ KULLANILAN SİSTEME GÖRE DEĞİŞTİRİLEBİLİR.
class httpSonucModel {
  dynamic responseData;
  bool? success;
  String? message;
  bool? logOut = false;

  httpSonucModel(
      {required this.responseData,
      required this.success,
      required this.message,
      this.logOut});

  httpSonucModel.fromJsonData(Map<String, dynamic> data)
      : responseData = data['responseData'],
        success = data['success'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['responseData'] = responseData;
    data['success'] = success;
    return data;
  }
}
