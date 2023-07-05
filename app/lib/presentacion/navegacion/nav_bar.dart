import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'nav_bar_desktop.dart';
import 'nav_bar_mobile.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const NavBarMobile(),
      desktop: (BuildContext context) => const NavBarDesktop(),
    );
  }
}

