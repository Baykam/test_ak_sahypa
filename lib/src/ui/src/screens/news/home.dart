import 'dart:async';

import 'package:ak_sahypa_test/app/router/paths.dart';
import 'package:ak_sahypa_test/src/application/news/news_bloc.dart';
import 'package:ak_sahypa_test/src/application/save_news/save_news_bloc.dart';
import 'package:ak_sahypa_test/src/infrasturcture/models/index.dart';
import 'package:ak_sahypa_test/src/ui/src/constants/assets/images.dart';
import 'package:ak_sahypa_test/src/ui/widgets/errorScreen.dart';
import 'package:ak_sahypa_test/src/ui/widgets/loadingScreen.dart';
import 'package:ak_sahypa_test/src/ui/widgets/news/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'functions.dart';


part 'widgets/banner.dart';
part 'widgets/new.dart';

class NewsScreen extends StatefulWidget{
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> with _Functions {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<NewsBloc, NewsState>(
          listener: listener,
          builder: (context, state) {
            if(state is NewsLoading){
              return Loadingscreen();
            }
        
            if (state is NewsError) {
              return ErrorScreen();
            }
        
            if (state is NewsSuccess) {
              return success(state);
            }
            return SizedBox();
          },
        ),
      ),
    );
  }


  Widget success(NewsSuccess success){
    return SingleChildScrollView(
      child: Column(
        spacing: 12,
        children: [
          /// need his own api. but just know i put inside that state
          AutoPlayDroneBanner(
            imageUrls: [ProjectImages.banner,ProjectImages.banner,ProjectImages.banner],),
          Divider(),
          NewsItems(news: success.news),
        ],
      ),
    );
  }
}