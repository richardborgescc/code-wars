/*
  https://www.codewars.com/kata/559e3224324a2b6e66000046/train/dart
*/

import 'dart:math';

import "package:test/test.dart";

void main() {
  test("Basic-tests", () {
    gridGenerator(8);
    /*
    expect(sumin(5), equals(55));
    expect(sumax(8), equals(372));
    expect(sumsum(8), equals(576));
    */
  });
}

int sumin(int n) {
  // your code here
}
int sumax(int n) {
  // your code here
}
int sumsum(int n) {
  // your code here
}

void gridGenerator(int n) {
  int sumMin = 0;
  int sumMax = 0;

  for (int i = 0; i <= n; i++) {
    for (int j = 0; j <= n; j++) {
      sumMax += max(i, j);
      sumMin += min(i, j);
    }
  }

  print('sumMin: $sumMin');
  print('sumMax: $sumMax');
  int sumSum = sumMax + sumMin;
  print('sumSum: $sumSum');
}
