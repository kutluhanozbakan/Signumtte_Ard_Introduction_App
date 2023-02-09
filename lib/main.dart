// ignore_for_file: prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_introduction_app_ard_grup/api/static_variables.dart';
import 'package:flutter_introduction_app_ard_grup/providers/crud_view_provider.dart';
import 'package:flutter_introduction_app_ard_grup/providers/list_view_provider.dart';
import 'package:flutter_introduction_app_ard_grup/providers/login_provider.dart';
import 'package:flutter_introduction_app_ard_grup/providers/main_page_view_provider.dart';
import 'package:sizer/sizer.dart';
import 'api/get_token_api.dart';
import 'components/splash_screen/splash_view.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: providers,
      child: EasyLocalization(
        supportedLocales: const [
          //Dil seçenekleri belirtilir. Buna uygun assets dosyasında json dosyaları oluşturulur.
          Locale('tr'),
          Locale('en'),
        ],
        //dil seçeneklerinin olduğu path
        path: 'assets/translations',
        saveLocale: true,
        //başlangıç değeri
        startLocale: Locale('tr'),
        fallbackLocale: Locale('tr'),
        child: MyHomePage(),
      ),
    ),
  );
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<RegistrationProvider>(
      create: (_) => RegistrationProvider()),
  ChangeNotifierProvider<ListViewProvider>(create: (_) => ListViewProvider()),
  ChangeNotifierProvider<CrudViewProvider>(create: (_) => CrudViewProvider()),
  ChangeNotifierProvider<MainPageViewProvider>(
      create: (_) => MainPageViewProvider()),
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    StaticVariables.LangCode = context.locale.toString();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      title: 'ARD Tanitim Uygulamasi',
      home: const Splash(),
      theme: ThemeData(fontFamily: 'Raleway', dividerColor: Colors.transparent),
    );
  }
}
