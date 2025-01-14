// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talawa/locator.dart';

//import '../../test/views/after_auth_screens/chat/select_contact_test.dart';

class BaseView<T extends ChangeNotifier> extends StatefulWidget {
  const BaseView({
    required this.builder,
    this.onModelReady,
  });
  final Function(T)? onModelReady;
  final Widget Function(BuildContext, T, Widget?) builder;

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends ChangeNotifier> extends State<BaseView<T>> {
  T model = locator<T>();

  @override
  void initState() {
    widget.onModelReady?.call(model);
    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return ChangeNotifierProvider<T>(
      create: (context) => model,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }
}
