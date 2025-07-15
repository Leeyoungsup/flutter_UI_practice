void main() {
  print('=== Dart Class 연습 ===\n');
  
  // 1. 기본 클래스 사용
  print('1. 기본 클래스 사용:');
  basicClassExample();
  
  // 2. 생성자 다양한 사용법
  print('\n2. 생성자 다양한 사용법:');
  constructorExample();
  
  // 3. 상속 (Inheritance)
  print('\n3. 상속 (Inheritance):');
  inheritanceExample();
  
  // 4. 추상 클래스 (Abstract Class)
  print('\n4. 추상 클래스 (Abstract Class):');
  abstractClassExample();
  
  // 5. 믹스인 (Mixin)
  print('\n5. 믹스인 (Mixin):');
  mixinExample();
  
  // 6. 접근 제어자 (Private/Public)
  print('\n6. 접근 제어자:');
  accessControlExample();
  
  // 7. 정적 멤버 (Static)
  print('\n7. 정적 멤버 (Static):');
  staticExample();
  
  // 8. 인터페이스 (Interface)
  print('\n8. 인터페이스 (Interface):');
  interfaceExample();
}

// 1. 기본 클래스 예제
void basicClassExample() {
  // 기본 생성자로 객체 생성
  Person person1 = Person('홍길동', 25);
  person1.introduce();
  person1.haveBirthday();
  person1.introduce();
  
  // 다른 객체 생성
  Person person2 = Person('김철수', 30);
  person2.introduce();
}

class Person {
  // 인스턴스 변수 (Properties)
  String name;
  int age;
  
  // 생성자 (Constructor)
  Person(this.name, this.age);
  
  // 메서드 (Methods)
  void introduce() {
    print('안녕하세요! 저는 $name이고, $age세입니다.');
  }
  
  void haveBirthday() {
    age++;
    print('생일축하해요! 이제 $age세가 되었습니다.');
  }
}

// 2. 생성자 다양한 사용법
void constructorExample() {
  // 기본 생성자
  Car car1 = Car('BMW', 'X5');
  car1.displayInfo();
  
  // 명명된 생성자
  Car car2 = Car.electric('Tesla', 'Model 3', 400);
  car2.displayInfo();
  
  // 팩토리 생성자
  Car car3 = Car.fromMap({'brand': 'Hyundai', 'model': 'Sonata'});
  car3.displayInfo();
}

class Car {
  String brand;
  String model;
  int? batteryRange;  // 전기차의 경우만
  
  // 기본 생성자
  Car(this.brand, this.model);
  
  // 명명된 생성자 (Named Constructor)
  Car.electric(this.brand, this.model, this.batteryRange);
  
  // 팩토리 생성자 (Factory Constructor)
  factory Car.fromMap(Map<String, String> map) {
    return Car(map['brand']!, map['model']!);
  }
  
  void displayInfo() {
    print('자동차: $brand $model${batteryRange != null ? ' (배터리: ${batteryRange}km)' : ''}');
  }
}

// 3. 상속 (Inheritance)
void inheritanceExample() {
  Student student = Student('이영희', 20, '컴퓨터공학과');
  student.introduce();  // 부모 클래스 메서드
  student.study();      // 자식 클래스 메서드
  
  Teacher teacher = Teacher('박교수', 45, '수학과');
  teacher.introduce();  // 오버라이드된 메서드
  teacher.teach();      // 자식 클래스 메서드
}

class Student extends Person {
  String major;
  
  Student(String name, int age, this.major) : super(name, age);
  
  void study() {
    print('$name이(가) $major를 공부하고 있습니다.');
  }
}

class Teacher extends Person {
  String subject;
  
  Teacher(String name, int age, this.subject) : super(name, age);
  
  @override
  void introduce() {
    print('안녕하세요! 저는 $subject 담당 $name 교수입니다. ($age세)');
  }
  
  void teach() {
    print('$name 교수가 $subject를 가르치고 있습니다.');
  }
}

// 4. 추상 클래스 (Abstract Class)
void abstractClassExample() {
  Dog dog = Dog('멍멍이');
  Cat cat = Cat('야옹이');
  
  dog.sleep();   // 공통 메서드
  dog.makeSound(); // 구현된 추상 메서드
  
  cat.sleep();   // 공통 메서드
  cat.makeSound(); // 구현된 추상 메서드
}

