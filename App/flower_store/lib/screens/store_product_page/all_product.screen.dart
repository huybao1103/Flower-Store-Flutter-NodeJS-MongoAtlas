
import 'package:flower_store/models/menu.model.dart';
import 'package:flower_store/shared/components/custom_drawer.dart';
import 'package:flower_store/shared/components/main_page_header.dart';
import 'package:flutter/material.dart';
import 'package:flower_store/assets/custom_icon.dart';
class AllProductScreen extends StatefulWidget {
  const AllProductScreen({ super.key });

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    List<String> products = [
      " Bridal bouquet",
      " Bouquet",
      " Vase of flowers",
      "Basker of flowers",
      "Box of flowers",
      "Congratulation flowers",
      "Condolence flowers",
      "Tet flower collection",
    ];
    
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFF0F0F0)
        ),
        child: Padding(padding: const EdgeInsets.only(
            left: 16, right: 16, top: 24
          ),
          child: Column(
            children: [
              mainPageHeader(_scaffoldKey),
            ],
          ),
        ),
      ),
      drawer: customDrawer(
        items: <Widget>[
          commonListItem(
            text: " Home", 
            prefixIcon: CustomIcon.custom_home,
          ),
          commonListItem(
            text: " Account", 
            prefixIcon: Icons.person,
          ),
          commonListItem(
            text: " Purchase History", 
            prefixIcon: Icons.history_rounded,
          ),
          CustomDrawer(
            width: MediaQuery.of(context).size.width / 1.6, 
            menuItem: MenuItem.haveChildren("Products", List.generate(products.length, (index) => MenuItem(products[index])))
          )
        ],
        drawerHeader: customDrawerHeader(name: "Bao Luong")
      )
    );
  }
}