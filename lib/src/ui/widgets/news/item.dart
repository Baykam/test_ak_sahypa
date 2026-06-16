import 'package:ak_sahypa_test/src/infrasturcture/models/index.dart';
import 'package:ak_sahypa_test/src/infrasturcture/services/cache/image/cahced_network_image.dart';
import 'package:ak_sahypa_test/src/ui/src/constants/extensions/datetime.dart';
import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key,  required this.model, this.onTap, this.saveData, this.isSaved = false});
  final NewsModel model;
  final Function(NewsModel model)? onTap;
  final Function(NewsModel model, bool isSaved)? saveData;
  final bool isSaved;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(8),
      child: Material(
        color: Color(0xff1E1E1E),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () => onTap?.call(model),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.all(8),
                  leading: SizedBox(
                    height: 62,
                    width: 80,
                    child: Hero(
                        tag: 'news_image_${model.image}',
                        child: ProductImage(url: model.image ?? '')),
                  ),
                  title: Text.rich(TextSpan(
                    text: model.title ?? '',
                    style: Theme.of(context).textTheme.bodySmall,
                    children: [
                      TextSpan(
                        style: Theme.of(context).textTheme.titleSmall,
                        text: '\n ${model.description ?? ''}',
                      )
                    ]),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(model.updatedAt?.toReadableString() ?? '', style: Theme.of(context).textTheme.bodySmall),
                      Container(
                        width: 56,
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () => saveData?.call(model, isSaved),
                          icon: Icon(isSaved ? Icons.bookmark : Icons.bookmark_border),
                          color: isSaved ? Colors.blue : null,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}