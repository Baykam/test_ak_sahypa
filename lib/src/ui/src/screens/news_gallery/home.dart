import 'package:ak_sahypa_test/app/app.dart';
import 'package:ak_sahypa_test/src/application/index.dart';
import 'package:ak_sahypa_test/src/infrasturcture/models/index.dart';
import 'package:ak_sahypa_test/src/infrasturcture/services/cache/image/cahced_network_image.dart';
import 'package:ak_sahypa_test/src/ui/src/constants/assets/images.dart';
import 'package:ak_sahypa_test/src/ui/src/constants/extensions/datetime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


part 'functions.dart';

part 'widgets/appbar.dart';
part 'widgets/body.dart';
part 'widgets/image.dart';

class NewsGalleryScreen extends StatefulWidget {
  const NewsGalleryScreen({super.key, required this.objectId});

  final String objectId;

  @override
  State<NewsGalleryScreen> createState() => _NewsGalleryScreenState();
}

class _NewsGalleryScreenState extends State<NewsGalleryScreen> with _GalleryFunctions {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: secondAppbar(context),
      body: BlocBuilder<NewsGalleryBloc, NewsGalleryState>(
        builder: (context, state) {
          if(state is NewsGalleryLoading){
            return const Center(child: CircularProgressIndicator());
          }

          if (state is NewsGalleryError) {
            return Center(child: Text(state.error.error ?? 'i get some error'));
          }

          if (state is NewsGallerySuccess) {
            return success(state.newsGallery);
          }

          return SizedBox();
        },
      ),
    );
  }


  Widget success(List<NewsGalleryModel> newsGallery){
    final data = newsGallery[0];
    return SingleChildScrollView(
        child: Column(
          children: [
            ImageWidgetForDetail(url: data.news?.image ?? ''),
            BodyDetail(model: data),
          ],
        ),
    );
  }
}