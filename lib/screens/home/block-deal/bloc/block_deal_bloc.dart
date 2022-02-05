import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '/models/deal.dart';
import '/models/failure.dart';
import '/respositories/deal/deal_repository.dart';

part 'block_deal_event.dart';
part 'block_deal_state.dart';

class BlockDealBloc extends Bloc<BlockDealEvent, BlockDealState> {
  final DealRepository _dealRepository;

  BlockDealBloc({required DealRepository dealRepository})
      : _dealRepository = dealRepository,
        super(BlockDealState.initial()) {
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
      ShowOnlySellDeals event, Emitter<BlockDealState> emit) async {
    try {
      emit(state.copyWith(status: BlockDealStatus.loading));
      final deals = await _dealRepository.getBlockDeals();

      print('Block deals --------- $deals');

      final sellDeals =
          deals.where((element) => element?.dealType == 'SELL').toList();

      emit(BlockDealState.showOnlySellDeals(deals: sellDeals));
    } catch (error) {
      emit(
        state.copyWith(
          failure: Failure(message: error.toString()),
          status: BlockDealStatus.error,
        ),
      );
    }
  }

  Future<void> _searching(
      SearchKeyWordChanged event, Emitter<BlockDealState> emit) async {
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
    Emitter<BlockDealState> emit,
  ) async {
    try {
      emit(state.copyWith(status: BlockDealStatus.loading));
      final deals = await _dealRepository.getBlockDeals();
      //getBulkDeals();

      print('Block deals --------- $deals');
      emit(BlockDealState.showAllDeals(deals: deals));
    } catch (error) {
      emit(
        state.copyWith(
          failure: Failure(message: error.toString()),
          status: BlockDealStatus.error,
        ),
      );
    }
  }

  Future<void> _showOnlyBuyDeals(
    ShowOnlyBuyDeals event,
    Emitter<BlockDealState> emit,
  ) async {
    try {
      emit(state.copyWith(status: BlockDealStatus.loading));

      final deals = await _dealRepository.getBlockDeals();

      final buyDeals =
          deals.where((element) => element?.dealType == 'BUY').toList();

      print('Buy Deals -----$buyDeals');

      emit(BlockDealState.showOnlyBuyDeals(deals: buyDeals));
    } catch (error) {
      emit(
        state.copyWith(
          failure: Failure(message: error.toString()),
          status: BlockDealStatus.error,
        ),
      );
    }
  }
}
