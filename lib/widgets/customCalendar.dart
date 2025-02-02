// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'buttonWidgets/customButtonWithGradient.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({Key? key}) : super(key: key);

  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime? _selectedDate;

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    ).then((pickedDate) {
      if (pickedDate != null) {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          _selectedDate != null
              ? DateFormat('dd/MM/yyyy').format(_selectedDate!)
              : 'Tarih seçilmedi',
          style: TextStyle(fontSize: 18),
        ),
        CustomButtonWithGradient(
          width: MediaQuery.of(context).size.width / 2,
          onPressed: _showDatePicker,
          child: const Text('Tarih Seçiniz'),
        ),
      ],
    );
  }
}
