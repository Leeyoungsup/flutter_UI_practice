void main() {
  print('🎯 === Dart Class 완전 정복 === 🎯\n');
  
  // 📌 1. 기본 클래스 & 객체
  print('📌 1. 기본 클래스 & 객체');
  print('=' * 30);
  basicClassExample();
  
  // 📌 2. 생성자의 모든 것
  print('\n📌 2. 생성자의 모든 것');
  print('=' * 30);
  constructorExample();
  
  // 📌 3. 상속 & 오버라이딩
  print('\n📌 3. 상속 & 오버라이딩');
  print('=' * 30);
  inheritanceExample();
  
  // 📌 4. 추상 클래스
  print('\n📌 4. 추상 클래스');
  print('=' * 30);
  abstractClassExample();
  
  // 📌 5. 믹스인 (다중 상속)
  print('\n📌 5. 믹스인 (다중 상속)');
  print('=' * 30);
  mixinExample();
  
  // 📌 6. 접근 제어자
  print('\n📌 6. 접근 제어자 (캡슐화)');
  print('=' * 30);
  accessControlExample();
  
  // 📌 7. 정적 멤버
  print('\n📌 7. 정적 멤버 (Static)');
  print('=' * 30);
  staticExample();
  
  // 📌 8. 인터페이스
  print('\n📌 8. 인터페이스 (다형성)');
  print('=' * 30);
  interfaceExample();
}

// ═══════════════════════════════════════════════════════════════
// 📌 1. 기본 클래스 & 객체
// ═══════════════════════════════════════════════════════════════

void basicClassExample() {
  print('👤 Person 객체들을 생성해보겠습니다!\n');
  
  // 첫 번째 사람 생성
  Person person1 = Person('홍길동', 25);
  person1.introduce();
  person1.haveBirthday();
  person1.introduce();
  
  print(''); // 빈 줄
  
  // 두 번째 사람 생성
  Person person2 = Person('김철수', 30);
  person2.introduce();
}

/// 👤 사람을 나타내는 기본 클래스
class Person {
  // 🔸 인스턴스 변수 (각 객체마다 고유한 값)
  String name;    // 이름
  int age;        // 나이
  
  // 🔸 생성자 (객체를 만들 때 실행)
  Person(this.name, this.age);
  
  // 🔸 메서드 (객체의 행동)
  void introduce() {
    print('  안녕하세요! 저는 $name이고, $age세입니다.');
  }
  
  void haveBirthday() {
    age++;
    print('  🎉 생일축하해요! 이제 $age세가 되었습니다.');
  }
}

// ═══════════════════════════════════════════════════════════════
// 📌 2. 생성자의 모든 것
// ═══════════════════════════════════════════════════════════════

void constructorExample() {
  print('🚗 다양한 생성자로 자동차를 만들어보겠습니다!\n');
  
  // ① 기본 생성자
  print('① 기본 생성자:');
  Car car1 = Car('BMW', 'X5');
  car1.displayInfo();
  
  // ② 명명된 생성자들 (Named Constructors)
  print('\n② 명명된 생성자들 (Named Constructors):');
  print('   🔍 Named Constructor란?');
  print('   - 클래스명.생성자명() 형태로 사용');
  print('   - 특정 용도에 맞는 객체 생성');
  print('   - 같은 클래스에 여러 개 만들 수 있음\n');
  
  print('  🔋 전기차 전용 생성자:');
  Car car2 = Car.electric('Tesla', 'Model 3', 400);
  car2.displayInfo();
  
  print('  🏎️ 스포츠카 전용 생성자:');
  Car car3 = Car.sportsCar('Ferrari', '488 GTB');
  car3.displayInfo();
  
  print('  🚙 SUV 전용 생성자:');
  Car car4 = Car.suv('Volvo', 'XC90', 7);
  car4.displayInfo();
  
  // ③ 팩토리 생성자 (맵에서 생성)
  print('\n③ 팩토리 생성자:');
  print('   🔍 Factory Constructor란?');
  print('   - 항상 새 인스턴스를 만들지 않을 수 있음');
  print('   - 캐싱, 싱글톤 패턴 등에 유용');
  print('   - factory 키워드 사용\n');
  
  Car car5 = Car.fromMap({'brand': 'Hyundai', 'model': 'Sonata'});
  car5.displayInfo();
}

