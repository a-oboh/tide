import 'package:flutter/material.dart';

class PageOverlayLoader extends StatelessWidget {
  const PageOverlayLoader(
      {super.key, required this.child, this.loading = false});

  final Widget child;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (loading)
          Container(
            color: Colors.black.withOpacity(0.7), // Adjust opacity as needed
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }
}
