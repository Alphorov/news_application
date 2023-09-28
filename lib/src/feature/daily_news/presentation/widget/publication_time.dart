import 'package:flutter/material.dart';

class PublicationTime extends StatelessWidget {
  const PublicationTime({required this.publishedAt, super.key});

  final String publishedAt;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          const Icon(Icons.timeline_outlined, size: 16),
          const SizedBox(width: 4),
          Text(
            publishedAt,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
}
