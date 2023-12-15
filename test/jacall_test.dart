import 'package:flutter_test/flutter_test.dart';
import 'package:license_get/jacall.dart';

void main() {
  test('jacall ...', () {
    // Normal case
    expect(isJAcall('JS2IIU'), true);
  });
  test('jacall Portable', () {
    // portable
    expect(isJAcall('JS2IIU/2'), true);
  });

  test('jacall 7call JA', () {
    // 7call
    expect(isJAcall('7J1RL'), true);
  });

  test('jacall Kinen', () {
    // kinen
    expect(isJAcall('8J17CALL'), true);
  });

  test('jacall Mongol call', () {
    // Mongol
    expect(isJAcall('JT1CD'), false);
  });

  test('jacall Yemen call', () {
    // Yemen
    expect(isJAcall('701ACS'), false);
  });

  test('jacall Normal, lower case', () {
    // Normal case
    expect(isJAcall('js2iiu'), true);
  });
}
