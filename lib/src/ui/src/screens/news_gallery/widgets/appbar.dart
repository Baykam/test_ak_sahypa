part  of '../home.dart';

PreferredSizeWidget secondAppbar(BuildContext context) => AppBar(
    leading: IconButton(onPressed: () => context.pop(), icon: Icon(Icons.arrow_back_ios_new)),
  actions: [
    IconButton(onPressed: (){}, icon: Text('Aa', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white))),
    IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_border)),
    IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
  ],
);