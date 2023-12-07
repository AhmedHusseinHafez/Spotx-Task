import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotx/bloc/region_id_bloc/region_id_bloc_bloc.dart';
import 'package:spotx/core/constants/app_constants.dart';
import 'package:spotx/data/models/ui_builder/filters.dart';
import 'package:spotx/view/widgets/custom_container.dart';

class RegionByIDWidget extends StatelessWidget {
  final Filters? filters;

  const RegionByIDWidget({
    Key? key,
    required this.filters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: FutureBuilder<void>(
        future: initializeBloc(context),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return BlocBuilder<RegionByIDBloc, RegionByIDState>(
              builder: (context, state) {
                if (state is LoadingRegionByIDState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is LoadedRegionByIDState) {
                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      String imageUrl = state.data[index].images!.isNotEmpty
                          ? state.data[index].images![0].url.toString()
                          : NOT_IMAGE;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomContainer(
                              imageUrl: imageUrl,
                              title: state.data[index].name.toString(),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<void> initializeBloc(BuildContext context) async {
    if (filters != null && filters!.region != null) {
      context
          .read<RegionByIDBloc>()
          .add(GetRegionByIDEvent(id: filters!.region!));
    }
  }
}
