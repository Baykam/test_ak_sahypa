import 'package:flutter/material.dart';

class Loadingscreen extends StatelessWidget {
  const Loadingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}