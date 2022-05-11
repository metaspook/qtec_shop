import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // _scrollController.offset;
    // _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    // print(_scrollController.offset.toString());
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(_scrollController.offset.toString());
    // _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    return Scaffold(
      appBar: AppBar(
        title: const Text("প্রোডাক্ট ডিটেইল"),
        backgroundColor: Colors.transparent,
        foregroundColor: const Color.fromRGBO(50, 50, 50, 1),
        shadowColor: Colors.transparent,
        // iconTheme: IconThemeData(color: Colors.accents),
        // toolbarTextStyle: const TextStyle(color: Colors.black),
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
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      hintText: 'কাঙ্ক্ষিত পণ্যটি খুঁজুন',
                      border: InputBorder.none,
                    ),
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
          Flexible(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 7.5),
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              // shrinkWrap: true,
              // itemExtent: 400,
              // controller: _scrollController,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                // print(_scrollController.offset.toString());
                return Container(
                  margin: const EdgeInsets.only(
                    top: 5,
                    bottom: 25,
                    left: 7.5,
                    right: 7.5,
                  ),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset("assets/images/pringles_00.png"),
                );
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  const Text(
                    "প্রিঞ্জেলস অনিওন চিপস ৪২ গ্রাম",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: const TextSpan(
                            text: 'ব্রান্ডঃ ',
                            style: TextStyle(
                              color: Color.fromRGBO(100, 100, 100, 1),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              // TextSpan(text: ' ' * 5),
                              TextSpan(
                                text: 'প্রিঞ্জেলস',
                                style: TextStyle(
                                    color: Color.fromRGBO(50, 50, 50, 1),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              )
                            ]),
                      ),
                      Container(
                        height: 6,
                        width: 6,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(218, 32, 121, 1),
                            shape: BoxShape.circle),
                      ),
                      RichText(
                        text: const TextSpan(
                            text: 'ডিস্ট্রিবিউটরঃ ',
                            style: TextStyle(
                              color: Color.fromRGBO(100, 100, 100, 1),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              // TextSpan(text: ' ' * 5),
                              TextSpan(
                                text: 'মোঃ মোবারাক হোসেন',
                                style: TextStyle(
                                    color: Color.fromRGBO(50, 50, 50, 1),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              )
                            ]),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                      bottom: 25,
                      left: 7.5,
                      right: 7.5,
                    ),
                    // padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 10, right: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'ক্রয়মূল্যঃ',
                                    style: TextStyle(
                                        color: Color.fromRGBO(218, 32, 121, 1),
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '৳ 220',
                                    style: TextStyle(
                                        color: Color.fromRGBO(218, 32, 121, 1),
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'বিক্রয়মূল্যঃ',
                                    style: TextStyle(
                                        // color: Color.fromRGBO(218, 32, 121, 1),
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '৳ 250',
                                    style: TextStyle(
                                        // color: Color.fromRGBO(218, 32, 121, 1),
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // dashed divider.
                        Row(
                          children: <Widget>[
                            for (var i = 0; i < 150 ~/ 2; i++)
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: i % 2 == 0
                                      ? Colors.transparent
                                      : Colors.grey.shade400,
                                ),
                              )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 10, left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'লাভঃ',
                                style: TextStyle(
                                    // color: Color.fromRGBO(218, 32, 121, 1),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '৳ 30',
                                style: TextStyle(
                                    // color: Color.fromRGBO(218, 32, 121, 1),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
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
