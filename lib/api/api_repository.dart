// ignore_for_file: non_constant_identifier_names, unused_local_variable, avoid_print, depend_on_referenced_packages

import 'dart:convert';
import 'package:archive/archive.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_introduction_app_ard_grup/api/static_variables.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/http_response.model.dart';
import '../models/user.model.dart';
import '../services/dio/DioClient.dart';

class APIRepository {
  DioClient? dioClient;
  //Canlıya geçileceği zaman kullanılıcak Url
  //final String _baseUrl = "";
  final String _baseUrl = "";

//Servisten gelen cevap için bekleme süresi
//İleride değiştirilebilir.
  final int timeout = 120000;

//Uygulama içerisinde kullanılan token 30 dakika içerisinde yenileniyor, sayfa içerisinde gezen kulanıcı 30 dakika boyunca işlem yapmaz
//ise tekrar token alarak işlemlerine devam etmesi sağlanır.
//RefreshToken
  Future<bool> ReloadApiBase(String tokenValue) async {
    var dio = Dio();
    dio
      ..options.baseUrl = _baseUrl
      ..options.responseType = ResponseType.json
      ..options.contentType = "application/json; charset=UTF-8"
      ..options.connectTimeout = timeout
      ..options.receiveTimeout = timeout
      ..options.sendTimeout = timeout
      ..options.headers = {'Content-Type': 'application/json; charset=UTF-8'};
    dio.options.headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'AUTH_TOKEN': tokenValue
    };
    dioClient = DioClient(_baseUrl, dio, tokenValue);
    return true;
  }

//Login Servis Sağlayıcısı
  Future<UserResult> login(
      {@required String? userName,
      @required String? password,
      bool rememberMe = false}) async {
    try {
      var result = UserResult(mesaj: "Başarili", logOut: false);

      await ReloadApiBase("");

      Future.delayed(const Duration(seconds: 2)).whenComplete(() {});
      //Kullanılacak servisin içeriğine göre içerik değiştirilebilir.
      final response = await dioClient!.post("Login", data: {
        "kullaniciAdi": userName,
        "sifre": password,
        "mobil": "1",
      });
      //Gelen response değerinin durumuna göre kontroller sağlanabilir.
      if (response['Hata'] != null) {
        result.mesaj =
            response['Aciklama'] ?? response['Mesaj'] ?? "Giris Hatasi";
        return UserResult(
            mesaj: result.mesaj,
            user: result.user,
            success: false,
            logOut: false);
      } else if (response['basariDurumu'] == false) {
        result.user = User.fromJson(response);
        return UserResult(
            mesaj: response['mesaj'],
            user: result.user,
            success: false,
            logOut: false);
      } else {
        response['sifre'] = password;
        response['rememberMe'] = rememberMe;

        result.user = User.fromJson(response);
        if (result.user!.OTP_GEREKLI!) {
          return UserResult(
              logOut: false,
              mesaj: result.mesaj,
              success: true,
              user: result.user);
        } else {
          ReloadApiBase(result.user!.token!);
          String userString = json.encode(response);

          saveToken(result.user!);
          if (rememberMe != false) {
            rememberMeOption();
          }
        }
      }

      return UserResult(
          mesaj: result.mesaj, user: result.user, success: true, logOut: true);
    } on DioError catch (e) {
      if (DioErrorType.response == e.type) {
        if (e.response!.statusCode == 401) {
          return UserResult(
              success: false, mesaj: "Yetkisiz Erişim", logOut: true);
        }
        return UserResult(success: false, mesaj: "İstek hatası", logOut: true);
      }

      if (DioErrorType.connectTimeout == e.type) {
        return UserResult(
            success: false, mesaj: "Sistem zaman aşımına uğradı", logOut: true);
      }
      if (DioErrorType.sendTimeout == e.type) {
        return UserResult(
            success: false, mesaj: "Sistem zaman aşımına uğradı", logOut: true);
      }
      if (DioErrorType.other == e.type) {
        return UserResult(
            success: false, mesaj: "Bağlantı Hatası", logOut: true);
      }
      if (e.response != null) {
      } else {
        return UserResult(
            mesaj: e.message, user: null, success: false, logOut: false);
      }
    }
    return UserResult(mesaj: "hata", user: null, success: false, logOut: false);
  }

