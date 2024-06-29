import 'package:flutter/material.dart';
import 'package:on_a_trip/features/destination_screen/presentation/widgets/proposal_tile_widget.dart';

class ProposalWidget extends StatelessWidget {
  const ProposalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          ProposalTileWidget(),
          ProposalTileWidget(),
          ProposalTileWidget(),
          ProposalTileWidget(),
          ProposalTileWidget(),
          ProposalTileWidget(),
        ],
      ),
    );
  }
}
