import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'notification_page2.dart';

class ProfileDetailsPage extends StatefulWidget {
  const ProfileDetailsPage({super.key});

  @override
  State<ProfileDetailsPage> createState() => _ProfileDetailsPageState();
}

class _ProfileDetailsPageState extends State<ProfileDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.arrow_back_ios,
                        size: 24,
                        color: Colors.white,
                      ),
                      const Spacer(),
                      Text(
                        "Profile",
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                      ),
                      const Spacer(),
                      // Image.asset("assets/icon/menu.png")
                    ],
                  ),
                ],
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
                          "https://media.istockphoto.com/id/1437816897/photo/business-woman-manager-or-human-resources-portrait-for-career-success-company-we-are-hiring.webp?b=1&s=170667a&w=0&k=20&c=YQ_j83pg9fB-HWOd1Qur3_kBmG_ot_hZty8pvoFkr6A=",
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
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(200),
                                bottomRight: Radius.circular(200)),
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
                  Text(
                    "Your name",
                    style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      // Replace with your desired icon
                      hintText: 'John Smith',
                      border: UnderlineInputBorder(),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),

                  ),
                  const SizedBox(height: 30,),


                  Text(
                    "Phone number",
                    style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone_android),
                      // Replace with your desired icon
                      hintText: '+84 878 798',
                      border: UnderlineInputBorder(),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),

                  ),
                  const SizedBox(height: 30,),
                  Text(
                    "Change password",
                    style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                  ),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: Icon(Icons.visibility_off),
                      // Replace with your desired icon
                      hintText: 'Enter Change password',
                      border: UnderlineInputBorder(),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),

                  ),
                  const SizedBox(height: 30,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFFF4F3FD), // Light purple color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // Adjust the radius as needed
                        ),
                      ),
                      onPressed: () {
                        // Define your button functionality here
                      },
                      child: const Text(
                        'Confirm',
                        style: TextStyle(color: Color(0xFF583EF2)), // Adjust the text style as needed
                      ),
                    ),
                  ),

                  const Spacer(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF583EF2), // Light purple color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // Adjust the radius as needed
                        ),
                      ),
                      onPressed: () {
                        Get.to(const NotificationPage2());
                      },
                      child: const Text(
                        'Save',
                        style: TextStyle(color: Colors.white), // Adjust the text style as needed
                      ),
                    ),
                  ),
                  const SizedBox(height: 30,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
