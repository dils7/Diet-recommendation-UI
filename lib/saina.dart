import 'package:flutter/material.dart';

class Need extends StatefulWidget {
  @override
  State<Need> createState() => _NeedState();
}

class _NeedState extends State<Need> {
  TextEditingController carbsController = TextEditingController();
  TextEditingController vegetablesController = TextEditingController();
  TextEditingController fruitsController = TextEditingController();
  TextEditingController proteinController = TextEditingController();
  TextEditingController dairyController = TextEditingController();
  TextEditingController fatsController = TextEditingController();
  TextEditingController sugarController = TextEditingController();
  TextEditingController sodiumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[200],
        automaticallyImplyLeading: false,
        title: const Text(
          "Posan Sathi",
          style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildNutrientRow('Carbs', 'grams/day', 'Rice, Potato, Pasta', carbsController),
          _buildNutrientRow('Vegetables', 'grams/day', 'Spinach, Broccoli, Carrots', vegetablesController),
          _buildNutrientRow('Fruits', 'grams/day', 'Apple, Banana, Orange', fruitsController),
          _buildNutrientRow('Protein', 'grams/day', 'Chicken, Fish, Lentils', proteinController),
          _buildNutrientRow('Dairy', 'litre/day', 'Milk, Yogurt, Cheese', dairyController),
          _buildNutrientRow('Fats', 'grams/day', 'Avocado, Olive Oil, Nuts', fatsController),
          _buildNutrientRow('Sugar', 'grams/day', 'Honey, Maple Syrup, Dates', sugarController),
          _buildNutrientRow('Sodium', 'grams/day', 'Salted Nuts, Canned Soups, Processed Meats', sodiumController),
        ],
      ),
    );
  }

  Widget _buildNutrientRow(
      String nutrient, String quantity, String relatedFoods, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nutrient,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          'Recommended intake: $quantity',
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 5),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Enter quantity',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 5),
        Text(
          'Related foods: $relatedFoods',
          style: TextStyle(color: Colors.grey),
        ),
        Divider(),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Need(),
  ));
}


// import 'package:flutter/material.dart';
//
// class Need extends StatefulWidget {
// // final UserData userData;
//
// // const Need({Key? key, required this.userData}) : super(key: key);
//
// @override
// State<Need> createState() => _NeedState();
// }
//
// class _NeedState extends State<Need> {
//   TextEditingController carbsController = TextEditingController();
//   TextEditingController vegetablesController = TextEditingController();
//   TextEditingController fruitsController = TextEditingController();
//   TextEditingController proteinController = TextEditingController();
//   TextEditingController dairyController = TextEditingController();
//   TextEditingController fatsController = TextEditingController();
//   TextEditingController sugarController = TextEditingController();
//   TextEditingController sodiumController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.blue[200],
//         automaticallyImplyLeading: false,
//         title: const Text(
//           "Posan Sathi",
//           style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
//           textAlign: TextAlign.center,
//         ),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16),
//         children: [
//           _buildNutrientRow('Carbs',  'grams/day', carbsController),
//           _buildNutrientRow('Vegetables', 'grams/day', vegetablesController),
//           _buildNutrientRow('Fruits', 'grams/day', fruitsController),
//           _buildNutrientRow('Protein', 'grams/day', proteinController),
//           _buildNutrientRow('Dairy', 'litre/day', dairyController),
//           _buildNutrientRow('Fats', 'grams/day', fatsController),
//           _buildNutrientRow('Sugar', 'grams/day', sugarController),
//           _buildNutrientRow('Sodium', 'grams/day', sodiumController),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildNutrientRow(
//       String nutrient, String quantity, TextEditingController controller) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           nutrient,
//           style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(
//           width: 200,
//         child: Padding(padding: EdgeInsets.all(10),// Adjust width as needed
//           child: TextField(
//             controller: controller,
//             keyboardType: TextInputType.number,
//             textAlign: TextAlign.center,
//             decoration: InputDecoration(
//               hintText: quantity,
//               border: const OutlineInputBorder(),
//             ),
//           ),
//         ),
//         ),
//       ],
//     );
//   }
// }
// void main() {
//   runApp(MaterialApp(
//     home: Need(),
//   ));
// }




