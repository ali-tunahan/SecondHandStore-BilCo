import 'dart:async';
import 'dart:convert';

import 'package:bil_co/ApiSingleton.dart';
import 'package:bil_co/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

import 'package:openapi/openapi.dart';

import '../Authorization.dart';

class EditInfoField extends StatefulWidget {
  EditInfoField(
      {super.key,
      required this.icon,
      required this.hintText,
      required this.labelText,
      this.isPassword = false,
      this.validator,
      required this.onSaved,
      this.onChanged});
  final Icon icon;
  final String hintText;
  final String labelText;
  bool isPassword;
  bool password = false;
  Icon passwordIcon = const Icon(Icons.visibility_off, size: 15.0);
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final Function(String)? onChanged;

  @override
  State<EditInfoField> createState() => _EditInfoFieldState();
}

class _EditInfoFieldState extends State<EditInfoField> {
  TextStyle labelStyle = TextStyle(
      fontSize: 12, color: Colors.black); // Burada label için stil ayarları
  TextStyle hintStyle = TextStyle(
      fontSize: 12, color: Colors.black); // Burada hint text için stil ayarları
  bool isMobile = !kIsWeb;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    if (widget.isPassword) widget.password = true;
    if (widget.password) {
      return TextFormField(
        style: TextStyle(fontSize: 12.0),
        validator: widget.validator,
        obscureText: widget.isPassword,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 5, bottom: 12),
          labelStyle: labelStyle, // label stilini kullan
          hintStyle: hintStyle,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                if (widget.isPassword) {
                  widget.passwordIcon = const Icon(
                    Icons.visibility,
                    size: 15.0,
                  );
                  widget.isPassword = false;
                } else {
                  widget.passwordIcon = const Icon(
                    Icons.visibility_off,
                    size: 15.0,
                  );
                  widget.isPassword = true;
                }
              });
            },
            icon: widget.passwordIcon,
          ),
          errorStyle: TextStyle(height: 0),
          icon: widget.icon,
          hintText: widget.hintText,
          labelText: widget.labelText,
        ),
        onSaved: widget.onSaved,
        onChanged: widget.onChanged,
      );
    } else {
      return TextFormField(
        style: TextStyle(fontSize: 12.0),
        validator: widget.validator,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 5, bottom: 12),
          icon: widget.icon,
          hintText: widget.hintText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: widget.labelText,
          labelStyle: labelStyle, // label stilini kullan
          hintStyle: hintStyle,
        ),
        onSaved: widget.onSaved,
        onChanged: widget.onChanged,
      );
    }
  }
}

class EditButton extends StatelessWidget {
  const EditButton(
      {super.key, required this.hintText, required this.onPressed});
  final String hintText;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: 10.0),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding:
                  EdgeInsets.only(right: 20.0), // Sağ taraftan 20 piksel boşluk
              child: ElevatedButton(
                onPressed: () {
                  onPressed();
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(kFormButtonColor),
                ),
                child: Text(
                  hintText,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//-----------------------------
class EditTop extends StatefulWidget {
  @override
  State<EditTop> createState() => _EditTopState();
}

class _EditTopState extends State<EditTop> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isMobile = !kIsWeb;

  bool isLoadingInfo = false;

  final AuthApi userDTO = AuthorizedAPISingleton.instance.getAuthApi();

  late final UserDTO currUser;

  late String userIdAuth;
  @override
  void initState() {
    super.initState();
    isLoadingInfo = true;
    userDTO.apiAuthIdGet(id: Authorization.userId ?? "").then((value) {
      setState(() {
        isLoadingInfo = false;
        currUser = value.data!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    userIdAuth = Authorization.userId ?? "";

    return (isLoadingInfo)
        ? const Center(
            // Display a spinner or loading indicator
            child: CircularProgressIndicator(),
          )
        : Container(
            child: Column(children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                      left:
                          15.0), // İstediğiniz boşluk miktarını burada ayarlayabilirsiniz
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/profile_page");
                    },
                  ),
                ),
              ),

              /// edit_profile_pic
              ProfileImageUpload(),

              /// edit account info
              Divider(height: 30, thickness: 1, color: Colors.grey[300]),
              const Align(
                alignment: Alignment.centerLeft, // Sol tarafa hizala
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 30.0), // Soldan 10 piksel boşluk ekle
                  child: Text(
                    'Edit Account Info',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
              ),

              Form(
                child: EditCredentialsWidget(
                    formKey: _formKey, mail: currUser.id ?? ""),
              ),
              ElevatedButton(
                onPressed: () {
                  context.go("/forgot_password_profile"); //TODO IMPLEMENT WHAT TO DO WHEN PRESSED
                },
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStatePropertyAll<Color>(kFormButtonColor),
                  shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(16), // Custom border radius
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ' Send password reset link ',
                    style: const TextStyle(
                        fontFamily: 'Lato',
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ),
                ),
              )
              /*
              Divider(height: 30, thickness: 1, color: Colors.grey[300]),
              const Align(
                alignment: Alignment.centerLeft, // Sol tarafa hizala
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 30.0), // Soldan 10 piksel boşluk ekle
                  child: Text(
                    'Edit Password',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: EditPasswordWidget(
                  formKey: _formKey,
                  old_password: "aly1212!",
                ),
              ),

               */
              ,Divider(height: 30, thickness: 1, color: Colors.grey[300]),
            ]),
          );
  }
}

