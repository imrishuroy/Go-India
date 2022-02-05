part of 'block_deal_bloc.dart';

enum BlockDealStatus { initial, loading, succuss, error }

enum ButtonStatus { all, buy, sell }

class BlockDealState extends Equatable {
  final List<Deal?> deals;
  final Failure? failure;
  final BlockDealStatus status;
  final ButtonStatus buttonStatus;
  final bool searching;
  final List<Deal?> searchDeals;
  final String? searchKeyWord;

  const BlockDealState({
    required this.deals,
    this.failure,
    required this.status,
    required this.buttonStatus,
    this.searching = false,
    this.searchDeals = const [],
    this.searchKeyWord,
  });

  BlockDealState copyWith({
    List<Deal?>? deals,
    Failure? failure,
    BlockDealStatus? status,
    ButtonStatus? buttonStatus,
    bool? searching,
    List<Deal?>? searchDeals,
    String? searchKeyWord,
  }) {
    return BlockDealState(
      deals: deals ?? this.deals,
      failure: failure ?? this.failure,
      status: status ?? this.status,
      buttonStatus: buttonStatus ?? this.buttonStatus,
      searching: searching ?? this.searching,
      searchDeals: searchDeals ?? this.searchDeals,
      searchKeyWord: searchKeyWord ?? this.searchKeyWord,
    );
  }

  factory BlockDealState.initial() => const BlockDealState(
        deals: [],
        failure: Failure(),
        status: BlockDealStatus.initial,
        buttonStatus: ButtonStatus.all,
        searching: false,
        searchDeals: [],
        searchKeyWord: '',
      );

  factory BlockDealState.showAllDeals({required List<Deal?> deals}) =>
      BlockDealState(
        deals: deals,
        status: BlockDealStatus.succuss,
        buttonStatus: ButtonStatus.all,
      );

  factory BlockDealState.showOnlyBuyDeals({required List<Deal?> deals}) =>
      BlockDealState(
        deals: deals,
        status: BlockDealStatus.succuss,
        buttonStatus: ButtonStatus.buy,
      );

  factory BlockDealState.showOnlySellDeals({required List<Deal?> deals}) =>
      BlockDealState(
        deals: deals,
        status: BlockDealStatus.succuss,
        buttonStatus: ButtonStatus.sell,
      );

  @override
  List<Object?> get props {
    return [
      deals,
      failure,
      status,
      buttonStatus,
      searching,
      searchDeals,
      searchKeyWord,
    ];
  }
}
