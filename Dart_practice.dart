// ignore: file_names


void main(){
  var oldFrinends=[
    '철수',
    '영희',
    '훈이',
  ];
  var newFriends=[
    '짱구',
    '유리',
    '맹구',
    for (var friend in oldFrinends) '친구: $friend',

  ];
  print(newFriends);
}