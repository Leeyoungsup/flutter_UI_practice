// ignore: file_names

void main() {
  print('=== QQ Operator (??) 연습 ===\n');
  
  // 1. 기본 QQ Operator 사용법
  print('1. 기본 QQ Operator:');
  basicQQOperator();
  
  // 2. 변수 할당에서 QQ Operator
  print('\n2. 변수 할당에서 QQ Operator:');
  variableAssignmentExample();
  
  // 3. 함수 매개변수에서 QQ Operator
  print('\n3. 함수 매개변수에서 QQ Operator:');
  parameterExample();
  
  // 4. QQ Assignment Operator (??=)
  print('\n4. QQ Assignment Operator (??=):');
  assignmentOperatorExample();
  
  // 5. 연쇄적 QQ Operator 사용
  print('\n5. 연쇄적 QQ Operator:');
  chainedQQExample();
  
  // 6. 실제 활용 예시
  print('\n6. 실제 활용 예시:');
  realWorldExample();
}

// 1. 기본 QQ Operator 사용법
void basicQQOperator() {
  String? nullableName = null;
  String? anotherName = '홍길동';
  
  // ?? 연산자: 왼쪽이 null이면 오른쪽 값 사용
  String displayName1 = nullableName ?? '익명';
  print('nullableName ?? "익명" = $displayName1');     // 익명
  
  // 값이 있는 경우 원본 값 사용
  if (anotherName != null) {
    String displayName2 = anotherName;
    print('anotherName = $displayName2');             // 홍길동
  }
  
  // 숫자에서도 사용 가능
  int? nullableAge = null;
  int? actualAge = 25;
  
  int age1 = nullableAge ?? 0;
  print('nullableAge ?? 0 = $age1');        // 0
  
  if (actualAge != null) {
    print('actualAge = $actualAge');          // 25
  }
}

// 2. 변수 할당에서 QQ Operator
void variableAssignmentExample() {
  String? userInput;  // 사용자 입력이 없을 수도 있음
  String? configValue; // 설정값이 없을 수도 있음
  
  // 우선순위: 사용자 입력 > 설정값 > 기본값
  String finalValue = userInput ?? configValue ?? '기본값';
  print('최종값: $finalValue');  // 기본값
  
  // 설정값만 있는 경우
  configValue = '설정된 값';
  finalValue = userInput ?? configValue ?? '기본값';
  print('최종값: $finalValue');  // 설정된 값
  
  // 사용자 입력이 있는 경우
  userInput = '사용자 입력값';
  finalValue = userInput ?? configValue ?? '기본값';
  print('최종값: $finalValue');  // 사용자 입력값
}

// 3. 함수 매개변수에서 QQ Operator
void parameterExample() {
  greetUser('김철수');
  greetUser(null);
  
  calculateTax(1000);
  calculateTax(1000, 0.15);
  calculateTax(1000, null);
}

void greetUser(String? name) {
  String displayName = name ?? '게스트';
  print('안녕하세요, $displayName님!');
}

void calculateTax(double amount, [double? taxRate]) {
  double rate = taxRate ?? 0.1;  // 기본 세율 10%
  double tax = amount * rate;
  print('금액: $amount, 세율: ${(rate * 100).toStringAsFixed(1)}%, 세금: $tax');
}

// 4. QQ Assignment Operator (??=)
void assignmentOperatorExample() {
  String? username;
  String? email;
  
  print('초기값 - username: $username, email: $email');
  
  // ??= : 변수가 null일 때만 값을 할당
  username ??= '기본사용자';
  email ??= 'default@example.com';
  
  print('할당 후 - username: $username, email: $email');
  
  // 이미 값이 있으면 변경되지 않음
  username ??= '새로운사용자';
  email ??= 'new@example.com';
  
  print('재할당 후 - username: $username, email: $email');  // 값 변경 안됨
  
  // List에서도 사용 가능
  List<String>? items;
  print('items 초기값: $items');
  
  items ??= ['기본항목'];
  print('items 할당 후: $items');
  
  items ??= ['새항목'];  // 이미 값이 있어서 변경 안됨
  print('items 재할당 후: $items');
}

// 5. 연쇄적 QQ Operator 사용
void chainedQQExample() {
  String? primaryColor;
  String? secondaryColor;
  String? tertiaryColor = '파란색';
  
  // 여러 개의 ?? 연산자를 연쇄적으로 사용
  String finalColor = primaryColor ?? secondaryColor ?? tertiaryColor ?? '검은색';
  print('최종 색상: $finalColor');  // 파란색
  
  // 함수 호출과 함께 사용
  String result = getUserPreference() ?? getSystemDefault() ?? '기본설정';
  print('설정 결과: $result');
}

String? getUserPreference() {
  // 사용자 설정이 없다고 가정
  return null;
}

String? getSystemDefault() {
  // 시스템 기본값도 없다고 가정
  return null;
}

// 6. 실제 활용 예시
void realWorldExample() {
  // 사용자 프로필 생성 예시
  UserProfile profile = createUserProfile(
    name: '이영희',
    email: 'young@example.com',
    age: null,
    city: null
  );
  
  profile.displayInfo();
  
  // 환경 설정 예시
  AppConfig config = AppConfig();
  config.setTheme(null);
  config.setLanguage('ko');
  config.setFontSize(null);
  
  print('\n앱 설정:');
  print('테마: ${config.theme}');
  print('언어: ${config.language}');
  print('폰트 크기: ${config.fontSize}');
}

// 실제 활용을 위한 클래스들
class UserProfile {
  String name;
  String email;
  int age;
  String city;
  
  UserProfile({
    required this.name,
    required this.email,
    int? age,
    String? city,
  }) : age = age ?? 20,           // null이면 기본 나이 20
       city = city ?? '미정';      // null이면 '미정'
  
  void displayInfo() {
    print('\n사용자 프로필:');
    print('이름: $name');
    print('이메일: $email');
    print('나이: $age세');
    print('도시: $city');
  }
}

UserProfile createUserProfile({
  required String name,
  required String email,
  int? age,
  String? city,
}) {
  return UserProfile(
    name: name,
    email: email,
    age: age,
    city: city,
  );
}

class AppConfig {
  String theme = '기본';
  String language = 'en';
  int fontSize = 14;
  
  void setTheme(String? newTheme) {
    theme = newTheme ?? 'light';  // null이면 'light' 테마
  }
  
  void setLanguage(String? newLanguage) {
    language ??= 'en';  // 이미 값이 있으면 변경 안됨
    if (newLanguage != null) {
      language = newLanguage;
    }
  }
  
  void setFontSize(int? size) {
    fontSize = size ?? 16;  // null이면 기본 폰트 크기 16
  }
}

