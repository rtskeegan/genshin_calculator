import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:genshin_calculator/data/leyline.dart';
import 'package:genshin_calculator/data/xp_material.dart';
import 'package:genshin_calculator/data/levelxp.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
    String totalWhiteMat = "";
    String totalRedMat = "";
    String totalPurpleMat = "";
    String currentXP = "";
    String currentLevel = "";
    String desiredLevel = "";
    String response = '';
    String neededPurples = '';
    String neededReds = '';
    String neededWhites = '';

  @override
  Widget build(BuildContext context) {
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
              onPressed: calculateRequiredMaterials,
              child: const Text("Calculate"),
            ),
            SizedBox(height: 48.0),
            Text(response == '' ? "No calculation" : response),
            Row(children: [
              Expanded(
                child: Text(
                  neededPurples
                ),
              ),
              Expanded(
                child: Text(
                  neededReds
                ),
              ),
              Expanded(
                child: Text(
                  neededWhites
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
  
void calculateRequiredMaterials() {
  // FIX THIS!!!!!!!!!!
  int neededPurplesInt = 0;
  int neededRedsInt = 0;
  int neededWhitesInt = 0;
  num neededMaterialsVar = 0;
  final int intCurrentXP = int.parse(currentXP);
  final int intNeededXP = xpTable[int.parse(desiredLevel) - 1].total -  xpTable[int.parse(currentLevel) - 1].total;
  final num finalAnswer = intNeededXP - intCurrentXP - (int.parse(totalPurpleMat) * 20000) - (int.parse(totalRedMat) * 5000) - (int.parse(totalWhiteMat) * 1000);
  neededMaterialsVar = finalAnswer;
  while (neededMaterialsVar > 20000) {
    neededMaterialsVar -= 20000;
    neededPurplesInt ++;
  }
  while (neededMaterialsVar > 5000 && neededMaterialsVar < 20000) {
    neededMaterialsVar -= 5000;
    neededRedsInt ++;
  }
  while (neededMaterialsVar >= 0 && neededMaterialsVar < 5000) {
    neededMaterialsVar -= 1000;
    neededWhitesInt ++;
  }
  setState(() {
    finalAnswer <= 0 ? response = 'Farmed' : response = 'Not done';
    neededPurples = neededPurplesInt.toString();
    neededReds = neededRedsInt.toString();
    neededWhites = neededWhitesInt.toString();
    });
  }
}
