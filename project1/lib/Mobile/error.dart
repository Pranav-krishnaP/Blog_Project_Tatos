import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MerrorScreen extends StatelessWidget {
  const MerrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "404 Error\nFailed to Fetch details",
          style: TextStyle(fontSize: 56, color: Colors.grey),
        ),
      ),
    );
    ;
  }
}
