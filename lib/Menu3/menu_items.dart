import 'package:hicks/Menu2/menu_items.dart';

class subList {
  final String title;
  List<subList>? subcontents = [];
  List<String>? contents = [];

  subList(this.title, this.subcontents, this.contents);
}

List<subList> items = [
  subList("Kitchen", null, [
    "Dish Washer",
    "Glass",
    "Spoons",
    "Broom Stick",
    "Knife",
    "Coffee Mugs"
  ]),
  subList("Living Room", [
    subList("Furniture", null, ["Sofa", "Table"]),
    subList("Electronics", null, ["Fan", "Refrigerator", "TV"])
  ], [
    "Clock"
  ]),
  subList(
      "Clothing",
      [
        subList("Men", null, [
          "Cap",
          "Jackts",
          "Shirts",
          "Jeans",
          "Shoes",
          "T-shirts",
        ]),
        subList("Women", null, [
          "Tops",
          "Jeans",
          "Leggins",
          "Sarees",
          "T-shirts",
          "Sandals",
          "Skirts"
        ])
      ],
      null),
  subList(
      "Food",
      [
        subList("Fruits", null, ["Apples", "Mangoes", "Grapes"]),
        subList("Vegetables", null, ["Tomatoes", "Onions", "Capsicum"]),
        subList("Chocolates", null, ["Dairy Milk", "Munch", "Perk", "5-Star"])
      ],
      null)
];
