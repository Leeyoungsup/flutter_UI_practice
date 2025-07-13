// ignore: file_names


void main(){
  Map<String,Object> player={
    'name':'손흥민',
    'age':31,
    'team':'토트넘 홋스퍼',
    'position':'공격수',
    'goals':20,  // 골 수
  };
  print('선수 이름: ${player['name']}');
  print('나이: ${player['age']}세');   
  print('소속 팀: ${player['team']}');
  print('포지션: ${player['position']}');
  print('올 시즌 골 수: ${player['goals']}골');
  print('--- 선수 정보 출력 완료 ---');
  
  Map<int,bool> scores = {
    1: true,  // 1번 문제 정답
    2: false, // 2번 문제 오답
    3: true,  // 3번 문제 정답
    4: false, // 4번 문제 오답
    5: true   // 5번 문제 정답
  };  
  print('문제 점수 확인:');
  scores.forEach((question, isCorrect) {
    if (isCorrect) {
      print('문제 $question: 정답');
    } else {
      print('문제 $question: 오답');
    }
  });
}