import 'package:flutter_test/flutter_test.dart';
import 'package:shogi/src/extensions/string_extensions.dart';

main() {
  group('isNullOrEmpty', () {
    test('null', () {
      String string;
      expect(string.isNullOrEmpty, isTrue);
    });

    test('Empty', () {
      String string = '';
      expect(string.isNullOrEmpty, isTrue);
    });

    test('Whitespace', () {
      String string = ' ';
      expect(string.isNullOrEmpty, isFalse);
    });

    test('Character', () {
      String string = ' hello';
      expect(string.isNullOrEmpty, isFalse);
    });
  });

  group('first', () {
    test('null', () {
      String string;
      expect(string.first, isNull);
    });

    test('Empty', () {
      String string = '';
      expect(string.first, isNull);
    });

    test('Character', () {
      String string = ' hello';
      expect(string.first, ' ');
    });
  });

  group('last', () {
    test('null', () {
      String string;
      expect(string.last, isNull);
    });

    test('Empty', () {
      String string = '';
      expect(string.last, isNull);
    });

    test('Character', () {
      String string = ' hello';
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
      String string = '';
      expect(string.isUpperCase, isFalse);
    });

    test('Whitespace', () {
      String string = ' ';
      expect(string.isUpperCase, isFalse);
    });

    test('First character uppercase', () {
      String string = 'A string';
      expect(string.isUpperCase, isTrue);
    });

    test('First character lowercase', () {
      String string = 'a string';
      expect(string.isUpperCase, isFalse);
    });
  });
}
