import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_introduction_app_ard_grup/utils/utils.dart';
import 'package:flutter_introduction_app_ard_grup/widgets/customListTile.dart';

import '../../utils/global_utils.dart';

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
      body: Padding(
        padding: EdgeInsets.all(height_10),
        child: Column(
          children: [
            AppListTileWithAvatar(
              icon: Icons.info,
              transactionName: "1",
              transactionAmount: "2",
              transactionAmountHeight: 40,
              transactionIcon: "32",
              transactionType: "4",
            )
          ],
        ),
      ),
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
