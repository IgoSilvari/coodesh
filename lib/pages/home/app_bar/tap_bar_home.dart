import 'package:coodesh/colors.dart';
import 'package:flutter/material.dart';

class TapBarHome extends StatelessWidget implements PreferredSizeWidget {
  const TapBarHome({
    required this.controller,
    Key? key,
  }) : super(key: key);

  final TabController? controller;

  @override
  Size get preferredSize => const Size.fromHeight(5);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerColor: CoodeshColor.defaultRedColor,
      indicatorColor: Colors.white,
      dividerHeight: 3,
      labelStyle: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(fontSize: 12, fontWeight: FontWeight.w600),
      indicatorWeight: 1,
      indicatorSize: TabBarIndicatorSize.tab,
      controller: controller,
      tabs: const [
        Tab(
          text: 'Word List',
        ),
        Tab(
          text: 'History',
        ),
        Tab(
          text: 'Favotites',
        ),
      ],
    );
  }
}
