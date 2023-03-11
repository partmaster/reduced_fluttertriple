// fluttertriple_store.dart

import 'package:flutter/widgets.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'inherited_widgets.dart';
import 'package:reduced/reduced.dart';

/// Extension on class [StreamStore] with support of the [ReducedStore] interface.
class ReducedStreamStore<S extends Object> extends StreamStore<Object, S>
    implements ReducedStore<S> {
  ReducedStreamStore(super.initialState);

  @override
  dispatch(event) => update(event(state));
}

extension ExtensionStoreOnBuildContext on BuildContext {
  /// Convenience method for getting a [ReducedStreamStore] instance.
  ReducedStreamStore<S> store<S extends Object>() =>
      InheritedValueWidget.of<ReducedStreamStore<S>>(this);
}
