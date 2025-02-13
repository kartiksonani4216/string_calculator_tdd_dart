import 'package:string_calculator/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  group('String Calculator', () {
    final calculator = StringCalculator();

    // Test to ensure an empty string input returns 0
    test('Empty string returns 0', () {
      expect(calculator.add(""), equals(0));
    });

    // Test to verify that a single number input returns itself
    test('Single number returns the number itself', () {
      expect(calculator.add("1"), equals(1));
    });

    // Test to check if the addition of two numbers separated by a comma works correctly
    test('Two numbers return their sum', () {
      expect(calculator.add("1,2"), equals(3));
    });

    // Test to validate that multiple numbers separated by commas return their sum
    test('Multiple numbers return their sum', () {
      expect(calculator.add("1,2,3,4"), equals(10));
    });

    // Test to check if newline characters can also be used as delimiters along with commas
    test('Newline as a delimiter should work', () {
      expect(calculator.add("1\n2,3"), equals(6));
    });

    // Test to verify that custom delimiters are correctly identified and used
    test('Custom delimiter should be supported', () {
      expect(calculator.add("//;\n1;2"), equals(3));
    });

    // Test to ensure that negative numbers throw an ArgumentError exception with a proper message
    test('Negative numbers should throw an exception', () {
      expect(
          () => calculator.add("1,-2,3,-4"),
          throwsA(isA<ArgumentError>().having((e) => e.message, 'message',
              contains('Negatives not allowed: -2, -4'))));
    });

    // Test to check if large numbers are handled correctly
    test('Large numbers should be summed correctly', () {
      expect(calculator.add("1000,2000,3000"), equals(6000));
    });

    // Test to verify handling of mixed valid and invalid inputs
    test('Invalid input should throw an exception', () {
      expect(() => calculator.add("1,a,3"), throwsA(isA<FormatException>()));
    });
  });
}
