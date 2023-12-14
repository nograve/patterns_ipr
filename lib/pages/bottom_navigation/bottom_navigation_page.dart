import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:patterns_ipr/pages/behavioral/behavioral_page.dart';
import 'package:patterns_ipr/pages/creational/creational_page.dart';
import 'package:patterns_ipr/pages/structural/structural_page.dart';
import 'package:patterns_ipr/widgets/custom_bottom_nav_bar_item.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({
    required this.child,
    required this.location,
    super.key,
  });
  final Widget child;
  final String location;

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _currentIndex = 0;

  static const tabs = [
    CustomBottomNavBarItem(
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home),
      label: 'Creational',
      initialLocation: CreationalPage.routeName,
    ),
    CustomBottomNavBarItem(
      icon: Icon(Icons.explore_outlined),
      activeIcon: Icon(Icons.explore),
      label: 'Structural',
      initialLocation: StructuralPage.routeName,
    ),
    CustomBottomNavBarItem(
      icon: Icon(Icons.storefront_outlined),
      activeIcon: Icon(Icons.storefront_rounded),
      label: 'Behavioral',
      initialLocation: BehavioralPage.routeName,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    const labelStyle = TextStyle(fontFamily: 'Roboto');
    return Scaffold(
      body: SafeArea(child: widget.child),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: labelStyle,
        unselectedLabelStyle: labelStyle,
        selectedItemColor: const Color(0xFF434343),
        selectedFontSize: 12,
        unselectedItemColor: const Color(0xFF838383),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) => _goToOtherTab(context, index),
        currentIndex: widget.location == CreationalPage.routeName
            ? 0
            : widget.location == StructuralPage.routeName
                ? 1
                : 2,
        items: tabs,
      ),
    );
  }

  void _goToOtherTab(BuildContext context, int index) {
    if (index != _currentIndex) {
      final router = GoRouter.of(context);
      final location = tabs[index].initialLocation;

      setState(() {
        _currentIndex = index;
      });

      router.go(location);
    }
  }
}
