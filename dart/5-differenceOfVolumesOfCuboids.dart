/*
  https://www.codewars.com/kata/58cb43f4256836ed95000f97/train/dart
*/

import "package:test/test.dart";

void main() {
  group('basic tests', () {
    test("findDifference([3, 2, 5], [1, 4, 4])", () => expect(findDifference([3, 2, 5], [1, 4, 4]), equals(14)));
    test("findDifference([9, 7, 2], [5, 2, 2])", () => expect(findDifference([9, 7, 2], [5, 2, 2]), equals(106)));
    test("findDifference([11, 2, 5], [1, 10, 8])", () => expect(findDifference([11, 2, 5], [1, 10, 8]), equals(30)));
    test("findDifference([4, 4, 7], [3, 9, 3])", () => expect(findDifference([4, 4, 7], [3, 9, 3]), equals(31)));
    test("findDifference([15, 20, 25], [10, 30, 25])", () => expect(findDifference([15, 20, 25], [10, 30, 25]), equals(0)));
  });
}

int findDifference(List<int> a, List<int> b) {
  int cuboidA = a.fold(1, (value, element) => value * element);
  int cuboidB = b.fold(1, (value, element) => value * element);

  return cuboidA > cuboidB
    ? cuboidA - cuboidB
    : cuboidB - cuboidA;
}