//sayfalama get metodu
//Verilen Sayfalama şeklinde çekilmesini sağlayan servis bağlantısı
  Future<httpSonucModel> getListForPaging(
      {@required String? controller,
      @required Map<String, dynamic>? queryParameters,
      bool redirectLogin = false}) async {
    try {
      ReloadApiBase(StaticVariables.token);
      final response =
          await dioClient!.get(controller!, queryParameters: queryParameters);
      if (response != null) {
        return httpSonucModel(
            responseData: response,
            success: true,
            message: 'Başarılı',
            logOut: false);
      }
      return httpSonucModel(
          responseData: response,
          success: false,
          message: 'Hata',
          logOut: false);
    } on DioError catch (e) {
      if (DioErrorType.other == e.type) {
        return httpSonucModel(
            responseData: {},
            success: false,
            message: "Bağlantı Hatası",
            logOut: false);
      }
      if (DioErrorType.response == e.type) {
        if (e.response!.statusCode == 401) {
          return httpSonucModel(
              success: false,
              message: "Yetkisiz Erişim",
              responseData: {},
              logOut: true);
        }
        return httpSonucModel(
            responseData: {},
            success: false,
            message: "İstek hatası",
            logOut: false);
      }
      if (DioErrorType.connectTimeout == e.type) {
        return httpSonucModel(
            responseData: {},
            success: false,
            message: "Sistem zaman aşımına uğradı",
            logOut: false);
      }
      if (DioErrorType.sendTimeout == e.type) {
        return httpSonucModel(
            responseData: {},
            success: false,
            message: "Sistem zaman aşımına uğradı",
            logOut: false);
      }
      if (e.response != null) {
        return httpSonucModel(
            responseData: {}, success: false, message: 'Hata', logOut: false);
      } else {
        //Hata dönüşü
        return httpSonucModel(
            responseData: {},
            success: false,
            message: e.message,
            logOut: false);
      }
    }
  }

//get metodu
//Verilen çekilmesini sağlayan servis bağlantısı
  Future<httpSonucModel> get(
      {@required String? controller,
      Map<String, dynamic>? queryParameters,
      bool redirectLogin = false}) async {
    var result = httpSonucModel(
        responseData: {}, success: true, message: "Başarılı", logOut: false);
    try {
      ReloadApiBase(StaticVariables.token);
      final response =
          await dioClient!.get(controller!, queryParameters: queryParameters);
      if (response != null) {
        return httpSonucModel(
            responseData: response,
            success: true,
            message: "Başarılı",
            logOut: false);
      }
      return httpSonucModel(
          responseData: response,
          success: false,
          message: "Başarısız",
          logOut: false);
    } on DioError catch (e) {
      if (DioErrorType.other == e.type) {
        return httpSonucModel(
            responseData: {},
            success: false,
            message: "Bağlantı Hatası",
            logOut: false);
      }
      if (DioErrorType.response == e.type) {
        if (e.response!.statusCode == 401) {
          return httpSonucModel(
              success: false,
              message: "Yetkisiz Erişim",
              responseData: {},
              logOut: true);
        }
        return httpSonucModel(
            responseData: {},
            success: false,
            message: "İstek hatası",
            logOut: false);
      }
      if (DioErrorType.connectTimeout == e.type) {
        return httpSonucModel(
            responseData: {},
            success: false,
            message: "Sistem zaman aşımına uğradı",
            logOut: false);
      }
      if (DioErrorType.sendTimeout == e.type) {
        return httpSonucModel(
            responseData: {},
            success: false,
            message: "Sistem zaman aşımına uğradı",
            logOut: false);
      }
      if (e.response != null) {
        return httpSonucModel(
            responseData: {},
            success: false,
            message: e.message,
            logOut: false);
      } else {
        return httpSonucModel(
            responseData: {},
            success: false,
            message: e.message,
            logOut: false);
      }
    }
  }
}

//Beni hatırla butonuna basıldığı takdirde calısan alan,
//Kullanıcının bilgilerini localstorage üzerine kayıt edilir ve bir dahaki girişinde direkt olarak local storage üzerinden alınır.
void rememberMeOption() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString("Token", StaticVariables.token);
  await prefs.setString("UserId", StaticVariables.userId.toString());
  await prefs.setString("given_name", StaticVariables.given_name);
  await prefs.setString("family_name", StaticVariables.family_name);
  await prefs.setBool("isBaro", StaticVariables.isBaro);
  await prefs.setBool("isAdmin", StaticVariables.isAdmin);
  await prefs.setBool("isKurum", StaticVariables.isKurum);
  await prefs.setString("kurumAdi", StaticVariables.kurumAdi);
  await prefs.setString("cryptedUserName", StaticVariables.cryptedUserName);
  await prefs.setString("cryptedPassword", StaticVariables.cryptedPassword);
  await prefs.setString("userLogo", StaticVariables.userLogo);
  await prefs.setString("baroLogo", StaticVariables.baroLogo);
  await prefs.setInt("baroID", StaticVariables.baroID);
}

