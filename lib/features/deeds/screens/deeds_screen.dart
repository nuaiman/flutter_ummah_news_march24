import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/common/widgets/transparent_appbar.dart';
import '../../../core/constants/pngs.dart';
import '../../../models/deed.dart';
import '../widgets/deed_tile.dart';

class DeedsScreen extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const DeedsScreen(),
      );

  const DeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Pngs.bg),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const TransparentAppBar(
              text: 'Deeds',
            ),
            Expanded(
              child: ListView(
                children: [
                  DeedTile(
                    deed: Deed(
                      id: 1,
                      title: 'Title 1',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 2,
                      title: 'Title 2',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 3,
                      title: 'Title 3',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 4,
                      title: 'Title 4',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 5,
                      title: 'Title 5',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 6,
                      title: 'Title 6',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 7,
                      title: 'Title 7',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
