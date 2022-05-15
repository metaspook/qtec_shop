import 'package:flutter/material.dart';
import 'package:qtec_shop/utils/utils.dart';
import 'package:qtec_shop/widgets/widgets.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(context.watch<ProductsCubit>()..getProducts());
    final size = MediaQuery.of(context).size;
    // String queryString = XController.search.text;

    final mainList = <String>['hello', 'kaloo', 'jallo', 'jakko'];
    List<String> queryList = [];
    // _fetchProducts();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Column(
        children: [
          const SearchBar(),
          Expanded(
            child:

                // BlocBuilder<ProductsCubit, List<Product>>(
                //     builder: (context, products) {
                //   if (products.isEmpty) {
                //     return const Center(
                //       child: CircularProgressIndicator.adaptive(),
                //     );
                //   }
                //   const inCart = false;
                //   products.removeWhere(
                //       (product) => !product.productName.contains(queryString));
                //   return

                LayoutBuilder(builder: (context, constraints) {
              // XController.search.addListener(() {

              // });d

              return ValueListenableBuilder(
                valueListenable: Constants.queryString,
                builder: (BuildContext context, String value, Widget? child) {
                  print(Constants.queryString.value);
                  queryList = value.isNotEmpty
                      ? [
                          ...mainList
                              .where((product) => product.contains(value))
                        ]
                      : mainList;
                  return GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    padding:
                        const EdgeInsets.only(left: 7, right: 7, bottom: 20),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // mainAxisSpacing: constraints.maxHeight * .0175,
                      // mainAxisSpacing: constraints.maxWidth * .05,
                      // mainAxisExtent: 290,
                      mainAxisExtent: constraints.maxHeight * .45,
                      // mainAxisExtent: constraints.maxWidth * .78,
                    ),
                    itemCount: queryList.length,
                    // products.length,
                    // queryList.isEmpty ? products.length : queryList.length,
                    itemBuilder: (BuildContext context, int index) {
                      // print("তীর চিনিগুড়া চাল-১ কেজি");
                      // print(products[2].productName);

                      return Text(queryList[index]);

                      // Stack(
                      //   alignment: Alignment.bottomCenter,
                      //   children: [
                      //     ProductCard(products[index]),
                      //     if (products[index].stock != 0)
                      //       const Positioned(
                      //           right: 12, top: 12, child: StockoutBadge()),
                      //     if (products[index].stock != 0)
                      //       const Positioned(
                      //           bottom: -5,
                      //           child: inCart == true
                      //               ? QuantityButtonBar()
                      //               : Add2CartButton())
                      //   ],
                      // );
                    },
                  );
                },
              );

              // });
            }),
          ),
        ],
      ),
    );
  }
}
