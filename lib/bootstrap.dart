import 'dart:async';
import 'dart:developer';

import 'package:ak_sahypa_test/src/infrasturcture/services/db/db.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const _tag = 'AppBlocObserver';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)', name: _tag);
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)', name: _tag);
    super.onError(bloc, error, stackTrace);
  }
}

final class ApplicationInitialize {
  Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
    FlutterError.onError = (details) {
      log(details.exceptionAsString());
    };

    await runZonedGuarded(
      () async {
        // ignore: deprecated_member_use
        await BlocOverrides.runZoned(
          () async {
            await _initialize();
            runApp(await builder());
          },
          blocObserver: AppBlocObserver(),
        );
      },
      (error, stackTrace) => log(error.toString()),
    );
  }

  ///initialize method for app when starting
  Future<void> _initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);


    await DbManager.i.init();
  }
}