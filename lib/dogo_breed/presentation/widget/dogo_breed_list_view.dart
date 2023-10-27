import 'package:deliveristo_challenge/dogo/presentation/pages/dogos_gallery_page.dart';
import 'package:deliveristo_challenge/dogo_breed/cubit/dogo_breed_cubit.dart';
import 'package:deliveristo_challenge/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogoBreedListView extends StatelessWidget {
  const DogoBreedListView({this.toGallery = false, Key? key}) : super(key: key);
  final bool toGallery;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DogoBreedCubit, DogoBreedState>(
      builder: (context, state) {
        if (state is DogoBreedLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is DogoBreedSuccess) {
          return _buildBreedList(context, state.dogoBreed.breeds);
        } else if (state is DogoBreedFailure) {
          return _buildErrorText('Something went wrong!');
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildBreedList(BuildContext context, List<String?> breeds) {
    return Column(
      children: [
        Text(
          'Breeds',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Text('Select a breed to continue'),
        const SizedBox(height: 10),
        const Divider(thickness: 0.5),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: breeds.length,
            itemBuilder: (context, index) {
              final dogoBreed = breeds[index].toString();
              return _buildBreedListItem(context, dogoBreed, index);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBreedListItem(
      BuildContext context, String dogoBreed, int index) {
    return ListTile(
      onTap: () {
        if (toGallery) {
          context.push(
            DogosGalleryPage(breed: dogoBreed),
          );
        } else {
          context.pop(dogoBreed);
        }
      },
      leading: Text((index + 1).toString()),
      title: Text(dogoBreed),
    );
  }

  Widget _buildErrorText(String message) {
    return Center(
      child: Text(message),
    );
  }
}
