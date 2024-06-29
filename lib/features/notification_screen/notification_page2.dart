import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationPage2 extends StatefulWidget {
  const NotificationPage2({super.key});

  @override
  State<NotificationPage2> createState() => _NotificationPage2State();
}

class _NotificationPage2State extends State<NotificationPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(
                  height: 80,
                ),
                const Icon(
                  Icons.arrow_back_ios,
                  size: 24,
                ),
                const Spacer(),
                Text(
                  "Notification",
                  style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600)),
                ),
                const Spacer(),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(bottom: 10),
              height: 161,
              decoration: const BoxDecoration(
                  color: Color(0xFFAEE8FC),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Center(child: Image.asset("assets/icon/nt2.png")),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Now we got new service for your sofa ",
              style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w600)),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "1/1/2021",
              style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w600)),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
              style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF78789D),
                      fontWeight: FontWeight.w600)),
            ),
            Spacer(),
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
                  'view',
                  style: TextStyle(color: Color(0xFF583EF2)), // Adjust the text style as needed
                ),
              ),
            ),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
