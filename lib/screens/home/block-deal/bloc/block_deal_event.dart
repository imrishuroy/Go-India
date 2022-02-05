part of 'block_deal_bloc.dart';

abstract class BlockDealEvent extends Equatable {
  const BlockDealEvent();

  @override
  List<Object> get props => [];
}

class ShowAllDeals extends BlockDealEvent {}

class ShowOnlyBuyDeals extends BlockDealEvent {}

class ShowOnlySellDeals extends BlockDealEvent {}

class Searching extends BlockDealEvent {}

class NotSearcing extends BlockDealEvent {}

class SearchKeyWordChanged extends BlockDealEvent {
  final String keyword;

  const SearchKeyWordChanged({required this.keyword});
}
