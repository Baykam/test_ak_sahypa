enum RoutePaths{
  News(path: '/news'), NewsGallery(path: '/news-gallery/:id');

  final String path;

  const RoutePaths({required this.path});
}