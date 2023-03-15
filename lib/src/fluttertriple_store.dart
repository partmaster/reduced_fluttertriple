// fluttertriple_store.dart

import 'package:flutter/widgets.dart';
import 'package:flutter_triple/flutter_triple.dart' hide Store;
import 'inherited_widgets.dart';
import 'package:reduced/reduced.dart';

/// Extension on class [StreamStore] with support of the [Store] interface.
class ReducedStreamStore<S extends Object> extends StreamStore<Object, S>
    implements Store<S> {
  ReducedStreamStore(super.initialState);

  @override
  process(event) => update(event(state));
}

extension ExtensionStoreOnBuildContext on BuildContext {
  /// Convenience method for getting a [ReducedStreamStore] instance.
  ReducedStreamStore<S> store<S extends Object>() =>
      InheritedValueWidget.of<ReducedStreamStore<S>>(this);
}
