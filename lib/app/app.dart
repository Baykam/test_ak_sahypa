import 'package:ak_sahypa_test/app/router/router.dart';
import 'package:ak_sahypa_test/app/stateInitializer/init.dart';
import 'package:ak_sahypa_test/src/ui/src/constants/themes/dark.dart';
import 'package:flutter/material.dart';

final class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return StateInitializer(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: DarkTheme().themeData,
        routerConfig: AppRouter().router,
      ),
    );
  }
}