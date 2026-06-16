import 'package:ak_sahypa_test/src/infrasturcture/models/index.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key,this.model});

  final ErrorModel? model;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(model?.error ?? 'An error occurred'),
    );
  }
}