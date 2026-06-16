part of '../home.dart';

class NewsItems extends StatelessWidget {
  const NewsItems({super.key, required this.news});

  final List<NewsModel> news;


  @override
  Widget build(BuildContext context) {
    final stateObject = context.findAncestorStateOfType<_NewsScreenState>();

    return BlocBuilder<SaveNewsBloc,SaveNewsState>(
      builder: (context, savedState) {
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: news.length,
          itemBuilder: (context, index) {
            final model = news[index];
            final bool isSaved = stateObject?.isNewsSaved(
              objectId: model.objectId,
              saveState: savedState,
            ) ?? false;

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: NewsItem(
                model: model,
                isSaved: isSaved,
                onTap: (model) => context.pushNamed(
                      RoutePaths.NewsGallery.name,
                      pathParameters: {"id":model.objectId ?? ''}
                    ),
                saveData: (model, currentSaved) =>
                    stateObject?.handleSaveOrDelete(model: model, currentSavedState: currentSaved),
              ),
            );
          },
        );
      }
    );
  }
}