import 'package:shogi/src/extensions/string_extensions.dart';
import 'package:test/test.dart';

void main() {
  group('first', () {
    test('Empty', () {
      final string = '';
      expect(string.first, isEmpty);
    });

    test('Character', () {
      final string = ' hello';
      expect(string.first, ' ');
    });
  });

  group('last', () {
    test('Empty', () {
      final string = '';
      expect(string.last, isEmpty);
    });

    test('Character', () {
      final string = ' hello';
      expect(string.last, 'o');
    });
  });

  test('isSingleCharacter', () {
    expect(''.isSingleCharacter, isFalse);
    expect(' '.isSingleCharacter, isTrue);
    expect('a'.isSingleCharacter, isTrue);
    expect('aAa'.isSingleCharacter, isFalse);
  });

  group('isUpperCase', () {
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
