import 'package:beauty_center/application/home/widgets/carosel_slider_widget.dart';
import 'package:beauty_center/application/offers/bloc/bloc/offer_bloc.dart';
import 'package:beauty_center/core/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<OfferBloc>(context).add(GetOffersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Best offers",
                style: TextStyle(
                    color: AppColors.darkGreyColor,
                    fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "See more",
                  style: TextStyle(
                      color: AppColors.lightGoldColor,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.lightGoldColor),
                ),
              ),
            ],
          ),
        ),
        const Align(alignment: Alignment.center, child: CaroselSliderWidget()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Recommended",
            style: TextStyle(
                color: AppColors.darkGreyColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
