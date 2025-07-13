// ignore: file_names
void main(){
  late final String? name;
  // print(name); // 선언 전에 접근하면 오류 발생
  name = null;
  // name='Dart'; //단 한번만 초기화 가능
  print("Hello, $name!");
}