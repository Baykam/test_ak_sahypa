import 'package:ak_sahypa_test/app/router/paths.dart';
import 'package:ak_sahypa_test/app/router/screens/index.dart';
import 'package:ak_sahypa_test/src/ui/src/screens/news/home.dart';
import 'package:go_router/go_router.dart';

class NewsRoute extends GoRoute{
  NewsRoute() : super(
    path: RoutePaths.News.path,
    name: RoutePaths.News.name, 
    builder: (context, state) => NewsScreen(),
    routes: [
      NewsGalleryRoute(),
    ]
    );
}