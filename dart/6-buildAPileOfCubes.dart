/*
  https://www.codewars.com/kata/5592e3bd57b64d00f3000047/train/dart
*/

import "package:test/test.dart";
import 'dart:math';

void main() {
  dotest(int m, exp) {
    test("Testing for $m", () =>
      expect(findNb(m), equals(exp)));
  }
  group("fixed tests", () {
    dotest(4183059834009, 2022);
    dotest(24723578342962, -1);
    dotest(135440716410000, 4824);
    dotest(40539911473216, 3568);
    dotest(26825883955641, 3218);
    
  });
}

int findNb(int m) {
  int n = 1;
  int sum = 0;

  while (sum < m) {
    sum += pow(n, 3);
    n++;
  }

  return sum == m ? n - 1 : -1;
}
