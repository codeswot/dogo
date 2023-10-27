import 'package:deliveristo_challenge/dogo/presentation/pages/dogos_gallery_page.dart';
import 'package:deliveristo_challenge/dogo_sub_breed/cubit/dogo_sub_breed_cubit.dart';
import 'package:deliveristo_challenge/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogoSubBreedListView extends StatelessWidget {
  const DogoSubBreedListView(this.breed, {this.toGallery = false, Key? key})
      : super(key: key);

  final bool toGallery;
  final String breed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DogoSubBreedCubit, DogoSubBreedState>(
      builder: (context, state) {
        if (state is DogoSubBreedLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is DogoSubBreedSuccess) {
          return _buildSubBreedsList(context, state.dogoSubBreed.subBreeds);
        } else if (state is DogoSubBreedFailure) {
          return const Center(
            child: Text('Something went wrong!'),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildSubBreedsList(BuildContext context, List<String> subBreeds) {
    if (subBreeds.isEmpty) {
      return _buildNoSubBreedsFound(context);
    }

    return ListView.builder(
      itemCount: subBreeds.length,
      itemBuilder: (context, index) {
        final dogoSubBreed = subBreeds[index].toString();
        return _buildSubBreedListItem(context, dogoSubBreed, index);
      },
    );
  }

  Widget _buildNoSubBreedsFound(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('No sub breeds found for $breed!'),
        const SizedBox(height: 10),
        TextButton(
          onPressed: () {
            context.pop(null);
          },
          child: const Text('Go back'),
        ),
      ],
    );
  }

  Widget _buildSubBreedListItem(
      BuildContext context, String dogoSubBreed, int index) {
    return ListTile(
      onTap: () {
        if (toGallery) {
          context.push(
            DogosGalleryPage(
              breed: breed,
              subBreed: dogoSubBreed,
            ),
          );
        } else {
          context.pop(dogoSubBreed);
        }
      },
      leading: Text((index + 1).toString()),
      title: Text(dogoSubBreed),
    );
  }
}
