import 'package:flutter/material.dart';

class AnimateListItem extends StatefulWidget {
  final Widget child;

  const AnimateListItem({
    super.key,
    required this.child,
  });

  @override
  State<AnimateListItem> createState() => _AnimateListItemState();
}

class _AnimateListItemState extends State<AnimateListItem> {
  bool _animate = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _animate = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 1000),
      opacity: _animate ? 1 : 0,
      curve: Curves.easeInOutQuart,
      child: AnimatedPadding(
          duration: const Duration(milliseconds: 500),
          padding: _animate
              ? const EdgeInsets.all(4.0)
              : const EdgeInsets.only(top: 10),
          child: widget.child),
    );
  }
}
