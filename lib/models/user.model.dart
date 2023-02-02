// ignore_for_file: camel_case_types

class User {
  bool? isAvukat;
  bool? isBaro;
  bool? isKurum;
  bool? isAdmin;
  String? avatarBase64;
  String? baroLogoBase64;
  String? token;
  DateTime? expireDate;
  int? kullaniciID;
  int? baroID;
  String? eposta;
  String? adi;
  String? soyadi;
  String? gorevi;
  String? iPAdresi;
  String? remoteUser;
  int? kullaniciTipiID;
  int? MaxCountOfAgain;
  bool? OTP_BLOK;
  bool? GECERSIZ_OTP;
  bool? OTP_GEREKLI;
  int? OTP_LOG_ID;
  int? OtpDurationSecond;
  int? CountOfAgain;
  String? smsBaslik;
  String? kullaniciAdi;
  String? baroAdi;
  String? cepTelefon;
  String? kullaniciTcKimlikNo;
  String? sifre;
  bool? rememberMe;

  User(
      {this.token,
      this.smsBaslik,
      this.isKurum,
      this.isBaro,
      this.isAvukat,
      this.CountOfAgain,
      this.isAdmin,
      this.kullaniciAdi,
      this.adi,
      this.avatarBase64,
      this.baroAdi,
      this.baroID,
      this.baroLogoBase64,
      this.cepTelefon,
      this.eposta,
      this.expireDate,
      this.gorevi,
      this.iPAdresi,
      this.kullaniciID,
      this.kullaniciTcKimlikNo,
      this.kullaniciTipiID,
      this.remoteUser,
      this.soyadi,
      this.sifre,
      this.rememberMe,
      this.MaxCountOfAgain,
      this.GECERSIZ_OTP,
      this.OTP_BLOK,
      this.OTP_GEREKLI,
      this.OTP_LOG_ID,
      this.OtpDurationSecond});

  User.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    adi = json['Adi'];
    GECERSIZ_OTP = json['GECERSIZ_OTP'];
    soyadi = json['Soyadi'];
    kullaniciAdi = json['KullaniciAdi'];
    kullaniciID = json['KullaniciID'];
    kullaniciTcKimlikNo = json['KullaniciTcKimlikNo'];
    MaxCountOfAgain = json['MaxCountOfAgain'];
    CountOfAgain = json['CountOfAgain'];
    OTP_BLOK = json['OTP_BLOK'];
    OTP_LOG_ID = json['OTP_LOG_ID'];
    OTP_GEREKLI = json['OTP_GEREKLI'];
    OtpDurationSecond = json['OtpDurationSecond'];
    isAdmin = json['isAdmin'];
    isAvukat = json['isAvukat'];
    isBaro = json['isBaro'];
    isKurum = json['isKurum'];
    avatarBase64 = json['AvatarBase64'];
    baroAdi = json['BaroAdi'];
    baroID = json['BaroID'];
    baroLogoBase64 = json['BaroLogoBase64'];
    cepTelefon = json['CepTelefon'];
    eposta = json['Eposta'];
    expireDate = DateTime.tryParse(json['expire_date']);
    gorevi = json['Gorevi'];
    iPAdresi = json['IPAdresi'];
    remoteUser = json['RemoteUser'];
    smsBaslik = json['smsBaslik'];
    kullaniciTipiID = json['KullaniciTipiID'];
    sifre = json['sifre'];
    rememberMe = json['rememberMe'];
  }
}

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

class LoginRequestModel {
  String? kullaniciAdi;
  String? sifre;
  String? mobil;
  bool? beniHatirla;

  LoginRequestModel(
      {required this.sifre,
      required this.kullaniciAdi,
      this.mobil,
      this.beniHatirla});

  LoginRequestModel.fromJsonData(Map<String, dynamic> data)
      : kullaniciAdi = data['kullaniciAdi'],
        sifre = data['sifre'],
        mobil = data['mobil'],
        beniHatirla = data['beniHatirla'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kullaniciAdi'] = kullaniciAdi;
    data['sifre'] = sifre;
    data['mobil'] = mobil;
    data['beniHatirla'] = beniHatirla;
    return data;
  }
}
