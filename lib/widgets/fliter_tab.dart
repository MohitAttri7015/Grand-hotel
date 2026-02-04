import 'package:flutter/material.dart';
import 'package:grand_hotel/constants/app_constants.dart';

class FilterTab extends StatefulWidget {
  final List<String> tabs;
  final int initialIndex;
  final ValueChanged<int>? onTabChanged;
  const FilterTab({
    super.key,
    required this.tabs,
    required this.initialIndex,
    this.onTabChanged,
  });

  @override
  State<FilterTab> createState() => _FilterTabState();
}

class _FilterTabState extends State<FilterTab> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex; 
  }

  @override
  void didUpdateWidget(covariant FilterTab oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialIndex != widget.initialIndex) {
      selectedIndex = widget.initialIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.tabs.length,
        itemBuilder: (context, index) {
          final isActive = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onTabChanged?.call(index);
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
              child: Center(
                child: Text(
                  widget.tabs[index],
                  style: TextStyle(
                    fontFamily: 'Inter_Medium',
                    fontSize: 13,
                    color: isActive ? Colors.white : Colors.grey.shade700,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
