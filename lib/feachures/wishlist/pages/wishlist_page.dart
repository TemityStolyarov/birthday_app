import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobyte_birthday/core/constants.dart';
import 'package:mobyte_birthday/feachures/widgets/custom_scaffold.dart';
import 'package:mobyte_birthday/feachures/widgets/custon_rounded_button.dart';
import 'package:mobyte_birthday/feachures/wishlist/bloc/wishlist_page_bloc.dart';
import 'package:mobyte_birthday/feachures/wishlist/models/gift_model.dart';
import 'package:mobyte_birthday/feachures/wishlist/widgets/add_gift_panel.dart';
import 'package:mobyte_birthday/feachures/widgets/custom_app_bar.dart';
import 'package:mobyte_birthday/feachures/widgets/custom_floating_button.dart';
import 'package:mobyte_birthday/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({Key? key}) : super(key: key);

  // Mocked default values
  void _initDefaultGiftValues() {
    Hive.box('gifts').put(
      0,
      GiftModel(
        name: 'Playstation 5',
        link: link1,
        reserved: false,
      ),
    );
    Hive.box('gifts').put(
      1,
      GiftModel(
        name: 'GTA V',
        link: link2,
        reserved: true,
      ),
    );
  }

  void _showSlidingPanel(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12.sp),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return const AddGiftPanel();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return FutureBuilder(
          future: Hive.openBox('gifts'),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                _initDefaultGiftValues();
                return BlocProvider<WishlistPageBloc>(
                  create: (context) => WishlistPageBloc(),
                  child: CustomSafeArea(
                    scaffold: Scaffold(
                      floatingActionButton: Padding(
                        padding: EdgeInsets.only(right: 16.sp),
                        child: CustomFloatingButton(
                          size: 84.spMin,
                          onTap: () {
                            _showSlidingPanel(context);
                          },
                        ),
                      ),
                      appBar: PreferredSize(
                        preferredSize: Size.fromHeight(48.sp),
                        child: CustomAppBar(text: S.of(context).wishlist),
                      ),
                      backgroundColor: backgroundColor,
                      body: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.all(16.sp),
                          child: const _GiftsList(),
                        ),
                      ),
                    ),
                  ),
                );
              }
            } else {
              return const CustomSafeArea(
                scaffold: Scaffold(
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: secondaryAccentColor,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}

class _GiftsList extends StatelessWidget {
  const _GiftsList({
    Key? key,
  }) : super(key: key);

  void _showConfirmPanel(BuildContext context, GiftModel gift, int index) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12.sp),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200.sp,
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(16.sp),
              child: Column(
                children: [
                  Container(
                    height: 4.sp,
                    width: 35.sp,
                    decoration: BoxDecoration(
                      color: tertiaryColor,
                      borderRadius: BorderRadius.circular(40.sp),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.sp,
                      vertical: 16.sp,
                    ),
                    child: Text(
                      S.of(context).confirm_delete_gift(gift.name),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.sp),
                  RoundedButton(
                    fontSize: 16.sp,
                    width: 181.sp,
                    height: 50.sp,
                    onPressed: () {
                      Hive.box('gifts').deleteAt(index);
                      Navigator.of(context).pop();
                    },
                    text: S.of(context).delete,
                    buttonColor: secondaryAccentColor,
                  ),
                  //
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('gifts').listenable(),
      builder: (BuildContext context, giftsBox, Widget? child) {
        return ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            final giftModel = Hive.box('gifts').getAt(index) as GiftModel;
            return InkWell(
              overlayColor: const MaterialStatePropertyAll(Colors.transparent),
              onDoubleTap: () => _showConfirmPanel(
                context,
                giftModel,
                index,
              ),
              child: _GiftTile(
                giftModel: giftModel,
                giftsBox: giftsBox,
                index: index,
              ),
            );
          },
          itemCount: giftsBox.length,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 16.sp);
          },
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
        );
      },
    );
  }
}

class _GiftTile extends StatelessWidget {
  final GiftModel giftModel;
  final Box giftsBox;
  final int index;

  const _GiftTile({
    Key? key,
    required this.giftModel,
    required this.giftsBox,
    required this.index,
  }) : super(key: key);

  void openLink() {
    launchUrl(Uri.parse(giftModel.link));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                giftModel.name,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: openLink,
                child: Text(
                  S.of(context).gift_link,
                  style: TextStyle(
                    fontSize: 14.sp,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
        BlocBuilder<WishlistPageBloc, WishlistPageState>(
          builder: (context, state) {
            return InkWell(
              onTap: () {
                context.read<WishlistPageBloc>().add(
                      WishlistPageChangeEvent(
                        index: index,
                        giftModel: giftModel,
                      ),
                    );
              },
              borderRadius: BorderRadius.circular(20.r),
              child: Ink(
                width: 20.sp,
                height: 20.sp,
                decoration: BoxDecoration(
                  color: giftModel.reserved
                      ? reservationPointSelectedColor
                      : reservationPointUnselectedColor,
                  shape: BoxShape.circle,
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
