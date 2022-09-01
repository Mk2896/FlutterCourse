import 'package:flutter/material.dart';
import 'package:flutter_class_11/view_models/my_home_page_view_model.dart';
import 'package:stacked/stacked.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyHomePageViewModel>.reactive(
      viewModelBuilder: () => MyHomePageViewModel(),
      onModelReady: (viewModel) => viewModel.initialise(),
      staticChild: const Icon(Icons.add),
      builder: (context, viewModel, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          child: child,
          onPressed: () {
            viewModel.updateTitle();
          },
        ),
        body: Center(
          child: Text(viewModel.title),
        ),
      ),
    );
  }
}
