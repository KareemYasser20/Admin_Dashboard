
import 'package:admin_dashboard/models/product_model.dart';
import 'package:admin_dashboard/shared/colors.dart';
import 'package:flutter/material.dart';

class EditUser extends StatefulWidget {
  static const String id = 'edit_user_screen';
  final ProductModel ?  categoryProduct;

  const EditUser({Key? key, this.categoryProduct}) : super(key: key);

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as EditUser;
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Edit ${args.categoryProduct?.productName} Category'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Edit Category ${args.categoryProduct?.productName}'),
      ),
    );
  }
}