class StringCalculator {
  /// Adds numbers provided in a string, supporting custom delimiters.
  /// Returns 0 for an empty string.
  /// Supports newline as a delimiter and custom delimiters prefixed with `//`.
  /// Throws an [ArgumentError] if negative numbers are present.
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
    List<int> parsedNumbers = numbers.split(delimiter).map(int.parse).toList();

    // Check for negative numbers and throw an error
    final negatives = parsedNumbers.where((no) => no < 0).toList();
    if (negatives.isNotEmpty) {
      throw ArgumentError('Negatives not allowed: ${negatives.join(', ')}');
    }

    // Return the sum of parsed numbers
    return parsedNumbers.reduce((a, b) => a + b);
  }
}
