part of 'deal_bloc.dart';

abstract class DealEvent extends Equatable {
  const DealEvent();

  @override
  List<Object> get props => [];
}

class ShowAllDeals extends DealEvent {}

class ShowOnlyBuyDeals extends DealEvent {}

class ShowOnlySellDeals extends DealEvent {}

class Searching extends DealEvent {}

class NotSearcing extends DealEvent {}

class SearchKeyWordChanged extends DealEvent {
  final String keyword;

  const SearchKeyWordChanged({required this.keyword});
}
