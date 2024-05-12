import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
        body: SingleChildScrollView(
        child: Container(
        padding: const EdgeInsets.all(50),
    child: Column(
    children: [

    /// -- IMAGE
    Stack(
    children: [
    SizedBox(
    width: 120,
    height: 120,
    child: InkWell (
    // onTap: () {
    // Navigator.push(context, MaterialPageRoute(builder: (context) => const UpdateProfileScreen()));
    // },
    child: ClipRRect(
    borderRadius: BorderRadius.circular(100), child: Image.asset('assets/image/logo.png')),
    ),
    ),
    // Positioned(
    //   bottom: 0,
    //   right: 0,
    //   child: Container(
    //     width: 35,
    //     height: 35,
    //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: tPrimaryColor),
    //     child: IconButton(
    //       onPressed: () {
    //         Navigator.push(
    //             context, MaterialPageRoute(
    //             builder: (context) => const UpdateProfileScreen())
    //         );
    //       },icon: const Icon(
    //       LineAwesomeIcons.alternate_pencil,
    //       color: Colors.black,
    //       size: 20,
    //     ),
    //   ),
    //   ),
    // ),
    ],

    ),
    const SizedBox(height: 10),
    Text('Posan Sathi', style: Theme.of(context).textTheme.headline4?.copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
    // Center(
    //   child: Text(
    //     tProfileSubHeading,
    //     style: Theme.of(context).textTheme.headline6?.copyWith(
    //         fontStyle: FontStyle.italic,
    //         color: Colors.grey
    //     ),
    //   ),
    // )
    const SizedBox(height: 20),

    ],
    ),
        ),
        ),
    );
  }
}