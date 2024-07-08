import 'package:beauty_center/application/offers/bloc/bloc/offer_bloc.dart';
import 'package:beauty_center/core/utils/extensions/context_extensions.dart';
import 'package:beauty_center/core/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OfferDetailsScreen extends StatefulWidget {
  final int id;
  const OfferDetailsScreen({super.key, required this.id});

  @override
  State<OfferDetailsScreen> createState() => _OfferDetailsScreenState();
}

class _OfferDetailsScreenState extends State<OfferDetailsScreen> {
  @override
  void initState() {
    BlocProvider.of<OfferBloc>(context)
        .add(GetOfferByIdEvent(id: widget.id.toString()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<OfferBloc, OfferState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.offer != null) {
          return Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
            floatingActionButton: Padding(
              padding: EdgeInsets.only(top: size.height / 10),
              child: const CircleAvatar(
                minRadius: 35,
                maxRadius: 50,
                backgroundColor: Colors.amber,
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: size.height / 4,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.bottomCenter,
                      fit: BoxFit.fill,
                      image: AssetImage(ImagePath.detailsImage),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Spacer(),
                      Expanded(
                          child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                context.pop();
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              )),
                        ],
                      )),
                      Expanded(
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Text(
                                state.offer!.title ?? "",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: AppFonts.maxFontSize),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            const Spacer(
                              flex: 6,
                            ),
                            SvgPicture.asset(
                              IconPath.loveIcon,
                              color: Colors.white,
                            ),
                            Expanded(
                              child: Text(
                                state.offer!.likes != null
                                    ? state.offer!.likes.toString()
                                    : "",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: AppFonts.minFontSize.spMin),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Spacer(),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text("connect with us"),
                                SvgPicture.asset(IconPath.facebookIcon),
                                SvgPicture.asset(IconPath.whatsappIcon),
                                SvgPicture.asset(IconPath.instagramIcon)
                              ],
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Row(
                                  children: [
                                    Text(
                                      state.offer!.title ?? "",
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  RatingBarIndicator(
                                    rating: state.offer!.rate != null
                                        ? state.offer!.rate!.toDouble()
                                        : 0,
                                    itemCount: 5,
                                    itemSize: 30.0,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                  ),
                                  Text(
                                    state.offer!.rate != null
                                        ? state.offer!.rate!.toString()
                                        : "",
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.red,
                                  ),
                                  Text(state.offer!.venue != null
                                      ? state.offer!.venue!.city != null
                                          ? state.offer!.venue!.city!.name ?? ""
                                          : ""
                                      : "")
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: SvgPicture.asset(
                                        IconPath.calendarIcon,
                                        fit: BoxFit.fill,
                                      )),
                                  Text(
                                    "Openfrom",
                                    style: TextStyle(
                                        color: AppColors.blueColor,
                                        decoration: TextDecoration.underline,
                                        decorationColor:
                                            AppColors.lightGoldColor),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Sunday to Saturday",
                                    style: TextStyle(
                                      color: AppColors.darkGreyColor,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: SvgPicture.asset(
                                      IconPath.calendarIcon,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Text(
                                    "from",
                                    style: TextStyle(
                                        color: AppColors.blueColor,
                                        decoration: TextDecoration.underline,
                                        decorationColor:
                                            AppColors.lightGoldColor),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "8  Am  until  7  Pm",
                                    style: TextStyle(
                                      color: AppColors.darkGreyColor,
                                    ),
                                  ),
                                ],
                              ),
                              Image.asset(ImagePath.mapImage)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
