import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:on_a_trip/common/constants/colors.dart';
import 'package:on_a_trip/common/constants/spaces.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/common/widgets/custom_container.dart';
import 'package:on_a_trip/common/widgets/back_button_appbar.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () {},
          child: const Text("Save"),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  height: 196,
                  decoration: const BoxDecoration(
                    color: Color(0xFF583EF2),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                  ),
                  child: const Column(
                    children: [
                      BackButtonAppBar(
                        title: "Your Profile",
                        iconColor: CustomColors.cardColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 100),
                CustomContainer(
                  margin: EdgeInsets.symmetric(
                    horizontal: Spaces.defaultHorizontalPadding,
                    vertical: Spaces.defaultVerticalPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: 'Your Name',
                        ),
                      ),
                      SizedBox(height: 12.h),
                      const TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.call_outlined),
                          labelText: "Phone",
                        ),
                      ),
                      SizedBox(height: 12.h),
                      const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined),
                          labelText: 'Email',
                        ),
                      ),
                      SizedBox(height: 12.h),
                      const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline),
                          suffixIcon: Icon(Icons.visibility_off),
                          labelText: 'Password',
                        ),
                      ),
                      SizedBox(height: 24.h),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: CustomColors.cardColor,
                            foregroundColor: CustomColors.primaryColor,
                          ),
                          child: const Text('Confirm'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 132,
              left: 0,
              right: 0,
              child: Center(
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: "https://blog.thomascook.in/wp-content/uploads/2017/01/Santorini-Greece.jpg",
                      imageBuilder: (context, imageProvider) => Container(
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                        // child: Container(
                        //   decoration: BoxDecoration(
                        //     shape: BoxShape.circle,
                        //     color: Colors.black.withOpacity(0.4),
                        //   ),
                        //   child: const Center(
                        //     child: Icon(
                        //       Icons.camera_alt,
                        //       color: Colors.white,
                        //     ),
                        //   ),
                        // ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: MediaQuery.of(context).size.width / 2.77,
                      right: MediaQuery.of(context).size.width / 2.77,
                      child: Container(
                        width: 120,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1F1F39).withOpacity(0.5),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(200),
                            bottomRight: Radius.circular(200),
                          ),
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
