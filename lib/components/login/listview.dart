import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_introduction_app_ard_grup/common/global_utils.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Column(),
    );
  }
}

PreferredSizeWidget appBar(BuildContext context) {
  return AppBar(
    leading: GestureDetector(
      child: const Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
      ),
      onTap: () {
        logout(context);
      },
    ),
  );
}
