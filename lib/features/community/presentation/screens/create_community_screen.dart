import 'package:flutter/material.dart';

class CreateCommunityScreen extends StatelessWidget {
  const CreateCommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: Text('This is CreateCommunityScreen'),
            );
          },
        ),
      ),
    );
  }
}
