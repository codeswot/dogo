import 'package:flutter/material.dart';

import 'dogo/presentation/presentation.dart';
import 'dogo/presentation/widget/widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DOGO 🐾'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DogoPage(),
            SizedBox(height: 16),
            DogosGalleryTilePicker(),
          ],
        ),
      ),
    );
  }
}
