void main(){
  List x = ['@kjg','jfoo'];
  print('your list is ===========${x}');
  String y = '${x}';
  y = y.substring(0,y.length-1);
  y = y.substring(1);
  print('\n\n$y\n\n');
  List z = y.split(', ');
  print(z);
}