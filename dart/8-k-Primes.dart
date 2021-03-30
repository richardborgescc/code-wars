/*
  https://www.codewars.com/kata/5726f813c8dcebf5ed000a6b/train/dart
*/

import "package:test/test.dart";

void main() {
  testing1(int k, int start, int limit, List<int> exp) => 
    test("Testing for $k $start $limit", () => 
      expect(countKprimes(k, start, limit), equals(exp)));
  testing2(int s, int exp) => 
    test("Testing for $s", () => 
      expect(puzzle(s), equals(exp)));
  
  group("fixed tests countKprimes", () {
    testing1(5, 1000, 1100, [1020, 1026, 1032, 1044, 1050, 1053, 1064, 1072, 1092, 1100]);
    testing1(5, 500, 600, [500, 520, 552, 567, 588, 592, 594]);
    testing1(7, 1000, 1500, [1008, 1056, 1080, 1088, 1120, 1200, 1216, 1248, 1458, 1472]);
  
  });
  group("fixed tests puzzle", () {
    testing2(100, 0);
    testing2(151, 3);
  });
}

List<int> countKprimes(int k, int start, int end) {
    // your code
  return [0];
}
int puzzle(int s) {
    // your code
    return 0;
}
