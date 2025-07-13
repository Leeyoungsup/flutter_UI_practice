// ignore: file_names

void main() {
  print('=== Dart Function 연습 ===\n');
  
  // 1. 기본 함수 호출
  print('1. 기본 함수:');
  basicFunction();
  
  // 2. 반환값이 있는 함수
  print('\n2. 반환값이 있는 함수:');
  int result = addNumbers(5, 3);
  print('5 + 3 = $result');
  
  // 3. 다양한 매개변수 타입
  print('\n3. 다양한 매개변수:');
  greetPerson('홍길동', 25);
  
  // 4. 선택적 매개변수 (Optional Parameters)
  print('\n4. 선택적 매개변수:');
  greetWithOptional('김철수');
  greetWithOptional('이영희', 30);
  
  // 5. 명명된 매개변수 (Named Parameters)
  print('\n5. 명명된 매개변수:');
  createUser(name: '박민수', age: 28);
  createUser(name: '최수진', age: 22, city: '서울');
  
  // 6. 기본값이 있는 매개변수
  print('\n6. 기본값이 있는 매개변수:');
  calculateArea(5);
  calculateArea(5, 10);
  
  // 7. 익명 함수 (Anonymous Functions)
  print('\n7. 익명 함수:');
  List<int> numbers = [1, 2, 3, 4, 5];
  numbers.forEach((number) {
    print('숫자: $number');
  });
  
  // 8. 화살표 함수 (Arrow Functions)
  print('\n8. 화살표 함수:');
  int doubled = doubleNumber(4);
  print('4의 두 배: $doubled');
  String formattedName = formatName('홍', '길동');
  print('형식화된 이름: $formattedName');
  // 9. 고차 함수 (Higher-order Functions)
  print('\n9. 고차 함수:');
  performOperation(10, 5, add);
  performOperation(10, 5, multiply);
  
  // 10. 함수를 변수에 저장
  print('\n10. 함수를 변수에 저장:');
  Function myFunction = sayHello;
  myFunction();
  
  // 11. 재귀 함수
  print('\n11. 재귀 함수:');
  int fact = factorial(5);
  print('5! = $fact');
  
  // 12. 함수형 프로그래밍
  print('\n12. 함수형 프로그래밍:');
  List<int> allNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  List<int> evenNumbers = filterEvenNumbers(allNumbers);
  print('짝수들: $evenNumbers');
  
  // 13. 클로저 (Closure)
  print('\n13. 클로저:');
  Function multiplyBy3 = createMultiplier(3);
  print('7 × 3 = ${multiplyBy3(7)}');
  
  // 14. Named Arguments 예제
  print('\n14. Named Arguments 예제:');
  displayPersonInfo(name: '홍길동', age: 25);
  displayPersonInfo(name: '김영희', age: 30, city: '서울', job: '개발자');
  displayPersonInfo(age: 22, name: '이철수', job: '학생');  // 순서 바뀌어도 OK
  
  List<int> numbers1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  print('원본 리스트: $numbers1');

  // where()는 조건에 맞는 값들을 반환
  var evenNumbers1 = numbers1.where((number) => number % 2 == 0);
  print('짝수들 (값): ${evenNumbers1}');
}

// 1. 기본 함수 (반환값 없음)
void basicFunction() {
  print('안녕하세요! 기본 함수입니다.');
}

// 2. 반환값이 있는 함수
int addNumbers(int a, int b) {
  return a + b;
}

// 3. 여러 매개변수를 받는 함수
void greetPerson(String name, int age) {
  print('안녕하세요, $name님! 나이: $age세');
}

// 4. 선택적 위치 매개변수 (Optional Positional Parameters)
void greetWithOptional(String name, [int? age]) {
  if (age != null) {
    print('안녕하세요, $name님! 나이: $age세');
  } else {
    print('안녕하세요, $name님!');
  }
}

// 5. 명명된 매개변수 (Named Parameters)
void createUser({required String name, required int age, String? city}) {
  print('사용자 생성: $name, $age세${city != null ? ', $city 거주' : ''}');
}

// 6. 기본값이 있는 매개변수
void calculateArea(double width, [double height = 1.0]) {
  double area = width * height;
  print('넓이: $width × $height = $area');
}

// 7. 화살표 함수 (한 줄 함수)
int doubleNumber(int x) => x * 2;

// 8. 더 복잡한 화살표 함수
String formatName(String firstName, String lastName) => 
    '${firstName.toUpperCase()} ${lastName.toUpperCase()}';

// 9. 고차 함수 - 다른 함수를 매개변수로 받는 함수
void performOperation(int a, int b, int Function(int, int) operation,) {
  int result = operation(a, b);
  print('연산 결과: $result');
}

// 고차 함수에서 사용할 함수들
int add(int x, int y) => x + y;
int multiply(int x, int y) => x * y;
int subtract(int x, int y) => x - y;

// 10. 함수를 변수에 저장할 수 있는 함수
void sayHello() {
  print('함수를 변수에 저장했습니다!');
}

// 11. 재귀 함수 (Recursive Function)
int factorial(int n) {
  if (n <= 1) return 1;
  return n * factorial(n - 1);
}

// 12. 제네릭 함수 (Generic Function)
T getFirst<T>(List<T> list) {
  return list.first;
}

// 13. 함수형 프로그래밍 스타일
List<int> filterEvenNumbers(List<int> numbers) =>numbers.where((number) => number % 2 == 0).toList();

// 14. 클로저 (Closure) - 외부 변수에 접근하는 함수
Function createMultiplier(int multiplier) {
  return (int value) => value * multiplier;
}

// 14-1. Named Arguments 예제 함수
void displayPersonInfo({
  required String name,     // 필수 Named Argument
  required int age,         // 필수 Named Argument
  String? city,             // 선택적 Named Argument
  String? job,              // 선택적 Named Argument
  String country = '한국'    // 기본값이 있는 Named Argument
}) {
  print('=== 인물 정보 ===');
  print('이름: $name');
  print('나이: $age세');
  
  if (city != null) {
    print('거주지: $city');
  }
  
  if (job != null) {
    print('직업: $job');
  }
  
  print('국가: $country');
  print(''); // 빈 줄
}

// 15. 비동기 함수 (Async Function) - 예제용
Future<String> fetchUserData() async {
  // 실제로는 네트워크 요청이나 데이터베이스 쿼리 등
  await Future.delayed(Duration(seconds: 1));
  return '사용자 데이터를 가져왔습니다!';
}

// ============ TODO: 직접 연습해보세요! ============
/*
TODO 1: 두 수의 최대공약수를 구하는 함수를 만들어보세요
int gcd(int a, int b) {
  // 유클리드 호제법 구현
}

TODO 2: 리스트의 평균을 구하는 함수를 만들어보세요
double calculateAverage(List<double> numbers) {
  // 구현해보세요
}

TODO 3: 문자열을 역순으로 뒤집는 함수를 만들어보세요
String reverseString(String input) {
  // 구현해보세요
}

TODO 4: 소수인지 판별하는 함수를 만들어보세요
bool isPrime(int number) {
  // 구현해보세요
}
*/

