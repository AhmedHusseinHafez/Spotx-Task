import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotx/bloc/region_id_bloc/region_id_bloc_bloc.dart';
import 'package:spotx/bloc/ui_builder/ui_builder_bloc.dart';
import 'package:spotx/bloc/units_capacity_bloc/units_capacity_bloc.dart';
import 'package:spotx/core/apptheme.dart';
import 'package:spotx/data/remote_data_source/remote_data_source.dart';
import 'package:spotx/view/pages/home.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              UiBuilderBloc(remoteApi: RemoteApi())..add(GetUiBuildersEvent()),
        ),
        BlocProvider(
          create: (context) => RegionByIDBloc(remoteApi: RemoteApi()),
        ),
        BlocProvider(
          create: (context) => UnitsCapacityBloc(remoteApi: RemoteApi()),
        ),
      ],
      child: MaterialApp(
        title: 'spotx',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: const Home(),
      ),
    );
  }
}
