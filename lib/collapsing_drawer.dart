import 'package:flutter/material.dart';
import 'package:side_drawer/collapsing_drawer_item.dart';
import 'package:side_drawer/constants.dart';
import 'package:side_drawer/drawer_items.dart';

class CollapsingDrawer extends StatefulWidget {
  const CollapsingDrawer({Key? key}) : super(key: key);

  @override
  _CollapsingDrawerState createState() => _CollapsingDrawerState();
}

class _CollapsingDrawerState extends State<CollapsingDrawer>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = false;
  double minWidth = 70;
  double maxWidth = 220;
  late AnimationController _animationController;
  late Animation<double> widthAnimation;
  int currentSelectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, widget) => widgetBuilder(context, widget),
    );
  }

  Widget widgetBuilder(context, widget) {
    return Material(
      elevation: 80.0,
      child: Container(
        width: widthAnimation.value,
        color: kBackgroundColor,
        child: Column(
          children: <Widget>[
            CollapsingDrawerItem(
              press: () {},
              title: 'Birdy',
              icon: Icons.person,
              animationController: _animationController,
            ),
            const Divider(
              color: Colors.grey,
              height: 40.0,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, counter) {
                  return const Divider(height: 12.0);
                },
                itemBuilder: (context, counter) {
                  return CollapsingDrawerItem(
                    press: () {
                      setState(() {
                        currentSelectedIndex = counter;
                      });
                    },
                    isSelected: currentSelectedIndex == counter,
                    title: items[counter].text,
                    icon: items[counter].icon,
                    animationController: _animationController,
                  );
                },
                itemCount: items.length,
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isCollapsed = !isCollapsed;
                  isCollapsed
                      ? _animationController.forward()
                      : _animationController.reverse();
                });
              },
              child: AnimatedIcon(
                icon: AnimatedIcons.close_menu,
                progress: _animationController,
                color: kPrimaryForegroundColor,
                size: 50.0,
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
