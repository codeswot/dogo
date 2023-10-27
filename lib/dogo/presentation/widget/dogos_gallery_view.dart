import 'package:cached_network_image/cached_network_image.dart';
import 'package:deliveristo_challenge/dogo/cubit/dogos_cubit.dart';
import 'package:deliveristo_challenge/dogo/presentation/widget/widget.dart';
import 'package:deliveristo_challenge/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogoGalleryView extends StatelessWidget {
  const DogoGalleryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dogo\'s Gallery'),
      ),
      body: BlocBuilder<DogosCubit, DogosState>(
        builder: (context, state) {
          if (state is DogosLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is DogosSuccess) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: state.dogos.urls.length,
              itemBuilder: (context, index) {
                final url = state.dogos.urls[index];
                return Hero(
                  tag: url,
                  child: GestureDetector(
                    onTap: () => context.push(
                      DogoFullImagePage(url),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: url,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.pets),
                    ),
                  ),
                );
              },
            );
          } else if (state is DogosFailure) {
            return Center(
              child: Text('something went wrong  ${state.dogos.status}'),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
