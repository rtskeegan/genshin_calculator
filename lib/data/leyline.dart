import 'package:genshin_calculator/data/xp_material.dart';

class Leyline {
  final int worldLevel;
  final Map<XpMaterial, int> materials;

  Leyline({
    required this.worldLevel,
    required this.materials,
  });
}

//Using lowest possible amount of materials that can be earned from leylines
List<Leyline> leylines = [
  Leyline(
    worldLevel: 0,
    materials: {xpMaterials[0]:7, xpMaterials[1]:3},
  ),
  Leyline(
    worldLevel: 1,
    materials: {xpMaterials[0]:10, xpMaterials[1]:5},
  ),
  Leyline(
    worldLevel: 2,
    materials: {xpMaterials[1]:10},
  ),
  Leyline(
    worldLevel: 3,
    materials: {xpMaterials[1]:13},
  ),
  Leyline(
    worldLevel: 4,
    materials: {xpMaterials[1]:6, xpMaterials[2]:2},
  ),
  Leyline(
    worldLevel: 5,
    materials: {xpMaterials[1]:6, xpMaterials[2]:3},
  ),
    Leyline(
    worldLevel: 6,
    materials: {xpMaterials[1]:6, xpMaterials[2]:4},
  ),
    Leyline(
    worldLevel: 7,
    materials: {xpMaterials[1]:6, xpMaterials[2]:4},
  ),
    Leyline(
    worldLevel: 8,
    materials: {xpMaterials[1]:6, xpMaterials[2]:4},
  ),
    Leyline(
    worldLevel: 9,
    materials: {xpMaterials[1]:6, xpMaterials[2]:4},
  ),
];