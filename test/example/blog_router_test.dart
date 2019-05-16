import 'package:test/test.dart';
import 'package:two_way_router/two_way_router.dart';

import '../../example/blog_router.dart';

void main() {
  test('adds one to input values', () {
    print(pathParamter<String>());

    expect(() => pathParamter(), throwsException);

    print(router);
    // final calculator = Calculator();
    // expect(calculator.addOne(2), 13);
    // expect(calculator.addOne(-7), -6);
    // expect(calculator.addOne(0), 1);
    // expect(() => calculator.addOne(null), throwsNoSuchMethodError);
  });
}
