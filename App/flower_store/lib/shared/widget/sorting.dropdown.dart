import 'package:flutter/material.dart';

class SortingDropdown extends StatefulWidget {
  @override
  _SortingDropdownState createState() => _SortingDropdownState();
}

class _SortingDropdownState extends State<SortingDropdown> {
  String? _selectedSortOption;
  final List<String> _sortOptions = [
    'A-Z',
    'Z-A',
    'Price, low to high',
    'Price, high to low',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        color:Color(0xFFFA6C6C),
        borderRadius: BorderRadius.circular(10),
       ), 
      child: Padding(
        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: Center(
          child: DropdownButton<String>(
            alignment: Alignment.center,
            value: _selectedSortOption,
            hint: Text('Sort By',style: TextStyle(color: Colors.white),),
            icon: Icon(Icons.arrow_drop_down,color: Colors.white,),
            iconSize: 24,
            dropdownColor: Color(0xFFFA6C6C),
            style: TextStyle(color: Colors.white),
            underline: Container(
              height: 2,
              color: Colors.transparent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                _selectedSortOption = newValue;
              });
            },
            items: _sortOptions.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
