import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/common/constants/colors.dart';
import 'package:on_a_trip/common/constants/spaces.dart';
import 'package:on_a_trip/common/helper/utils.dart';
import 'package:on_a_trip/common/widgets/back_button_appbar.dart';
import 'package:on_a_trip/common/widgets/custom_container.dart';

class BiddingDetailsScreen extends StatefulWidget {
  const BiddingDetailsScreen({super.key});

  @override
  State<BiddingDetailsScreen> createState() => _BiddingDetailsScreenState();
}

class _BiddingDetailsScreenState extends State<BiddingDetailsScreen> {
  final TextEditingController _bidAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: Spaces.defaultVerticalPadding,
            horizontal: Spaces.defaultHorizontalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackButtonAppBar(
                title: "Bid Details",
              ),
              SizedBox(height: 16.h),
              CachedNetworkImage(
                imageUrl: "https://blog.thomascook.in/wp-content/uploads/2017/01/Santorini-Greece.jpg",
                imageBuilder: (context, imageProvider) => Container(
                  height: 200.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => Container(
                  width: 64,
                  height: 64,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: CustomColors.highlightText,
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              CustomContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    const Text(
                      "Looking for tour package from Manali, Himachal Pradesh to Goa, Maharashtra",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    const Text(
                      "Additional Information about the Leads",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    const Divider(),
                    SizedBox(height: 4.h),
                    const AdditionalnformationWidget(
                      title: "Looking for",
                      value: "Tour Package",
                    ),
                    SizedBox(height: 6.h),
                    const AdditionalnformationWidget(
                      title: "No. of Child",
                      value: "2",
                    ),
                    SizedBox(height: 6.h),
                    const AdditionalnformationWidget(
                      title: "No. of Adults",
                      value: "2",
                    ),
                    SizedBox(height: 6.h),
                    const AdditionalnformationWidget(
                      title: "Start City",
                      value: "Manali",
                    ),
                    SizedBox(height: 6.h),
                    const AdditionalnformationWidget(
                      title: "Destination",
                      value: "Goa",
                    ),
                    SizedBox(height: 6.h),
                    const AdditionalnformationWidget(
                      title: "Check-In",
                      value: "12 Dec 2024",
                    ),
                    SizedBox(height: 6.h),
                    const AdditionalnformationWidget(
                      title: "Check-Out",
                      value: "20 Dec 2024",
                    ),
                    SizedBox(height: 6.h),
                    const AdditionalnformationWidget(
                      title: "Hotel Category",
                      value: "4 Star",
                    ),
                    SizedBox(height: 4.h),
                    const Divider(),
                    SizedBox(height: 4.h),
                    const Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Posted on: 18 Oct 2024",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: CustomColors.primaryColor,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "42:23:43s Left",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: CustomColors.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.h),
                    const Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Current Bid Amount: Rs. 26000",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: CustomColors.primaryColor,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "2 Bids",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: CustomColors.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          try {
                            final data = await showDialog<String?>(
                              context: context,
                              builder: (context) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                contentPadding: const EdgeInsets.all(16),
                                content: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Enter Your Bid Amount",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          IconButton(
                                            splashRadius: 20,
                                            padding: EdgeInsets.zero,
                                            icon: const Icon(Icons.close),
                                            visualDensity: VisualDensity.compact,
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 16.h),
                                      TextFormField(
                                        controller: _bidAmountController,
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                          labelText: "Enter Amount",
                                          prefixIcon: Icon(Icons.attach_money_rounded),
                                        ),
                                      ),
                                      SizedBox(height: 20.h),
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            final bid = _bidAmountController.text;
                                            if (bid.isEmpty) {
                                              Utils.showSnackBar(context, content: "Please enter bid amount");
                                              return;
                                            }
                                            Navigator.of(context).pop(bid);
                                          },
                                          child: const Text("Place Your Bid"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                            if (data != null) {
                              Utils.showSnackBar(
                                context,
                                content: "Placed a bid of Rs. $data",
                              );
                            }
                          } catch (e) {
                            Utils.showSnackBar(context, content: e.toString());
                          }
                        },
                        child: const Text("Bid Now"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdditionalnformationWidget extends StatelessWidget {
  const AdditionalnformationWidget({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        const Text(
          ":",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
