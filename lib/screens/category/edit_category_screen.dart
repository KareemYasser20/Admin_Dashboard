import 'package:admin_dashboard/models/product_model.dart';
import 'package:admin_dashboard/shared/colors.dart';
import 'package:flutter/material.dart';

class EditCategory extends StatefulWidget {
  static const String id = 'edit_category_screen';
  final ProductModel ? categoryProduct;

   const EditCategory({Key? key, this.categoryProduct}) : super(key: key);

  @override
  State<EditCategory> createState() => _EditCategoryState();
}

class _EditCategoryState extends State<EditCategory> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as EditCategory;
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