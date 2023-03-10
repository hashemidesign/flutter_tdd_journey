import 'package:tdd_journey/validator.dart';
import 'package:test/test.dart';

void main() {
  group("Email validation -> ", () {
    test("Empty email", (){
      // Arrange & Act
      String? result = Validator.validateEmail('');
      expect(result, "Required Field");
    });

    test("Invalid email", (){
      // Arrange & Act
      String? result = Validator.validateEmail('abcxyz.com');
      expect(result, "Invalid Email Address");
    });

    test("Valid email", (){
      // Arrange & Act
      String? result = Validator.validateEmail('abc@xyz.com');
      expect(result, null);
    });
  });

  group("Password validation -> ", (){
    test("Empty password", (){
      // Arrange & Act
      String? result = Validator.validatePassword('');
      expect(result, "Required Field");
    });

    test("Invalid password", (){
      // Arrange & Act
      String? result = Validator.validatePassword('abcxcom');
      expect(result, "Invalid Password Characters Length");
    });

    test("Valid password", (){
      // Arrange & Act
      String? result = Validator.validatePassword('12345678');
      expect(result, null);
    });
  });

}