import 'package:flutter/material.dart';

class DogoPickerTile extends StatelessWidget {
  const DogoPickerTile({
    required this.subtitle,
    required this.title,
    this.onTap,
    super.key,
  });
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
      ),
      subtitle: Text(subtitle,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
              )),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
      ),
    );
  }
}
