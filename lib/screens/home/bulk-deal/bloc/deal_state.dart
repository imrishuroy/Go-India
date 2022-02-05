part of 'deal_bloc.dart';

enum DealStatus { initial, loading, succuss, error }

enum ButtonStatus { all, buy, sell }

class DealState extends Equatable {
  final List<Deal?> deals;
  final Failure? failure;
  final DealStatus status;
  final ButtonStatus buttonStatus;
  final bool searching;
  final List<Deal?> searchDeals;
  final String? searchKeyWord;

  const DealState({
    required this.deals,
    this.failure,
    required this.status,
    required this.buttonStatus,
    this.searching = false,
    this.searchDeals = const [],
    this.searchKeyWord,
  });

  factory DealState.initial() => const DealState(
        deals: [],
        failure: Failure(),
        status: DealStatus.initial,
        buttonStatus: ButtonStatus.all,
        searching: false,
        searchDeals: [],
        searchKeyWord: '',
      );

  factory DealState.showAllDeals({required List<Deal?> deals}) => DealState(
        deals: deals,
        status: DealStatus.succuss,
        buttonStatus: ButtonStatus.all,
      );

  factory DealState.showOnlyBuyDeals({required List<Deal?> deals}) => DealState(
        deals: deals,
        status: DealStatus.succuss,
        buttonStatus: ButtonStatus.buy,
      );

  factory DealState.showOnlySellDeals({required List<Deal?> deals}) =>
      DealState(
        deals: deals,
        status: DealStatus.succuss,
        buttonStatus: ButtonStatus.sell,
      );

  @override
  List<Object?> get props => [
        deals,
        failure,
        status,
        searching,
        searchDeals,
        searchKeyWord,
      ];

  DealState copyWith({
    List<Deal?>? deals,
    Failure? failure,
    DealStatus? status,
    ButtonStatus? buttonStatus,
    bool? searching,
    List<Deal?>? searchDeals,
    String? searchKeyWord,
  }) {
    return DealState(
      deals: deals ?? this.deals,
      failure: failure ?? this.failure,
      status: status ?? this.status,
      buttonStatus: buttonStatus ?? this.buttonStatus,
      searching: searching ?? this.searching,
      searchDeals: searchDeals ?? this.searchDeals,
      searchKeyWord: searchKeyWord ?? this.searchKeyWord,
    );
  }
}
