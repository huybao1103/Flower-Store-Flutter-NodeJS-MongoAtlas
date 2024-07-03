
import 'package:flower_store/models/menu.model.dart';
import 'package:flower_store/models/product.dart';
import 'package:flower_store/screens/store.main.screen.dart';
import 'package:flower_store/shared/components/custom_drawer.dart';
import 'package:flower_store/shared/components/input_decoration.dart';
import 'package:flower_store/shared/components/main_page_header.dart';
import 'package:flower_store/shared/widget/product.grid.dart';
import 'package:flutter/material.dart';
import 'package:flower_store/assets/custom_icon.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
class AllProductScreen extends StatefulWidget {
  const AllProductScreen({ super.key });

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? proName;

  List<Product> productsFavorite = [];
  
  @override
  Widget build(BuildContext context) {
    productsFavorite = [
      Product(
        name: proName ?? 'Blushing Bride',
        price: 56,
        imageUrl:
            'https://product.hstatic.net/200000846175/product/z5544206552217_68cd21965416a9e4e15d838797fafb68-min_047147ebaacc456095f669d928b2052b_1024x1024.jpg',
        isFavorite: true,
      ),
      Product(
        name: proName ?? 'Herves Love',
        price: 56,
        imageUrl:
            'https://product.hstatic.net/200000846175/product/_052e215d0bf4937c855e88d6d4b3e092-min_4ee2c7cf7ae24d67b1b46156d8b96f8c_bd89a4bf469c4db7833f9c3a51f8252e_1024x1024.jpg',
        isFavorite: true,
      ),
      Product(
        name: proName ?? 'Rose Bouquet',
        price: 56,
        imageUrl:
            'https://product.hstatic.net/200000846175/product/4-min_d37e9a752bc145a4b6c407f01666a7d4_f60c9f31b2f947f285846b25733d2dc4_1024x1024.jpg',
        isFavorite: true,
      ),
      Product(
        name: proName ?? 'Blushing Bride',
        price: 56,
        imageUrl:
            'https://product.hstatic.net/200000846175/product/z5544206552217_68cd21965416a9e4e15d838797fafb68-min_047147ebaacc456095f669d928b2052b_1024x1024.jpg',
        isFavorite: true,
      ),
      Product(
        name: proName ?? 'Herves Love',
        price: 56,
        imageUrl:
            'https://product.hstatic.net/200000846175/product/_052e215d0bf4937c855e88d6d4b3e092-min_4ee2c7cf7ae24d67b1b46156d8b96f8c_bd89a4bf469c4db7833f9c3a51f8252e_1024x1024.jpg',
        isFavorite: true,
      ),
      Product(
        name: proName ?? 'Rose Bouquet',
        price: 56,
        imageUrl:
            'https://product.hstatic.net/200000846175/product/4-min_d37e9a752bc145a4b6c407f01666a7d4_f60c9f31b2f947f285846b25733d2dc4_1024x1024.jpg',
        isFavorite: true,
      ),
      Product(
        name: proName ?? 'Blushing Bride',
        price: 56,
        imageUrl:
            'https://product.hstatic.net/200000846175/product/z5544206552217_68cd21965416a9e4e15d838797fafb68-min_047147ebaacc456095f669d928b2052b_1024x1024.jpg',
        isFavorite: true,
      ),
      Product(
        name: proName ?? 'Herves Love',
        price: 56,
        imageUrl:
            'https://product.hstatic.net/200000846175/product/_052e215d0bf4937c855e88d6d4b3e092-min_4ee2c7cf7ae24d67b1b46156d8b96f8c_bd89a4bf469c4db7833f9c3a51f8252e_1024x1024.jpg',
        isFavorite: true,
      ),
      Product(
        name: proName ?? 'Rose Bouquet',
        price: 56,
        imageUrl:
            'https://product.hstatic.net/200000846175/product/4-min_d37e9a752bc145a4b6c407f01666a7d4_f60c9f31b2f947f285846b25733d2dc4_1024x1024.jpg',
        isFavorite: true,
      ),
    ];
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
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: genericFieldContainer(
                  field: FormBuilderTextField(
                    onTapOutside: (event) {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    onTap: (){
                    },
                      name: proName ?? 'Search',
                      decoration: genericInputDecoration(label: 'Search', prefixIcon: Icons.search))
                ),
              ),
              Expanded(
                child: ProductGridview(
                  products: productsFavorite,
                  title: proName ?? 'All Products',
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: customDrawer(
        items: <Widget>[
          commonListItem(
            text: " Home", 
            prefixIcon: CustomIcon.custom_home,
            onTap: () => Navigator
            .of(context)
            .push(MaterialPageRoute(builder: (context) => const StoreMainScreen())),
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
            menuItem: MenuItem.haveChildren("Products", 
              List.generate(products.length, 
                (index) => MenuItem.withEven(products[index],
                List.empty(),
                () => setState(() {
                  proName = products[index];
                  Navigator.of(context).pop();
                })
              ))
            )
          )
        ],
        drawerHeader: customDrawerHeader(name: "Bao Luong")
      )
    );
  }
}