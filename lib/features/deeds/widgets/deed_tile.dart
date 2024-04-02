import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/common/widgets/txt.dart';
import '../../../core/constants/palette.dart';
import '../../../models/deed.dart';
import '../../language/controller/language_controller.dart';
import '../controllers/deeds_controller.dart';

class DeedTile extends ConsumerStatefulWidget {
  final Deed deed;
  const DeedTile({
    super.key,
    required this.deed,
  });

  @override
  ConsumerState<DeedTile> createState() => _DeedTileState();
}

class _DeedTileState extends ConsumerState<DeedTile> {
  @override
  Widget build(BuildContext context) {
    ref.watch(deedsProvider);
    final languageIsEnglish = ref.watch(languageIsEnglishProvider);
    return Card(
      color: Palette.liteGrey,
      surfaceTintColor: Palette.liteGrey,
      child: ListTile(
        leading: CupertinoCheckbox(
          value: ref.watch(deedsProvider.notifier).getIsDoneStatus(widget.deed),
          onChanged: (value) {
            ref.read(deedsProvider.notifier).markAsDone(widget.deed, value!);
          },
        ),
        title:
            Txt(!languageIsEnglish ? widget.deed.titleBn : widget.deed.titleEn),
        trailing: CircleAvatar(
          radius: 12,
          backgroundColor: Palette.grey,
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: CircleAvatar(
              backgroundColor: Palette.white,
              child: Txt(
                !languageIsEnglish
                    ? ref
                        .read(languageIsEnglishProvider.notifier)
                        .convertEnglishToBangla(widget.deed.id.toString())
                    : widget.deed.id.toString(),
                color: Palette.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
