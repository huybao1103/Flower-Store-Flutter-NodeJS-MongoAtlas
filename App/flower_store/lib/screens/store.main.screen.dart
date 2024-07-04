import 'package:carousel_slider/carousel_slider.dart';
import 'package:flower_store/assets/custom_icon.dart';
import 'package:flower_store/constants/colors.dart';
import 'package:flower_store/models/menu.model.dart';
import 'package:flower_store/models/product.dart';
import 'package:flower_store/screens/favorite.screen.dart';
import 'package:flower_store/shared/components/custom_drawer.dart';
import 'package:flower_store/shared/components/main_page_header.dart';
import 'package:flower_store/shared/widget/carousel.dart';
import 'package:flower_store/shared/widget/product.listview.horizontal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreMainScreen extends StatefulWidget {
  const StoreMainScreen({super.key});

  @override
  State<StoreMainScreen> createState() => _StoreMainScreenState();
}

class _StoreMainScreenState extends State<StoreMainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> imgList = [
    'https://i.pinimg.com/originals/64/6b/ed/646bedb7a2bc011d01605cf84e5a4f90.jpg',
    'https://damasflowers.com/wp-content/uploads/2019/07/14-banner3-1.jpg',
    'https://assets.eflorist.com/site/EF-15879/Homepage/TODAYS%20DEALS%20BANNER%20WITH%20TITTLE.jpg',
    'https://img.teleflora.com/images/o_0/l_backgrounds:202002-DOTD_640LandingPage,pg_1/w_640,cs_no_cmyk,c_pad,g_south/f_auto,q_80,e_sharpen:1/backgrounds/202002-DOTD_640LandingPage/flowers'
  ];
  List<String> category = [
    " Bridal bouquet",
    " Bouquet",
    " Vase of flowers",
    "Basker of flowers",
    "Box of flowers",
    "Congratulation flowers",
    "Condolence flowers",
    "Tet flower collection",
  ];
  final List<Product> productsFavorite = [
    Product(
      name: 'Blushing Bride',
      price: 56,
      imageUrl:
          'https://product.hstatic.net/200000846175/product/z5544206552217_68cd21965416a9e4e15d838797fafb68-min_047147ebaacc456095f669d928b2052b_1024x1024.jpg',
      isFavorite: true,
    ),
    Product(
      name: 'Herves Love',
      price: 56,
      imageUrl:
          'https://product.hstatic.net/200000846175/product/_052e215d0bf4937c855e88d6d4b3e092-min_4ee2c7cf7ae24d67b1b46156d8b96f8c_bd89a4bf469c4db7833f9c3a51f8252e_1024x1024.jpg',
      isFavorite: true,
    ),
    Product(
      name: 'Rose Bouquet',
      price: 56,
      imageUrl:
          'https://product.hstatic.net/200000846175/product/4-min_d37e9a752bc145a4b6c407f01666a7d4_f60c9f31b2f947f285846b25733d2dc4_1024x1024.jpg',
      isFavorite: true,
    ),
  ];
  final List<Product> products = [
    Product(
      name: 'Blushing Bride',
      price: 56,
      imageUrl:
          'https://product.hstatic.net/200000846175/product/z5544206552217_68cd21965416a9e4e15d838797fafb68-min_047147ebaacc456095f669d928b2052b_1024x1024.jpg',
      isFavorite: false,
    ),
    Product(
      name: 'Herves Love',
      price: 56,
      imageUrl:
          'https://product.hstatic.net/200000846175/product/_052e215d0bf4937c855e88d6d4b3e092-min_4ee2c7cf7ae24d67b1b46156d8b96f8c_bd89a4bf469c4db7833f9c3a51f8252e_1024x1024.jpg',
      isFavorite: false,
    ),
    Product(
      name: 'Rose Bouquet',
      price: 56,
      imageUrl:
          'https://product.hstatic.net/200000846175/product/4-min_d37e9a752bc145a4b6c407f01666a7d4_f60c9f31b2f947f285846b25733d2dc4_1024x1024.jpg',
      isFavorite: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        decoration: const BoxDecoration(
          gradient: gradientBackground,
        ),
        child: Column(
          children: [
            mainPageHeader(_scaffoldKey, context),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Column(
                    children: [
                      ReusableCarousel(imageList: imgList),
                      ProductListview(
                        products: productsFavorite,
                        title: 'Your favorite',
                        navigator: FavoriteScreen(),
                      ),
                      ProductListview(
                        products: products,
                        title: 'Best Selling',
                      ),
                      ProductListview(
                        products: products,
                        title: 'Special offers',
                      ),
                      ProductListview(
                        products: products,
                        title: 'New Arrival',
                      ),
                      ProductListview(
                        products: products,
                        title: 'Top Rating',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
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
            menuItem: MenuItem.haveChildren(
              "Products",
              List.generate(
                category.length,
                (index) => MenuItem(category[index]),
              ),
            ),
          ),
        ],
        drawerHeader: customDrawerHeader(name: "Bao Luong"),
      ),
    );
  }
}
