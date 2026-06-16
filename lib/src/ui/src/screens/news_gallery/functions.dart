part of 'home.dart';

mixin _GalleryFunctions on State<NewsGalleryScreen>{
@override
  void initState() {
    super.initState();
    init();
  }

  void init() => context.read<NewsGalleryBloc>().add(LoadNewsGallary(widget.objectId));
}