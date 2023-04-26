import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/page/home_page.dart';
import 'package:flutter_web/utils/responsive_layout.dart';

class NavBar extends StatelessWidget {
  NavBar({Key? key}) : super(key: key);
  final navLinks = ['Home', 'Products', 'Features', 'Contact'];

  List<Widget> navItem() {
    return navLinks.map((text) {
      return Padding(
        padding: const EdgeInsets.only(left: 18),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 38),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFC86DD7),
                    Color(0xFF3023AE),
                  ],
                  begin: Alignment.bottomRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: const Center(
                child: Text(
                  'A',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            const Text(
              'Audio Broadcast',
              style: TextStyle(fontSize: !kIsWeb ? 20 : 26),
            ),
          ]),
          if (!ResponsiveLayout.isSmallScreen(context))
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [...navItem()]..add(InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const NFTPage()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFC86DD7),
                            Color(0xFF3023AE),
                          ],
                          begin: Alignment.bottomRight,
                          end: Alignment.bottomLeft,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF6078EA).withOpacity(.3),
                            offset: const Offset(0, 8),
                            blurRadius: 8,
                          )
                        ]),
                    child: const Material(
                      color: Colors.transparent,
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                )),
            )
          else
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const NFTPage()));
              },
              child: kIsWeb
                  ? Image.network('assets/menu.png', width: 26, height: 26)
                  : Image.asset('assets/menu.png', width: 26, height: 26),
            ),
        ],
      ),
    );
  }
}
