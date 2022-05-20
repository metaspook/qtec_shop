import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtec_shop/cubit/cubit.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              onChanged: (value) =>
                  context.read<SearchbarCubit>().setQuery(value),
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey.shade400),
                hintText: 'কাঙ্ক্ষিত পণ্যটি খুঁজুন',
                border: InputBorder.none,
              ),
            ),
          ),
          const Icon(
            Icons.search_rounded,
            color: Colors.grey,
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