class EditCredentialsWidget extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final String mail;
  //final String id;
  String? name;
  String? newPhone;

  EditCredentialsWidget({required this.formKey, required this.mail});

  @override
  _EditCredentialsWidgetState createState() => _EditCredentialsWidgetState();
}

class _EditCredentialsWidgetState extends State<EditCredentialsWidget> {
  bool isLoadingInfo = false;

  final AuthApi userDTO = AuthorizedAPISingleton.instance.getAuthApi();

  late final UserDTO currUser;

  late String userIdAuth;
  @override
  void initState() {
    super.initState();
    isLoadingInfo = true;
    userDTO.apiAuthIdGet(id: Authorization.userId ?? "").then((value) {
      setState(() {
        isLoadingInfo = false;
        currUser = value.data!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    bool is_mobile = !kIsWeb;
    double _width = MediaQuery.of(context).size.width;
    bool is_info_change = false;
    bool isLoadingSave = false;
    void _updateInfoChangeStatus(String? value) {
      setState(() {
        is_info_change = value != null && value.isNotEmpty;
      });
    }

    return (isLoadingInfo || isLoadingSave)
        ? const Center(
            // Display a spinner or loading indicator
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              _buildEditInfoFieldContainer(
                _width,
                is_mobile,
                Row(
                  children: [
                    Icon(Icons.mail, size: 20.0),
                    SizedBox(width: 10.0),
                    Text(
                      currUser.userName ?? "N/A",
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ],
                ),
              ),
              /*
        _buildEditInfoFieldContainer(
            _width,
            is_mobile,
            Row(
              children: [
                Icon(Icons.numbers, size: 20.0),
                SizedBox(width:10.0),
                Text(
                  widget.id,
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              ],
            )),

         */
              _buildEditInfoFieldContainer(
                  _width,
                  is_mobile,
                  EditInfoField(
                      validator: (value) {
                        if (value == null || !value.isNotEmpty) {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        print(value);
                      },
                      onChanged: (value) {
                        widget.name = value;
                      },
                      icon: const Icon(Icons.person, size: 20.0),
                      hintText: (currUser.firstName ?? "") +
                          " " +
                          (currUser.lastName ?? ""),
                      labelText: "Name",
                      isPassword: false)),
              _buildEditInfoFieldContainer(
                  _width,
                  is_mobile,
                  EditInfoField(
                      validator: (value) {
                        if (value == null || !value.isNotEmpty) {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        print(value);
                      },
                      onChanged: (value){
                        widget.newPhone = value;
                      },
                      icon: const Icon(Icons.phone, size: 20.0),
                      hintText: currUser.phoneNumber ?? " N/A",
                      labelText: "Phone Number",
                      isPassword: false)),
              // OLD PASSOWRD CHECK: Before confirming the password change, user
              // should enter the old password.
              EditButton(
                hintText: "Save",
                onPressed: () {
                  if (true) {
                      // TODO
                    setState(() {
                      isLoadingSave = true;
                    });
                      sendChanges().then((value) {
                      isLoadingSave = false;
                      });
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                  }
                },
              ),
            ],
          );
  }
  Future<void> sendChanges() async {

    var dto = UpdateUserDTO((b) => b
      ..userName = currUser.userName
      ..id = currUser.id
      ..phoneNumber = widget.newPhone
      ..lastName = ""
      ..firstName = widget.name
      ..enabled = currUser.enabled);
    await AuthorizedAPISingleton.instance
        .getAuthApi()
        .apiAuthIdPut(id: Authorization.userId!, updateUserDTO: dto);
  }
  Widget _buildEditInfoFieldContainer(
      double width, bool isMobile, Widget child) {
    return Container(
      width: width - 200,

      ///1.3,
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: isMobile ? 80 : 20), // Yatay padding'i artırın
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(45),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: SizedBox(
        height: 25,
        width: width - 60, // Container genişliğinden daha küçük
        child: child,
      ),
    );
  }
}

class EditPasswordWidget extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final String? old_password;
  String? new_password;
  String? updated_password;
  bool isObscurePassword = true;

  EditPasswordWidget({required this.formKey, this.old_password});

  @override
  _EditPasswordWidgetState createState() => _EditPasswordWidgetState();
}

class _EditPasswordWidgetState extends State<EditPasswordWidget> {
  @override
  Widget build(BuildContext context) {
    bool is_mobile = !kIsWeb;
    double _width = MediaQuery.of(context).size.width;
    bool is_password_change = false;
    bool is_new_password_entered = false;

    void _updatePasswordChangeStatus(String? value) {
      setState(() {
        is_password_change = value != null && value.isNotEmpty;
      });
    }

    void _newPasswordChangeStatus(String? value) {
      setState(() {
        is_new_password_entered = value != null && value.isNotEmpty;
      });
    }

    return Column(
      children: [
        _buildEditInfoFieldContainer(
            _width,
            is_mobile,
            EditInfoField(
                validator: (value) {
                  _updatePasswordChangeStatus(value);
                  if (is_password_change) {
                    if (value != widget.old_password) {
                      return "Current password doesn't match";
                    }
                  }
                  if (is_new_password_entered) {}
                  return null;
                },
                onSaved: (value) {
                  print(value);
                },
                icon: const Icon(Icons.lock, size: 20.0),
                hintText: "",
                labelText: "Current Password *",
                isPassword: true)),
        _buildEditInfoFieldContainer(
            _width,
            is_mobile,
            EditInfoField(
                validator: (value) {
                  if (is_password_change) {
                    if (value == null || !value.isNotEmpty) {
                      return "New Password cannot be empty";
                    }
                  } else if (!is_password_change) {
                    if (value != null && value.isNotEmpty) {
                      return "Current Password cannot be empty";
                    }
                  }
                  return null;
                },
                onSaved: (value) {
                  print(value);
                },
                onChanged: (value) {
                  widget.new_password = value;
                },
                icon: const Icon(Icons.lock, size: 20.0),
                hintText: "",
                labelText: "New Password*",
                isPassword: true)),
        // OLD PASSOWRD CHECK: Before confirming the password change, user
        // should enter the old password.
        _buildEditInfoFieldContainer(
            _width,
            is_mobile,
            EditInfoField(
                validator: (value) {
                  if (is_password_change) {
                    if (value == null || !value.isNotEmpty) {
                      return "New Password cannot be empty";
                    }
                    if (value != widget.new_password) {
                      return "Passwords don't match";
                    }
                  }
                  return null;
                },
                onSaved: (value) {
                  print(value);
                },
                icon: const Icon(Icons.lock, size: 20.0),
                hintText: "",
                labelText: "New Password Again*",
                isPassword: true)),
        EditButton(
          hintText: "Save",
          onPressed: () {
            if (widget.formKey.currentState!.validate()) {
              widget.formKey.currentState?.save();
              // If the form is valid, display a snackbar. In the real world,
              // you'd often call a server or save the information in a database.
            }
          },
        ),
      ],
    );
  }

  Widget _buildTextField(
      String labeled_text, String placeHolder, bool isPassword) {
    return Padding(
        padding: EdgeInsets.only(bottom: 30),
        child: TextField(
          style: TextStyle(fontSize: 12.0),
          obscureText: isPassword ? widget.isObscurePassword : false,
          decoration: InputDecoration(
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(Icons.remove_red_eye, color: Colors.grey),
                      onPressed: () {})
                  : null,
              contentPadding: EdgeInsets.only(bottom: 5),
              labelText: labeled_text,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: placeHolder,
              hintStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              )),
        ));
  }

  Widget _buildEditInfoFieldContainer(
      double width, bool isMobile, Widget child) {
    return Container(
      width: width - 200,

      ///1.3,
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: isMobile ? 80 : 20), // Yatay padding'i artırın
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(45),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: SizedBox(
        //height: 25,
        width: width - 60, // Container genişliğinden daha küçük
        child: child,
      ),
    );
  }
}

class EditCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool is_mobile = !kIsWeb;
    double _width = MediaQuery.of(context).size.width;

