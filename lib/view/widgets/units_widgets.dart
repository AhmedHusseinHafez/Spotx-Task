import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotx/bloc/units_bloc/units_bloc.dart';
import 'package:spotx/core/constants/app_constants.dart';
import 'package:spotx/view/widgets/custom_container.dart';

import '../../data/remote_data_source/remote_data_source.dart';

class UnitsWidget extends StatelessWidget {
  const UnitsWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: BlocProvider(
          create: (context) =>
              UnitsBloc(remoteApi: RemoteApi())..add(GetUnitsEvent()),
        child: BlocBuilder<UnitsBloc, UnitsState>(
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
        ),
      ),
    );
  }
}
