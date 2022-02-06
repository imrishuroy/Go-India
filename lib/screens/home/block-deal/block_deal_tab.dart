import 'package:flutter/material.dart';
import '/widgets/show_list_items.dart';
import 'bloc/block_deal_bloc.dart';
import '/widgets/custom_button.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class BlockDealsTab extends StatefulWidget {
  const BlockDealsTab({Key? key}) : super(key: key);

  @override
  State<BlockDealsTab> createState() => _BlockDealsTabState();
}

class _BlockDealsTabState extends State<BlockDealsTab> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlocConsumer<BlockDealBloc, BlockDealState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.status == BlockDealStatus.succuss) {
            return Column(
              children: [
                const SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      buttonColor: Colors.blue,
                      onPressed: () =>
                          context.read<BlockDealBloc>().add(ShowAllDeals()),
                      showBorder: state.buttonStatus == ButtonStatus.all,
                      label: 'All',
                    ),
                    CustomButton(
                      buttonColor: Colors.green,
                      onPressed: () =>
                          context.read<BlockDealBloc>().add(ShowOnlyBuyDeals()),
                      showBorder: state.buttonStatus == ButtonStatus.buy,
                      label: 'Buy',
                    ),
                    CustomButton(
                      buttonColor: Colors.red,
                      onPressed: () => context
                          .read<BlockDealBloc>()
                          .add(ShowOnlySellDeals()),
                      showBorder: state.buttonStatus == ButtonStatus.sell,
                      label: 'Sell',
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) => context
                        .read<BlockDealBloc>()
                        .add(SearchKeyWordChanged(keyword: value)),
                    decoration: InputDecoration(
                      hintText: 'Search Client Name',
                      hintStyle: const TextStyle(fontWeight: FontWeight.w600),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      suffixIcon: state.searching
                          ? InkWell(
                              onTap: () {
                                _searchController.clear();
                                context
                                    .read<BlockDealBloc>()
                                    .add(NotSearcing());
                              },
                              child: const Icon(Icons.clear),
                            )
                          : const Icon(
                              Icons.search,
                              color: Colors.green,
                            ),
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                Expanded(
                    child: state.searching
                        ? ShowListItems(deals: state.searchDeals)
                        : ShowListItems(deals: state.deals)),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
