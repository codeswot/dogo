import 'package:deliveristo_challenge/dogo_breed/cubit/dogo_breed_cubit.dart';
import 'package:dogos_repository/dogos_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/widget.dart';

class BreedListPage extends StatelessWidget {
  const BreedListPage({
    this.toGallery = false,
    super.key,
  });
  final bool toGallery;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DogoBreedCubit(DogoRepository())..getDogoBreed(),
      child: DogoBreedListView(toGallery: toGallery),
    );
  }
}
