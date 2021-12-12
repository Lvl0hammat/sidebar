import 'package:flutter/material.dart';
import 'package:side_drawer/constants.dart';

class CollapsingDrawerItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final AnimationController animationController;
  final VoidCallback press;
  const CollapsingDrawerItem(
      {Key? key,
      required this.title,
      required this.icon,
      required this.animationController,
      this.isSelected = false,
      required this.press})
      : super(key: key);

  @override
  _CollapsingDrawerItemState createState() => _CollapsingDrawerItemState();
}

class _CollapsingDrawerItemState extends State<CollapsingDrawerItem> {
  late Animation<double> widthAnimation, sizedBoxAnimation;
  @override
  void initState() {
    super.initState();
    widthAnimation =
        Tween<double>(begin: 200, end: 70).animate(widget.animationController);
    sizedBoxAnimation =
        Tween<double>(begin: 10, end: 0).animate(widget.animationController);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.press,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          color: widget.isSelected
              ? Colors.transparent.withOpacity(0.3)
              : Colors.transparent,
        ),
        width: widthAnimation.value,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Row(
          children: <Widget>[
            Icon(
              widget.icon,
              color:
                  widget.isSelected ? kPrimaryForegroundColor : Colors.white30,
              size: 38.0,
            ),
            SizedBox(width: sizedBoxAnimation.value),
            (widthAnimation.value >= 190)
                ? Text(
                    widget.title,
                    style: widget.isSelected
                        ? const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600)
                        : const TextStyle(
                            color: Colors.white70,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
