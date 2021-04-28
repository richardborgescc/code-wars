void main() {
  exercisePuttingItAllTogether();
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

/*
  https://dart.dev/codelabs/dart-cheatsheet#exceptions
*/
typedef VoidFunction = void Function();

class ExceptionWithMessage {
  final String message;
  const ExceptionWithMessage(this.message);
}

// Call logException to log an exception, and doneLogging when finished.
abstract class Logger {
  void logException(Type t, [String? msg]);
  void doneLogging();
}

void tryFunction(VoidFunction untrustworthy, Logger logger) {
  // Invoking this method might cause an exception. Catch and handle
  // them using try-on-catch-finally.
  
  try {
    untrustworthy();
  } on ExceptionWithMessage catch (e) {
    logger.logException(e.runtimeType, e.message);
  } on Exception {
    logger.logException((Exception));
  } finally {
    logger.doneLogging();
  }
  
}

class MyLogger extends Logger {
  Type? lastType;
  String lastMessage = '';
  bool done = false;
  
  void logException(Type t, [String? message]) {
    lastType = t;
    lastMessage = message ?? lastMessage;
  }
  
  void doneLogging() => done = true;  
}

void exceptions() {
  var logger = MyLogger();

  tryFunction(() => throw Exception(), logger);
  print('${logger.lastType} ${logger.lastMessage}');

  tryFunction(() => throw ExceptionWithMessage('Hey!'), logger);
  print('${logger.lastType} ${logger.lastMessage}');

  tryFunction(() {}, logger); // No exception, repeat last execution
  print('${logger.lastType} ${logger.lastMessage}');

  tryFunction(() => throw 'A String', logger); // Unhandled exception
}

/*
  https://dart.dev/codelabs/dart-cheatsheet#using-this-in-a-constructor
*/
class MyNamedParameterClass {
  final int anInt;
  final String aString;
  final double aDouble;
  
  // Create a constructor here.
  MyNamedParameterClass({required this.anInt, required this.aString, required this.aDouble});
}

class MyPositionalParameterClass {
  final int anInt;
  final String aString;
  final double aDouble;
  
  // Create a constructor here.
  MyPositionalParameterClass(this.anInt, this.aString, this.aDouble);
}

void usingThisInAConstructor() {
  MyNamedParameterClass(aDouble: 0.5, aString: 'invert', anInt: 10);
  MyPositionalParameterClass(10, 'string', 0.5);
}

/*
  https://dart.dev/codelabs/dart-cheatsheet#initializer-lists
*/
class FirstTwoLetters {
  final String letterOne;
  final String letterTwo;

  // Create a constructor with an initializer list here:
  FirstTwoLetters(String word)
    : letterOne = word[0],
      letterTwo = word[1],
      assert(word.length <= 2) {
        print('invalid word');
      }
}

void initializerLists() {
  FirstTwoLetters valid = FirstTwoLetters('12');
  print('${valid.letterOne}, ${valid.letterTwo}');

  FirstTwoLetters invalid = FirstTwoLetters('');
}

/*
  https://dart.dev/codelabs/dart-cheatsheet#named-constructors
*/
class Color {
  int red;
  int green;
  int blue;
  
  Color(this.red, this.green, this.blue);

  // Create a named constructor called "Color.black" here:
  Color.black()
    : red = 0,
      green = 0,
      blue = 0;
}

void namedConstructors() {
  Color color = Color.black();
  print('${color.red}, ${color.green}, ${color.blue}');
}

/*
  https://dart.dev/codelabs/dart-cheatsheet#factory-constructors
*/
class IntegerHolder {
  IntegerHolder();
  
  // Implement this factory constructor.
  factory IntegerHolder.fromList(List<int> list) {
    if (list.length == 1) {
      return IntegerSingle(list[0]);
    } else if (list.length == 2) {
      return IntegerDouble(list[0], list[1]);
    } else if (list.length == 3) {
      return IntegerTriple(list[0], list[1], list[2]);
    }

    print('I don\'t recognize');
    throw Error();
  }
}

class IntegerSingle extends IntegerHolder {
  final int a;
  IntegerSingle(this.a); 
}

class IntegerDouble extends IntegerHolder {
  final int a;
  final int b;
  IntegerDouble(this.a, this.b); 
}

class IntegerTriple extends IntegerHolder {
  final int a;
  final int b;
  final int c;
  IntegerTriple(this.a, this.b, this.c); 
}

void factoryConstructors() {
  final obj = IntegerHolder.fromList([1, 2, 3]);

  if (obj is! IntegerTriple) {
    print('it is not a IntegerTripe');
  } else {
    if (obj.a != 1) {
      print('undefined a');
    }
    print(obj.a);
    
    if (obj.b != 2) {
      print('undefined b');
    }
    print(obj.b);

    if (obj.c != 3) {
      print('undefined c');
    }
    print(obj.c);
  }
}

/*
  https://dart.dev/codelabs/dart-cheatsheet#redirecting-constructors
*/
class ColorRedirectingConstructor {
  int red;
  int green;
  int blue;
  
  ColorRedirectingConstructor(this.red, this.green, this.blue);

  ColorRedirectingConstructor.black() : this(0, 0, 0);
}

void redirectingConstructors() {
  ColorRedirectingConstructor color = ColorRedirectingConstructor.black();
  print(color.red);
}

/*
  https://dart.dev/codelabs/dart-cheatsheet#const-constructors
*/
class Recipe {
  const Recipe(this.ingredients, this.calories, this.milligramsOfSodium);
  
  final List<String> ingredients;
  final int calories;
  final double milligramsOfSodium;

  static const Recipe recipe = Recipe(['rice', 'beans'], 1000, 50);
}

void constConstructors() {
  Recipe recipe = Recipe.recipe;
  print(recipe.ingredients);
}

/*
  https://dart.dev/codelabs/iterables#example-using-a-for-in-loop
*/
void usingAForInLoop() {
  var iterable = ['Salad', 'Popcorn', 'Toast'];

  for (var element in iterable) {
    print(element);
  }
}

/*
  https://dart.dev/codelabs/iterables#example-using-first-and-last
*/
void usingFirstAndLast() {
  Iterable iterable = ['first', 'second', 'third'];

  print('first: ${iterable.first}');
  print('last: ${iterable.last}');
}

/*
  https://dart.dev/codelabs/iterables#example-using-firstwhere
*/
bool predicate(String element) {
  return element.length > 5;
}

void usingFirstwhere() {
  var items = ['Salad', 'Popcorn', 'Toast', 'Lasagne'];

  // You can find with a simple expression:
  var element1 = items.firstWhere((element) => element.length > 5);
  print(element1);

  // Or try using a function block:
  var element2 = items.firstWhere((element) {
    return element.length > 5;
  });
  print(element2);

  // Or even pass in a function reference:
  var element3 = items.firstWhere(predicate);
  print(element3);

  // You can also use an `orElse` function in case no value is found!
  var element4 = items.firstWhere(
    (element) => element.length > 10,
    orElse: () => 'None!',
  );
  print(element4);
}

/*
  https://dart.dev/codelabs/iterables#exercise-practice-writing-a-test-predicate
*/
String singleWhere(Iterable<String> items) {
  return items.singleWhere((element) => element.startsWith('M') && element.contains('a'));
}

void writingATestPredicate() {
  print(singleWhere(['opa', 'Matter']));
}

/*
  https://dart.dev/codelabs/iterables#checking-conditions
*/
bool anyUserUnder18(Iterable<User> users) => users.any((user) => user.age < 18);

bool everyUserOver13(Iterable<User> users) => users.every((user) => user.age > 13);

class User {
  String name;
  int age;

  User(
    this.name,
    this.age,
  );
}

void checkingConditions() {
  var users = [
    User('Alice', 21),
    User('Bob', 17),
    User('Claire', 52),
    User('David', 14),
  ];

  print(anyUserUnder18(users));
  print(everyUserOver13(users));
}

/*
  https://dart.dev/codelabs/iterables#filtering
*/
Iterable<UserFiltering> filterUnder21(Iterable<UserFiltering> users) {
  return users.where((user) => user.age >= 21);
}

Iterable<UserFiltering> findShortNamed(Iterable<UserFiltering> users) {
  return users.where((user) => user.name.length <= 3);
}

class UserFiltering {
  String name = '';
  int age = 0;

  UserFiltering(
    this.name,
    this.age,
  );
}

void filtering() {
  var users = [
    UserFiltering('Alice', 21),
    UserFiltering('Bob', 17),
    UserFiltering('Claire', 52),
    UserFiltering('Dan', 12),
  ];

  Iterable<UserFiltering> under21 = filterUnder21(users);
  under21.forEach((element) => print('more than 21: ${element.name} - ${element.age}'));

  Iterable<UserFiltering> shortNames = filterUnder21(users);
  shortNames.forEach((element) => print('short name: ${element.name} - ${element.age}'));
}

/*
  https://dart.dev/codelabs/iterables#mapping
*/
Iterable<String> getNameAndAges(Iterable<UserMapping> users) => users
  .map((user) => '${user.name} is ${user.age}');

class UserMapping {
  String name = '';
  int age = 0;

  UserMapping(
    this.name,
    this.age,
  );
}

void mapping() {
  print(getNameAndAges([
    UserMapping('User1', 10),
    UserMapping('User2', 20),
    UserMapping('User3', 30),
  ]));
}

/*
  https://dart.dev/codelabs/iterables#exercise-putting-it-all-together
*/
bool isValidEmailAddress(EmailAddress email) {
  return email.address.contains('@');
}

Iterable<EmailAddress> parseEmailAddresses(Iterable<String> strings) => strings
  .map((mail) => EmailAddress(mail));

bool anyInvalidEmailAddress(Iterable<EmailAddress> emails) => emails
  .any((email) => !isValidEmailAddress(email));

Iterable<EmailAddress> validEmailAddresses(Iterable<EmailAddress> emails) => emails
  .where((email) => isValidEmailAddress(email));

class EmailAddress {
  String address;

  EmailAddress(this.address);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is EmailAddress &&
              address == other.address;

  @override
  int get hashCode => address.hashCode;

  @override
  String toString() {
    return 'EmailAddress{address: $address}';
  }
}

void exercisePuttingItAllTogether() {
  var input = [
    'ali@gmail.com',
    'bobgmail.com',
    'cal@gmail.com',
  ];

  Iterable<EmailAddress> emailsList = parseEmailAddresses(input);

  print(anyInvalidEmailAddress(emailsList));
  print(validEmailAddresses(emailsList));
}
