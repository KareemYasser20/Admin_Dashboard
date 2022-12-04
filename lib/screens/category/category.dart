import 'package:admin_dashboard/screens/category/add_category_screen.dart';
import 'package:admin_dashboard/screens/category/edit_category_screen.dart';
import 'package:admin_dashboard/shared/colors.dart';
import 'package:admin_dashboard/shared/constant.dart';
import 'package:admin_dashboard/shared/widgets/category_widgets/single_category_product.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  static const String id = 'category_screen';

  const CategoryScreen({Key ? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Category Management'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: categoryProduct.length,
        itemBuilder: (context, index) {
          return SingleCategoryProduct(
            product: categoryProduct[index],
            cancelFunction: (){
              
              setState(() {
                categoryProduct.removeAt(index);
              });
            },
            onTapFunction: () {
              Navigator.pushNamed(context, EditCategory.id,
                  arguments: EditCategory(
                    categoryProduct: categoryProduct[index],
                  ));
                  
            },
          );
        },
      ),
      bottomNavigationBar: Container(
        height: 70.0,
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: GestureDetector(
                child: const Text(
                  "Add New Category",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, AddCategory.id);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
