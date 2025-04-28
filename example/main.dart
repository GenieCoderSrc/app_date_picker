import 'package:flutter/material.dart';
import 'package:app_date_picker/app_date_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppDatePicker Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExampleHomePage(),
    );
  }
}

class ExampleHomePage extends StatelessWidget {
  const ExampleHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppDatePicker Demo'),
      ),
      body: Center(
        child: AppDatePicker(
          title: 'Select Birthday:',
          initDate: DateTime(2000, 1, 1),
          dateFormat: 'dd-MMMM-yyyy',
          doneTxt: 'Done',
          onSelectDateTime: (date) {
            debugPrint('Selected date: \$date');
          },
        ),
      ),
    );
  }
}
