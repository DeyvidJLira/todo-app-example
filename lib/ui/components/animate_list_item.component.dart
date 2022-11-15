import 'package:flutter/material.dart';

class AnimateListItem extends StatefulWidget {
  final int index;
  final Widget child;

  const AnimateListItem(this.index, this.child, {super.key});

  @override
  State<AnimateListItem> createState() => _AnimateListItemState();
}

class _AnimateListItemState extends State<AnimateListItem> {
  bool _animate = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: widget.index * 100), () {
      setState(() {
        _animate = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
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
