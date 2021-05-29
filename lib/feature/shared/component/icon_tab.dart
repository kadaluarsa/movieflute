import 'package:flutter/material.dart';

class IconTab extends StatelessWidget {
  final String iconPath;
  final String label;

  IconTab({this.iconPath, this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      child: Tab(
        child: Column(
          children: [
            Image.asset(
              iconPath,
              width: 40,
              height: 40,
            ),
            SizedBox(height: 4),
            Text(label)
          ],
        ),
      ),
    );
  }
}
