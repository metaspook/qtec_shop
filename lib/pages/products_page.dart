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
        products.addAll(
            (context.read<ProductsCubit>()..getProducts(offset += 10)).state);
      }
    });
  }

  int offset = 0;
  List<Product> products = [];
  List<Product> queryList = [];

  @override
  Widget build(BuildContext context) {
    final searchQuery = context.watch<SearchbarCubit>().state;
    if (products.isEmpty) {
      products.addAll(
          (context.watch<ProductsCubit>()..getProducts(offset += 10)).state);
    }
    return Expanded(
      child: products.isEmpty
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : LayoutBuilder(
              builder: (context, constraints) {
                queryList = searchQuery.isNotEmpty
                    ? [
                        ...products.where(
                          (product) => product.productName.contains(
                            RegExp(
                              searchQuery,
                              caseSensitive: false,
                              unicode: true,
                            ),
                          ),
                        )
                      ]
                    : products;
                return GridView.builder(
                  controller: scrollController,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(left: 7, right: 7, bottom: 20),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: constraints.maxHeight * .45,
                  ),
                  itemCount: searchQuery.isEmpty
                      ? queryList.length + 2
                      : queryList.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (searchQuery.isEmpty && index >= queryList.length) {
                      return ProductCard.loading();
                    } else {
                      final inCart = context
                          .watch<CartCubit>()
                          .containsProductById(queryList[index].id);
                      return Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          ProductCard(queryList[index]),
                          if (queryList[index].stock != 0)
                            inCart
                                ? QuantityButtonBar(queryList[index].id)
                                : Positioned(
                                    bottom: -8,
                                    child: Add2CartButton(queryList[index]),
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
