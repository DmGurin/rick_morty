import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(60),
      child: CachedNetworkImage(
        imageUrl: image,
        height: 120,
        width: 120,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) {
          return Center(
            child: Column(
              children: [
                const Icon(
                  Icons.error_outline,
                  color: Colors.white,
                ),
                Text(
                  error!,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
