import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_journey/login_screen.dart';

void main() {
  testWidgets("Should have a title", (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));
    // Act
    Finder title = find.text("Login");
    // Assert
    expect(title, findsOneWidget);
  });

  testWidgets("Should have a text form field for email",
      (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));
    // Act
    Finder emailTextField = find.byKey(const ValueKey("email"));
    // Assert
    expect(emailTextField, findsOneWidget);
  });

  testWidgets("Should have a text form field for password",
      (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));
    // Act
    Finder passwordTextField = find.byKey(const ValueKey("password"));
    // Assert
    expect(passwordTextField, findsOneWidget);
  });

  testWidgets("Should have a login button", (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));
    // Act
    Finder loginButton = find.byType(ElevatedButton);
    // Assert
    expect(loginButton, findsOneWidget);
  });

  testWidgets(
      "Should return required field message if email and password is empty",
      (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(const MaterialApp(home: LoginScreen()));
        Finder loginButton = find.byType(ElevatedButton);
        // Act
        await tester.tap(loginButton);
        await tester.pumpAndSettle(); // wait for all animations to finish
        Finder errorText = find.text("Required Field");
        // Assert
        expect(errorText, findsNWidgets(2));
      });

  testWidgets(
      "Should submit form when email and password is valid",
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(const MaterialApp(home: LoginScreen()));
        Finder loginButton = find.byType(ElevatedButton);
        // Act
        Finder email = find.byKey(const ValueKey("email"));
        Finder password = find.byKey(const ValueKey("password"));
        await tester.enterText(email, "abc@abc.com");
        await tester.enterText(password, "123456789");
        await tester.tap(loginButton);
        await tester.pumpAndSettle();
        Finder errorText = find.text("Required Field");
        // Assert
        expect(errorText, findsNothing);
      });
}
