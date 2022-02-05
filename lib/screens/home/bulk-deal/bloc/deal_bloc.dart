import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '/models/deal.dart';
import '/models/failure.dart';
import '/respositories/deal/deal_repository.dart';

part 'deal_event.dart';
part 'deal_state.dart';

class DealBloc extends Bloc<DealEvent, DealState> {
  final DealRepository _dealRepository;

  DealBloc({
    required DealRepository dealRepository,
  })  : _dealRepository = dealRepository,
        super(DealState.initial()) {
    on<ShowAllDeals>(_showAllDeals);
    on<ShowOnlyBuyDeals>(_showOnlyBuyDeals);
    on<ShowOnlySellDeals>(_showOnlySellDeals);
    on<SearchKeyWordChanged>(_searching);
    on<Searching>((event, emit) {
      emit(state.copyWith(searching: true));
    });
    on<NotSearcing>((event, emit) {
      emit(state.copyWith(searching: false));
    });
  }

  Future<void> _showOnlySellDeals(
      ShowOnlySellDeals event, Emitter<DealState> emit) async {
    try {
      emit(state.copyWith(status: DealStatus.loading));
      final deals = await _dealRepository.getBulkDeals();

      final sellDeals =
          deals.where((element) => element?.dealType == 'SELL').toList();

      emit(DealState.showOnlySellDeals(deals: sellDeals));
    } catch (error) {
      emit(
        state.copyWith(
          failure: Failure(message: error.toString()),
          status: DealStatus.error,
        ),
      );
    }
  }

  Future<void> _searching(
      SearchKeyWordChanged event, Emitter<DealState> emit) async {
    final searchDeals = state.deals
        .where((element) =>
            element?.clientName
                ?.toUpperCase()
                .contains(event.keyword.toUpperCase()) ??
            false)
        .toList();
    emit(
      state.copyWith(
        searchKeyWord: event.keyword,
        searchDeals: searchDeals,
        searching: true,
      ),
    );
  }

  Future<void> _showAllDeals(
    ShowAllDeals event,
    Emitter<DealState> emit,
  ) async {
    try {
      emit(state.copyWith(status: DealStatus.loading));
      final deals = await _dealRepository.getBulkDeals();
      //getBulkDeals();
      emit(DealState.showAllDeals(deals: deals));
    } catch (error) {
      emit(
        state.copyWith(
          failure: Failure(message: error.toString()),
          status: DealStatus.error,
        ),
      );
    }
  }

  Future<void> _showOnlyBuyDeals(
    ShowOnlyBuyDeals event,
    Emitter<DealState> emit,
  ) async {
    try {
      emit(state.copyWith(status: DealStatus.loading));

      final deals = await _dealRepository.getBulkDeals();

      final buyDeals =
          deals.where((element) => element?.dealType == 'BUY').toList();

      print('Buy Deals -----$buyDeals');

      emit(DealState.showOnlyBuyDeals(deals: buyDeals));
    } catch (error) {
      emit(
        state.copyWith(
          failure: Failure(message: error.toString()),
          status: DealStatus.error,
        ),
      );
    }
  }
}