/// 🚗 자동차를 나타내는 클래스
class Car {
  String brand;           // 브랜드
  String model;           // 모델명
  int? batteryRange;      // 배터리 주행거리 (전기차만)
  int? seats;             // 좌석 수 (SUV용)
  bool isSportsCar;       // 스포츠카 여부
  
  // ① 기본 생성자
  Car(this.brand, this.model) : isSportsCar = false;
  
  // ② 명명된 생성자들 (Named Constructors)
  
  /// 🔋 전기차 전용 명명된 생성자
  Car.electric(this.brand, this.model, this.batteryRange) : 
    isSportsCar = false,
    seats = null {
    print('    ⚡ 전기차가 생성되었습니다!');
  }
  
  /// 🏎️ 스포츠카 전용 명명된 생성자
  Car.sportsCar(this.brand, this.model) : 
    batteryRange = null,
    seats = 2,
    isSportsCar = true {
    print('    🏎️ 스포츠카가 생성되었습니다!');
  }
  
  /// 🚙 SUV 전용 명명된 생성자
  Car.suv(this.brand, this.model, this.seats) : 
    batteryRange = null,
    isSportsCar = false {
    print('    🚙 SUV가 생성되었습니다!');
  }
  
  // ③ 팩토리 생성자 (특별한 방식으로 객체 생성)
  factory Car.fromMap(Map<String, String> map) {
    print('    🏭 팩토리에서 자동차를 생성합니다!');
    return Car(map['brand']!, map['model']!);
  }
  
  void displayInfo() {
    String info = '    🚗 $brand $model';
    
    // 전기차 정보
    if (batteryRange != null) {
      info += ' ⚡ (배터리: ${batteryRange}km)';
    }
    
    // 좌석 정보
    if (seats != null) {
      info += ' 👥 (${seats}인승)';
    }
    
    // 스포츠카 표시
    if (isSportsCar) {
      info += ' 🏎️ (스포츠카)';
    }
    
    print(info);
  }
}

// ═══════════════════════════════════════════════════════════════
// 📌 3. 상속 & 오버라이딩
// ═══════════════════════════════════════════════════════════════

void inheritanceExample() {
  print('🎓 상속을 통해 학생과 선생님을 만들어보겠습니다!\n');
  
  // 학생 객체
  print('📚 학생:');
  Student student = Student('이영희', 20, '컴퓨터공학과');
  student.introduce();    // 부모 클래스 메서드
  student.study();        // 자식 클래스 메서드
  
  print(''); // 빈 줄
  
  // 선생님 객체
  print('👨‍🏫 선생님:');
  Teacher teacher = Teacher('박교수', 45, '수학과');
  teacher.introduce();    // 오버라이드된 메서드
  teacher.teach();        // 자식 클래스 메서드
}

/// 📚 학생 클래스 (Person을 상속)
class Student extends Person {
  String major;  // 전공
  
  // 생성자: super()로 부모 클래스 생성자 호출
  Student(String name, int age, this.major) : super(name, age);
  
  void study() {
    print('  📖 $name이(가) $major를 열심히 공부하고 있습니다.');
  }
}

/// 👨‍🏫 선생님 클래스 (Person을 상속)
class Teacher extends Person {
  String subject;  // 담당 과목
  
  Teacher(String name, int age, this.subject) : super(name, age);
  
  // 부모 클래스 메서드를 오버라이드
  @override
  void introduce() {
    print('  👨‍🏫 안녕하세요! 저는 $subject 담당 $name 교수입니다. ($age세)');
  }
  
