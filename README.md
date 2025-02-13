# String Calculator (Dart Implementation with TDD)

This is an implementation of the **String Calculator** using **Test-Driven Development (TDD)** in **Dart**. It includes unit tests and follows best practices for TDD.

## 📌 Features
- Returns `0` for an empty string.
- Supports addition of comma-separated numbers.
- Supports newlines (`\n`) as a delimiter.
- Supports custom delimiters (e.g., `//;\n1;2`).
- Throws an exception for negative numbers.
- Handles large numbers efficiently.
- Validates input to prevent format errors.

## 🛠️ Environment
- Developed using **Dart 3.6.2 (stable)**
- Uses `package:test` for unit testing

## 🚀 Setup Instructions

### 1️⃣ Clone the Repository
```sh
git clone https://github.com/kartiksonani4216/string_calculator_tdd_dart
cd string_calculator_tdd_dart
```

### 2️⃣ Install Dependencies
```sh
dart pub get
```

### 3️⃣ Run Tests
```sh
dart test
```

### 4️⃣ Example Usage
You can use the `StringCalculator` class in your Dart application as follows:
```dart
import 'package:string_calculator/string_calculator.dart';

void main() {
  final calculator = StringCalculator();
  print(calculator.add("1,2,3")); // Output: 6
  print(calculator.add("//;\n1;2")); // Output: 3
}
```

## ✅ Running Tests
To ensure that all functionalities work correctly, run:
```sh
dart test
```

This will execute all test cases and verify the correctness of the implementation.

---

Feel free to contribute or suggest improvements! 🚀
