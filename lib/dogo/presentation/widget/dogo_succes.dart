import 'package:cached_network_image/cached_network_image.dart';
import 'package:deliveristo_challenge/dogo/cubit/dogo_cubit.dart';
import 'package:deliveristo_challenge/dogo/presentation/widget/dogo_full_image.dart';
import 'package:deliveristo_challenge/dogo_breed/presentation/pages/pages.dart';
import 'package:deliveristo_challenge/dogo_sub_breed/presentation/pages/sub_breed_list_page.dart';
import 'package:deliveristo_challenge/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dog_picker_tile.dart';

class DogoSuccessWidget extends StatelessWidget {
  const DogoSuccessWidget(this.url, {Key? key}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CachedNetworkImage(
        imageUrl: url,
        imageBuilder: (context, imageProvider) {
          return _buildImage(context, imageProvider);
        },
        placeholder: (context, url) =>
            const CircularProgressIndicator.adaptive(),
        errorWidget: (context, url, error) => const Icon(Icons.pets),
      ),
    );
  }

  Widget _buildImage(BuildContext context, ImageProvider imageProvider) {
    return Hero(
      tag: url,
      child: Material(
        child: GestureDetector(
          onTap: () => _pushFullImagePage(context, url),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  height: 300,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              _buildOpenInNewIcon(),
              _buildBottomContainer(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOpenInNewIcon() {
    return const Positioned(
      right: 30,
      top: 30,
      child: Center(
        child: Icon(
          Icons.open_in_new,
          color: Colors.white,
          size: 48,
        ),
      ),
    );
  }

  Widget _buildBottomContainer(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DogoPickerTile(
              title: 'Dogo Breed',
              subtitle: 'Pick Dogo image by breed',
              onTap: () => _getDogoByBreed(context),
            ),
            const Divider(thickness: 0.5),
            DogoPickerTile(
              title: 'Dogo Sub Breed',
              subtitle: 'Pick Dogo image by sub breed',
              onTap: () => _getDogoBySubBreed(context),
            ),
          ],
        ),
      ),
    );
  }

  void _getDogoByBreed(BuildContext context) async {
    final selectedBreed = await context.showBottomSheet(const BreedListPage());
    if (context.mounted && selectedBreed != null) {
      context.read<DogoCubit>().getDogo(breed: selectedBreed);
    }
  }

  void _getDogoBySubBreed(BuildContext context) async {
    final selectedBreed = await context.showBottomSheet(const BreedListPage());
    if (context.mounted && selectedBreed != null) {
      final selectedSubBreed =
          await context.showBottomSheet(SubBreedListPage(selectedBreed));
      if (context.mounted && selectedSubBreed != null) {
        context.read<DogoCubit>().getDogo(
              breed: selectedBreed,
              subBreed: selectedSubBreed,
            );
      }
    }
  }

  void _pushFullImagePage(BuildContext context, String url) {
    context.push(DogoFullImagePage(url));
  }
}
