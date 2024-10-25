import 'package:flutter/material.dart';
import 'package:index/home.dart';
import 'HistoryPage.dart';
import 'ProfilePage.dart';
import 'home.dart';

class Playlistpage extends StatefulWidget {
  const Playlistpage({super.key});

  @override
  State<Playlistpage> createState() => _PlaylistpageState();
}

class _PlaylistpageState extends State<Playlistpage> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Navigate to the respective pages based on the index
    switch (_currentIndex) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Home();
        }));
        break;
      case 1:
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 85),
            Text(
              "Playlist",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 110),
            Icon(Icons.add),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.grey.shade600, Colors.black],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: Boxes.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 10.0, // Space between columns
                mainAxisSpacing: 8.0, // Space between rows
                childAspectRatio: 0.8, // Adjust the aspect ratio as needed
              ),
              //scrollDirection: Axis.vertical,
              // itemCount: Boxes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: PlayListGrids(
                    context,
                    Boxes[index],
                    PlayListName[index],
                    NumberOfSongs[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
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
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history_outlined,
              color: Colors.white,
              size: 30,
            ),
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.white,
              size: 30,
            ),
            label: 'Profile',
          ),
        ],
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.grey.shade800,
      ),
    );
  }

  Widget PlayListGrids(BuildContext context, String box, String playListName,
      String numberOfSongs) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0, top: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(image: AssetImage(box), fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 15),
          Text(playListName),
          SizedBox(height: 7),
          Text(numberOfSongs),
        ],
      ),
    );
  }

  List<String> Boxes = [
    "assets/images/card12.jpg",
    "assets/images/card10.jpg",
    "assets/images/card8.jpg",
    "assets/images/card6.jpg",
    "assets/images/card4.jpg",
    "assets/images/card2.jpg",
    "assets/images/card11.jpg",
    "assets/images/card9.jpg",
    "assets/images/card7.jpg",
    "assets/images/card5.jpg",
    "assets/images/card3.jpg",
    "assets/images/card1.jpg",
  ];

  List<String> PlayListName = [
    "Liked Songs",
    "Happiness",
    "Sadness",
    "Party",
    "Gym",
    "Car Songs",
    "Pumping Music",
    "Daily Music",
    "Party",
    "Dance",
    "Chill Songs",
    "Punjabi songs"
  ];

  List<String> NumberOfSongs = [
    "128 songs",
    "51 songs",
    "5 songs",
    "30 songs",
    "8 songs",
    "18 songs",
    "88 songs",
    "12 songs",
    "7 songs",
    "47 songs",
    "33 songs",
    "17 songs",
  ];
}
