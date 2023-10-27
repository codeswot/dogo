import 'package:deliveristo_challenge/dogo_sub_breed/cubit/dogo_sub_breed_cubit.dart';
import 'package:dogos_repository/dogos_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';

class SubBreedListPage extends StatelessWidget {
  const SubBreedListPage(this.breed, {this.toGallery = false, super.key});
  final bool toGallery;
  final String breed;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DogoSubBreedCubit(DogoRepository())..getDogoSubBreed(breed),
      child: DogoSubBreedListView(
        breed,
        toGallery: toGallery,
      ),
    );
  }
}
