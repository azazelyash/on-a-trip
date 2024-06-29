import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/common/constants/colors.dart';
import 'package:on_a_trip/common/widgets/back_button_appbar.dart';
import 'package:on_a_trip/gen/assets.gen.dart';

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
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                height: 196,
                decoration: const BoxDecoration(
                  color: Color(0xFF583EF2),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(45),
                    bottomRight: Radius.circular(45),
                  ),
                ),
                child: const BackButtonAppBar(
                  title: "Your Profile",
                  iconColor: CustomColors.cardColor,
                ),
              ),
            ),
            Positioned(
                top: 140,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 135,
                  width: 135,
                  child: Center(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(67),
                          child: Image.network(
                            "https://blog.thomascook.in/wp-content/uploads/2017/01/Santorini-Greece.jpg",
                            height: 135,
                            width: 135,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 8,
                          child: Container(
                            width: 120,
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color(0xFF1F1F39).withOpacity(0.5),
                              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(200), bottomRight: Radius.circular(200)),
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
                )),
            Positioned(
              top: 300,
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
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
            )
          ],
        ),
      ),
    );
  }
}
