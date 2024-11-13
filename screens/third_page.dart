import 'package:flutter/material.dart';
import 'fourth_page.dart';

class ThirdScreen extends StatelessWidget {
final List<String> formValues;  // 첫 번째 페이지에서 입력된 값들
final List<String> ratioValues; // 두 번째 페이지에서 입력된 비율 값들

ThirdScreen({required this.formValues, required this.ratioValues});

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('템플릿 저장이 완료되었습니다.')),
    body: Padding(
      padding: const EdgeInsets.all(30.0),
      child: ListView.builder(
        itemCount: formValues.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text('STEP ${index + 1}: ${formValues[index]}'),
              subtitle: Text('비율: ${ratioValues[index]}'),
            ),
          );
        },
      ),
    ),
  );
}
}