  void teach() {
    print('  📝 $name 교수가 $subject를 가르치고 있습니다.');
  }
}

// ═══════════════════════════════════════════════════════════════
// 📌 4. 추상 클래스
// ═══════════════════════════════════════════════════════════════

void abstractClassExample() {
  print('🐾 추상 클래스로 동물들을 만들어보겠습니다!\n');
  
  Dog dog = Dog('멍멍이');
  Cat cat = Cat('야옹이');
  
  print('🐕 강아지:');
  dog.sleep();      // 공통 메서드
  dog.makeSound();  // 구현된 추상 메서드
  
  print('\n🐱 고양이:');
  cat.sleep();      // 공통 메서드
  cat.makeSound();  // 구현된 추상 메서드
}

/// 🐾 동물 추상 클래스 (직접 인스턴스 생성 불가)
abstract class Animal {
  String name;
  
  Animal(this.name);
  
  // 일반 메서드 (이미 구현됨)
  void sleep() {
    print('  😴 $name이(가) 잠을 자고 있습니다.');
  }
  
  // 추상 메서드 (하위 클래스에서 반드시 구현해야 함)
  void makeSound();
}

/// 🐕 강아지 클래스
class Dog extends Animal {
  Dog(String name) : super(name);
  
  @override
  void makeSound() {
    print('  🐕 $name: 멍멍!');
  }
}

/// 🐱 고양이 클래스
class Cat extends Animal {
  Cat(String name) : super(name);
  
  @override
  void makeSound() {
    print('  🐱 $name: 야옹~');
  }
}

// ═══════════════════════════════════════════════════════════════
// 📌 5. 믹스인 (다중 상속)
// ═══════════════════════════════════════════════════════════════

void mixinExample() {
  print('🐬 믹스인으로 다양한 능력을 가진 동물들을 만들어보겠습니다!\n');
  
  print('🐬 돌고래 (수영 가능):');
  Dolphin dolphin = Dolphin('돌핀');
  dolphin.breathe();
  dolphin.swim();
  
  print('\n🦅 새 (비행 가능):');
  Bird bird = Bird('참새');
  bird.breathe();
  bird.fly();
}

/// 🏊 수영 능력 믹스인
mixin Swimmer {
  void swim() {
    print('  🏊 수영 중입니다!');
  }
}

/// ✈️ 비행 능력 믹스인
mixin Flyer {
  void fly() {
    print('  ✈️ 날아가고 있습니다!');
  }
}

/// 🐾 포유동물 기본 클래스
class Mammal {
  String name;
  Mammal(this.name);
  
  void breathe() {
    print('  💨 $name이(가) 숨을 쉬고 있습니다.');
  }
}

/// 🐬 돌고래 (포유동물 + 수영 능력)
class Dolphin extends Mammal with Swimmer {
  Dolphin(String name) : super(name);
}

/// 🦅 새 (포유동물 + 비행 능력)
class Bird extends Mammal with Flyer {
  Bird(String name) : super(name);
}

// ═══════════════════════════════════════════════════════════════
// 📌 6. 접근 제어자 (캡슐화)
// ═══════════════════════════════════════════════════════════════

void accessControlExample() {
  print('🏦 은행 계좌로 캡슐화를 배워보겠습니다!\n');
  
  BankAccount account = BankAccount('홍길동', 1000);
  
  print('💰 초기 잔액: ${account.getBalance()}원');
  
  account.deposit(500);
  account.withdraw(200);
  account.withdraw(2000);  // 잔액 부족으로 실패
  
  print('💰 최종 잔액: ${account.getBalance()}원');
  // account._balance = 99999;  // ❌ private 변수라 접근 불가!
}

/// 🏦 은행 계좌 클래스
class BankAccount {
  String ownerName;     // public: 누구나 접근 가능
  double _balance;      // private: 클래스 내부에서만 접근 가능 (_ 접두사)
  
