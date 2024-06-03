import 'package:coodesh/router.dart';
import 'package:flutter/material.dart';

class CardWordList extends StatelessWidget {
  const CardWordList({required this.word, Key? key}) : super(key: key);

  final String? word;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () => Navigator.of(context).pushNamed(
          AppRouter.viewWordTranslationPage,
          arguments: word,
        ),
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              word ?? '',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
