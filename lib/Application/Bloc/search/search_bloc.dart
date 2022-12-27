import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoea_app/function/search_fun.dart';
import 'package:shoea_app/model/product_model.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(InitialState()) {
    on<SearchEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<Searchproduct>((event, emit) async {
      List<Product> _temp =
          await SearchFuction.searchProduct(Search_text: event.search_text);
      emit(SearchState(productList: _temp));
    });
  }
}
