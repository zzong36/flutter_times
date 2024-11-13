import 'package:flutter/material.dart';
import 'second_page.dart';
import 'fourth_page.dart';
import 'fifth_page.dart';

class FirstScreen extends StatelessWidget {

  final String title;  // 전달받은 제목

  FirstScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Container(
            height: 150,
            padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
            margin: EdgeInsets.fromLTRB(0, 50, 0, 50),
           //color: Colors.blue,
           // color: Colors.blue,
            child: Text('STEP2: 업무 순서를 작성해주세요',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),),
          ),
        ),
      ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [

              Container(
                color: Colors.blue,
                height: 500,
                child: DynamicFormPage()
                //DynamicFormExample()
              ),
            ],
          ),
        ),
    );
  }
}