    /// card
    return Container(
      width: _width,
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.fromLTRB(10, is_mobile ? 80 : 20, 10, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(45),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: EditTop(),
    );
  }
}

class EditPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isMobile = !kIsWeb;
    double _width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.fromLTRB(
          isMobile ? 15 : _width / right_left_page_spacing,
          isMobile ? 0 : 150,
          isMobile ? 15 : _width / right_left_page_spacing,
          10),
      child: Column(
        children: [EditCard()],
      ),
    );
  }
}

class ProfileImageUpload extends StatefulWidget {
  ProfileImageUpload({super.key});

  @override
  _ProfileImageUploadState createState() => _ProfileImageUploadState();
}

class _ProfileImageUploadState extends State<ProfileImageUpload> {
  bool isMobile = !kIsWeb;
  ImageProvider? imgProvider; // ImageProvider variable
  bool isLoadingInfo = false;
  bool isLoadingSave = false;
  final AuthApi userDTO = AuthorizedAPISingleton.instance.getAuthApi();

  late final UserDTO currUser;

  late String userIdAuth;
  @override
  void initState() {
    super.initState();
    isLoadingInfo = true;
    userDTO.apiAuthIdGet(id: Authorization.userId ?? "").then((value) {
      setState(() {
        isLoadingInfo = false;
        currUser = value.data!;
      });
    });
  }

