import 'package:flutter/material.dart';

import 'form_components.dart';
const kTextColor = Color(0xFF010000);
const kScaffoldColor = Color(0xFFE9E9F0);
const kPrimaryColor = Color(0xFF5E8DC0);
//const kSecondaryColor = Color(0xFF394867);
//const kPrimaryColor = Color(0x66EC1C24);
const kSecondaryColor =  Color(0xFF630000);
const kFormColor = Color(0x66EC1C24);
const kFormTextColor= Colors.blueGrey;
const kTitleColor = Colors.white;
const kIconColor = Colors.white;
const kFormButtonColor = Color(0xFF2B4057);
const kSignUpBackground = Colors.cyan;
const kHighlightText = kSecondaryColor;

List<FilterOption> allFilters = [
  FilterOption(displayText: "CS 223", filterValue: "cs223"),
  FilterOption(displayText: "CS 224", filterValue: "cs224"),
  FilterOption(displayText: "CS 101", filterValue: "cs101"),
  FilterOption(displayText: "CS 102", filterValue: "cs102"),
  FilterOption(displayText: "CS 201", filterValue: "cs201"),
  FilterOption(displayText: "CS 202", filterValue: "cs202"),
  FilterOption(displayText: "MATH 101", filterValue: "math101"),
  FilterOption(displayText: "MATH 102", filterValue: "math102"),
  FilterOption(displayText: "MATH 132", filterValue: "math132"),
  FilterOption(displayText: "PSCY 102", filterValue: "pscy102"),
  FilterOption(displayText: "PHYS 101", filterValue: "phys101"),
  FilterOption(displayText: "PHYS 102", filterValue: "phys102"),
  FilterOption(displayText: "Book", filterValue: "book"),
  FilterOption(displayText: "Equipment", filterValue: "equipment"),
  FilterOption(displayText: "Tech", filterValue: "tech"),
  FilterOption(displayText: "Tool", filterValue: "tool"),
  FilterOption(displayText: "Calculator", filterValue: "calculator"),
  FilterOption(displayText: "Other", filterValue: "other"),
  FilterOption(displayText: "Household", filterValue: "household"),
  FilterOption(displayText: "Kitchen", filterValue: "kitchen"),
  FilterOption(displayText: "Decor", filterValue: "decor"),
  FilterOption(displayText: "Notebook", filterValue: "notebook"),
  FilterOption(displayText: "Phone", filterValue: "phone"),
  FilterOption(displayText: "Laptop", filterValue: "laptop"),
  FilterOption(displayText: "Headphones", filterValue: "headphones"),
  FilterOption(displayText: "Flask", filterValue: "flask"),
  FilterOption(displayText: "Mug", filterValue: "mug"),
  FilterOption(displayText: "Bottle", filterValue: "bottle"),
  FilterOption(displayText: "Cable", filterValue: "cable"),
  FilterOption(displayText: "Charger", filterValue: "charger"),
  FilterOption(displayText: "Clothing", filterValue: "clothing"),
  FilterOption(displayText: "Wallet", filterValue: "wallet"),
  FilterOption(displayText: "Case", filterValue: "case"),
  FilterOption(displayText: "Mouse", filterValue: "mouse"),
  FilterOption(displayText: "Keyboard", filterValue: "keyboard"),
  FilterOption(displayText: "Bag", filterValue: "bag"),
];

//const kAppBarColor = Color(0xFF14274E);
const kAppBarColor = kPrimaryColor;
const int right_left_page_spacing = 15; // usage example: width / right_left_page_spacing
const int kMobileWidthThreshold = 500;

