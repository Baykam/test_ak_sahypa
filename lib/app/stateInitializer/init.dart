import 'package:ak_sahypa_test/src/application/index.dart';
import 'package:ak_sahypa_test/src/application/save_news/save_news_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StateInitializer extends StatelessWidget {
  const StateInitializer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        /// Api calls
        BlocProvider(create: (context) => NewsGalleryBloc()),
        BlocProvider(create: (context) => NewsBloc()),


        /// Local calls
        BlocProvider(create: (context) => SaveNewsBloc()),
      ],
      child: child,
    );
  }
}