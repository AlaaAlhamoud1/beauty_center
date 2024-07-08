import 'package:beauty_center/application/offers/models/offer_model.dart';
import 'package:beauty_center/application/offers/repository/offer_repository.dart';
import 'package:beauty_center/configure_di.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'offer_event.dart';
part 'offer_state.dart';

class OfferBloc extends Bloc<OfferEvent, OfferState> {
  OfferBloc() : super(OfferState.initial()) {
    on<GetOffersEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true, response: null));
      await getIt<OfferRepository>().getOffers().then((value) async {
        emit(state.copyWith(response: value, isLoading: false));
      }).catchError((e) {
        emit(state.copyWith(
            message: e.toString(), isLoading: false, response: null));
        // toast('$e', bgColor: const Color(0xff2B3C4E));
      });
    });

    on<GetOfferByIdEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true, offer: null));
      await getIt<OfferRepository>()
          .getOfferById(id: event.id)
          .then((value) async {
        emit(state.copyWith(offer: value, isLoading: false)); 
      }).catchError((e) {
        emit(state.copyWith(
            message: e.toString(), isLoading: false, offer: null));
        // toast('$e', bgColor: const Color(0xff2B3C4E));
      });
    });
  }
}
