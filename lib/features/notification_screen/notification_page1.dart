import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Row(
              children: [
                const Icon(Icons.arrow_back_ios,size: 24,),
                const Spacer(),
                Image.asset("assets/icon/menu.png")
              ],
            ),
            SizedBox(height: 20,),
            Text(
              "Notification",
              style: GoogleFonts.montserrat(
                  textStyle:
                  const TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.w600)),
            ),
            const SizedBox(height: 10,),
            Expanded(
              child: Stack(
                children: [
                  ListView.builder(

                    itemBuilder: (BuildContext context,int index){
                      return notificationCard();
                    },
                    itemCount: 10,),

                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.only(left: 30,right: 30),
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white, // Background color
                        borderRadius: BorderRadius.circular(27), // Border radius
                        boxShadow: const[
                          BoxShadow(
                            color: Color(0xFFF0F2F2), // Shadow color
                            blurRadius: 19, // Blur radius
                            offset: Offset(0, 12), // Shadow offset
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("assets/icon/home.png"),
                          Image.asset("assets/icon/map_icon.png"),
                          Image.asset("assets/icon/notification.png"),
                          Image.asset("assets/icon/user.png"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )


          ],
        ),
      ),

    );
  }

  notificationCard(){
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      height: 100,
      decoration: const BoxDecoration(
          color:Color(0xFFF4F3FD) ,
          borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            height: 70,
            width: 70,
            decoration: const BoxDecoration(
              color:Color(0xFFFFEBF0) ,
              borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
            ),
            child: Image.asset("assets/icon/gift_icon.png"),
          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "New Proposal from Anurag ",
                style: GoogleFonts.montserrat(
                    textStyle:
                    const TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.w600)),
              ),
              Text(
                "Rs. 12,000",
                style: GoogleFonts.montserrat(
                    textStyle:
                    const TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.w600)),
              ),
              Text(
                "14 mins ago",
                style: GoogleFonts.montserrat(
                    textStyle:
                    const TextStyle(fontSize: 12, color: Color(0xFF78789D),fontWeight: FontWeight.w600)),
              ),
            ],
          )
        ],),
    );
  }

}
