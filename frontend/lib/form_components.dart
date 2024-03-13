import 'dart:io';

import 'package:bil_co/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class InfoFormField extends StatefulWidget {
  InfoFormField(
      {super.key,
      this.icon,
      required this.hintText,
      required this.labelText,
      this.isPassword = false,
      this.isNumber = false,
      this.validator,
      required this.onSaved,
      this.onChanged,
      this.initialValue});
  final Icon? icon;
  final String hintText;
  final String labelText;
  final String? initialValue;

  bool isPassword;
  bool isNumber;
  bool password = false;
  Icon passwordIcon = const Icon(Icons.visibility_off);
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final Function(String)? onChanged;

  @override
  State<InfoFormField> createState() => _InfoFormFieldState();
}

class _InfoFormFieldState extends State<InfoFormField> {
  @override
  Widget build(BuildContext context) {
    if (widget.isPassword) widget.password = true;
    if (widget.password) {
      return TextFormField(
        validator: widget.validator,
          initialValue: widget.initialValue,

        obscureText: widget.isPassword,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                if (widget.isPassword) {
                  widget.passwordIcon = const Icon(Icons.visibility);
                  widget.isPassword = false;
                } else {
                  widget.passwordIcon = const Icon(Icons.visibility_off);
                  widget.isPassword = true;
                }
              });
            },
            icon: widget.passwordIcon,
          ),
          icon: widget.icon,
          hintText: widget.hintText,
          labelText: widget.labelText,
        ),
        onSaved: widget.onSaved,
        onChanged: widget.onChanged,
      );
    } else {
      return TextFormField(
        inputFormatters:
            widget.isNumber ? [FilteringTextInputFormatter.digitsOnly] : null,
        validator: widget.validator,
        decoration: InputDecoration(
          icon: widget.icon,
          hintText: widget.hintText,
          labelText: widget.labelText,
        ),
        onSaved: widget.onSaved,
      );
    }
  }
}

class FormButton extends StatelessWidget {
  const FormButton(
      {super.key, required this.hintText, required this.onPressed});
  final String hintText;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(kFormButtonColor),
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16), // Custom border radius
            ),
          ),
        ),
        child: Text(
          hintText,
          style: const TextStyle(
              fontFamily: 'Lato',
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 20),
        ),
      ),
    );
  }
}

