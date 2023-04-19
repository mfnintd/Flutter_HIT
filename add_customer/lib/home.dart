import 'package:flutter/material.dart';
import 'addcustomer.dart';
import 'customer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  List<Customer> customers = <Customer>[
    Customer(
      name: 'Duy',
      type: 1,
      city: 'Vĩnh Phúc',
      phoneNumber: null,
    ),
    Customer(
      name: 'Duy',
      type: 2,
      city: 'Vĩnh Phúc',
      phoneNumber: '0123456789',
    ),
    Customer(
      name: 'Duy',
      type: 3,
      city: 'Vĩnh Phúc',
      phoneNumber: '0123456789',
    ),
  ];

  late final TabController _tabController =
      TabController(length: 4, vsync: this);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddCustomerScreen(
                        customers: customers,
                      ),
                    ),
                  ).then(
                    (value) {
                      setState(() {});
                    },
                  );
                },
                icon: const Icon(
                  Icons.add,
                ),
              ),
            ),
          ],
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: const <Widget>[
              Tab(
                child: Text('Tất cả'),
              ),
              Tab(
                child: Text('Khách hàng'),
              ),
              Tab(
                child: Text('Khách hàng và nhà cung cấp'),
              ),
              Tab(
                child: Text('Nhà cung cấp'),
              ),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
          child: TabBarView(
            controller: _tabController,
            children: [
              _tatCaBuilder(),
              _khachHangBuilder(),
              _khachHangVaNhaCungCapBuilder(),
              _nhaCungCapBuilder(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tatCaBuilder() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: ListView.builder(
          itemCount: customers.length,
          itemBuilder: (BuildContext context, int index) {
            return _customerBuilder(customers[index]);
          }),
    );
  }

  Widget _khachHangBuilder() {
    List<Customer> tmp =
        customers.where((element) => element.type == 1).toList();
    return Container(
      margin: const EdgeInsets.all(16),
      child: ListView.builder(
          itemCount: tmp.length,
          itemBuilder: (BuildContext context, int index) {
            return _customerBuilder(tmp[index]);
          }),
    );
  }

  Widget _khachHangVaNhaCungCapBuilder() {
    List<Customer> tmp =
        customers.where((element) => element.type == 2).toList();
    return Container(
      margin: const EdgeInsets.all(16),
      child: ListView.builder(
          itemCount: tmp.length,
          itemBuilder: (BuildContext context, int index) {
            return _customerBuilder(tmp[index]);
          }),
    );
  }

  Widget _nhaCungCapBuilder() {
    List<Customer> tmp =
        customers.where((element) => element.type == 3).toList();
    return Container(
      margin: const EdgeInsets.all(16),
      child: ListView.builder(
          itemCount: tmp.length,
          itemBuilder: (BuildContext context, int index) {
            return _customerBuilder(tmp[index]);
          }),
    );
  }

  Widget _customerBuilder(Customer customer) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            customer.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          if (customer.phoneNumber != null && customer.phoneNumber!.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(),
                Text(
                  customer.phoneNumber!,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
