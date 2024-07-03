import 'package:flower_store/constants/colors.dart';
import 'package:flower_store/models/menu.model.dart';
import 'package:flower_store/shared/components/custom_widgets.dart';
import 'package:flower_store/shared/styles/menu_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Drawer customDrawer({
  required List<Widget> items,
  DrawerHeader? drawerHeader,
}) {
  items.insert(0, drawerHeader ?? customDrawerHeader());
  return Drawer(
    backgroundColor: const Color(0xFFFFFEFE),
    child: ListView(
      children: items
    ),
  );
}

DrawerHeader customDrawerHeader({
  String? avatarUri,
  String? name
}) {
 return DrawerHeader(
    decoration: const BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: horizontalDividerColor,
        )
      )
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(avatarUri ?? 'assets/images/drawer_avatar.png'),
          radius: 40,
        ),
        Text(name ?? "Luong Quang Huy Bao",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        )
      ],
    )
  );
}

ListTile commonListItem({
  required String text,
  IconData? prefixIcon,
  IconData? suffixIcon,
  void Function()? onTap
}) {
  text = text.trim();
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 25),
    title: Row(
      children: <Widget>[
        Icon(prefixIcon, size: 24,),
        Text(' $text', style: const TextStyle(fontWeight: FontWeight.bold))
      ],
    ),
    onTap: onTap,
  );
}

class CustomDrawer extends StatefulWidget {
  double width;
  MenuItem menuItem;
  CustomDrawer({ super.key, required this.width, required this.menuItem });

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool isOpened = false;
  IconData icon = Icons.arrow_right_rounded;

  late double width;
  late MenuItem menuItem;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.width = widget.width;
    this.menuItem = widget.menuItem;
  }
  @override
  Widget build(BuildContext context) {
    return getMenuItemWithSubmenu(menuItem: menuItem, width: width);
  }

  Padding getMenuItemWithSubmenu({
    required double width,
    required MenuItem menuItem
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 14),
      child: MenuBar(
        style: commonMenuStyle(),
        children: [getMenus(menuItem: menuItem, width: width)]
      ),
    );
  }

  SubmenuButton getMenus({
    required MenuItem menuItem,
    required double width
  }) {
    return SubmenuButton(
      onOpen: () => setState(() => icon = Icons.arrow_drop_down_rounded),
      onClose: () => setState(() => icon = Icons.arrow_right_rounded),
      menuStyle: commonMenuStyle(),
      menuChildren: [
        MenuItemButton(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              menuItem.children!.length, 
              (i) => GestureDetector(
                onTap: menuItem.children![i].onTap,
                child: textWithIcon(
                  label: menuItem.children![i].label.trim(), 
                  prefixIcon: SvgPicture.asset('assets/images/${i == 0 ? "sub_menu_item_first.svg" : "sub_menu_item.svg"}'),
                  textStyle: const TextStyle(color: Colors.black, fontSize: 17),
                ),
              )
            ),
          ),
        ),
      ], 
      child: SizedBox(
        width: width,
        child: textWithIcon(
          label: " ${menuItem.label.trim()}", 
          prefixIcon: const Icon(Icons.content_paste_rounded),
          suffixIcon: Icon(
            icon,
            size: 40
          )
        ),
      )
    );
  }
}


InkWell commonSubMenuItem({
  required String label,
  bool? first,
  void Function()? onTap
}) {
  label = label.trim();
  String iconName = first != null && first ? "sub_menu_item_first.svg" : "sub_menu_item.svg";
  return InkWell(
    onTap: onTap,
    child: textWithIcon<SvgPicture>(
      label: " $label",
      prefixIcon: SvgPicture.asset('assets/images/$iconName'),
      textStyle: const TextStyle(color: Colors.black)
    ),
  );
}