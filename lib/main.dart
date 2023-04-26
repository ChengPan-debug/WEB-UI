import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/utils/responsive_layout.dart';
import 'package:flutter_web/widgets/navbar.dart';
import 'package:flutter_web/widgets/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient:
            LinearGradient(colors: [Color(0xFFF8FBFF), Color(0xFFFCFDFD)]),
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              NavBar(),
              const Body(),
            ],
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      largeScreen: LargeChild(),
      // mediumScreen: mediumScreen,
      smallScreen: smallScreen(),
    );
  }
}

class LargeChild extends StatelessWidget {
  const LargeChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Stack(
        fit: StackFit.expand,
        children: [
          FractionallySizedBox(
            alignment: Alignment.centerRight,
            widthFactor: .6,
            child: kIsWeb
                ? Image.network("assets/image_01.png", scale: .85)
                : Image.asset("assets/image_01.png", scale: .85),
          ),
          FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: .6,
              child: Padding(
                padding: EdgeInsets.only(left: 48),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Hello!',
                      style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF8591B0)),
                    ),
                    RichText(
                      text: const TextSpan(
                          text: 'WellCome To ',
                          style: TextStyle(
                            fontSize: 60,
                            color: Color(0xFF8591B0),
                          ),
                          children: [
                            TextSpan(
                              text: 'Audio Broadcast',
                              style: TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ]),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 12.0, top: 20.0),
                      child: Text("LET'S EXPLORE THE WORLD"),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Search(),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class smallScreen extends StatelessWidget {
  const smallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hello!',
              style: TextStyle(
                  fontSize: kIsWeb ? 60 : 40,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8591B0)),
            ),
            RichText(
              text: const TextSpan(
                  text: 'WellCome To ',
                  style: TextStyle(
                    fontSize: kIsWeb ? 60 : 40,
                    color: Color(0xFF8591B0),
                  ),
                  children: [
                    TextSpan(
                      text: 'Audio Broadcast',
                      style: TextStyle(
                        fontSize: kIsWeb ? 60 : 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ]),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12.0, top: 20.0),
              child: Text("LET'S EXPLORE THE WORLD"),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: kIsWeb
                  ? Image.network("assets/image_01.png", scale: 1)
                  : Image.asset("assets/image_01.png", scale: 1),
            ),
            const SizedBox(
              height: 32,
            ),
            const Search(),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget card({
    required String imageLabel,
  }) {
    return Flexible(
      child: SizedBox(
        width: 500.0,
        height: 700.0,
        child: Card(
          color: const Color(0xFF3D2942),
          elevation: 5.0,
          shadowColor: Colors.white.withOpacity(0.5),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                // Image.asset(imageLabel, width: 430, height: 400.0),
                SizedBox(
                  width: 430,
                  child: Row(
                    children: [
                      // CircleAvatar(
                      //   child: Image.asset(
                      //       'assets/live_auctions/circular_avatar.png'),
                      //   radius: 35.0,
                      //   foregroundColor: null,
                      // ),
                      const SizedBox(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Virtual Art'),
                          Text('By @wizard'),
                        ],
                      ),
                      const Spacer(),
                      const Icon(Icons.headset,
                          size: 28.0, color: Color(0xFF76607A)),
                      Text('92')
                    ],
                  ),
                ),
                SizedBox(
                  width: 410.0,
                  height: 100.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Current Bid'),
                      const Spacer(),
                      Text('4.48 ETH'),
                    ],
                  ),
                ),
                const Spacer(),
                OutlinedButton(
                    onPressed: () {},
                    child: Text('Place a Bid'),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(const Color(0xFFE9D7A7)),
                        side: MaterialStateProperty.all(const BorderSide(
                            color: Color(0xFFFFCE4E),
                            style: BorderStyle.solid)),
                        fixedSize:
                            MaterialStateProperty.all(const Size(430, 64.0)))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
