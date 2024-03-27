// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:imaan_barometer/models/deed.dart';

// import '../controllers/deeds_controller.dart';

// class DeedsChart extends ConsumerWidget {
//   const DeedsChart({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final deeds = ref.watch(deedsProvider);
//     final groupedDeeds =
//         ref.watch(deedsProvider.notifier).groupDeedsByDay(deeds);

//     return _buildChart(groupedDeeds);
//   }

//   Widget _buildChart(Map<String, List<Deed>> groupedDeeds) {
//     final daysOfWeek = ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'];

//     final data = daysOfWeek.map((day) {
//       final deedsForDay = groupedDeeds[day] ?? [];
//       final completionPercentage = _calculateCompletionPercentage(deedsForDay);
//       return MapEntry(day, completionPercentage);
//     }).toList();

//     return SfCartesianChart(
//       primaryXAxis: CategoryAxis(
//         isVisible: true,
//       ),
//       primaryYAxis: const NumericAxis(minimum: 0, maximum: 100, interval: 25),
//       tooltipBehavior: TooltipBehavior(enable: true),
//       series: [
//         ColumnSeries<MapEntry<String, double>, String>(
//           dataSource: data,
//           xValueMapper: (MapEntry<String, double> data, _) => data.key,
//           yValueMapper: (MapEntry<String, double> data, _) => data.value,
//           name: 'Deeds Completion',
//           color: const Color.fromRGBO(8, 142, 255, 1),
//         ),
//       ],
//     );
//   }

//   double _calculateCompletionPercentage(List<Deed> deeds) {
//     final completedDeeds = deeds.where((deed) => deed.isDone).length;
//     final totalDeeds = deeds.length;
//     return totalDeeds != 0 ? (completedDeeds / totalDeeds) * 100 : 0;
//   }
// }
