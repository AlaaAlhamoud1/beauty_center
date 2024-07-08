import 'package:beauty_center/application/offers/models/offer_model.dart';
import 'package:beauty_center/application/offers/screens/offer_details_screen.dart';
import 'package:beauty_center/core/values/values.dart';
import 'package:flutter/material.dart';

class OfferAdsWidget extends StatelessWidget {
  final OfferModel offerModel;
  const OfferAdsWidget({super.key, required this.offerModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(ImagePath.testOfferImage), fit: BoxFit.fill),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          const Spacer(
            flex: 3,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Text(
                        offerModel.title ?? "",
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      )),
                      Expanded(
                          child: Text(
                        offerModel.description ?? "",
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        maxLines: 2,
                      ))
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            OfferDetailsScreen(id: offerModel.id ?? 0),
                      ),
                    );
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          30,
                        ),
                      ),
                    ),
                    child: Text(
                      'Details',
                      style: TextStyle(color: AppColors.lightGoldColor),
                    ),
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
