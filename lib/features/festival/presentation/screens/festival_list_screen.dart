import 'package:flutter/material.dart';

class FestivalListScreen extends StatelessWidget {
  const FestivalListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: Text('This is FestivalListScreen'),
            );
          },
        ),
      ),
    );
  }
}
