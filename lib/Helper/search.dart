import 'package:catalog/Products/airpods.dart';
import 'package:catalog/Products/apple_watches.dart';
import 'package:catalog/Products/iPad.dart';
import 'package:catalog/Products/iPhones.dart';
import 'package:catalog/Products/mac.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class SerachBarPage extends StatefulWidget {
  const SerachBarPage({Key? key}) : super(key: key);

  @override
  _SerachBarPageState createState() => _SerachBarPageState();
}

class _SerachBarPageState extends State<SerachBarPage> {
  final List<String> items = ["iphone", "ipad", "macbook", "Airpods", "watch"];
  final List<String> duplicateItems = [
    "iphone",
    "ipad",
    "macbook",
    "Airpods",
    "watch"
  ];
  late ScrollController controller;
  @override
  void initState() {
    items.addAll(duplicateItems);
    controller = ScrollController();
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = [];
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = [];
      dummySearchList.forEach((item) {
        // print("Item char : $item and query is $query");
        if (item.contains(query)) {
          // print("item $item conatins query $query");
          dummyListData.add(item);
          print(dummyListData);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 175,
              left: 68,
              child: Image.asset(
                'asset/images/search.png',
                height: 250,
              )),
          Positioned(
            top: 430,
            left: 50,
            child: Text(
              "Search what you are looking for...",
              style: TextStyle(fontSize: 20),
            ),
          ),
          FloatingSearchBar(
            scrollController: controller,
            isScrollControlled: true,
            hint: 'Search...',
            scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
            transitionDuration: const Duration(milliseconds: 800),
            transitionCurve: Curves.easeInOut,
            physics: const BouncingScrollPhysics(),
            axisAlignment: isPortrait ? 0.0 : -1.0,
            openAxisAlignment: 0.0,
            width: isPortrait ? 600 : 500,
            debounceDelay: const Duration(milliseconds: 500),
            onQueryChanged: (query) {
              filterSearchResults(query);
              // Call your model, bloc, controller here.
            },
            // Specify a custom transition to be used for
            // animating between opened and closed stated.
            transition: CircularFloatingSearchBarTransition(),
            // actions: [
            //   FloatingSearchBarAction(
            //     showIfOpened: false,
            //     child: CircularButton(
            //       icon: const Icon(Icons.place),
            //       onPressed: () {},
            //     ),
            //   ),
            //   FloatingSearchBarAction.searchToClear(
            //     showIfClosed: false,
            //   ),
            // ],
            builder: (context, transition) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Material(
                  // color: Colors.white,
                  elevation: 4.0,
                  child: Column(
                      children: List.generate(items.length, (index) {
                    return ListTile(
                      title: Text(
                        "${items[index]}",
                        // style: TextStyle(color: Colors.black),
                      ),
                      onTap: () {
                        print("object ${items[index]}");
                        if (items[index] == "iphone") {
                          Get.to(() => IPhones());
                        }
                        if (items[index] == "ipad") {
                          Get.to(() => Ipad());
                        }
                        if (items[index] == "macbook") {
                          Get.to(() => Mac());
                        }
                        if (items[index] == "Airpods") {
                          Get.to(() => Airpods());
                        }
                        if (items[index] == "watch") {
                          Get.to(() => Watches());
                        }
                      },
                    );

                    // ListView.builder(
                    //     shrinkWrap: true,
                    //     itemCount: items.length,
                    //     itemBuilder: (c, index) {
                    //       return ListTile(
                    //         title: Text(
                    //           "${items[index]}",
                    //           // style: TextStyle(color: Colors.black),
                    //         ),
                    //         onTap: () {
                    //           print("object ${items[index]}");
                    //         },
                    //       );
                    //     }),
                    // ],
                  })),
                  // child: Column(
                  //   // mainAxisSize: MainAxisSize.min,
                  //   children: Colors.accents.map((color) {
                  //     return Container(height: 112, color: color);
                  //   }).toList(),
                  // ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