  dynamic pickedImage;

  Future<void> _pickImage() async {
    if (!kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          pickedImage = File(image.path);
          imgProvider = FileImage(File(pickedImage.path));
        });
      }
    } else {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          // Add a new image
          pickedImage = f;
          imgProvider = MemoryImage(f);
        });
      }
    }
  }

  Future<void> sendChanges() async {
    String imageString = "";
    if (kIsWeb) {
      imageString = base64Encode(pickedImage);
    } else {
      // TODO test for android

      var file = (pickedImage as File);
      var bytes = file.readAsBytesSync();
      String base64Image = base64Encode(bytes).toString();
      imageString = base64Image;
    }

    var dto = UpdateUserDTO((b) => b
      ..userName = currUser.userName
      ..id = currUser.id
      ..phoneNumber = currUser.phoneNumber
      ..lastName = currUser.lastName
      ..firstName = currUser.firstName
      ..enabled = currUser.enabled
      ..profileImage = imageString);
    await AuthorizedAPISingleton.instance
        .getAuthApi()
        .apiAuthIdPut(id: Authorization.userId!, updateUserDTO: dto);
  }

  @override
  Widget build(BuildContext context) {
    return (isLoadingInfo || isLoadingSave)
        ? const Center(
            // Display a spinner or loading indicator
            child: CircularProgressIndicator(),
          )
        : Column(children: [
            Stack(
              children: [
                imgProvider != null
                    ? pp_circle(imgProvider)
                    : pp_circle(AssetImage("assets/indir.png")),

                /*
              if(this.userDTO.userImage != null && this.userDTO.userImage?.imageUrl != null && this.userDTO.userImage?.imageUrl != "") {
      return
        CircleAvatar(radius: 70, backgroundImage: NetworkImage(this.userDTO.userImage!.imageUrl!));
    }
    return CircleAvatar(radius: 70, backgroundColor: Colors.white10);
           */
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 4, color: Colors.white),
                      color: kFormButtonColor,
                    ),
                    child: InkWell(
                      onTap: _pickImage,
                      child: Icon(Icons.edit, color: Colors.white, size: 18.0),
                    ),
                  ),
                ),
              ],
            ),
            const Text(
              'Edit Profile Picture',
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.end, // Satırı yatay eksende ortala
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      right: 0.0), // Sağdaki buton için sağa padding ekle
                  child: EditButton(
                    hintText: "Save",
                    onPressed: () {
                      // TODO
                      isLoadingSave = true;
                      sendChanges().then((value) {
                        isLoadingSave = false;
                      });
                    },
                  ),
                ),
              ],
            )
          ]);
  }

  Widget pp_circle(ImageProvider<Object>? img) {
    return (isLoadingInfo || isLoadingSave)
        ? const Center(
            // Display a spinner or loading indicator
            child: CircularProgressIndicator(),
          )
        : Container(
            width: 120,
            height: isMobile ? 60 : 120,
            decoration: BoxDecoration(
              border: Border.all(width: 5, color: Colors.white),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.1),
                ),
              ],
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: img!, // Use imgProvider here
              ),
            ),
          );
  }
}
