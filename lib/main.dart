// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_introduction_app_ard_grup/providers/crud_view_provider.dart';
import 'package:flutter_introduction_app_ard_grup/providers/list_view_provider.dart';
import 'package:sizer/sizer.dart';
import 'api/get_token_api.dart';
import 'components/splash_screen/splash_view.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: providers,
    child: MaterialApp(
      // ignore: prefer_const_literals_to_create_immutables
      debugShowCheckedModeBanner: false,
      title: 'ARD Tanitim Uygulamasi',
      home: const MyHomePage(),
    ),
  ));
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<ListViewProvider>(create: (_) => ListViewProvider()),
  ChangeNotifierProvider<CrudViewProvider>(create: (_) => CrudViewProvider()),
];

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
