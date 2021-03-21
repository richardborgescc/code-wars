import 'dart:math' as math;
import "package:test/test.dart";

void main() {
  dotest(int m, n, exp) {
    test("Testing for $m $n", () =>
      expect(checkChoose(m, n), equals(exp)));
  }
  group("fixed tests", () {
    dotest(6, 4, 2);
    dotest(4, 4, 1);
    dotest(4, 2, -1);
    dotest(35, 7, 3);
    dotest(184756, 20, 10);
    
  });
}

int checkChoose(int m, n) {
  // m = n! / (x! * (n - x)!)
  return -1;
}
