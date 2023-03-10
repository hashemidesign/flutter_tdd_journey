import 'package:tdd_journey/math_utils.dart';
import 'package:test/test.dart';

void main() {
  group('math_utils - ', () {
    test("Check for two number addition", (){
      // Arrange
      int a = 10;
      int b = 10;

      // Act
      int sum = add(a, b);

      // Assert
      expect(sum, 20);
    });

    test("Check for two number subtraction", (){
      // Arrange
      int a = 20;
      int b = 10;

      // Act
      int subtraction = subtract(a, b);

      // Assert
      expect(subtraction, 10);
    });

    test("Check for two number multiplication", (){
      // Arrange
      int a = 20;
      int b = 10;

      // Act
      int multiplication = multiply(a, b);

      // Assert
      expect(multiplication, 200);
    });
  });
}