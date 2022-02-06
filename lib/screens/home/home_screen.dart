import 'package:flutter/material.dart';
import '/screens/home/bulk-deal/bloc/deal_bloc.dart' as bulk;
import '/respositories/deal/deal_repository.dart';
import 'block-deal/bloc/block_deal_bloc.dart';
import 'block-deal/block_deal_tab.dart';
import 'bulk-deal/bulk_deal_tab.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xfff5f5f5),
        appBar: AppBar(
          title: const Text(
            'Go India Stocks',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xfff5f5f5),
          bottom: const TabBar(
            labelColor: Colors.blue,
            indicatorColor: Colors.orange,
            indicatorWeight: 3.0,
            tabs: [
              Tab(text: 'Bulk Deal'),
              Tab(text: 'Block Deal'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BlocProvider<bulk.DealBloc>(
              create: (context) => bulk.DealBloc(
                dealRepository: context.read<DealRepository>(),
              )..add(bulk.ShowAllDeals()),
              child: const BulkDealTab(),
            ),
            BlocProvider<BlockDealBloc>(
              create: (context) => BlockDealBloc(
                dealRepository: context.read<DealRepository>(),
              )..add(ShowAllDeals()),
              child: const BlockDealsTab(),
            ),
          ],
        ),
      ),
    );
  }
}
