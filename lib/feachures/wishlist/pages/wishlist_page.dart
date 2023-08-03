import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_birthday/core/constants.dart';
import 'package:mobyte_birthday/feachures/widgets/custom_scaffold.dart';
import 'package:mobyte_birthday/feachures/wishlist/widgets/add_gift_panel.dart';
import 'package:mobyte_birthday/feachures/widgets/custom_app_bar.dart';
import 'package:mobyte_birthday/feachures/widgets/custom_floating_button.dart';
import 'package:mobyte_birthday/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

//TODO вынести в модель
List<Map<String, dynamic>> gifts = [
  {
    'title': 'Playstation 5',
    'subtitle':
        'https://www.google.com/search?q=playstation+5&sxsrf=AB5stBiFPJBUztpMwkGvTVG6kq5lMceUHQ%3A1689963425657&source=hp&ei=ocu6ZOO-JcCXhbIPudKMUA&iflsig=AD69kcEAAAAAZLrZsZ_OKKPYaoLdqpzQir8m6f6goAMZ&ved=0ahUKEwijk6uttKCAAxXAS0EAHTkpAwoQ4dUDCAk&uact=5&oq=playstation+5&gs_lp=Egdnd3Mtd2l6Ig1wbGF5c3RhdGlvbiA1SHJQD1gPcAB4AJABAJgBAKABAKoBALgBA8gBAPgBAQ&sclient=gws-wiz',
    'reserved': false,
  },
  {
    'title': 'GTA V',
    'subtitle':
        'https://www.google.com/search?q=gta+5&sxsrf=AB5stBitMo3vDWCxtMDEoHcC78scyUopjg%3A1689963429553&ei=pcu6ZNKtIa2whbIPz86QqAE&ved=0ahUKEwiSlJuvtKCAAxUtWEEAHU8nBBUQ4dUDCA8&uact=5&oq=gta+5&gs_lp=Egxnd3Mtd2l6LXNlcnAiBWd0YSA1MgcQLhiKBRhDMgcQLhiKBRhDMgcQLhiKBRhDMgcQLhiKBRhDMgcQLhiKBRhDMgcQABiKBRhDMgcQLhiKBRhDMgcQLhiKBRhDMgUQABiABDIFEAAYgAQyFhAuGIoFGEMYlwUY3AQY3gQY4ATYAQFIrgdQAFivBXAAeAGQAQCYAY8CoAGWBqoBBTAuMi4yuAEDyAEA-AEBwgINEC4YigUYxwEY0QMYQ8ICCxAuGIAEGMcBGNEDwgIcEC4YigUYxwEY0QMYQxiXBRjcBBjeBBjgBNgBAeIDBBgAIEGIBgG6BgYIARABGBQ&sclient=gws-wiz-serp',
    'reserved': true,
  },
];

class _WishlistPageState extends State<WishlistPage> {
  void onRecervedToggle(int index) {
    setState(() {
      gifts[index]['reserved'] = !gifts[index]['reserved'];
    });
  }

  void onAddGift(Map<String, dynamic> gift) {
    setState(() {
      gifts.add(gift);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return CustomSafeArea(
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
                child: _GiftsList(
                  gifts: gifts,
                  onReservedToggle: onRecervedToggle,
                ),
              ),
            ),
          ),
        );
      },
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
        return AddGiftPanel(
          onAddGift: onAddGift,
        );
      },
    );
  }
}

class _GiftsList extends StatefulWidget {
  final List<Map<String, dynamic>> gifts;
  final Function(int) onReservedToggle;

  const _GiftsList({
    Key? key,
    required this.gifts,
    required this.onReservedToggle,
  }) : super(key: key);

  @override
  State<_GiftsList> createState() => _GiftsListState();
}

class _GiftsListState extends State<_GiftsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return _Gift(
          title: widget.gifts[index]['title'],
          subtitle: widget.gifts[index]['subtitle'],
          reserved: widget.gifts[index]['reserved'],
          onTap: () => widget.onReservedToggle(index),
        );
      },
      itemCount: widget.gifts.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 16.sp);
      },
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
    );
  }
}

class _Gift extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool reserved;
  final VoidCallback onTap;

  const _Gift({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.reserved,
    required this.onTap,
  }) : super(key: key);

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
                title,
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
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20.r),
          child: Ink(
            width: 20.sp,
            height: 20.sp,
            decoration: BoxDecoration(
              color: reserved
                  ? reservationPointSelectedColor
                  : reservationPointUnselectedColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }

  void openLink() {
    launchUrl(Uri.parse(subtitle));
  }
}
