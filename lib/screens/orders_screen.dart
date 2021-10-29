import 'package:flutter/material.dart';
import 'package:new_shop_app/widgets/emtycartscreen.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';
import '../widgets/app_drawer.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    print('building orders');
    // final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (dataSnapshot.error != null) {
              // ...
              // Do error handling stuff
              return Center(
                child: Text('An error occurred!'),
              );
            } else {
              return Consumer<Orders>(
                builder: (ctx, orderData, child) =>orderData.orders.isEmpty?_emptyOrders(): ListView.builder(
                      itemCount: orderData.orders.length,
                      itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
                    ),
              );
            }
          }
        },
      ),
    );
  }
  Widget _emptyOrders(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: 45,
        ),
        Text('No Orders Found',
            style: 
              
                  TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            
            ),
        SizedBox(height: 12),
        Text(
          'Please add Order',
          style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.grey),
        
        ),
        SizedBox(height: 60),
        Image.asset('./images/notification.png'),
        SizedBox(height:25),
      ],
    );
  }
}
