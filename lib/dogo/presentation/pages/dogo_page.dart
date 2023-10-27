import 'package:deliveristo_challenge/dogo/cubit/dogo_cubit.dart';
import 'package:dogos_repository/dogos_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/widget.dart';

class DogoPage extends StatelessWidget {
  const DogoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DogoCubit(DogoRepository())..getDogo(),
      child: const DogoView(),
    );
  }
}
