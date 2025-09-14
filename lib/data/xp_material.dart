class XpMaterial {
  final String name;
  final int amount;

  XpMaterial({required this.name, required this.amount});
}

final List<XpMaterial> xpMaterials = [
  XpMaterial(name: "Wanderer's Advice", amount: 1000),
  XpMaterial(name: "Adventurer's Experience", amount: 5000),
  XpMaterial(name: "Hero's Wit", amount: 20000),
];
