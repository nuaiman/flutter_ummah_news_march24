import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GridItemTile extends StatelessWidget {
  final String label;
  final String svgPath;
  final Function() onTap;
  const GridItemTile({
    super.key,
    required this.label,
    required this.svgPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(
            svgPath,
            height: 150,
          ),
          const SizedBox(height: 10),
          Text(label),
        ],
      ),
    );
  }
}
