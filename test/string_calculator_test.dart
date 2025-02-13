import 'package:string_calculator/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  group('String Calculator', () {
    final calculator = StringCalculator();

    test('Empty string returns 0', () {
      expect(calculator.add(""), equals(0));
    });

    test('Single number returns the number itself', () {
      expect(calculator.add("1"), equals(1));
    });

    test('Two numbers return their sum', () {
      expect(calculator.add("1,2"), equals(3));
    });

    test('Multiple numbers return their sum', () {
      expect(calculator.add("1,2,3,4"), equals(10));
    });

    test('Newline as a delimiter should work', () {
      expect(calculator.add("1\n2,3"), equals(6));
    });

    test('Custom delimiter should be supported', () {
      expect(calculator.add("//;\n1;2"), equals(3));
    });

    test('Negative numbers should throw an exception', () {
      expect(() => calculator.add("1,-2,3,-4"), throwsA(isA<ArgumentError>()));
    });
  });
}
