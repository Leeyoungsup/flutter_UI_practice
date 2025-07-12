// Dart 기본 문법 연습 예제들
// 이 파일을 참고하여 main.dart에서 연습해보세요!

void main() {
  print('=== Dart 기본 문법 연습 ===');
  
  // 1. 변수와 데이터 타입 연습
  variablesAndDataTypes();
  
  // 2. 함수 연습
  functionsExample();
  
  // 3. 클래스와 객체 연습
  classesAndObjects();
  
  // 4. 컬렉션 연습
  collectionsExample();
  
  // 5. 조건문과 반복문 연습
  controlFlowExample();
}

// 1. 변수와 데이터 타입
void variablesAndDataTypes() {
  print('\n--- 변수와 데이터 타입 ---');
  
  // 정수
  int age = 25;
  print('나이: $age');
  
  // 실수
  double height = 175.5;
  print('키: $height cm');
  
  // 문자열
  String name = 'Flutter 개발자';
  print('이름: $name');
  
  // 불린
  bool isStudent = true;
  print('학생 여부: $isStudent');
  
  // var 키워드 (타입 추론)
  var city = '서울';
  print('도시: $city');
  
  // 상수
  const pi = 3.14159;
  final currentTime = DateTime.now();
  print('원주율: $pi');
  print('현재 시간: $currentTime');
}

// 2. 함수
void functionsExample() {
  print('\n--- 함수 ---');
  
  // 기본 함수
  String greeting = sayHello('Dart');
  print(greeting);
  
  // 선택적 매개변수
  String info = getPersonInfo('김철수', age: 30, city: '부산');
  print(info);
  
  // 익명 함수
  List<int> numbers = [1, 2, 3, 4, 5];
  var squares = numbers.map((n) => n * n).toList();
  print('제곱수들: $squares');
}

String sayHello(String name) {
  return 'Hello, $name!';
}

String getPersonInfo(String name, {int? age, String? city}) {
  String result = '이름: $name';
  if (age != null) result += ', 나이: $age';
  if (city != null) result += ', 도시: $city';
  return result;
}

// 3. 클래스와 객체
void classesAndObjects() {
  print('\n--- 클래스와 객체 ---');
  
  // 객체 생성
  Person person = Person('이영희', 28);
  print('${person.name}님은 ${person.age}세입니다.');
  
  // 메서드 호출
  person.introduce();
  person.haveBirthday();
  person.introduce();
  
  // Student 클래스 (상속)
  Student student = Student('박민수', 20, '컴퓨터공학과');
  student.introduce();
  student.study();
}

class Person {
  String name;
  int age;
  
  // 생성자
  Person(this.name, this.age);
  
  // 메서드
  void introduce() {
    print('안녕하세요! 저는 $name이고, $age세입니다.');
  }
  
  void haveBirthday() {
    age++;
    print('생일이에요! 이제 $age세가 되었습니다.');
  }
}

class Student extends Person {
  String major;
  
  Student(super.name, super.age, this.major);
  
  @override
  void introduce() {
    super.introduce();
    print('전공은 $major입니다.');
  }
  
  void study() {
    print('$name이(가) $major를 공부하고 있습니다.');
  }
}

// 4. 컬렉션 (List, Set, Map)
void collectionsExample() {
  print('\n--- 컬렉션 ---');
  
  // List (배열)
  List<String> fruits = ['사과', '바나나', '오렌지'];
  print('과일들: $fruits');
  fruits.add('포도');
  print('과일 추가 후: $fruits');
  
  // Set (중복 제거)
  List<int> duplicateNumbers = [1, 2, 3, 2, 1];
  Set<int> uniqueNumbers = duplicateNumbers.toSet();
  print('원본 리스트 (중복 포함): $duplicateNumbers');
  print('중복 제거된 숫자들: $uniqueNumbers');
  
  // Map (키-값 쌍)
  Map<String, int> scores = {
    '수학': 95,
    '영어': 88,
    '과학': 92,
  };
  print('점수들: $scores');
  scores['국어'] = 90;
  print('국어 점수 추가 후: $scores');
  
  // 컬렉션 메서드들
  List<int> nums = [1, 2, 3, 4, 5];
  var evenNums = nums.where((n) => n % 2 == 0).toList();
  print('짝수들: $evenNums');
  
  var sum = nums.reduce((a, b) => a + b);
  print('합계: $sum');
}

// 5. 조건문과 반복문
void controlFlowExample() {
  print('\n--- 조건문과 반복문 ---');
  
  // if-else
  int score = 85;
  if (score >= 90) {
    print('A학점');
  } else if (score >= 80) {
    print('B학점');
  } else {
    print('더 노력하세요!');
  }
  
  // switch
  String day = 'Monday';
  switch (day) {
    case 'Monday':
      print('월요일: 새로운 한 주의 시작!');
      break;
    case 'Friday':
      print('금요일: 주말이 가까워요!');
      break;
    default:
      print('평범한 하루입니다.');
  }
  
  // for 반복문
  print('for 반복문:');
  for (int i = 1; i <= 5; i++) {
    print('숫자: $i');
  }
  
  // for-in 반복문
  List<String> colors = ['빨강', '파랑', '초록'];
  print('색깔들:');
  for (String color in colors) {
    print('- $color');
  }
  
  // while 반복문
  int count = 0;
  print('while 반복문:');
  while (count < 3) {
    print('카운트: $count');
    count++;
  }
}

// 연습해볼 수 있는 추가 예제들
class PracticeExamples {
  // TODO: 여기에 더 많은 연습 예제들을 추가해보세요!
  
  // 팩토리얼 계산
  static int factorial(int n) {
    if (n <= 1) return 1;
    return n * factorial(n - 1);
  }
  
  // 피보나치 수열
  static List<int> fibonacci(int count) {
    if (count <= 0) return [];
    if (count == 1) return [0];
    
    List<int> fib = [0, 1];
    for (int i = 2; i < count; i++) {
      fib.add(fib[i - 1] + fib[i - 2]);
    }
    return fib;
  }
  
  // 문자열 뒤집기
  static String reverseString(String input) {
    return input.split('').reversed.join('');
  }
  
  // 소수 판별
  static bool isPrime(int number) {
    if (number < 2) return false;
    for (int i = 2; i <= number ~/ 2; i++) {
      if (number % i == 0) return false;
    }
    return true;
  }
}
