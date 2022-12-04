import 'dart:io';
import 'package:admin_dashboard/screens/users/users_data.dart';
import 'package:admin_dashboard/shared/api/config.dart';
import 'package:admin_dashboard/shared/colors.dart';
import 'package:admin_dashboard/shared/components/progress.dart';
import 'package:admin_dashboard/shared/provider/loading_provider.dart';
import 'package:admin_dashboard/shared/widgets/account_widgets/account_buttons.dart';
import 'package:admin_dashboard/shared/widgets/account_widgets/default_form_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class AddUser extends StatefulWidget {
  static const String id = 'add_user_screen';

  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController =  TextEditingController();
  TextEditingController passwordController =  TextEditingController();
  TextEditingController noteController =  TextEditingController();
  bool showPassword = true;
  bool checkActive = false;
  bool isLoading = false;

   PickedFile ? _imageFile; // this variable will store image will be select from camera or gallery
  final ImagePicker _picker = ImagePicker();
  final _globalKey = GlobalKey<FormState>();

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile! as PickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Consumer<LoadingControl>(builder: (context, load, child) {
        return Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Form(
                  key: _globalKey,
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: ListView(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(left: 5.0),
                          margin: const EdgeInsets.only(bottom: 25.0),
                          child: const Text(
                            'Add new user',
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        imageProfile(),
                        const SizedBox(
                          height: 15.0,
                        ),
                        DefaultFormField(
                          controller: nameController,
                          maxLineNumber: 1,
                          obscureValue: false,
                          showPassword: false,
                          suffixIconFunction: (){},
                          hintText: 'User Name',
                          isPasswordTextField: false,
                          inputType: TextInputType.text,
                          validatorFunction: (String ? value) {
                            if (value!.isEmpty) {
                              return 'Please enter the user name';
                            }
                            return null;
                          },
                        ),
                        DefaultFormField(
                          controller: emailController,
                          suffixIconFunction: (){},
                          showPassword: false,
                          obscureValue: false,
                          maxLineNumber: 1,
                          hintText: 'Email',
                          isPasswordTextField: false,
                          inputType: TextInputType.emailAddress,
                          validatorFunction: (String ? value) {
                            if (value!.isEmpty ||
                                !value.contains(".") ||
                                !value.contains("@")) {
                              return 'Please enter valid Email';
                            }
                            return null;
                          },
                        ),
                        DefaultFormField(
                          controller: passwordController,
                          maxLineNumber: 1,
                          hintText: 'Password',
                          isPasswordTextField: true,
                          showPassword: showPassword,
                          suffixIconFunction: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          obscureValue: true,
                          inputType: TextInputType.text,
                          validatorFunction: (String ? value) {
                            if (value!.isEmpty || value.length < 4) {
                              return 'Please enter valid password more than 4 character';
                            }
                            return null;
                          },
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 15.0),
                          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Text(
                                  'User Active : ',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ),
                              Checkbox(
                                  value: checkActive,
                                  onChanged: (newValue) {
                                    setState(() {
                                      checkActive = newValue!;
                                    });
                                  }),
                            ],
                          ),
                        ),
                        DefaultFormField(
                          controller: noteController,
                          maxLineNumber: null,
                          suffixIconFunction: (){},
                          showPassword: false,
                          obscureValue: false,
                          validatorFunction: (String ? value){
                            if (value == null) {
                              // The user haven't typed anything
                              return "Type something, man!";
                            }
                            return null;
                          },
                          hintText: 'User Note',
                          isPasswordTextField: false,
                          inputType: TextInputType.multiline,
                        ),
                        isLoading
                            ? circularProgress()
                            : AccountsButton(
                                buttonText: 'Save',
                                onPressButton: () async {
                                  if (!await checkConnection()) {
                                    Toast.show(
                                        "Please check your internet connection.",
                                       // context,
                                        duration: Toast.lengthLong,
                                        gravity: Toast.bottom);
                                  } else if (_globalKey.currentState!
                                      .validate()) {
                                    isLoading = true;
                                    load.addLoading();

                                    bool res = await createUser(
                                        nameController.text,
                                        emailController.text,
                                        passwordController.text,
                                        checkActive,
                                        noteController.text,
                                        context);

                                    isLoading = res;
                                    load.addLoading();

                                    // ignore: avoid_print
                                    print('User Data ------------->');
                                    // ignore: avoid_print
                                    print(
                                        'User image is: ${_imageFile!.path.toString()}');
                                        // ignore: avoid_print
                                    print(
                                        'User Name is: ${nameController.text}');
                                        // ignore: avoid_print
                                    print(
                                        'User Email is: ${emailController.text}');
                                        // ignore: avoid_print
                                    print(
                                        'User pass is: ${passwordController.text}');
                                        // ignore: avoid_print
                                    print(
                                        'User phone is: ${noteController.text}');
                                  } else {
                                    Toast.show(
                                        "Please fill the user data.",
                                        //context,
                                        duration: Toast.lengthLong,
                                        gravity: Toast.bottom);
                                  }
                                },
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 20.0,
      ),
      child: Column(
        children: [
          const Text(
            'Choose profile photo',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                icon: const Icon(Icons.camera),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                label: const Text('Camera'),
              ),
              TextButton.icon(
                icon: const Icon(Icons.image),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                label: const Text('Gallery'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 70.0,
            backgroundImage: _imageFile == null
                ? const AssetImage("images/product/burger.jpg")
                : FileImage(File(_imageFile!.path)) as ImageProvider,
          ),
          Positioned(
            bottom: 0.0,
            right: 0.0,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  builder: (context) => bottomSheet(),
                  context: context,
                );
              },
              child: Container(
                height: 45.0,
                width: 45.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryColor,
                  border: Border.all(
                    width: 4.0,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
                child: const Icon(
                  Icons.camera_alt,
                  size: 28.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
