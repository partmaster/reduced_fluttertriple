// provider.dart

import 'package:flutter/widgets.dart';
import 'package:reduced_fluttertriple/reduced_fluttertriple.dart';

import 'state.dart';

class MyAppStateProvider extends StatelessWidget {
  const MyAppStateProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => ReducedProvider(
        initialState: MyAppState(title: 'reduced_setstate example'),
        child: child,
      );
}
