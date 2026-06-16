part of '../home.dart';

class NewsItems extends StatelessWidget {
  const NewsItems({super.key, required this.news});

  final List<NewsModel> news;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: news.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: NewsItem(
              model: news[index],
            onTap: (model) => context.pushNamed(
                  RoutePaths.NewsGallery.name,
                  pathParameters: {"id":model.objectId ?? ''}
                ),
            saveData: (model, isSaved) {},
          ),
        );
      },
    );
  }
}