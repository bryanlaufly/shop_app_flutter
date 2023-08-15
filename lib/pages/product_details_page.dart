import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/providers/cart_provider.dart';

class ProductDetailsPage extends StatefulWidget {
  // final Map<String,Object> product; 
  final Map<String,dynamic> product; 

  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {

  int selectedSize = 0;

  void onTap(){
    if (selectedSize != 0){
      // Provider.of<CartProvider>(context, listen:false).addproduct(widget.product);

      // context.read<CartProvider>().addproduct(
      //    {
      //         'id': widget.product['id'],
      //       'title': widget.product['title'],
      //       'price': widget.product['price'],
      //       'imageUrl': widget.product['imageUrl'],
      //       'company': widget.product['company'],
      //       'sizes': selectedSize,
      //   }
      // );

      Provider.of<CartProvider>(context, listen:false).addproduct(
        {
              'id': widget.product['id'],
            'title': widget.product['title'],
            'price': widget.product['price'],
            'imageUrl': widget.product['imageUrl'],
            'company': widget.product['company'],
            'sizes': selectedSize,
        }
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('You added successfully!'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a size!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Column(
        children:[
          Text(widget.product['title'] as String, style: Theme.of(context).textTheme.titleLarge),
          const Spacer(flex:1),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.product['imageUrl'] as String, height:250,),
          ),
          const Spacer(flex:2),

          Container(
            // height: 200,
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: const Color.fromRGBO(217, 241, 233, 1),
            // color: Theme.of(context).primaryColorLight,
            child: Column(
              children: [
                Text('\$${widget.product['price']}', style: Theme.of(context).textTheme.titleLarge),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length,
                    itemBuilder:(context,index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                                onTap: () {           
                                setState(() {
                                  selectedSize = (widget.product['sizes'] as List<int>)[index].toInt();
                                });
                                },
                          child: Chip(      
                              backgroundColor: 
                              selectedSize == (widget.product['sizes'] as List<int>)[index].toInt() ?
                              const Color.fromARGB(255, 102, 187, 93):
                              null,                              
                              label : Text(
                                (widget.product['sizes'] as List<int>)[index].toString(),                     
                              ),
                          ),
                        ),
                      );
                    }
                  ),
                ),

                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child:Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child : ElevatedButton.icon(
                      onPressed: onTap, 
                      icon: const Icon(Icons.shopping_cart), 
                      label: const Text('Add to Cart')
                    ),
                  ),
                ),
                
              ],
            ),
          )
        ]
      ),
    );
  }
}