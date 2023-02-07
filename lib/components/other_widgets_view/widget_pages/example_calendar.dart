import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../widgets/cardWidgets/customCardWithImage.dart';
import '../../../widgets/customCalendar.dart';

class ExampleCalendar extends StatefulWidget {
  const ExampleCalendar({super.key});

  @override
  State<ExampleCalendar> createState() => _ExampleCalendarState();
}

class _ExampleCalendarState extends State<ExampleCalendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 50),
            child: CustomCardWithImage(
              cardName: "Takvim Örneği",
              isIcon: false,
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
            child: CustomCalendar(),
          )
        ],
      ),
    );
  }
}
