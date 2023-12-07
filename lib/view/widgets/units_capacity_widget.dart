import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotx/bloc/units_capacity_bloc/units_capacity_bloc.dart';
import 'package:spotx/core/constants/app_constants.dart';
import 'package:spotx/data/models/ui_builder/filters.dart';
import 'package:spotx/view/widgets/custom_container.dart';

class UnitsCapacityWidget extends StatelessWidget {
  final Filters? filters;
  const UnitsCapacityWidget({
    super.key,
    required this.filters,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 120,
        child: FutureBuilder(
            future: initializeBloc(context),
            builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
              return BlocBuilder<UnitsCapacityBloc, UnitsCapacityState>(
                builder: (context, state) {
                  if (state is LoadingDataState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is LoadedDataState) {
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
                                  title: state.data[index].title.toString())
                            ],
                          ),
                        );
                      },
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              );
            }));
  }

  Future<void> initializeBloc(BuildContext context) async {
    if (filters != null && filters!.guest != null) {
      context
          .read<UnitsCapacityBloc>()
          .add(GetUnitsCapacityEvent(guest: filters!.guest!));
    }
  }
}
