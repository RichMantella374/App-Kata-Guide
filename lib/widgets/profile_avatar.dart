import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String? imageUrl;
  final VoidCallback onUpload;

  const ProfileAvatar({
    super.key,
    required this.imageUrl,
    required this.onUpload,
  });

  @override
  Widget build(BuildContext context) {
    final radius = 50.0;

    return Column(
      children: [
        CircleAvatar(
          radius: radius,
          backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
          child:
              imageUrl == null
                  ? Icon(
                    Icons.person,
                    size: radius,
                    color: Colors.grey.shade300,
                  )
                  : null,
        ),
        const SizedBox(height: 8),
        TextButton.icon(
          onPressed: onUpload,
          icon: const Icon(Icons.upload),
          label: const Text("Cambiar foto"),
        ),
      ],
    );
  }
}
