import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imaan_barometer/core/common/widgets/txt.dart';

import '../../constants/svgs.dart';

class TransparentAppBar extends StatelessWidget {
  final String text;
  final Function()? onBackPresses;
  const TransparentAppBar({
    super.key,
    required this.text,
    this.onBackPresses,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              if (onBackPresses != null) {
                onBackPresses!();
              }
            },
            icon: SvgPicture.asset(Svgs.backButton),
          ),
          Txt(
            text,
            fontSize: 24,
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(Svgs.menu),
          ),
        ],
      ),
    );
  }
}