class FormContainer extends StatelessWidget {
  const FormContainer(
      {super.key, required this.title, required this.children, this.asset});
  final List<Widget> children;
  final String title;
  final String? asset;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      height: 1000,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(asset!),
            fit: BoxFit.fill,
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 36),
              child: Text(
                title,
                style: const TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    fontSize: 50,
                    color: kTitleColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(26.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: children,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoDropdownField extends StatefulWidget {
  InfoDropdownField(
      {super.key,
      required this.hintText,
      required this.labelText,
      this.onChanged,
      required this.options,
      this.selectedValue});
  final String hintText;
  final String labelText;
  final Function(dynamic)? onChanged;
  final List<Map<String, dynamic>> options;
  final dynamic selectedValue;

  @override
  State<InfoDropdownField> createState() => _InfoDropdownField();
}

class _InfoDropdownField extends State<InfoDropdownField> {
  Widget build(BuildContext context) {
    var menuEntries = widget.options.map((option) {
      return DropdownMenuEntry(
        value: option['value'],
        enabled: true,
        label: '${option['displayText']}',
      );
    }).toList();

    return DropdownMenu(
      label: Text(widget.labelText),
      hintText: widget.hintText,
      initialSelection: widget.selectedValue,
      onSelected: widget.onChanged,
      dropdownMenuEntries: menuEntries,
    );
  }
}
// Example Usage:
// InfoDropdownField(
//   label: 'Select Option',
//   value: selectedValue,
//   options: [
//     {'displayText': 'Option 1', 'value': 'Info 1'},
//     {'displayText': 'Option 2', 'value': 'Info 2},
//     {displayText': 'Option 3', 'value': 'Info 3'},
//   ],
//   onChanged: (value) {
//     // Handle selected value
//   },
// )

class FilterOption {
  final String displayText;
  final String filterValue;

  FilterOption({required this.displayText, required this.filterValue});

  @override
  String toString() {
    return filterValue;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true; // Check if it's the same instance
    return other is FilterOption &&
        other.filterValue == displayText &&
        other.filterValue == filterValue;
  }

  // Override the hashCode method
  @override
  int get hashCode => displayText.hashCode ^ filterValue.hashCode;
}

class SearchableFilterChips extends StatefulWidget {
  final List<FilterOption> allFilters;
  final String? hintText;
  final String label;
  final Function(String)? onChanged;
  final Function(String) onSaved;
  final String alreadySelected;
  SearchableFilterChips(
      {super.key,
      required this.allFilters,
      this.hintText,
      required this.label,
      this.onChanged,
      required this.onSaved,
      required this.alreadySelected});

  @override
  _SearchableFilterChipsState createState() =>
      _SearchableFilterChipsState(allFilters: allFilters);
}

class _SearchableFilterChipsState extends State<SearchableFilterChips> {
  TextEditingController _searchController = TextEditingController();
  List<FilterOption> selectedFilters = [];
  List<FilterOption> allFilters;
  List<FilterOption> displayedFilters = [];
  String tags="";
  bool cu= true;

  _SearchableFilterChipsState({required this.allFilters}) {
    // Initialize displayed filters with the first 10 filters
    displayedFilters = allFilters.take(5).toList();
    //displayedFilters.addAll(selectedFilters);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.alreadySelected != ""&&cu) {
      cu=false;
      List<String> tags = widget.alreadySelected.split(",");
      for(int i =0;i<tags.length;i++) {
        tags[i]=tags[i].trim();
      }
      setState(() {
        for (var filter in allFilters) {
          for(var tag in tags){
            if(filter.filterValue==tag&&!selectedFilters.contains(filter)){
              selectedFilters.add(filter);
              _searchController.clear();
              updateDisplayedFilters("");
            }
          }
        }
      });

    }
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: selectedFilters.map((filter) {
                return FilterChip(
                  label: Text(filter.displayText),
                  selected: selectedFilters.contains(filter),
                  onSelected: (isSelected) {
                    setState(() {
                      if (isSelected) {
                        selectedFilters.add(filter);
                        _searchController.clear();
                        updateDisplayedFilters("");
                      } else {
                        selectedFilters.remove(filter);
                      }
                    });
                    // Notify the parent about the selected filters


                    widget.onChanged?.call(tags = selectedFilters.join(', '));
                  },
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                updateDisplayedFilters(value);
              },
              decoration: InputDecoration(
                labelText: widget.label,
                hintText: widget.hintText,
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Wrap(
            spacing: 12.0,
            runSpacing: 5,
            children: displayedFilters.map((filter) {
              return FilterChip(
                label: Text(filter.displayText),
                selected: selectedFilters.contains(filter),
                onSelected: (isSelected) {
                  setState(() {
                    if (isSelected) {
                      selectedFilters.add(filter);
                      _searchController.clear();
                      updateDisplayedFilters("");
                    } else {
                      selectedFilters.remove(filter);
                    }
                  });
                  // Notify the parent about the selected filters
                  widget.onChanged?.call(tags = selectedFilters.join(', '));
                },
              );
            }).toList(),
          ),
          // Container(
          //   padding: EdgeInsets.all(8.0),
          //   child: Text("Selected Filters: ${selectedFilters.join(', ')}"),
          // ),
        ],
      ),
    );
  }

  void onSaved(String value) {
    widget.onSaved(selectedFilters.join(', '));
  }

  void updateDisplayedFilters(String searchQuery) {
    setState(() {
      // Filter all filters based on the search query
      List<FilterOption> matchingUnselectedFilters = allFilters
          .where((filter) => ((filter.displayText
                      .toLowerCase()
                      .contains(searchQuery.toLowerCase()) ||
                  filter.filterValue
                      .toLowerCase()
                      .contains(searchQuery.toLowerCase())) &&
              !selectedFilters.contains(filter)))
          .toList();

      // Filter selected filters based on the search query
      List<FilterOption> matchingSelectedFilters = selectedFilters
          .where((filter) => (filter.displayText
                  .toLowerCase()
                  .contains(searchQuery.toLowerCase()) ||
              filter.filterValue
                  .toLowerCase()
                  .contains(searchQuery.toLowerCase())))
          .toList();

      // Combine matching filters and selected filters
      displayedFilters = [
        ...matchingUnselectedFilters.take(5),
      ];

      // Deduplicate the list to avoid duplicates
      displayedFilters = displayedFilters.toSet().toList();
    });
  }
}

class ImageUploadForm extends StatefulWidget {
  final void Function(List<dynamic> images) onSaved;

  ImageUploadForm({super.key, required this.onSaved});

  @override
  _ImageUploadFormState createState() => _ImageUploadFormState();
}

class _ImageUploadFormState extends State<ImageUploadForm> {
  List<dynamic> images = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5, // You can adjust the number of columns
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: images.length + 1, // Add 1 for the "Add Image" button
            itemBuilder: (context, index) {
              if (index == images.length) {
                // Last item in the grid is the "Add Image" button
                return InkWell(
                  onTap: () {
                    _pickImage();
                  },
                  child: Container(
                    color: Colors.grey[300],
                    child: Icon(Icons.add),
                  ),
                );
              } else {
                // Display uploaded images
                return InkWell(
                  onTap: () {
                    // Replace image when clicked
                    _pickImage(index);
                  },
                  child: (kIsWeb)
                      ? Image.memory(images[index], fit: BoxFit.fill)
                      : Image.file(images[index]!, fit: BoxFit.fill),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage([int? index]) async {
    if(!kIsWeb){
       final ImagePicker _picker = ImagePicker();
       XFile? image = await _picker.pickImage(source: ImageSource.gallery);
       if (image != null) {
         setState(() {
           if (index != null && index < images.length) {
             // Replace existing image
             images[index] = File(image.path);
           } else {
             // Add a new image
             images.add(File(image.path));
           }
           widget.onSaved(images);
         });
       }
    }else{

      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          if (index != null && index < images.length) {
            // Replace existing image
            images[index] = f;
          } else {
            // Add a new image
            images.add(f);
          }
          widget.onSaved(images);
        });
      }
    }
  }
}
