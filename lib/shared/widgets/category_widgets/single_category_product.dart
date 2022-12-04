import 'package:admin_dashboard/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../colors.dart';

class SingleCategoryProduct extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onTapFunction;
  final VoidCallback cancelFunction;

  const SingleCategoryProduct(
      {Key ? key, required this.product, required this.onTapFunction,required this.cancelFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          GestureDetector(
            onTap: cancelFunction,
            child: Container(
              alignment: Alignment.topLeft,
              child: const Icon(
                Icons.cancel,
                color: primaryColor,
                size: 30.0,
              ),
            ),
          ),
          ListTile(
            title: Text(
              product.productName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            subtitle: Text(
              product.productPrice.toString(),
              style: const TextStyle(),
            ),
            leading: Container(
              width: 50.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(product.productImage),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
            ),
            trailing: SizedBox(
              width: 32.0,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: onTapFunction,
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const FaIcon(
                        FontAwesomeIcons.penToSquare,
                        color: Colors.white,
                        size: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
