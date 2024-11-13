import 'package:flutter/material.dart';
import 'first_page.dart';


class TitleInputForm extends StatefulWidget {
  @override
  _TitleInputFormState createState() => _TitleInputFormState();
}

class _TitleInputFormState extends State<TitleInputForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();

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
            child: Text('STEP1: 템플릿 제목을 입력해주세요',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 제목 입력 필드
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: '제목 입력',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '제목을 입력해주세요.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              // 저장 버튼
              Center(
                child: ElevatedButton(
                  onPressed: () {
// 폼 검증
                    if (_formKey.currentState!.validate()) {
// 폼이 유효하면 다음 페이지로 이동하며 제목을 전달
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FirstScreen(
                            title: _titleController.text,
                          ),
                        ),
                      );
                    }
                  },
                  child: Text('다음'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

