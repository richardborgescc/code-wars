void main() {
  stringInterpolation();
}

/*
  https://dart.dev/codelabs/dart-cheatsheet#string-interpolation
*/
void stringInterpolation() {
  int number = 1;
  String word = 'ops';
  String interpolation = '$number $word';

  print("interpolation: $interpolation");

  String calcInterpolation = '${3 + 2}';
  print("calcInterpolation: $calcInterpolation");

  String callFunctionInterpolation = '${"upper case me".toUpperCase()}';
  print("callFunctionInterpolation: $callFunctionInterpolation");
}
