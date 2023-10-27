import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DogoFullImagePage extends StatelessWidget {
  const DogoFullImagePage(this.url, {super.key});
  final String url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Who\'s a good DOGO ?'),
      ),
      body: Hero(
        tag: url,
        child: CachedNetworkImage(
          imageUrl: url,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.contain,
              ),
            ),
          ),
          placeholder: (context, url) =>
              const CircularProgressIndicator.adaptive(),
          errorWidget: (context, url, error) => const Icon(
            Icons.pets,
          ),
        ),
      ),
    );
  }
}
