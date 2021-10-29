import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context).settings.arguments as String; // is the id!
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(loadedProduct.title),
      // ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              //title: Text(loadedProduct.title),
              background: Hero(
                tag: loadedProduct.id,
                child: Image.network(
                  loadedProduct.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left:25.0),
                  child: Text(loadedProduct.title,style: TextStyle(fontSize: 22,),),
                ),
                   SizedBox(
                  height: 10,
                ),
                Row(children: [

                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      width:  124.0,
                      child: Text("Price")),
                  ),

                      Text(
                  '\Rs ${loadedProduct.price}',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                ],),
                   SizedBox(
                  height: 10,
                ),
                Row(children: [

                    Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      width:  124.0,
                      child: Text("Size")),
                  ),
                    //                Container(
                    // padding: EdgeInsets.symmetric(horizontal: 10),
                    // width: double.infinity,
                    // child: 
                    Text(
                      loadedProduct.size.toString(),
                      textAlign: TextAlign.center,
                      softWrap: true,
                       style: TextStyle(
                      
                      fontSize: 15,
                    ),
                    ),
                 // ),
                ]
                ),
            
                SizedBox(
                  height: 10,
                ),
                Row(children: [
                    Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                     
                      width:  124.0,
                       height: MediaQuery.of(context).size.height,
                      child: Text("Description")),
                  
                    //                Container(
                    // padding: EdgeInsets.symmetric(horizontal: 10),
                    // width: double.infinity,
                    // child: 
                   // SizedBox(height:5),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(right: 10),
                      child: Container(
                       
                        width: MediaQuery.of(context).size.width-200,
                         height: MediaQuery.of(context).size.height,
                        child: Text(
                          loadedProduct.description.toString(),
                          //textAlign: TextAlign.center,
                        //  softWrap: ,
                           style: TextStyle(
                        //fontSize: 15,
                        ),
                        ),
                      ),
                    ),
                    
                ]
                ),
               SizedBox(height: 800,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
