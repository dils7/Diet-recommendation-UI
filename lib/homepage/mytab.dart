//home page
import 'dart:convert';

import 'package:ai_app/home_page.dart';
import 'package:ai_app/homepage/aboutpage.dart';
import 'package:ai_app/saina.dart';
import 'package:flutter/material.dart';
import 'package:ai_app/home_page.dart';
import 'package:ai_app/user_page.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({Key? key}) : super(key: key);

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  int selectedIndex = 0;

  final widgetOptions = [
    Home(),
    Start(),
    About()
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final widgetTitle = {"home", "start", "about"};


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        fixedColor: Colors.blue[200],
        unselectedItemColor: Colors.blue[200],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.house,
              ),
              label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.start), label: 'Start'),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_rounded), label: 'About')
          // BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
          // BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Log')
        ],
      ),
    );
  }
}

class NepaliFood {
  final String name;
  final String servingSize;
  final String carbohydrates;
  final String protein;

  NepaliFood({required this.name, required this.servingSize, required this.carbohydrates, required this.protein});

  factory NepaliFood.fromJson(Map<String, dynamic> json) {
    return NepaliFood(
      name: json['name'],
      servingSize: json['serving_size'],
      carbohydrates: json['nutrients']['carbohydrates'],
      protein: json['nutrients']['protein'],
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String foodJson = '''
{
  "NepaliFoods": [
    {"name": "Dal Bhat", "serving_size": "200g", "nutrients": {"carbohydrates": "45g", "protein": "10g"}},
    {"name": "Momos", "serving_size": "200g", "nutrients": {"carbohydrates": "35g", "protein": "15g"}},
    {"name": "Sel Roti", "serving_size": "200g", "nutrients": {"carbohydrates": "60g", "protein": "5g"}},
    {"name": "Gundruk", "serving_size": "200g", "nutrients": {"carbohydrates": "10g", "protein": "8g"}},
    {"name": "Yomari", "serving_size": "200g", "nutrients": {"carbohydrates": "50g", "protein": "4g"}},
    {"name": "Corn", "serving_size": "200g", "nutrients": {"carbohydrates": "41g", "protein": "5g"}},
    {"name": "Pumpkin", "serving_size": "200g", "nutrients": {"carbohydrates": "12g", "protein": "1g"}},
    {"name": "Lady's Finger (Okra)", "serving_size": "200g", "nutrients": {"carbohydrates": "14g", "protein": "3g"}},
    {"name": "Eggplant (Bhanta)", "serving_size": "200g", "nutrients": {"carbohydrates": "9g", "protein": "1g"}},
    {"name": "Apple", "serving_size": "200g", "nutrients": {"carbohydrates": "24g", "protein": "0.5g"}},
    {"name": "Orange", "serving_size": "200g", "nutrients": {"carbohydrates": "21g", "protein": "1.6g"}},
    {"name": "Strawberry", "serving_size": "200g", "nutrients": {"carbohydrates": "15g", "protein": "1.4g"}},
    {"name": "Banana", "serving_size": "200g", "nutrients": {"carbohydrates": "46g", "protein": "2.6g"}},
    {"name": "Papaya", "serving_size": "200g", "nutrients": {"carbohydrates": "22g", "protein": "1.8g"}},
    {"name": "Watermelon", "serving_size": "200g", "nutrients": {"carbohydrates": "15g", "protein": "1.1g"}},
    {"name": "Paneer", "serving_size": "200g", "nutrients": {"carbohydrates": "5g", "protein": "28g"}},
    {"name": "Milk", "serving_size": "200g", "nutrients": {"carbohydrates": "10g", "protein": "6.8g"}},
    {"name": "Mohi", "serving_size": "200g", "nutrients": {"carbohydrates": "8g", "protein": "4g"}},
    {"name": "Curd", "serving_size": "200g", "nutrients": {"carbohydrates": "7g", "protein": "11g"}},
    {"name": "Honey", "serving_size": "200g", "nutrients": {"carbohydrates": "140g", "protein": "0.6g"}},
    {"name": "Chicken", "serving_size": "200g", "nutrients": {"carbohydrates": "0g", "protein": "50g"}},
    {"name": "Buff", "serving_size": "200g", "nutrients": {"carbohydrates": "0g", "protein": "52g"}},
    {"name": "Pork", "serving_size": "200g", "nutrients": {"carbohydrates": "0g", "protein": "48g"}},
    {"name": "Kodo", "serving_size": "200g", "nutrients": {"carbohydrates": "72g", "protein": "8.2g"}},
    {"name": "Flaxseeds", "serving_size": "200g", "nutrients": {"carbohydrates": "29g", "protein": "32g"}},
    {"name": "Dhendo", "serving_size": "200g", "nutrients": {"carbohydrates": "76g", "protein": "2g"}}
  ]
}
''';

  @override
  Widget build(BuildContext context) {
    List<dynamic> jsonList = jsonDecode(foodJson)['NepaliFoods'];
    List<NepaliFood> foods = jsonList.map((json) => NepaliFood.fromJson(json)).toList();

    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.only(left: 40, right: 40, bottom: 0, top: 5),
          child: Column(
            children: [
              /// -- IMAGE
              Stack(
                alignment: Alignment.center, // Align the children of the Stack to the center
                children: [
                  SizedBox(
                    height: 200, // Adjust the height of SizedBox as needed
                    child: InkWell(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: Image.asset('assets/image/pyramid.png'),
                      ),
                    ),
                  ),
                ],
              ),
              // const SizedBox(height: 2),
              const Text(
                'FOOD PYRAMID',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 22,
                  color: Color(0xFF537CAA),
                ),
                textAlign: TextAlign.center, // Align the text to the center
              ),
              const SizedBox(height: 2),
              // List of Nepali foods
              Expanded(
                child: ListView.builder(
                  itemCount: foods.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(foods[index].name),
                      subtitle: Text('Carbs: ${foods[index].carbohydrates}, Protein: ${foods[index].protein}'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  State<Start> createState() => _Start();
}

class _Start extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/startbg.png'), // Replace with your image asset
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text('Start',
                //   style: TextStyle(fontSize: 15.0),
                // ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UserPage()));
                    print('Button pressed!');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreen),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0)), // Adjust padding here
                  ),
                  child: Text(
                    'Get Diet Recommendation',
                    style: TextStyle(color: Colors.white, fontSize: 18.0), // Increase font size if needed
                  ),
                ),
                SizedBox(height: 16.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//
// class _Start extends State<Start> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Text('Start',
//             //   style: TextStyle(fontSize: 15.0),
//             // ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => UserPage()));
//                 print('Button pressed!');
//               },
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF537CAA)),
//                 padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 22.0, horizontal: 24.0)),
//               ),
//               child: Text('Get Diet Recommendation', style: TextStyle(color:
//               Colors.white),),
//             ),
//             SizedBox(height: 16.0),
//           ],
//         ),
//       ),
//     );
//   }
// }

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.only(left: 40, right: 40, bottom: 0, top: 5),
          child: Column(
            children: [
              /// -- IMAGE
              Stack(
                alignment: Alignment.center, // Align the children of the Stack to the center
                children: [
                  SizedBox(
                    height: 200, // Adjust the height of SizedBox as needed
                    child: InkWell(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: Image.asset('assets/image/PoshanSathi.png'),
                      ),
                    ),
                  ),
                ],
              ),
              // const SizedBox(height: 2),
              const Text(
                'Empowering Nepal through Nutrition',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 22,
                  color: Color(0xFF537CAA),
                ),
                textAlign: TextAlign.center, // Align the text to the center
              ),
              const SizedBox(height: 2),
              const Text(
                'PoshanSathi is a mobile app designed to offer personalized wellness journeys rooted in compassion and understanding, using AI to craft weekly meal plans tailored to individual needs. With a focus on cultural relevance and inclusivity, PoshanSathi provides accessible and relatable nutritional guidance for diverse Nepalese communities. Powered by Flutter, Machine Learning, and hosted on Google Cloud Platform, PoshanSathi is a sustainable solution for a healthier Nepal',
                style: TextStyle(fontSize: 17),
              ),
              const SizedBox(height: 10),
              const Text('Created by Saina, Bipaswi, and Dilasha.',
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18, color: Colors.grey),

              )
            ],
          ),
        ),
      ),
    );
  }
}


