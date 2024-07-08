// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:beauty_center/application/offers/models/offer_model.dart';
import 'package:beauty_center/configure_di.dart';
import 'package:beauty_center/core/data/new_remote/network_service.dart';
import 'package:beauty_center/core/data/new_remote/response_model.dart';

abstract class OfferRepository {
  Future getOffers();
  Future<OfferModel> getOfferById({required String id});
}

class OfferRepositoryImpl implements OfferRepository {
  NetworkService networkService;
  OfferRepositoryImpl(
    this.networkService,
  );

  @override
  Future getOffers() async {
    ResponseModel response = await getIt<NetworkService>().sendRequest(
      'offers',
      method: HttpMethod.get,
    );
    if (response.content["offers"] != null) {
      return (response.content["offers"] as List<dynamic>)
          .map((e) => OfferModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      return [];
    }
  }

  @override
  Future<OfferModel> getOfferById({required String id}) async {
    ResponseModel response = await getIt<NetworkService>().sendRequest(
      'offers/$id',
      method: HttpMethod.get,
    );

    return OfferModel.fromJson(response.content);
  }
}
