import 'package:flutter/material.dart';
import 'third_page.dart';

class SecondScreen extends StatefulWidget {
  final List<String> formValues; // 전달된 폼 값 리스트

  SecondScreen({required this.formValues});

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<TextEditingController> _ratioControllers = [];

  @override
  void initState() {
    super.initState();
    // 비율 입력을 위한 컨트롤러 초기화
    _ratioControllers = List.generate(widget.formValues.length, (index) => TextEditingController());
  }

  // 두 개의 리스트 값을 가져와서 다음 페이지로 전달
  void _goToNextPage() {
    List<String> ratioValues = _ratioControllers.map((controller) => controller.text).toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ThirdScreen(
          formValues: widget.formValues,
          ratioValues: ratioValues,
        ),
      ),
    );
  }

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
            child: Text('STEP3: 업무 소요 시간을 비율을 작성해주세요',
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
            Expanded(
              child: ListView.builder(
                itemCount: widget.formValues.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        // 기존 입력된 값 표시
                        Expanded(
                          flex : 1,
                          child: ListTile(
                            title: Text('STEP ${index + 1} : ${widget.formValues[index]}'), // 타이틀에 index와 값을 함께 출력
                            //subtitle: Text(formValues[index]), // 전달된 값을 출력
                          ),
                        ),
                        SizedBox(width: 10),
                        // 비율 입력 필드
                        Expanded(
                          flex:2,
                          child: TextFormField(
                            controller: _ratioControllers[index],
                            decoration: InputDecoration(
                              labelText: '비율 입력',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            // "다음" 버튼 추가
            ElevatedButton(
              onPressed: _goToNextPage,
              child: Text('다음'),
            ),
          ],
        ),
      ),
    );
  }
}

