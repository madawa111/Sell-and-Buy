import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/edit_product_screen.dart';
import '../providers/products.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  UserProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold.of(context);
    return ListTile(
      title: Text(title),
      leading:Container(
          width: 50,
          height:  50,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.purple,
             // Color(0xFFFF0000), 
              width: 2.0),
              borderRadius: BorderRadius.circular(65.0)),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: CircleAvatar(
                radius:  20,
                backgroundImage:NetworkImage(imageUrl) ),
          ),
        ),


      //  CircleAvatar(
      //   backgroundImage: NetworkImage(imageUrl),
      // ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(EditProductScreen.routeName, arguments: id);
              },
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                try {
                  await Provider.of<Products>(context, listen: false)
                      .deleteProduct(id);
                } catch (error) {
                  scaffold.showSnackBar(
                    SnackBar(
                      content: Text('Deleting failed!', textAlign: TextAlign.center,),
                    ),
                  );
                }
              },
              color: Theme.of(context).errorColor,
            ),
          ],
        ),
      ),
    );
  }
}
