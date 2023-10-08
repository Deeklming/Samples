import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider5/models/cart.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);//간단한 consumer 방식
    final items = cart.items;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('내 카트'),
        actions: [
          Center(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                '총액: '+cart.getTotalPrice().toString(),
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index){
          return Builder(
            builder: (context){
              return ListTile(
                title: Text(items[index].title),
                subtitle: Text(items[index].price.toString()),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: (){
                    cart.deleteItem(items[index].id);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}