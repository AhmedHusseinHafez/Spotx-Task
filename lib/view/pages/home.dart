import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotx/bloc/ui_builder/ui_builder_bloc.dart';
import 'package:spotx/view/widgets/dispaly_content.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task"),
        centerTitle: true,
      ),
      body:
          BlocBuilder<UiBuilderBloc, UiBuilderState>(builder: (context, state) {
        if (state is LoadingUiBuilderState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LoadedUiBuilderState) {
          if (state.uiBuilder.isNotEmpty) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.uiBuilder.length,
              itemBuilder: (context, index) {
                final item = state.uiBuilder[index];
                final title = item.title;
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title.toString()),
                      const SizedBox(
                        height: 15,
                      ),
                      DisplayWidget(
                        content: item.content.toString(),
                        filters: item.filters
                      ),
                    ],
                  ),
                );
              },
            );
          }
        }
        return const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
