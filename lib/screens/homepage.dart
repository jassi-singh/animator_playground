import 'package:animator_playground/data/animations_data.dart';
import 'package:animator_playground/screens/animations/animations_page.dart';
import 'package:flutter/material.dart';

import '../models/animation_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animator Playground'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: animationsList.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemCard(animationInfo: animationsList[index]);
          },
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final AnimationInfo animationInfo;
  const ItemCard({
    Key? key,
    required this.animationInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return AnimationsPage(
              animationInfo: animationInfo,
            );
          },
        ),
      ),
      child: Card(
        color: animationInfo.color,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            animationInfo.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
