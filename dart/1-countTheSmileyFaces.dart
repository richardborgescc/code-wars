/*
  https://www.codewars.com/kata/583203e6eb35d7980400002a/train/dart
*/

import 'package:test/test.dart';

bool isValidEyes(String eyes) {
  if (eyes == ':' || eyes == ';') {
    return true;
  }
  
  return false;
}

bool isValidNose(String nose) {
  if (nose == '-' || nose == '~') {
    return true;
  }
  
  return false;
}

bool isValidMouth(String mouth) {
  if (mouth == ')' || mouth == 'D') {
    return true;
  }
  
  return false;
}

bool isValidFace(String face) {
  print(face);
  
  if (face.length == 2 
    && isValidEyes(face[0])
    && isValidMouth(face[1])
  ) {
    return true;
  } else if (face.length == 3
    && isValidEyes(face[0])
    && isValidNose(face[1])
    && isValidMouth(face[2])
  ) {
    return true;
  }
  
  return false;
}

int countSmileys(List<String> arr) {
  int count = 0;
  
  for (var smile in arr) {
    if (isValidFace(smile)) {
      count++;
    }
  }
  
  return count;
}

void runTests() {
  group("Fixed tests", () {
    test("Testing for []", () => expect(countSmileys([]), equals(0)));
    test("Testing for [':)', ';(', ';}', ':-D']", () => expect(countSmileys([':)', ';(', ';}', ':-D']), equals(2)));
    test("Testing for [';]', ':[', ';*', ':\$', ';-D']", () => expect(countSmileys([';]', ':[', ';*', ':\$', ';-D']), equals(1)));
    test("Testing for [':)',':(',':D',':O',':;']", () => expect(countSmileys([':)',':(',':D',':O',':;']), equals(2)));
    test("Testing for [':-)',';~D',':-D',':_D']", () => expect(countSmileys([':-)',';~D',':-D',':_D']), equals(3)));
    test("Testing for [':---)','))',';~~D',';D']", () => expect(countSmileys([':---)','))',';~~D',';D']), equals(1)));
    test("Testing for [';~)',':)',':-)',':--)']", () => expect(countSmileys([';~)',':)',':-)',':--)']), equals(3)));
    test("Testing for [':o)',':--D',';-~)']", () => expect(countSmileys([':o)',':--D',';-~)']), equals(0)));
  });
}

void main() {
  runTests();
}
