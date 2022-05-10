import 'package:flutter/material.dart';
import 'package:qtec_shop/widgets/widgets.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 7, right: 7, bottom: 20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // mainAxisSpacing: 0,
                mainAxisExtent: 260,
              ),
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return ProductCard(
                  title: index != 0
                      ? 'লেস ক্লাসিক ফ্যামিলি সাইজ চিপস্ চিপস্'
                      : 'Lays Classic Family Chips',
                  stock: index != 0 ? 10 : 0,
                  inCart: index != 1 ? false : true,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