//Kullanıcı giriş yaptıktan sonra gelen tokenı local storage üzerinde kayıt edilmesini sağlayan alan
void saveToken(User user) async {
  //Uygulama güvenliği için gelen kullanıcı kayıtları hashed edilir.
  var stringBytesSifre = utf8.encode(user.sifre!);
  var stringBytesKadi = utf8.encode(user.kullaniciAdi!);
  var gzipBytesSifre = GZipEncoder().encode(stringBytesSifre);
  var gzipBytesKadi = GZipEncoder().encode(stringBytesKadi);
  var stringEncodedSifre = base64.encode(gzipBytesSifre!);
  var stringEncodedKadi = base64.encode(gzipBytesKadi!);
  StaticVariables.cryptedPassword = stringEncodedSifre;
  StaticVariables.cryptedUserName = stringEncodedKadi;
  StaticVariables.kurumAdi = user.baroAdi ?? " ";
  StaticVariables.baroLogo = user.baroLogoBase64 ?? "";
  StaticVariables.userLogo = user.avatarBase64 ?? "";
  StaticVariables.baroID = user.baroID ?? 0;
  StaticVariables.token = user.token!;
  StaticVariables.family_name = user.adi!;
  StaticVariables.given_name = user.soyadi!;
  StaticVariables.userId = user.kullaniciID!;
  StaticVariables.isAdmin = user.isAdmin!;
  StaticVariables.isBaro = user.isBaro!;
  StaticVariables.isKurum = user.isKurum!;
}

//Şifreler hashed olarak tutulması gerektiği için encode ediliyor.
encode(String zipText) {
  var stringBytes = utf8.encode(zipText);
  var gzipBytes = GZipEncoder().encode(stringBytes);
  var stringEncoded = base64.encode(gzipBytes!);
  debugPrint('encoded: $stringEncoded');
}


//------------------------- ALTERNATİF KULLANIM-------------------------------------------------------------

 //Verilen gönderilmesini ve dönüş olarak İstenilen model için dönmesini sağlayan sağlayan servis bağlantısı

//   Future<Model_İsmi> postReturnIslemSonuc(
//       {@required String? controller,
//       @required dynamic data,
//       bool redirectLogin = false}) async {
//     try {
//       ReloadApiBase(StaticVariables.token);
//       final response = await dioClient!.post(controller!, data: data);
//       Model_İsmi sonuc = Model_İsmi.fromJson(response);
//       return sonuc;
//     } on DioError catch (e) {
//       if (DioErrorType.other == e.type) {
//         return Model_İsmi(
//             basariDurumu: false, aciklama: "Bağlantı Hatası", logOut: false);
//       }
//       if (DioErrorType.response == e.type) {
//         if (e.response!.statusCode == 401) {
//           return Model_İsmi(
//               basariDurumu: false, aciklama: "Yetkisiz Erişim", logOut: true);
//         }
//         return Model_İsmi(
//             basariDurumu: false, aciklama: "İstek hatası", logOut: false);
//       }
//       if (DioErrorType.connectTimeout == e.type) {
//         return Model_İsmi(
//             basariDurumu: false,
//             aciklama: "Sistem zaman aşımına uğradı",
//             logOut: false);
//       }
//       if (DioErrorType.sendTimeout == e.type) {
//         return Model_İsmi(
//             basariDurumu: false,
//             aciklama: "Sistem zaman aşımına uğradı",
//             logOut: false);
//       }
//       if (e.response != null) {
//         print('Dio error!');
//         print('STATUS: ${e.response?.statusCode}');
//         print('DATA: ${e.response?.data}');
//         print('HEADERS: ${e.response?.headers}');
//       } else {
//         // Error due to setting up or sending the request
//         print('Error sending request!');
//         print(e.message);
//         return Model_İsmi(
//             basariDurumu: false, aciklama: e.message, logOut: false);
//       }
//       return Model_İsmi(
//           basariDurumu: false, aciklama: e.message, logOut: false);
//     }
//   }

