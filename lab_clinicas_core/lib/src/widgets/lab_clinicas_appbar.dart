import 'package:flutter/material.dart';

class LabClinicasAppbar extends AppBar {
  LabClinicasAppbar({
    super.key,
    List<Widget>? actions,
  }) : super(
          actions: actions,
          toolbarHeight: 72,
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.50),
                offset: const Offset(0, 1),
                blurRadius: 4,
              )
            ]),
            child: Padding(
              padding: const EdgeInsets.only(left: 64),
              child: Image.asset('assets/images/logo_horizontal.png'),
            ),
          ),
        );
}
