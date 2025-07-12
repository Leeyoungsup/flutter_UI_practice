// ignore: file_names
void main(){
  var name;
  name='Haribo';
  name=12;
  name=true;
  if(name is String){
    print("String: $name");
  } else if(name is int){
    print("int: $name");    
  } else if(name is bool){
    print("bool: $name");
  } else {
    print("Unknown type");
  }
}