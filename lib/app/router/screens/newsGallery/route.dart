import 'package:ak_sahypa_test/app/router/paths.dart';
import 'package:ak_sahypa_test/src/ui/src/screens/news_gallery/home.dart';
import 'package:go_router/go_router.dart';

class NewsGalleryRoute extends GoRoute{
  NewsGalleryRoute() : super(
    path: RoutePaths.NewsGallery.path,
     name: RoutePaths.NewsGallery.name, 
     builder: (context, state) {
        String? id = state.pathParameters['id'];
        print("id for objectid $id");
        return NewsGalleryScreen(objectId: id ?? '');
      },
    );
}