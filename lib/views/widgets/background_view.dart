import 'package:flutter/material.dart';

class BackgroundView extends StatelessWidget {
  final String? assetPath;
  final String? networkUrl;

  const BackgroundView({
    super.key,
    this.assetPath,
    this.networkUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: assetPath != null
          ? Image.asset(assetPath!, fit: BoxFit.cover)
          : Image.network(networkUrl!, fit: BoxFit.cover),
    );
  }
}
