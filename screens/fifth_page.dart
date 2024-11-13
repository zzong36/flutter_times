import 'package:flutter/material.dart';
import 'second_page.dart';

class DynamicFormPage extends StatefulWidget {
  @override
  _DynamicFormPageState createState() => _DynamicFormPageState();
}

class _DynamicFormPageState extends State<DynamicFormPage> {
  final _formKey = GlobalKey<FormState>();
  List<TextEditingController> _controllers = [];

  @override
  void initState() {
    super.initState();
    // 처음에 기본 Form 추가
    _addFormField();
  }

  // 입력 필드 추가
  void _addFormField() {
    setState(() {
      _controllers.add(TextEditingController());
    });
  }

  // 입력 필드 삭제
  void _removeFormField(int index) {
    setState(() {
      _controllers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: _controllers.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: <Widget>[
                          // 입력 필드
                          Expanded(
                            child: TextFormField(
                              controller: _controllers[index],
                              decoration: InputDecoration(
                                labelText: 'STEP ${index + 1}',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                          // 삭제 버튼
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.black),
                            onPressed: () {
                              _removeFormField(index);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              // 저장 버튼 (폼 전체 검증)
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // 입력된 값들을 리스트로 추출하여 다음 페이지로 전달
                    List<String> formValues = _controllers.map((controller) => controller.text).toList();
                    Navigator.push(
                        context,
                      MaterialPageRoute(
                        builder: (context) => SecondScreen(formValues: formValues),
                      ),
                    );
                  } else {
                    // 폼이 유효하지 않을 때 경고 메시지 표시
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('업무 내용을 입력해주세요')),
                    );
                  }
                },
                child: Text('저장'),
              ),
            ],
          ),
        ),
      ),
      // + 버튼
      floatingActionButton: FloatingActionButton(
        onPressed: _addFormField,
        child: Text('추가 +'),
      ),
    );
  }

  @override
  void dispose() {
    // 모든 컨트롤러 해제
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}