  BankAccount(this.ownerName, this._balance);
  
  // 입금 메서드
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print('  💵 $amount원 입금되었습니다.');
    } else {
      print('  ❌ 올바른 금액을 입력해주세요.');
    }
  }
  
  // 출금 메서드
  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print('  💸 $amount원 출금되었습니다.');
    } else {
      print('  ❌ 출금할 수 없습니다. (잔액: $_balance원)');
    }
  }
  
  // 잔액 조회 메서드 (안전한 접근 방법)
  double getBalance() {
    return _balance;
  }
}

// ═══════════════════════════════════════════════════════════════
// 📌 7. 정적 멤버 (Static)
// ═══════════════════════════════════════════════════════════════

void staticExample() {
  print('⭕ 정적 멤버로 원을 관리해보겠습니다!\n');
  
  print('📊 초기 원의 개수: ${Circle.count}개');
  print('📐 파이 값: ${Circle.pi}');
  
  // 원 객체들 생성
  Circle circle1 = Circle(5.0);
  Circle circle2 = Circle(3.0);
  Circle circle3 = Circle(7.0);
  
  print('\n📊 생성된 원의 개수: ${Circle.count}개');
  
  // 정적 메서드로 넓이 계산
  double area = Circle.calculateArea(10.0);
  print('📏 반지름 10인 원의 넓이: ${area.toStringAsFixed(2)}');
  
  // 인스턴스 메서드로 넓이 계산
  print('📏 circle1의 넓이: ${circle1.getArea().toStringAsFixed(2)}');
}

/// ⭕ 원 클래스
class Circle {
  // 정적 변수 (모든 인스턴스가 공유)
  static int count = 0;
  static const double pi = 3.14159;
  
  // 인스턴스 변수 (각 객체마다 고유)
  double radius;
  
  Circle(this.radius) {
    count++;  // 생성될 때마다 카운트 증가
    print('  ⭕ 반지름 $radius인 원이 생성되었습니다.');
  }
  
  // 정적 메서드 (클래스명으로 직접 호출)
  static double calculateArea(double radius) {
    return pi * radius * radius;
  }
  
  // 인스턴스 메서드
  double getArea() {
    return calculateArea(radius);
  }
}

// ═══════════════════════════════════════════════════════════════
// 📌 8. 인터페이스 (다형성)
// ═══════════════════════════════════════════════════════════════

void interfaceExample() {
  print('🖨️ 인터페이스로 다양한 장치들을 만들어보겠습니다!\n');
  
  print('🖨️ 각 장치들의 기능:');
  Printer printer = Printer();
  Scanner scanner = Scanner();
  MultiFunctionDevice mfd = MultiFunctionDevice();
  
  printer.print('중요문서.pdf');
  scanner.scan('가족사진.jpg');
  
  print('\n🔄 복합기의 다양한 기능:');
  mfd.print('회의자료.docx');
  mfd.scan('계약서.pdf');
}

// 인터페이스 역할을 하는 추상 클래스들
abstract class Printable {
  void print(String document);
}

abstract class Scannable {
  void scan(String document);
}

/// 🖨️ 프린터 클래스
class Printer implements Printable {
  @override
  void print(String document) {
    print('  🖨️ 프린터로 [$document]를 출력합니다.');
  }
}

/// 📷 스캐너 클래스
class Scanner implements Scannable {
  @override
  void scan(String document) {
    print('  📷 스캐너로 [$document]를 스캔합니다.');
  }
}

/// 🔄 복합기 클래스 (다중 인터페이스 구현)
class MultiFunctionDevice implements Printable, Scannable {
  @override
  void print(String document) {
    print('  🔄 복합기로 [$document]를 출력합니다.');
  }
  
  @override
  void scan(String document) {
    print('  🔄 복합기로 [$document]를 스캔합니다.');
  }
}

