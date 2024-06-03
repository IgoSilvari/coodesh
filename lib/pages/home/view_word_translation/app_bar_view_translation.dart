import 'package:coodesh/store/favorite_word/favorite_word_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class AppBarViewTranslation extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarViewTranslation({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final favoriteWord = Provider.of<FavoriteWordStore>(context, listen: false);
    return AppBar(
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.close),
      ),
      actions: [
        IconButton(
          onPressed: () => favoriteWord.favorite(),
          icon: Observer(builder: (_) {
            return Visibility(
              visible: favoriteWord.isFavorite,
              replacement: const Icon(
                Icons.favorite_border,
                color: Colors.black,
                size: 30,
              ),
              child: const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 30,
              ),
            );
          }),
        ),
      ],
    );
  }
}
