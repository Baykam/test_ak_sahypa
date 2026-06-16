part of 'home.dart';

mixin _Functions on State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    context.read<NewsBloc>().add(Started());
    context.read<SaveNewsBloc>().add(GetAllListEvent());
  }

  void listener(BuildContext ctx, NewsState state) {
  }

  bool isNewsSaved({required String? objectId, required SaveNewsState saveState}) {
    if (objectId == null || objectId.isEmpty) return false;
    if (saveState is! GetAllState) return false;

    final Set<String> savedIds = saveState.listSave
        .map((e) => e.objectId ?? '')
        .where((id) => id.isNotEmpty)
        .toSet();

    return savedIds.contains(objectId);
  }

  void handleSaveOrDelete({required NewsModel model, required bool currentSavedState}) {
    final saveNewsBloc = context.read<SaveNewsBloc>();


    print("inside function");
    if (currentSavedState) {
      print("delete activate");
      saveNewsBloc.add(DeleteNewsSubmitted(news: model));
    } else {
      print("saved activate");
      saveNewsBloc.add(SaveNewsSubmitted(news: model));
    }

  }
}