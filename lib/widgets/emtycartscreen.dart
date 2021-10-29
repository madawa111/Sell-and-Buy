import 'package:flutter/material.dart';


class EmtyCartScreen extends StatelessWidget {
  const EmtyCartScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: 45,
        ),
        Text('No Cart Items Found',
            style: 
              
                  TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            
            ),
        SizedBox(height: 12),
        Text(
          'Please add a Items',
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
