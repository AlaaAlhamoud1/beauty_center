import 'package:beauty_center/application/home/widgets/offer_ads_widget.dart';
import 'package:beauty_center/application/offers/bloc/bloc/offer_bloc.dart';
import 'package:beauty_center/core/utils/extensions/int_extensions.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CaroselSliderWidget extends StatelessWidget {
  const CaroselSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OfferBloc, OfferState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.response != null) {
          return CarouselSlider(
              items: List.generate(
                  state.response!.length,
                  (index) =>
                      OfferAdsWidget(offerModel: state.response![index])),
              options: CarouselOptions(
                onPageChanged: (index, reason) {},
                viewportFraction: 1,
                disableCenter: false,
                autoPlayInterval: 3.seconds,
                autoPlay: state.response!.length > 1,
                pauseAutoPlayInFiniteScroll: true,
                pauseAutoPlayOnManualNavigate: true,
              ));
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
