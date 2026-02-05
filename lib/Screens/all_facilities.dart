import 'package:flutter/material.dart';
import 'package:grand_hotel/constants/app_constants.dart';
import 'package:grand_hotel/models/property_model.dart';
import 'package:iconsax/iconsax.dart';

class AllFacilities extends StatefulWidget {
  final List<FacilityCategory> facilities;
  const AllFacilities({super.key, required this.facilities});

  @override
  State<AllFacilities> createState() => _AllFacilitiesState();
}

class _AllFacilitiesState extends State<AllFacilities> {
  int? expandedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color.fromARGB(95, 255, 255, 255),
                    ),
                    child: Icon(Iconsax.backward, size: 20),
                  ),
                ),
      
                Text(
                  "All Facilities",
                  style: TextStyle(fontFamily: 'Inter_Medium', fontSize: 18),
                ),
      
                Opacity(opacity: 0, child: Text("none")),
              ],
            ),
      
            SizedBox(height: 30),
      
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.facilities.length,
              separatorBuilder: (_, _) => SizedBox(height: 12),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7FAF8),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() { 
                            expandedIndex = expandedIndex == index ? null : index;
                          });
                        },
                        child: Row(
                          children: [
                            Icon(
                              Iconsax.category,
                              size: 20,
                              color: kSurfaceColor,
                            ),
                            const SizedBox(width: 12),
      
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.facilities[index].name,
                                    style: TextStyle(
                                      fontFamily: 'Inter_Medium',
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    '${widget.facilities[index].items.length} facilities',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: thirdTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
      
                            Icon(
                              expandedIndex == index ? Icons.remove : Icons.add,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
      
                      if (expandedIndex == index) ...[
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.facilities[index].items.map((item) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4,
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.circle, size: 6, color: thirdTextColor,),
                                  const SizedBox(width: 8),
                                  Text(
                                    item,
                                    style: TextStyle(
                                      fontFamily: 'Inter_Medium',
                                      fontSize: 13,
                                      color: thirdTextColor
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
