import 'package:flutter/material.dart';
import 'package:grand_hotel/Screens/home_screen.dart';
import 'package:grand_hotel/Screens/search_screen.dart';
import 'package:grand_hotel/constants/app_constants.dart';
import 'package:grand_hotel/services/auth_service.dart';
import 'package:iconsax/iconsax.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final pages = const [
    HomeScreen(),
    // SearchPage(),
    // SearchScreen(),
    // ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final user = authServices.value.currentUser;
    return Scaffold(
      appBar: _currentIndex == 0
          ? PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: SafeArea(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.transparent,
                            backgroundImage: user?.photoURL != null
                                ? NetworkImage(user!.photoURL!)
                                : AssetImage('assets/user-profile.png'),
                          ),

                          SizedBox(width: 3),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user?.displayName ?? 'Username',
                                style: TextStyle(
                                  fontFamily: 'Inter_Medium',
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(height: 3),
                              Row(
                                children: [
                                  Icon(
                                    Iconsax.location,
                                    size: 15,
                                    color: thirdTextColor,
                                  ),
                                  SizedBox(width: 2),
                                  Text(
                                    "San Diego, CA",
                                    style: TextStyle(color: thirdTextColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Container(
                            width: 35, // circle size
                            height: 35,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: thirdTextColor,
                                width: 1,
                              ),
                            ),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: Icon(Iconsax.search_favorite_1, size: 18),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SearchScreen(),
                                  ),
                                );
                              },
                            ),
                          ),

                          SizedBox(width: 10),

                          Container(
                            width: 35, // circle size
                            height: 35,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: thirdTextColor,
                                width: 1,
                              ),
                            ),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: Icon(Iconsax.notification, size: 18),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          : null,

      body: IndexedStack(index: _currentIndex, children: pages),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kSurfaceColor,
        unselectedItemColor: thirdTextColor,
        selectedLabelStyle: const TextStyle(
          fontFamily: 'Inter_Medium',
          color: kSurfaceColor,
          fontSize: 12,
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'Inter_Medium',
          color: thirdTextColor,
          fontSize: 12,
        ),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Iconsax.home_1), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.book),
            label: "My Booking",
          ),
          BottomNavigationBarItem(icon: Icon(Iconsax.search_favorite), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Iconsax.user), label: "Profile"),
        ],
      ),
    );
  }
}
