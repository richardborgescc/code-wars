void main() {
  cascades();
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

/*
  https://dart.dev/codelabs/dart-cheatsheet#nullable-variables
*/
void nullableVariables() {
  /*
  int invalidNullSafetyNull = null; // do not work with null safety
  print(invalidNullSafetyNull);
  */

  int? nullSafetyNull = null; // dart sdk version >= 2.12
  print(nullSafetyNull);
}

/*
  https://dart.dev/codelabs/dart-cheatsheet#null-aware-operators
*/
void nullAwareOperators() {
  int? nullVar;

  nullVar ??= 3;
  print(nullVar);

  print('1 ?? 3 = ${1 ?? 3}');
  print('null ?? 12 = ${null ?? 12}');
}

/*
  https://dart.dev/codelabs/dart-cheatsheet#conditional-property-access
*/
class Person{
  String? name;
  int? age;

  Person({ this.name, this.age });
}

void conditionalPropertyAccess() {
  Person fullPerson = Person(name:"Ram", age: 18);
  Person noNamePerson = Person(age: 0);

  print(fullPerson?.name);
  print(noNamePerson?.name);
}

/*
  https://dart.dev/codelabs/dart-cheatsheet#collection-literals
*/
void collectionLiterals() {
  final aListOfStrings = ['one', 'two', 'three'];
  print(aListOfStrings);
  
  final aSetOfStrings = {'one', 'two', 'three'};
  print(aSetOfStrings);

  final aMapOfStringsToInts = {
    'one': 1,
    'two': 2,
    'three': 3,
  };
  print(aMapOfStringsToInts);

  final aListOfInts = <int>[];
  print(aListOfInts);

  final aSetOfInts = <int>{};
  print(aSetOfInts);

  final aMapOfIntToDouble = <int, double>{};
  print(aMapOfIntToDouble);

  // final aListOfBaseType = <BaseType>[SubType(), SubType()];
}

/*
  https://dart.dev/codelabs/dart-cheatsheet#arrow-syntax
*/
void arrowSyntax() {
  const aListOfStrings = ['a', 'b', 'c'];
  bool hasEmpty = aListOfStrings.any((s) => s.isEmpty);
  print(hasEmpty);

  const emptyStringList = [''];
  hasEmpty = emptyStringList.any((s) => s.isEmpty);
  print(hasEmpty);
}

/*
  https://dart.dev/codelabs/dart-cheatsheet#cascades
*/
class BigObject {
  int anInt = 0;
  String aString = '';
  List<double> aList = [];
  bool _done = false;
  
  void allDone() {
    _done = true;
  }
}
void cascades() {
  BigObject fillBigObject(BigObject obj) {
    // Create a single statement that will update and return obj:
    return obj
      ..anInt = 4
      ..aString = "opa"
      ..aList = [1, 2, 3]
      ..allDone();
  }

  BigObject obj = BigObject();
  print(fillBigObject(obj).aList);
}
