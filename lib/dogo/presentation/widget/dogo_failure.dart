import 'package:flutter/material.dart';

class DogoFailureWidget extends StatelessWidget {
  const DogoFailureWidget(this.errorMessage, {super.key});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Text(errorMessage);
  }
}
