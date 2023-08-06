import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobyte_birthday/feachures/wishlist/models/gift_model.dart';

part 'wishlist_page_event.dart';
part 'wishlist_page_state.dart';

class WishlistPageBloc extends Bloc<WishlistPageEvent, WishlistPageState> {
  WishlistPageBloc() : super(WishlistPageInitialState()) {
    on<WishlistPageChangeEvent>((event, emit) {
      Hive.box('gifts').putAt(
        event.index,
        GiftModel(
          name: event.giftModel.name,
          link: event.giftModel.link,
          reserved: !event.giftModel.reserved,
        ),
      );
    });
  }
}
