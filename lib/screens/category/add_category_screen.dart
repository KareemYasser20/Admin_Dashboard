import 'package:admin_dashboard/shared/colors.dart';
import 'package:flutter/material.dart';

class AddCategory extends StatefulWidget {
  static const String id = 'add_category_screen';

  const AddCategory({Key? key}) : super(key: key);

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Add New Category'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Add Category'),
      ),
    );
  }
}
