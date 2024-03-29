// fluttertriple_widgets.dart

import 'package:flutter/widgets.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:reduced/reduced.dart';

import 'inherited_widgets.dart';
import 'fluttertriple_store.dart';

class ReducedProvider<S extends Object> extends StatelessWidget {
  const ReducedProvider({
    super.key,
    required this.initialState,
    required this.child,
  });

  final S initialState;
  final Widget child;

  @override
  Widget build(BuildContext context) => StatefulInheritedValueWidget(
        converter: (rawValue) => ReducedStreamStore(rawValue),
        rawValue: initialState,
        child: child,
      );
}

class ReducedConsumer<S extends Object, P> extends StatelessWidget {
  const ReducedConsumer({
    super.key,
    required this.mapper,
    required this.builder,
  });

  final StateToPropsMapper<S, P> mapper;
  final WidgetFromPropsBuilder<P> builder;

  @override
  Widget build(BuildContext context) => _build(context.store<S>());

  Widget _build(ReducedStreamStore<S> store) =>
      ScopedBuilder<ReducedStreamStore<S>, Object, S>(
        store: store,
        distinct: (_) => mapper(store.state, store),
        onState: (_, __) => builder(
          props: mapper(
            store.state,
            store,
          ),
        ),
      );
}
