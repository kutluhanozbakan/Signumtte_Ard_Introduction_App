//Uygulama içerisinde kullanılacak imajların merkezi olarak yönetilmesi için oluşturulmuştur.
//Buraya ekleme yapmadan önce pubspec.yaml dosyasına imajın yolu verilmesi gerekmektedir.
enum APPImages {
  splashScreen,
}

extension APPImagesExtension on APPImages {
  String get images {
    switch (this) {
      case APPImages.splashScreen:
        return "lib/assets/images/ardgrup_logo.png";
    }
  }
}
