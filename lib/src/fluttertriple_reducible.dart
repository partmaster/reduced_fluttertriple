// fluttertriple_reducible.dart

import 'package:flutter/widgets.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'inherited_widgets.dart';
import 'package:reduced/reduced.dart';

/// Extension on class [StreamStore] with support of the [Reducible] interface.
class ReducibleStreamStore<S extends Object> extends StreamStore<Object, S>
    implements Reducible<S> {
  ReducibleStreamStore(super.initialState);

  @override
  reduce(reducer) => update(reducer(state));
}

extension ExtensionStoreOnBuildContext on BuildContext {
  /// Convenience method for getting a [ReducibleStreamStore] instance.
  ReducibleStreamStore<S> store<S extends Object>() =>
      InheritedValueWidget.of<ReducibleStreamStore<S>>(this);
}
