import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtec_shop/cubit/products_cubit.dart';
import 'package:qtec_shop/models/models.dart';
import 'package:qtec_shop/widgets/widgets.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // _fetchProducts();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15, bottom: 25),
            padding: const EdgeInsets.only(left: 20, right: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                const Flexible(
                  child: TextField(
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search_rounded,
                      color: Colors.grey,
                    ))
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<ProductsCubit, List<Product>>(
                builder: (context, products) {
              if (products.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              return GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 7, right: 7, bottom: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 3,
                  mainAxisExtent: 309,
                ),
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  // print("তীর চিনিগুড়া চাল-১ কেজি");
                  // print(products[2].productName);
                  return ProductCard(products[index]);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
