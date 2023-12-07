import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotx/bloc/region_bloc/region_bloc_bloc.dart';

import 'package:spotx/view/widgets/custom_container.dart';

import '../../data/remote_data_source/remote_data_source.dart';

class RegionWidget extends StatelessWidget {
  const RegionWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: BlocProvider(
        create: (context) =>
            RegionBloc(remoteApi: RemoteApi())..add(GetDataEvent()),
        child: BlocBuilder<RegionBloc, RegionState>(
          builder: (context, state) {
            if (state is LoadingDataState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LoadedDataState) {
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomContainer(
                            imageUrl:
                                state.data[index].images[index].url.toString(),
                            title: state.data[index].name.toString())
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
