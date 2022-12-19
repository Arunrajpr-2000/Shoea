import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoea_app/application/Bloc/search/search_bloc.dart';
import 'package:shoea_app/core/color/colors.dart';
import 'package:shoea_app/model/product_model.dart';
import 'package:shoea_app/presentation/screens/search/widget/listItem.dart';
import 'package:shoea_app/presentation/widgets/textfield_container.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ScaffoldBgcolor,
      appBar: AppBar(
        backgroundColor: const Color(0xff1F222B),
        // automaticallyImplyLeading: false,
        centerTitle: true,
        // const Color(0xff1F222B),
        //  Colors.green,
        title: TextfieldContainer(
          Controller: searchController,
          onChanged: (value) {
            context.read<SearchBloc>().add(SearchSong(search_text: value));
          },
          // leadingIcon: const Icon(
          //   Icons.search,
          //   color: Colors.grey,
          // ),
          TrailingIcon: IconButton(
            onPressed: searchController.clear,
            icon: const Icon(Icons.clear, color: whiteColor),
          ),
          hinttext: 'Looking For shoes',
        ),

        //    TextField(
        //     controller: searchController,
        //     onChanged: (value) {
        //       context.read<SearchBloc>().add(SearchSong(search_text: value));
        //     },
        //     decoration: InputDecoration(
        //       hintText: 'Product title/name',
        //   suffixIcon: IconButton(
        //     onPressed: searchController.clear,
        //     icon: const Icon(
        //       Icons.clear,
        //       color: Color.fromARGB(222, 1, 64, 64),
        //     ),
        //   ),
        //     ),
        //   ),
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state.productList.isEmpty) {
            return const Center(
              child: Text(
                'No Product with this name',
                style: TextStyle(color: whiteColor),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: state.productList.length,
              itemBuilder: (BuildContext context, int index) {
                return buildProduct(state.productList[index]);
              },
            );
          }
        },
      ),
    );
  }

  Widget buildProduct(Product product) => ListedItem(
        title: product.name.isEmpty ? 'No title given' : product.name,
        image: product.images.isEmpty
            ? 'https://media.istockphoto.com/id/1325006592/photo/one-closed-cardboard-box.jpg?b=1&s=170667a&w=0&k=20&c=D0i7ktndB9WqzmK9QvwDpeaEkS7_gs6tJ4k_ZTh-bsI='
            : product.images[0],
        product: product,
      );
}
