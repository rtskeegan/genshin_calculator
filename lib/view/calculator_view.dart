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
  String leylinesNeeded = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Genshin Impact Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Purple"),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      totalPurpleMat = value;
                    },
                  ),
                ),
                Spacer(),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: "Red"),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      totalRedMat = value;
                    },
                  ),
                ),
                Spacer(),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: "White"),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      totalWhiteMat = value;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 48.0),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Current Level",
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          currentLevel = value;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Desired Level",
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          desiredLevel = value;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Current XP",
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          currentXP = value;
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(0, 125)),
                    onPressed: calculateRequiredMaterials,
                    child: const Text("Calculate"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 48.0),
            Text(
              response == ''
                  ? "Please enter your data and press calculate!"
                  : response,
            ),
            Column(
              children: [
                Text("Needed Purple Materials $neededPurples"),
                Text("Needed Red Materials $neededReds"),
                Text("Needed White Materials $neededWhites"),
                Text("Maximum Amount of Leylines Needed $leylinesNeeded"),
              ],
            ),
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
    int neededLeylinesInt = 0;
    final int intCurrentXP = int.parse(currentXP);
    final int intNeededXP =
        xpTable[int.parse(desiredLevel) - 1].total -
        xpTable[int.parse(currentLevel) - 1].total;
    final num finalAnswer =
        intNeededXP -
        intCurrentXP -
        (int.parse(totalPurpleMat) * 20000) -
        (int.parse(totalRedMat) * 5000) -
        (int.parse(totalWhiteMat) * 1000);
    neededMaterialsVar = finalAnswer;
    while (neededMaterialsVar > 20000) {
      neededMaterialsVar -= 20000;
      neededPurplesInt++;
    }
    while (neededMaterialsVar > 5000 && neededMaterialsVar < 20000) {
      neededMaterialsVar -= 5000;
      neededRedsInt++;
    }
    while (neededMaterialsVar >= 0 && neededMaterialsVar < 5000) {
      neededMaterialsVar -= 1000;
      neededWhitesInt++;
    }
    neededLeylinesInt = calculateRequiredLeylines(
      neededWhitesInt,
      neededRedsInt,
      neededPurplesInt,
    );
    setState(() {
      finalAnswer <= 0 ? response = 'Farmed' : response = 'Not done';
      neededPurples = neededPurplesInt.toString();
      neededReds = neededRedsInt.toString();
      neededWhites = neededWhitesInt.toString();
      leylinesNeeded = neededLeylinesInt.toString();
    });
  }
}

int calculateRequiredLeylines(
  int neededWhites,
  int neededReds,
  int neededPurples,
) {
  int leylinesNeeded = 0;
  if (neededWhites != 0) {
    while (neededWhites > 0) {
      neededWhites -= 5;
      neededReds++;
    }
  }
  while (neededReds > 0 || neededPurples > 0) {
    leylinesNeeded++;
    neededReds -= 6;
    neededPurples -= 4;
  }
  return leylinesNeeded;
}
