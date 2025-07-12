import 'package:flutter/material.dart';

// 앱 시작점
void main() {
  runApp(const DartPracticeApp());
}

// 메인 앱 클래스
class DartPracticeApp extends StatelessWidget {
  const DartPracticeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dart Practice App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const PracticeHomePage(),
    );
  }
}

// 홈페이지 위젯
class PracticeHomePage extends StatefulWidget {
  const PracticeHomePage({super.key});

  @override
  State<PracticeHomePage> createState() => _PracticeHomePageState();
}

class _PracticeHomePageState extends State<PracticeHomePage> {
  // TODO: 여기에 연습할 변수들을 추가하세요
  String practiceText = 'Dart 연습을 시작하세요!';
  int practiceNumber = 0;
  List<String> practiceList = ['항목1', '항목2', '항목3'];
  bool isVisible = true;

  // TODO: 여기에 연습할 함수들을 추가하세요
  void updateText() {
    setState(() {
      practiceText = 'Hello, Dart! ${DateTime.now()}';
    });
  }

  void incrementNumber() {
    setState(() {
      practiceNumber++;
    });
  }

  void addToList() {
    setState(() {
      practiceList.add('새 항목 ${practiceList.length + 1}');
    });
  }

  void toggleVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dart Practice'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 텍스트 연습 섹션
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '텍스트 연습',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(practiceText),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: updateText,
                      child: const Text('텍스트 변경'),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // 숫자 연습 섹션
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '숫자 연습',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text('현재 숫자: $practiceNumber'),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: incrementNumber,
                      child: const Text('숫자 증가'),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // 리스트 연습 섹션
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '리스트 연습',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        itemCount: practiceList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(practiceList[index]),
                            leading: const Icon(Icons.star),
                          );
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: addToList,
                      child: const Text('항목 추가'),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // 조건부 렌더링 연습
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '조건부 렌더링 연습',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    if (isVisible)
                      const Text('이 텍스트는 조건부로 표시됩니다!'),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: toggleVisibility,
                      child: Text(isVisible ? '숨기기' : '보이기'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // TODO: 여기에 더 많은 연습 위젯들을 추가하세요
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: 여기에 연습할 코드를 작성하세요
          print('FloatingActionButton이 눌렸습니다!');
          print('현재 시간: ${DateTime.now()}');
        },
        child: const Icon(Icons.code),
      ),
    );
  }
}
