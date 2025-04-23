import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AsyncWidget extends StatelessWidget {
  final AsyncSnapshot snapshot;
  final Widget Function()? loading;
  final Widget Function()? error;
  final Widget Function(BuildContext context, AsyncSnapshot snapshot) builder;

  const AsyncWidget(
      {super.key,
      required this.snapshot,
      this.error,
      this.loading,
      required this.builder});

  @override
  Widget build(BuildContext context) {
    if (snapshot.hasError) {
      return error == null ? const Text("Lỗi rồi!") : error!();
    }
    if (!snapshot.hasData) {
      return loading == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : loading!();
    }

    return builder(context, snapshot);
  }
}
