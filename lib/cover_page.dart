import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MaterialApp(
    home: CoverPageView(),
  ));
}

class CoverPageView extends StatefulWidget {
  const CoverPageView({super.key});

  @override
  State<CoverPageView> createState() => _CoverPageViewState();
}

class _CoverPageViewState extends State<CoverPageView> {
  int selectedIndex=0;
  var imageList = [
    'assets/images/pop.jpg',
    'assets/images/car.jpg',
    'assets/images/eminem.jpg',
    'assets/images/headphone.jpg',
    'assets/images/ariana.jpg',
    'assets/images/tiktok.jpg',
    'assets/images/starboy.jpg',
    'assets/images/cover1.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.black,
              elevation: 0,
              floating: true,
              pinned: true,
              title: Center(
                  child: Text(
                    "Playlists",
                    style: GoogleFonts.ubuntu(
                        color: const Color(0xFFff80aa),
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  )),
              bottom: AppBar(
                backgroundColor: Colors.black,
                elevation: 0,
                title: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                      color: const Color(0xff262626),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: const Color(0xff595959))),
                  child: const TextField(
                    style: TextStyle(color: Color(0xFFff80aa)),
                    cursorColor: Color(0xFFff80aa),
                    //textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20, top: 5),
                        border: InputBorder.none,
                        hintText: "Search...",
                        hintStyle: TextStyle(color: Color(0xFFff80aa)),
                        suffixIcon: Icon(
                          Icons.search_outlined,
                          color: Color(0xFFff80aa),
                        )),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
              sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 8,
                        (context, index) => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage(imageList[index]))),
                    ),
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 30)),
            )
          ],
        ),
      ),
      bottomNavigationBar: SlidingClippedNavBar.colorful(
        backgroundColor: Colors.black,
        onButtonPressed: (index) {
          setState(() {
            selectedIndex = index;
          });
          // controller.animateToPage(selectedIndex,
          //     duration: const Duration(milliseconds: 400),
          //     curve: Curves.easeOutQuad);
        },
        iconSize: 30,
        selectedIndex: selectedIndex,
        barItems: [
          BarItem(
            icon: Icons.home,
            title: 'Home',
            activeColor: Color(0xFFff80aa),
            inactiveColor: Colors.white,
          ),
          BarItem(
            icon: Icons.search_rounded,
            title: 'Search',
            activeColor: Color(0xFFff80aa),
            inactiveColor: Colors.white,
          ),
          BarItem(
            icon: Icons.playlist_play,
            title: 'Playlists',
            activeColor: Color(0xFFff80aa),
            inactiveColor: Colors.white,
          ),
          BarItem(
            icon:  FontAwesomeIcons.ellipsis,
            title: 'More',
            activeColor: Color(0xFFff80aa),
            inactiveColor: Colors.white,
          ),
          /// Add more BarItem if you want

        ],
      ),
    );
  }
}
