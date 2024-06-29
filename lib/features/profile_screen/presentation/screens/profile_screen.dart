import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:on_a_trip/common/constants/colors.dart';
import 'package:on_a_trip/common/constants/spaces.dart';
import 'package:on_a_trip/common/widgets/custom_appbar.dart';
import 'package:on_a_trip/features/profile_screen/presentation/screens/order_screen.dart';
import 'package:on_a_trip/features/profile_screen/presentation/widgets/profile_element_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: Spaces.defaultHorizontalPadding,
        vertical: Spaces.defaultVerticalPadding,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomAppBar(),
          SizedBox(height: 32.h),
          CachedNetworkImage(
            imageUrl: "https://blog.thomascook.in/wp-content/uploads/2017/01/Santorini-Greece.jpg",
            imageBuilder: (context, imageProvider) => Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade200,
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  color: CustomColors.primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          const Text(
            "Brandon Smith",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 32.h),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ProfileElementButton(
                  icon: Icons.person,
                  title: 'Edit Profile',
                  onTap: () {},
                ),
                ProfileElementButton(
                  icon: Icons.history,
                  title: 'My Orders',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const OrderScreen()),
                    );
                  },
                ),
                ProfileElementButton(
                  icon: Icons.location_city_outlined,
                  title: 'Address',
                  onTap: () {},
                ),
                ProfileElementButton(
                  icon: Icons.favorite,
                  title: 'My Wishlist',
                  onTap: () {},
                ),
                ProfileElementButton(
                  onTap: () {},
                  icon: Icons.payment,
                  title: 'Payment Settings',
                ),
                ProfileElementButton(
                  onTap: () {},
                  icon: Icons.call_outlined,
                  title: 'Help & Support',
                ),
                ProfileElementButton(
                  onTap: () {},
                  isLast: true,
                  title: 'Logout',
                  icon: Icons.logout,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
