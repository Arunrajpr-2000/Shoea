import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shoea_app/function/cart_fun.dart';
import 'package:shoea_app/model/cart_model.dart';
import 'package:shoea_app/model/product_model.dart';
import 'package:shoea_app/presentation/screens/Auth/widget/snackbarAuth.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<AddtoCart>((event, emit) {
      addtoCart(
        CartModel: event.cartModel,
      );
      Utils.showSnackBar(context: event.context, text: 'Added to cart');

      emit(state);
    });

    on<RemoveFromCart>((event, emit) {
      removeFromCart(id: event.cartModel.id);
      Utils.showSnackBar(context: event.context, text: 'Removed From Cart');

      emit(state);
    });
    //  on<Increment>((event, emit) {
    //   return emit(state.copyWith(count: state.count + 1));
    // });
    // on<Decrement>((event, emit) {
    //   return emit(state.copyWith(count: state.count - 1));
    // });

    on<IncrementCount>((event, emit) {
      emit(CartState(
          cartModel: state.cartModel, orderquantity: state.orderquantity + 1));
    });
    on<DecrementCount>((event, emit) {
      emit(CartState(
          cartModel: state.cartModel,
          orderquantity: state.orderquantity <= 0
              ? state.orderquantity
              : state.orderquantity - 1));
    });
  }
}
