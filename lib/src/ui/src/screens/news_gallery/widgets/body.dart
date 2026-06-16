part of '../home.dart';

class BodyDetail extends StatelessWidget {
  const BodyDetail({super.key, required this.model});

  final NewsGalleryModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Row(
                    spacing: 2,
                    children: [
                      SizedBox(
                        height: 18,
                        width: 18,
                        child: Image.asset(ProjectImages.Frame),
                      ),
                      Text('Technology', style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  
                  Text(
                    model.news?.title ?? '',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              
                  Text(model.news?.description ?? '', style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
              Text(
                model.news?.updatedAt?.toReadableString() ?? '',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12),
              ),
              Row(
                spacing: 2,
                children: [
                  Image.asset(ProjectImages.facebook),
                  Image.asset(ProjectImages.twitter),
                  Image.asset(ProjectImages.other_links),
                ],
              ),
            ],
          ),
        ),


        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: Text(model.news?.content ?? '', style: Theme.of(context).textTheme.bodySmall),
        ),
      ],
    );
  }
}
