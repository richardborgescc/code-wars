/*
  https://www.codewars.com/kata/559e3224324a2b6e66000046/train/dart
*/

import 'dart:math';

import "package:test/test.dart";

void main() {
  test("Basic-tests", () {
    expect(sumin(5), equals(55));
    expect(sumax(8), equals(372));
    expect(sumsum(8), equals(576));
  });
}

class Sums {
  int sumMin = 0;
  int sumMax = 0;
  int sumSum = 0;

  Sums(sumMin, sumMax, sumSum) {
    this.sumMin = sumMin;
    this.sumMax = sumMax;
    this.sumSum = sumSum;
  }
}

int sumin(int n) {
  Sums sums = gridSums(n);
  return sums.sumMin;
}
int sumax(int n) {
  Sums sums = gridSums(n);
  return sums.sumMax;
}
int sumsum(int n) {
  Sums sums = gridSums(n);
  return sums.sumSum;
}

Sums gridSums(int n) {
  int sumMin = 0;
  int sumMax = 0;

  for (int i = 0; i <= n; i++) {
    for (int j = 0; j <= n; j++) {
      if (j < n) {
        sumMax += max(i, j);
      }

      sumMin += min(i, j);
    }
  }

  print('sumMin: $sumMin');
  print('sumMax: $sumMax');
  int sumSum = sumMax + sumMin;
  print('sumSum: $sumSum');
  return new Sums(sumMin, sumMax, sumSum);
}
