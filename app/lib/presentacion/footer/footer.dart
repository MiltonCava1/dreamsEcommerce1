import 'package:app/presentacion/footer/footer_mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'footer_desktop.dart';



class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const FooterMobile(),
      desktop: (BuildContext context) => const FooterDesktop(),
    );
  }
}



