import 'package:deliveristo_challenge/dogo/cubit/dogos_cubit.dart';
import 'package:dogos_repository/dogos_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/widget.dart';

class DogosGalleryPage extends StatelessWidget {
  const DogosGalleryPage({
    this.breed,
    this.subBreed,
    super.key,
  });
  final String? breed;
  final String? subBreed;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DogosCubit(DogoRepository())
        ..getDogos(
          breed: breed,
          subBreed: subBreed,
        ),
      child: const DogoGalleryView(),
    );
  }
}
