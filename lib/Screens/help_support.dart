import 'package:flutter/material.dart';
import 'package:grand_hotel/constants/app_constants.dart';
import 'package:iconsax/iconsax.dart';

class HelpSupport extends StatefulWidget {
  const HelpSupport({super.key});

  @override
  State<HelpSupport> createState() => _HelpSupportState();
}

class _HelpSupportState extends State<HelpSupport> {
  int openedIndex = -1;

  final List<Map<String, String>> faqList = [
    {
      "title": "Lorem ipsum dolor sit amet",
      "content":
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.",
    },
    {
      "title": "Lorem ipsum dolor sit amet",
      "content":
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.",
    },
    {
      "title": "Lorem ipsum dolor sit amet",
      "content":
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.",
    },
    {
      "title": "Lorem ipsum dolor sit amet",
      "content":
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
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
                  "Help & Support",
                  style: TextStyle(fontFamily: 'Inter_Medium', fontSize: 18),
                ),
      
                Opacity(opacity: 0, child: Text("none")),
              ],
            ),
      
            SizedBox(height: 30),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                itemCount: faqList.length,
                separatorBuilder: (context, index) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final isOpen = openedIndex == index;
              
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            openedIndex = isOpen ? -1 : index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  faqList[index]['title']!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Inter_Medium',
                                    color: isOpen ? kSurfaceColor : Colors.black,
                                  ),
                                ),
                              ),
                              Icon(
                                isOpen ? Iconsax.arrow_up_2 : Iconsax.arrow_down_1,
                                size: 18,
                                color: isOpen ? kSurfaceColor : Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
              
                      if (isOpen)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16, right: 20),
                          child: Text(
                            faqList[index]['content']!,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                              height: 1.5,
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
