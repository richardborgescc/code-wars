/*
  https://www.codewars.com/kata/515e271a311df0350d00000f/train/dart
*/

import 'dart:math';
import 'package:test/test.dart';

void runTests() {
  group('Basic tests', () {
    test("Testing for [1,2]", () => expect(squareSum([1,2]), equals(5)));
    test("Testing for [0,3,4,5]", () => expect(squareSum([0,3,4,5]), equals(50)));
    test("Testing for []", () => expect(squareSum([]), equals(0)));
    test("Testing for [-1,-2]", () => expect(squareSum([-1,-2]), equals(5)));
    test("Testing for [-1,0,1]", () => expect(squareSum([-1,0,1]), equals(2)));
  });
}

void main() {
  runTests();
}

int squareSum(List numbers) => numbers.length > 0
  ? numbers
      .map((element) => pow(element.abs(), 2))
      .reduce((sum, element) => sum + element)
  : 0;
