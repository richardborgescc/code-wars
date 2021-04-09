void main() {
  optionalNamedParameters();
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

/*
  https://dart.dev/codelabs/dart-cheatsheet#getters-and-setters
*/
class InvalidPriceException {}

class ShoppingCart {
  List<double> _prices = [];

  double get total => _prices.fold(0, (prev, element) => prev + element);

  set prices(List<double> value) {
    if (value.any((price) => price < 0)) {
      throw InvalidPriceException();
    }

    _prices = value;
  }
}

void gettersAndSetters() {
  ShoppingCart cart = ShoppingCart();

  cart.prices = [1, 2, 3];
  assert(cart.total == 6);
  print(cart.total);

  cart.prices = [1, -1]; // throw InvalidPriceException
}

/*
  https://dart.dev/codelabs/dart-cheatsheet#optional-positional-parameters
*/
String joinWithCommas(int a, [int? b, int? c, int? d, int? e]) {
  String sum = '${a}';
  
  if (b != null) sum = '$sum,$b';
  if (c != null) sum = '$sum,$c';
  if (d != null) sum = '$sum,$d';
  if (e != null) sum = '$sum,$e';
  
  return sum;
}

void optionalPositionalParameters() {
  print(joinWithCommas(1, 2, 3));
}

/*
  https://dart.dev/codelabs/dart-cheatsheet#optional-named-parameters
*/
class MyDataObject {
  final int anInt;
  final String aString;
  final double aDouble;

  MyDataObject({
     this.anInt = 1,
     this.aString = 'Old!',
     this.aDouble = 2.0,
  });

  // Add your copyWith method here:
  MyDataObject copyWith({int? newInt, String? newString, double? newDouble}) => 
    MyDataObject(
      anInt: newInt ?? this.anInt,
      aString: newString ?? this.aString,
      aDouble: newDouble ?? this.aDouble,
    );
}

void optionalNamedParameters() {
  MyDataObject dataObj = MyDataObject();

  print('Original:');
  print(dataObj.anInt);
  print(dataObj.aString);
  print(dataObj.aDouble);

  MyDataObject copyDataObj = dataObj.copyWith(newInt: 99,newDouble: 3.9);
  print('Copy with new values:');
  print(copyDataObj.anInt);
  print(copyDataObj.aString);
  print(copyDataObj.aDouble);
}
