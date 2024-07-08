part of 'offer_bloc.dart';

@immutable
class OfferState {
  final List<OfferModel>? response;
  final OfferModel? offer;
  final String? message;
  final bool? isLoading;

  const OfferState({
    this.response,
    this.offer,
    this.message,
    this.isLoading,
  });

  factory OfferState.initial() => const OfferState();

  OfferState copyWith(
      {List<OfferModel>? response,
      OfferModel? offer,
      String? selectedCategoryId,
      String? message,
      bool? isLoading}) {
    return OfferState(
        offer: offer ?? offer,
        isLoading: isLoading ?? this.isLoading,
        message: message ?? this.message,
        response: response ?? this.response);
  }
}
