part of 'home.dart';

mixin _Functions on State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    context.read<NewsBloc>().add(Started());
    // Ekran açılırken kayıtlı haberleri de çekiyoruz
    context.read<SaveNewsBloc>().add(GetAllListEvent());
  }

  void listener(BuildContext ctx, NewsState state) {
    // İhtiyacına göre buraya dinleyici mantıkları ekleyebilirsin
  }

  /// UI katmanından gelen objectId'nin kayıtlı olup olmadığını denetleyen fonksiyon
  bool isNewsSaved({required String? objectId, required SaveNewsState saveState}) {
    if (objectId == null || objectId.isEmpty) return false;
    if (saveState is! GetAllState) return false;

    // Set kullanarak O(1) zamanda hızlıca arama yapıyoruz
    final Set<String> savedIds = saveState.listSave
        .map((e) => e.objectId ?? '')
        .where((id) => id.isNotEmpty)
        .toSet();

    return savedIds.contains(objectId);
  }

  /// Kaydet/Sil butonuna tıklandığında çalışacak merkezi fonksiyon
  void handleSaveOrDelete({required NewsModel model, required bool currentSavedState}) {
    final saveNewsBloc = context.read<SaveNewsBloc>();

    if (currentSavedState) {
      // Eğer halihazırda kayıtlıysa (true ise) SİLME event'i tetikle
      saveNewsBloc.add(DeleteNewsSubmitted(news: model));
    } else {
      // Kayıtlı değilse (false ise) KAYDETME event'i tetikle
      saveNewsBloc.add(SaveNewsSubmitted(news: model));
    }

    // İşlem bittikten hemen sonra lokal listeyi yenilemesi için GetAllListEvent tetikliyoruz
    saveNewsBloc.add(GetAllListEvent());
  }
}