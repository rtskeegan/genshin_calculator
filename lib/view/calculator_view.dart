import 'package:flutter/material.dart';

import 'package:genshin_calculator/data/leyline.dart';
import 'package:genshin_calculator/data/xp_material.dart';
import 'package:genshin_calculator/data/levelxp.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  @override
  Widget build(BuildContext context) {
    String totalWhiteMat = "";
    String totalRedMat = "";
    String totalPurpleMat = "";
    String currentXP = "";
    String currentLevel = "";
    String desiredLevel = "";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Genshin Impact Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(labelText: "Total Purple Materials"),
                  onChanged: (value) {
                    totalPurpleMat = value;
                  },
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(labelText: "Total Red Materials"),
                  onChanged: (value) {
                    totalRedMat = value;
                  },
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(labelText: "Total White Materials"),
                  onChanged: (value) {
                    totalWhiteMat = value;
                  },
                ),
              ),
            ]),
            SizedBox(height: 48.0),
            TextField(
              decoration: const InputDecoration(labelText: "Current Level"),
              onChanged: (value) {
                currentLevel = value;
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Desired Level"),
              onChanged: (value) {
                desiredLevel = value;
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Current XP"),
              onChanged: (value) {
                currentXP = value;
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Logic to calculate required materials
                // This is where you would implement the calculation logic
              },
              child: const Text("Calculate"),
            ),
            // Display results here
          ],
        ),
      ),
    );
  }
}