/*
  https://www.codewars.com/kata/53dc54212259ed3d4f00071c/train/dart
*/

import 'package:test/test.dart';

void runTests() {
  group("Fixed tests", () {
    test("Testing for []", () => expect(sum([]), equals(0)));
    test("Testing for [5]", () => expect(sum([5]), equals(5)));
    test("Testing for [-5]", () => expect(sum([-5]), equals(-5)));
    test("Testing for [1, 2, 3.4, 4.3]", () => expect(sum([1, 2, 3.4, 4.3]), equals(10.7)));
    test("Testing for [1, -3, 2, 3, 4, -1]", () => expect(sum([1, -3, 2, 3, 4, -1]), equals(6)));
  });
}

void main() {
  runTests();
}

num sum(List<num> arr) => arr.length > 0
  ? arr.reduce((sum, element) => sum + element)
  : 0;
