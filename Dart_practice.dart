void main(){
  String? name = 'Flutter';
  name=null;
  if (name != null) {
    print('Hello, $name!');
  } else {
    print('Name is null');
  }
  name?.isEmpty;

}