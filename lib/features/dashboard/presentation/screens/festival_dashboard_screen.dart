import 'package:flutter/material.dart';

class FestivalDashboardScreen extends StatelessWidget {
  const FestivalDashboardScreen({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(child: Text('This is DashboardScreen'));
          },
        ),
      ),
    );
  }
}
