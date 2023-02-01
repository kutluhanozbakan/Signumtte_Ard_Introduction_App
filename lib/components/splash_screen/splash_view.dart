import 'package:flutter/material.dart';

import '../../utils/themes.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.none,
          image: AssetImage(APPImages.splashScreen.images),
        ),
      ),
    );
  }
}
