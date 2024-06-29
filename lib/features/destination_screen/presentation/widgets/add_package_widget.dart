import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/common/widgets/custom_container.dart';

class AddPackageWidget extends StatelessWidget {
  const AddPackageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: "https://blog.thomascook.in/wp-content/uploads/2017/01/Santorini-Greece.jpg",
            imageBuilder: (context, imageProvider) => Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: const Text(
                    "Create your custom package!",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          CustomContainer(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Your Destination",
                    prefixIcon: Icon(Icons.place_outlined),
                  ),
                ),
                SizedBox(height: 12.h),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Duration",
                    prefixIcon: Icon(Icons.timelapse),
                  ),
                ),
                SizedBox(height: 12.h),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Travel Date",
                    prefixIcon: Icon(Icons.date_range),
                  ),
                ),
                SizedBox(height: 12.h),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Budget",
                    prefixIcon: Icon(Icons.attach_money_outlined),
                  ),
                ),
                SizedBox(height: 12.h),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Message",
                    prefixIcon: Icon(Icons.message_outlined),
                  ),
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Create Package"),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
