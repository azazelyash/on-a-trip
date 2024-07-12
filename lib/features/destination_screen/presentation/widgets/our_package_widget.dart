import 'package:flutter/material.dart';
import 'package:on_a_trip/features/destination_screen/presentation/widgets/saved_places_list_widget.dart';

class OurPackagesWidget extends StatelessWidget {
  const OurPackagesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SavedPlacesListWidget(
            onTap: () {},
            imageUrl: "https://blog.thomascook.in/wp-content/uploads/2017/01/Santorini-Greece.jpg",
            title: "Snorkling at Kuta Beach",
            locationSubtitle: "Bali, Indonesia",
          ),
          SavedPlacesListWidget(
            onTap: () {},
            imageUrl: "https://media.timeout.com/images/106032809/750/562/image.jpg",
            title: "Snorkling at Kuta Beach",
            locationSubtitle: "Bali, Indonesia",
          ),
          SavedPlacesListWidget(
            onTap: () {},
            imageUrl: "https://ihplb.b-cdn.net/wp-content/uploads/2021/06/Maldives.jpeg",
            title: "Snorkling at Kuta Beach",
            locationSubtitle: "Bali, Indonesia",
          ),
          SavedPlacesListWidget(
            onTap: () {},
            imageUrl: "https://theplanetd.com/images/vietnam-sapa-rice-terraces.jpg",
            title: "Snorkling at Kuta Beach",
            locationSubtitle: "Bali, Indonesia",
          ),
          SavedPlacesListWidget(
            onTap: () {},
            imageUrl: "https://blog.thomascook.in/wp-content/uploads/2017/01/Cappadocia-Turkey-popsugar.com_.jpg",
            title: "Snorkling at Kuta Beach",
            locationSubtitle: "Bali, Indonesia",
          ),
        ],
      ),
    );
  }
}
