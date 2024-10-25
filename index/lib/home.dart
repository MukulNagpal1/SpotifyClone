import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:index/album.dart';
import 'package:index/gems.dart';
import 'package:index/library.dart';
import 'package:index/podcast.dart';
import 'package:index/PlaylistPage.dart';
import 'HistoryPage.dart';
import 'ProfilePage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
// this is test
    void _onItemTapped(int index) {
      setState(() {
        _currentIndex = index;
      });

      // Navigate to the respective pages based on the index
      switch (_currentIndex) {
        case 0:
          // Home Page, stay on the current screen.
          break;
        case 1:
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Playlistpage(); // Replace with your Playlist page
          }));
          break;
        case 2:
          // No action for the logo.
          break;
        case 3:
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Historypage(); // Replace with your History page
          }));
          break;
        case 4:
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Profilepage(); // Replace with your Profile page
          }));
          break;
      }
    }

    List<String> SingerNames = [
      "Diljit Dosanjh",
      "Sidhu MooseWala",
      "Karan Aujla",
      "Prem Dhillon",
      "AP Dhillon",
      "Arjit Singh",
      "Armaan Malik"
    ];

    List Ikons = [
      "assets/images/singer1.jpg",
      "assets/images/singer2.jpg",
      "assets/images/singer3.jpg",
      "assets/images/singer4.jpg",
      "assets/images/singer5.jpg",
      "assets/images/singer6.jpg",
      "assets/images/singer7.jpg",
    ];

    List MonthlyListeners = [
      "31420 monthly listners",
      "458412 monthly listners",
      "874125 monthly listners",
      "784152 monthly listners",
      "458412 monthly listners",
      "874125 monthly listners",
      "784152 monthly listners"
    ];
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.search,
              size: 30,
            ),
            Image.asset(
              "assets/images/spotifyLogo.png",
              height: 80,
              width: 150,
            ),
            Icon(
              Icons.settings,
              size: 30,
            )
          ],
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            Stack(children: [
              Container(
                height: 120,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient:
                        LinearGradient(colors: [Colors.orange, Colors.yellow])),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  child: Image.asset("assets/images/singerBanner1.jpg"),
                  height: 125,
                  width: 130,
                ),
              ),
              Positioned(
                left: 20,
                top: 5,
                child: Container(
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Popular",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        "Diljit Dosanjh",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Singer",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              )
            ]),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Today's hits",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Artists();
                      }));
                    },
                    child: Text(
                      "Artists",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: 35),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Album();
                      }));
                    },
                    child: Text(
                      "Album",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 35,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Podcast();
                      }));
                    },
                    child: Text(
                      "Podcast",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 35,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Gems();
                      }));
                    },
                    child: Text(
                      "Gems",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: 35)
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 5,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.grey.shade600, Colors.black])),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: SingerNames.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: ClipOval(
                      child: Image.asset(
                        Ikons[index],
                        fit: BoxFit.cover,
                        width: 50,
                        height: 80,
                      ),
                    ),
                    title: Text(
                      SingerNames[index],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    subtitle: Text(MonthlyListeners[index]),
                    trailing: Icon(Icons.chevron_right_rounded),
                  );

                  //return Text(
                  //Names[index],
                  //style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  //);
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 30,
                  );
                },
              ),
            ),
          ])),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
              size: 25,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.playlist_add_outlined,
              color: Colors.white,
              size: 30,
            ),
            label: 'Playlist',
          ),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/spotifyLogo.png",
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.history_outlined,
                color: Colors.white,
                size: 30,
              ),
              label: "History"),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.white,
              size: 30,
            ),
            label: 'Profile',
          ),
        ],
        // Current selected index
        unselectedItemColor: Colors.white,

        backgroundColor: Colors.grey.shade800, // Color of the selected item
        // Called when an item is tapped
      ),
    );
  }
}

Widget buildGridItem(BuildContext context, String imagePath, String songList,
    String singerList) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        height: 140,
        width: 140,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            image: DecorationImage(
                image: AssetImage(
                  imagePath,
                ),
                fit: BoxFit.cover)),
      ),
      SizedBox(height: 8),
      Container(
        child: Text(
          songList,
          style: TextStyle(fontSize: 18),
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        singerList,
        style: TextStyle(fontSize: 14),
      )
    ],
  );
}

List<String> imageList = [
  "assets/images/card1.jpg",
  "assets/images/card2.jpg",
  "assets/images/card3.jpg",
  "assets/images/card4.jpg",
  "assets/images/card5.jpg",
  "assets/images/card6.jpg",
  "assets/images/card7.jpg",
  "assets/images/card8.jpg",
  "assets/images/card9.jpg",
  "assets/images/card10.jpg",
  "assets/images/card11.jpg",
  "assets/images/card12.jpg",
];
List<String> songList = [
  "Bad Boy",
  "Look",
  "Daddy Issues",
  "Psycho",
  "Blinding Lights",
  "Be Alright",
  "Praise the Lord",
  "DALLA DALLA",
  "LEMON",
  "Hello, Anxiety",
  "Dynamite",
  "Psycho",
];
List<String> singerList = [
  "Red Velvet",
  "Red Velvet",
  "The Neighbourhood",
  "Red Velvet",
  "The Weekend",
  "Dean Lewis",
  "A&AP Rocky,Skepta",
  "ITZY",
  "ADDY",
  "Phum Viphurit",
  "Anne-Marie",
  "Red Velvet"
];

List<String> rowText = ["Artists", "Album", "Podcasts", "Gems"];
