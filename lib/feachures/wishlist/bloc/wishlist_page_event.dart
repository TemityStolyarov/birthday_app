part of 'wishlist_page_bloc.dart';

abstract class WishlistPageEvent {
  int index;
  GiftModel giftModel;
  WishlistPageEvent({required this.index, required this.giftModel});
}

class WishlistPageChangeEvent extends WishlistPageEvent {
  WishlistPageChangeEvent({required super.index, required super.giftModel});
}
