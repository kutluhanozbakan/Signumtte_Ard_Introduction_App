// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'api/get_token_api.dart';
import 'components/splash_screen/splash_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    // ignore: prefer_const_literals_to_create_immutables
    debugShowCheckedModeBanner: false,
    title: 'ARD Tanitim Uygulamasi',
    home: const MyHomePage(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ARD Tanitim Uygulamasi',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      //Uygulama açıldığı zaman, cihaz üzerinde local olarak kayıtlı olan tokenın kontrol edilmesi sağlanmaktadır.
      //Eğer ki herhangi bir token bulunmuyor ise kullanıcıyı login sayfasına yönlendirir.
      tokenGet(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Splash();
  }
}
