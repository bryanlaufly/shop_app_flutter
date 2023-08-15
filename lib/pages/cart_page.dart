import 'package:flutter/material.dart';
import 'package:shop_app_flutter/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
  
  final cart = Provider.of<CartProvider>(context).cart;
  // final cart = context.watch<CartProvider>().cart;  /*this can replace the above */

    return Scaffold(
      appBar: AppBar(
        title:  Text('Cart', style: Theme.of(context).textTheme.titleLarge,),
      ),

      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context,index){
          final cartItem = cart[index];

          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageUrl'] as String),
            ),
            title: Text(cartItem['title'] as String),
            subtitle: Text(cartItem['sizes'].toString()),
            trailing: const Icon(Icons.delete, color:Colors.red,),  
            onTap: () {
              showDialog(
                context: context, 
                builder: (context){
                  return AlertDialog(
                    title: Text('Delete Product', style: Theme.of(context).textTheme.titleMedium,),
                    content: const Text('Are you sure you want to remove the product from the cart ?'),
                    actions: [
                      ElevatedButton(
                        onPressed:() {
                          Provider.of<CartProvider>(context, listen: false).removeproduct(cartItem);
                          // context.read<CartProvider>().removeproduct(cartItem); /*can replace the above */
                          Navigator.of(context).pop();
                        },
                        child: const Text('Yes'),
                      ),
                      ElevatedButton(
                        onPressed:() {
                          Navigator.of(context).pop();
                        },
                        child: const Text('No'),
                      )
                    ],
                  );
                },
              );
            },
          );
        },        
      ),
    );
  }      
}
