import 'package:flutter/material.dart';

class NoDefinitionsFound extends StatelessWidget {
  const NoDefinitionsFound({
    required this.title,
    required this.subTitle,
    Key? key,
  }) : super(key: key);

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 185,
        padding: const EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                subTitle,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
