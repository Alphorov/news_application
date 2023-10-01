import 'package:flutter/material.dart';

class PublicationDate extends StatelessWidget {
  const PublicationDate({
    Key? key,
    required this.publicationDate,
  }) : super(key: key);

  final String publicationDate;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          const Icon(Icons.timeline_outlined, size: 16),
          const SizedBox(width: 4),
          Text(
            publicationDate,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      );
}
