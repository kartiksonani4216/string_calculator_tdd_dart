class StringCalculator {
  /// Adds numbers provided in a string, supporting custom delimiters.
  /// Returns 0 for an empty string.
  /// Supports newline as a delimiter and custom delimiters prefixed with `//`.
  /// Throws an [ArgumentError] if negative numbers are present.
  ///
  /// Example Inputs:
  /// - "1,2,3" => Returns 6
  /// - "//;\n1;2" => Returns 3
  /// - "1\n2,3" => Returns 6
  /// - "1,-2,3,-4" => Throws ArgumentError
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String delimiter = ',';

    // Check for custom delimiter declaration
    if (numbers.startsWith('//')) {
      var parts = numbers.split('\n');
      delimiter = parts[0].substring(2);
      numbers = parts.sublist(1).join('\n');
    }

    // Replace newline characters with the delimiter
    numbers = numbers.replaceAll('\n', delimiter);

    // Convert string numbers to a list of integers
    List<int> parsedNumbers = numbers.split(delimiter).map(int.parse).toList();

    // Check for negative numbers and throw an error if found
    final negatives = parsedNumbers.where((no) => no < 0).toList();
    if (negatives.isNotEmpty) {
      throw ArgumentError('Negatives not allowed: ${negatives.join(', ')}');
    }

    // Return the sum of parsed numbers
    return parsedNumbers.reduce((a, b) => a + b);
  }
}
