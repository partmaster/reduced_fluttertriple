import 'package:flutter_test/flutter_test.dart';
import 'package:reduced/reduced.dart';
import 'package:reduced_fluttertriple/reduced_fluttertriple.dart';

class CounterIncremented extends Event<int> {
  @override
  int call(int state) => state + 1;
}

void main() {
  test('ReducedStreamStore state 0', () {
    final objectUnderTest = ReducedStreamStore(0);
    expect(objectUnderTest.state, 0);
  });

  test('ReducedStreamStore state 1', () {
    final objectUnderTest = ReducedStreamStore(1);
    expect(objectUnderTest.state, 1);
  });

  test('ReducedStreamStore dispatch', () async {
    final objectUnderTest = ReducedStreamStore(0);
    objectUnderTest.dispatch(CounterIncremented());
    expect(objectUnderTest.state, 1);
  });
}
