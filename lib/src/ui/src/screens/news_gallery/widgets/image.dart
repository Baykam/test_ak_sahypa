part of '../home.dart';

class ImageWidgetForDetail extends StatelessWidget {
  const ImageWidgetForDetail({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 266,
      child: ProductImage(url: url),
    );
  }
}
