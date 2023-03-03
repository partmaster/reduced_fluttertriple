// fluttertriple_wrapper.dart

import 'package:flutter/widgets.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:reduced/reduced.dart';

import 'inherited_widgets.dart';
import 'fluttertriple_reducible.dart';

Widget wrapWithProvider<S extends Object>({
  required S initialState,
  required Widget child,
}) =>
    StatefulInheritedValueWidget(
      converter: (rawValue) => ReducibleStreamStore(rawValue),
      rawValue: initialState,
      child: child,
    );

extension WrapWithConsumer<S extends Object> on ReducibleStreamStore<S> {
  Widget wrapWithConsumer<P>({
    required ReducedTransformer<S, P> transformer,
    required ReducedWidgetBuilder<P> builder,
  }) =>
      ScopedBuilder<ReducibleStreamStore<S>, Object, S>(
        store: this,
        distinct: (_) => transformer(this),
        onState: (_, __) => builder(props: transformer(this)),
      );
}
