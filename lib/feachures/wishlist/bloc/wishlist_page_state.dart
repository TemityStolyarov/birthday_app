part of 'wishlist_page_bloc.dart';

abstract class WishlistPageState {
  bool reserved = false;
  WishlistPageState({required this.reserved});
}

class WishlistPageInitialState extends WishlistPageState {
  WishlistPageInitialState() : super(reserved: false);
}
