import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtec_shop/cubit/cubit.dart';
import 'package:qtec_shop/models/models.dart';
import 'package:qtec_shop/widgets/widgets.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProductCount = context.watch<CartCounterCubit>().state;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Column(
        children: const [
          SearchBar(),
          ProductsView(),
        ],
      ),
    );
  }
}

class ProductsView extends StatefulWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  final scrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        // print(' last position');
        products.addAll(
            (context.read<ProductsCubit>()..getProducts(offset += 10)).state);
      }
    });
  }

  List<Product> products = [];
  List<Product> queryList = [];

  int offset = 0;
  @override
  Widget build(BuildContext context) {
    final searchQuery = context.watch<SearchbarCubit>().state;
    // final cart = context.watch<CartCubit>().state;

    if (products.isEmpty) {
      products.addAll(
          (context.watch<ProductsCubit>()..getProducts(offset += 10)).state);
    }
    const inCart = false;
    return Expanded(
        child: products.isEmpty
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : LayoutBuilder(builder: (context, constraints) {
                queryList = searchQuery.isNotEmpty
                    ? [
                        ...products.where(
                            (product) => product.productName.contains(RegExp(
                                  searchQuery,
                                  caseSensitive: false,
                                  unicode: true,
                                )))
                      ]
                    : products;
                return GridView.builder(
                  controller: scrollController,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(left: 7, right: 7, bottom: 20),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // mainAxisSpacing: constraints.maxHeight * .0175,
                    // mainAxisSpacing: constraints.maxWidth * .05,
                    // mainAxisExtent: 290,
                    mainAxisExtent: constraints.maxHeight * .45,
                    // mainAxisExtent: constraints.maxWidth * .78,
                  ),
                  itemCount: searchQuery.isEmpty
                      ? queryList.length + 2
                      : queryList.length,
                  // products.length,
                  // queryList.isEmpty ? products.length : queryList.length,
                  itemBuilder: (BuildContext context, int index) {
                    // print("তীর চিনিগুড়া চাল-১ কেজি");
                    // print(products[2].productName);
                    if (searchQuery.isEmpty && index >= queryList.length) {
                      // offset = 20;
                      return const ProductCard.loading();
                    }

                    return
                        // Text(queryList[index]);

                        Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        ProductCard(queryList[index]),
                        if (queryList[index].stock == 0)
                          const Positioned(
                              right: 12, top: 12, child: StockoutBadge()),
                        if (queryList[index].stock != 0)
                          const Positioned(
                              // bottom: -3,
                              child: inCart == false
                                  ? QuantityButtonBar(quantity: 5)
                                  : Add2CartButton()),
                      ],
                    );
                  },
                );
                // },
                // );
              })
        // }),
        );
  }
}
