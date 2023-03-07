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

Widget wrapWithConsumer<S extends Object, P>({
  required ReducedTransformer<S, P> transformer,
  required ReducedWidgetBuilder<P> builder,
}) =>
    Builder(
        builder: (context) => internalWrapWithConsumer(
              store: context.store<S>(),
              transformer: transformer,
              builder: builder,
            ));

@visibleForTesting
ScopedBuilder<ReducibleStreamStore<S>, Object, S>
    internalWrapWithConsumer<S extends Object, P>({
  required ReducibleStreamStore<S> store,
  required ReducedTransformer<S, P> transformer,
  required ReducedWidgetBuilder<P> builder,
}) =>
        ScopedBuilder<ReducibleStreamStore<S>, Object, S>(
          store: store,
          distinct: (_) => transformer(store),
          onState: (_, __) => builder(props: transformer(store)),
        );
