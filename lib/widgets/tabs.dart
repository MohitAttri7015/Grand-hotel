import 'package:flutter/material.dart';
import 'package:grand_hotel/constants/app_constants.dart';

class Tabs extends StatefulWidget {
  final Function(int) onTabChanged;
  const Tabs({super.key, required this.onTabChanged});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> tabs = [
    {'title': 'All', 'icon': null},
    {'title': 'Villas', 'icon': 'assets/Villas.png'},
    {'title': 'Hotels', 'icon': 'assets/Hotels.png'},
    {'title': 'Apartments', 'icon': 'assets/Apartments.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        itemBuilder: (context, index) {
          final isActive = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onTabChanged(index);
            },
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: isActive ? kSurfaceColor : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isActive ? Colors.transparent : thirdTextColor,
                ),
              ),
              child: Row(
                children: [
                  if (tabs[index]['icon'] != null)
                    Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: isActive
                            // ignore: deprecated_member_use
                            ? Colors.white.withOpacity(0.2)
                            : Colors.grey.shade100,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        tabs[index]['icon'],
                        width: 20,
                        height: 20,
                      ),
                    ),
                  Text(
                    tabs[index]['title'],
                    style: TextStyle(
                      fontFamily: 'Inter_Medium',
                      fontSize: 14,
                      color: isActive ? Colors.white : Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
