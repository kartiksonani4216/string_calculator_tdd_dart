class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String delimiter = ',';

    if (numbers.startsWith('//')) {
      var parts = numbers.split('\n');

      delimiter = parts[0].substring(2);
      numbers = parts.sublist(1).join('\n');
    }

    numbers = numbers.replaceAll('\n', delimiter);
    List<int> parsedNumbers = numbers.split(delimiter).map(int.parse).toList();

    final negatives = parsedNumbers.where((no) => no < 0).toList();
    if (negatives.isNotEmpty) {
      throw ArgumentError('Negatives not allowed: ${negatives.join(', ')}');
    }

    return parsedNumbers.reduce((a, b) => a + b);
  }
}
