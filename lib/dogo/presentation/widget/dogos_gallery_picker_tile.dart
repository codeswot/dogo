import 'package:deliveristo_challenge/dogo_breed/presentation/pages/pages.dart';
import 'package:deliveristo_challenge/shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../dogo_sub_breed/presentation/pages/sub_breed_list_page.dart';
import 'widget.dart';

class DogosGalleryTilePicker extends StatelessWidget {
  const DogosGalleryTilePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Dogo\'s Gallery (List)',
            style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16.0),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onBackground,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: [
              DogoPickerTile(
                title: 'Breed',
                subtitle: 'Gallery of dogo\'s by breed',
                onTap: () {
                  context.showBottomSheet(
                    const BreedListPage(
                      toGallery: true,
                    ),
                  );
                },
              ),
              const Divider(thickness: 0.5),
              DogoPickerTile(
                title: 'Sub Breed',
                subtitle: 'Gallery of dogo\'s by sub breed',
                onTap: () async {
                  final String pickedBreed = await context.showBottomSheet(
                    const BreedListPage(),
                  );
                  if (context.mounted) {
                    context.showBottomSheet(SubBreedListPage(
                      pickedBreed,
                      toGallery: true,
                    ));
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
