// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'offer_bloc.dart';

class OfferEvent {}

class GetOffersEvent extends OfferEvent {}

class GetOfferByIdEvent extends OfferEvent {
  String id;
  GetOfferByIdEvent({
    required this.id,
  });
}
