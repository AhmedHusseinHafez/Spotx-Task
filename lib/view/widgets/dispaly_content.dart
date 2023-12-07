import 'package:flutter/material.dart';
import 'package:spotx/core/constants/app_constants.dart';
import 'package:spotx/data/models/ui_builder/filters.dart';
import 'package:spotx/view/widgets/region_by_id.dart';
import 'package:spotx/view/widgets/regions_widget.dart';
import 'package:spotx/view/widgets/units_capacity_widget.dart';
import 'package:spotx/view/widgets/units_widgets.dart';

class DisplayWidget extends StatelessWidget {
  final String content;
  final Filters? filters;

  const DisplayWidget(
      {super.key, required this.content, required this.filters});

  @override
  Widget build(BuildContext context) {
    if (content == REGIONS && filters == null) {
      return const RegionWidget();
    } else if (content == UNITS && filters != null) {
      if (filters!.orderBy == DEFAULT_PRICE && filters!.orderType == ASC) {
        return const UnitsWidget();
      } else if (filters!.guest != null) {
        return UnitsCapacityWidget(filters: filters);
      }
    } else if (content == SUB_REGION && filters != null) {
      return RegionByIDWidget(filters: filters);
    }
    return const SizedBox();
  }
}
