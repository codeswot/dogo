import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  bool get mounted {
    try {
      widget;
      return true;
    } catch (e) {
      return false;
    }
  }

  void push(Widget screen) {
    Navigator.of(this).push(MaterialPageRoute<void>(
      builder: (BuildContext context) => screen,
    ));
  }

  void pushReplacement(Widget screen) {
    Navigator.of(this).pushReplacement(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => screen,
      ),
    );
  }

  void pop<T>(T? result) {
    Navigator.of(this).maybePop(result);
  }

  Future<T?> showBottomSheet<T>(Widget sheet) => showModalBottomSheet<T>(
        showDragHandle: true,
        useRootNavigator: true,
        isScrollControlled: true,
        context: this,
        builder: (context) => SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child:
                BottomSheet(onClosing: () => T, builder: (context) => sheet)),
      );
}
