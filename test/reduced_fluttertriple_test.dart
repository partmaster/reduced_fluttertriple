import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:reduced/reduced.dart';
import 'package:reduced_fluttertriple/reduced_fluttertriple.dart';
import 'package:reduced_fluttertriple/src/inherited_widgets.dart';

class Incrementer extends Reducer<int> {
  @override
  int call(int state) {
    return state + 1;
  }
}

void main() {
  test('ReducibleStreamStore state 0', () {
    final objectUnderTest = ReducibleStreamStore(0);
    expect(objectUnderTest.state, 0);
  });

  test('ReducibleStreamStore state 1', () {
    final objectUnderTest = ReducibleStreamStore(1);
    expect(objectUnderTest.state, 1);
  });

  test('ReducibleStreamStore reduce', () async {
    final objectUnderTest = ReducibleStreamStore(0);
    objectUnderTest.reduce(Incrementer());
    expect(objectUnderTest.state, 1);
  });

  test('wrapWithProvider', () {
    const child = SizedBox();
    final objectUnderTest = wrapWithProvider(
      initialState: 0,
      child: child,
    );
    expect(
      objectUnderTest,
      isA<StatefulInheritedValueWidget<ReducibleStreamStore<int>, int>>(),
    );
    final provider = objectUnderTest
        as StatefulInheritedValueWidget<ReducibleStreamStore<int>, int>;
    expect(provider.rawValue, 0);
  });

  test('wrapWithConsumer', () {
    final store = ReducibleStreamStore(0);
    const child = SizedBox();
    final objectUnderTest = store.wrapWithConsumer(
      builder: ({Key? key, required int props}) => child,
      transformer: (reducible) => 1,
    );
    expect(objectUnderTest,
        isA<ScopedBuilder<ReducibleStreamStore<int>, Object, int>>());
  });
}
