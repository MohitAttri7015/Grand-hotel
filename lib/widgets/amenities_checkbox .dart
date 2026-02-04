// ignore: file_names
import 'package:flutter/material.dart';

class AmenitiesCheckbox extends StatefulWidget {
  final Function(List<String>) onChanged;
  const AmenitiesCheckbox({super.key, required this.onChanged});

  @override
  State<AmenitiesCheckbox> createState() => _AmenitiesCheckboxState();
}

class _AmenitiesCheckboxState extends State<AmenitiesCheckbox> {
  final Map<String, bool> amenities = {
    'Free Wifi': false,
    'Swimming Pool': false,
    'Laundry': false,
    'TV': false,
  };

  void _updateSelection() {
    final selected = amenities.entries
        .where((e) => e.value)
        .map((e) => e.key)
        .toList();

    widget.onChanged(selected); 
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: amenities.keys.map((title) {
        return CheckboxListTile(
          value: amenities[title],
          onChanged: (value) {
            setState(() {
              amenities[title] = value!;
            });
             _updateSelection();
          },

          // UI styling
          title: Text(
            title,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
          controlAffinity: ListTileControlAffinity.trailing, // checkbox right
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          activeColor: Colors.black,
        );
      }).toList(),
    );
  }
}
