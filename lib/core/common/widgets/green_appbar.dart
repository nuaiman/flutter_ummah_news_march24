import 'package:flutter/material.dart';

import '../../constants/palette.dart';
import '../../constants/pngs.dart';
import 'txt.dart';

class GreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final PreferredSize? preferredSizeWidget;
  const GreenAppBar({super.key, required this.title, this.preferredSizeWidget});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Palette.white,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Txt(
        title,
        fontSize: 24,
        color: Palette.white,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.drag_handle,
            color: Palette.white,
          ),
        ),
      ],
      bottom: preferredSizeWidget,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Pngs.appBarBg),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
