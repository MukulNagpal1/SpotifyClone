import 'package:flutter/material.dart';
import 'PlaylistPage.dart';
import 'HistoryPage.dart';
import 'home.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
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
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Playlistpage();
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

  List<String> SongNames = [
    "King Shit",
    "Off Roading",
    "Hass Hass",
    "Aukaat",
    "Check Kar",
    "Black Karde",
    "Ishq"
  ];

  List Ikons = [
    "assets/images/song1.jpg",
    "assets/images/song2.png",
    "assets/images/song3.jpg",
    "assets/images/song4.jpg",
    "assets/images/song5.jpg",
    "assets/images/song6.jpg",
    "assets/images/song7.jpg",
  ];

  List Singer = [
    "Shubh",
    "Khan Bhaini",
    "Diljit Dosanjh",
    "Jassie Gill",
    "Jashkaran Riarr",
    "Sardar Khehra",
    "Nirvain Pannu"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: EdgeInsets.only(top: 40.0),
          child: Row(
            children: [
              SizedBox(
                width: 160,
              ),
              Text(
                "Profile",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 120,
              ),
              Icon(Icons.dehaze_rounded)
            ],
          ),
        ),
        Stack(
          children: [
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(70),
                      bottomRight: Radius.circular(70))),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/images/profilePic.jpeg"),
                        fit: BoxFit.cover)),
              ),
            ),
            Positioned(
              left: 100,
              top: 110,
              child: Container(
                child: Column(
                  children: [
                    Text(
                      "Mukul Nagpal",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Text(
                      "mukulnagpal1993@gmail.com",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 220,
              left: 65,
              child: Container(
                child: Column(
                  children: [
                    Text("Followers"),
                    Text(
                      "129",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 220,
              left: 265,
              child: Container(
                child: Column(
                  children: [
                    Text(
                      "Followings",
                    ),
                    Text(
                      "12",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 18.0, left: 15.0, right: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.person_add_alt_1_rounded,
                    size: 30,
                  ),
                  Text("Find friend"),
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.share_sharp,
                    size: 30,
                  ),
                  Text("Share"),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
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
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Most Played",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
        ),
        Expanded(
            child: ListView.separated(
          itemCount: SongNames.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  Ikons[index],
                  fit: BoxFit.cover,
                  width: 50,
                  height: 80,
                ),
              ),
              title: Text(
                SongNames[index],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              subtitle: Text(Singer[index]),
              trailing: Icon(Icons.arrow_drop_down_outlined),
            );
          },
          separatorBuilder: (context, index) => Divider(
            thickness: 1,
            color: Colors.grey,
          ),
        ))
      ]),
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
