import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtec_shop/cubit/cubit.dart';
import 'package:qtec_shop/models/models.dart';
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
  List<Product> queryProducts = [];
  List<Product> products = [];
  int offset = 0;

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
        products.addAll((context.read<ProductsCubit>()
              ..getProducts(offset: offset += 10))
            .state);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final queryString = context.watch<SearchbarCubit>().state;
    if (products.isEmpty) {
      products.addAll((context.watch<ProductsCubit>()
            ..getProducts(offset: offset += 10))
          .state);
    }
    return Expanded(
      child: products.isEmpty
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : LayoutBuilder(
              builder: (context, constraints) {
                if (queryString.isNotEmpty) {
                  // query based search from 'slug' property.
                  queryProducts = [
                    ...products
                        .where((product) => product.queryString == queryString)
                  ];
                  // string based search from 'product_name' property.
                  if (queryProducts.isEmpty) {
                    queryProducts = [
                      ...products.where(
                        (product) => product.productName.contains(
                          RegExp(
                            queryString,
                            caseSensitive: false,
                            unicode: true,
                          ),
                        ),
                      )
                    ];
                  }
                } else {
                  // fallback to all products.
                  queryProducts = products;
                }
                return GridView.builder(
                  controller: scrollController,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(left: 5, right: 5, bottom: 20),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: constraints.maxHeight * .45,
                  ),
                  itemCount:
                      //  queryString.isEmpty ?
                      queryProducts.length + 2,
                  // : queryList.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index >= queryProducts.length) {
                      return ProductCard.loading();
                    } else {
                      final inCart = context
                          .watch<CartCubit>()
                          .containsProductById(queryProducts[index].id);
                      return Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          ProductCard(queryProducts[index]),
                          if (queryProducts[index].stock != 0)
                            inCart
                                ? QuantityButtonBar(queryProducts[index].id)
                                : Positioned(
                                    bottom: -8,
                                    child: Add2CartButton(queryProducts[index]),
                                  ),
                        ],
                      );
                    }
                  },
                );
              },
            ),
    );
  }
}
