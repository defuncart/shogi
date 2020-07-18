import 'package:shogi/src/extensions/string_extensions.dart';
import 'package:test/test.dart';

void main() {
  group('isNullOrEmpty', () {
    test('null', () {
      String string;
      expect(string.isNullOrEmpty, isTrue);
    });

    test('Empty', () {
      final string = '';
      expect(string.isNullOrEmpty, isTrue);
    });

    test('Whitespace', () {
      final string = ' ';
      expect(string.isNullOrEmpty, isFalse);
    });

    test('Character', () {
      final string = ' hello';
      expect(string.isNullOrEmpty, isFalse);
    });
  });

  group('first', () {
    test('null', () {
      String string;
      expect(string.first, isNull);
    });

    test('Empty', () {
      final string = '';
      expect(string.first, isNull);
    });

    test('Character', () {
      final string = ' hello';
      expect(string.first, ' ');
    });
  });

  group('last', () {
    test('null', () {
      String string;
      expect(string.last, isNull);
    });

    test('Empty', () {
      final string = '';
      expect(string.last, isNull);
    });

    test('Character', () {
      final string = ' hello';
      expect(string.last, 'o');
    });
  });

  test('isSingleCharacter', () {
    expect(null.isSingleCharacter, isFalse);
    expect(''.isSingleCharacter, isFalse);
    expect(' '.isSingleCharacter, isTrue);
    expect('a'.isSingleCharacter, isTrue);
    expect('aAa'.isSingleCharacter, isFalse);
  });

  group('isUpperCase', () {
    test('null', () {
      String string;
      expect(string.isUpperCase, isFalse);
    });

    test('Empty', () {
      final string = '';
      expect(string.isUpperCase, isFalse);
    });

    test('Whitespace', () {
      final string = ' ';
      expect(string.isUpperCase, isFalse);
    });

    test('First character uppercase', () {
      final string = 'A string';
      expect(string.isUpperCase, isTrue);
    });

    test('First character lowercase', () {
      final string = 'a string';
      expect(string.isUpperCase, isFalse);
    });
  });

  group('isLowerCase', () {
    test('null', () {
      String string;
      expect(string.isLowerCase, isFalse);
    });

    test('Empty', () {
      final string = '';
      expect(string.isLowerCase, isFalse);
    });

    test('Whitespace', () {
      final string = ' ';
      expect(string.isLowerCase, isFalse);
    });

    test('First character uppercase', () {
      final string = 'A string';
      expect(string.isLowerCase, isFalse);
    });

    test('First character lowercase', () {
      final string = 'a string';
      expect(string.isLowerCase, isTrue);
    });
  });
}