abstract class Animal {
  String name;
  
  Animal(this.name);
  
  // 일반 메서드 (구현됨)
  void sleep() {
    print('$name이(가) 잠을 자고 있습니다.');
  }
  
  // 추상 메서드 (구현되지 않음)
  void makeSound();
}

class Dog extends Animal {
  Dog(String name) : super(name);
  
  @override
  void makeSound() {
    print('$name: 멍멍!');
  }
}

class Cat extends Animal {
  Cat(String name) : super(name);
  
  @override
  void makeSound() {
    print('$name: 야옹~');
  }
}

// 5. 믹스인 (Mixin)
void mixinExample() {
  Dolphin dolphin = Dolphin('돌핀');
  dolphin.swim();
  dolphin.breathe();
  
  Bird bird = Bird('참새');
  bird.fly();
  bird.breathe();
}

mixin Swimmer {
  void swim() {
    print('수영 중입니다!');
  }
}

mixin Flyer {
  void fly() {
    print('날아가고 있습니다!');
  }
}

class Mammal {
  String name;
  Mammal(this.name);
  
  void breathe() {
    print('$name이(가) 숨을 쉬고 있습니다.');
  }
}

class Dolphin extends Mammal with Swimmer {
  Dolphin(String name) : super(name);
}

class Bird extends Mammal with Flyer {
  Bird(String name) : super(name);
}

// 6. 접근 제어자 (Private/Public)
void accessControlExample() {
  BankAccount account = BankAccount('홍길동', 1000);
  account.deposit(500);
  account.withdraw(200);
  
  print('현재 잔액: ${account.getBalance()}');
  // account._balance = 99999;  // ❌ private 변수에 직접 접근 불가
}

class BankAccount {
  String ownerName;
  double _balance;  // private 변수 (_ 접두사)
  
  BankAccount(this.ownerName, this._balance);
  
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print('$amount원 입금되었습니다.');
    }
  }
  
  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print('$amount원 출금되었습니다.');
    } else {
      print('출금할 수 없습니다.');
    }
  }
  
  double getBalance() {
    return _balance;
  }
}

// 7. 정적 멤버 (Static)
void staticExample() {
  print('원의 개수: ${Circle.count}');
  
  Circle circle1 = Circle(5.0);
  Circle circle2 = Circle(3.0);
  Circle circle3 = Circle(7.0);
  
  print('생성된 원의 개수: ${Circle.count}');
  print('파이값: ${Circle.pi}');
  
  double area = Circle.calculateArea(10.0);
  print('반지름 10인 원의 넓이: $area');
}

class Circle {
  static int count = 0;  // 정적 변수
  static const double pi = 3.14159;  // 정적 상수
  
  double radius;
  
  Circle(this.radius) {
    count++;  // 생성될 때마다 카운트 증가
  }
  
  // 정적 메서드
  static double calculateArea(double radius) {
    return pi * radius * radius;
  }
  
  // 인스턴스 메서드
  double getArea() {
    return calculateArea(radius);
  }
}

// 8. 인터페이스 (Interface)
void interfaceExample() {
  Printer printer = Printer();
  Scanner scanner = Scanner();
  MultiFunctionDevice mfd = MultiFunctionDevice();
  
  printer.print('문서1');
  scanner.scan('사진1');
  
  mfd.print('문서2');
  mfd.scan('사진2');
}

// 인터페이스 역할을 하는 추상 클래스
abstract class Printable {
  void print(String document);
}

abstract class Scannable {
  void scan(String document);
}

class Printer implements Printable {
  @override
  void print(String document) {
    print('프린터로 $document를 출력합니다.');
  }
}

class Scanner implements Scannable {
  @override
  void scan(String document) {
    print('스캐너로 $document를 스캔합니다.');
  }
}

// 다중 인터페이스 구현
class MultiFunctionDevice implements Printable, Scannable {
  @override
  void print(String document) {
    print('복합기로 $document를 출력합니다.');
  }
  
  @override
  void scan(String document) {
    print('복합기로 $document를 스캔합니다.');
  }
}

