import 'package:flutter/material.dart';
import 'package:shop_app_flutter/global_variables.dart';
import 'package:shop_app_flutter/widgets/product_card.dart';
import 'package:shop_app_flutter/pages/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  final List<String> filters = ['All', 'Adidas', 'Bata','Puma'];
  late String selectedFilter;

  @override /* can be omitted if we set late String selectedFilter = filters[0] in the above */
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
              Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Shoes\nCollection',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(50),
                        ),
                      ),
                      // enabledBorder: OutlineInputBorder(
                      //   borderRadius: BorderRadius.horizontal(
                      //     left: Radius.circular(50),
                      //   ),
                      // )
                    ),
                  ),
                ),
              ],
            ),
            


            SizedBox(
              height: 100,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        // print('tap now');
                        setState(() {
                          selectedFilter = filters[index];
                        });
                      },
                      child: Chip(
                        backgroundColor: selectedFilter == filters[index] ? 
                        const Color.fromRGBO(49, 169, 28, 1):
                        const Color.fromRGBO(241, 238, 238, 1),
                        side: const BorderSide(color: Color.fromRGBO(241, 238, 238, 1)),
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                        label: Text(
                          filters[index],
                          style: const TextStyle(
                            fontSize: 25,
                          ),
                        )
                      ),
                    ),
                  );
                }),
            ),

            // Expanded(
            //   child: MediaQuery.of(context).size.width < 1080 ? 
            //   ListView.builder(
            //     padding: const EdgeInsets.all(10.0),
            //     itemCount: products.length,
            //     itemBuilder: (context, index){
            //       return GestureDetector(
            //         onTap: () {
            //           Navigator.of(context).push(
            //             MaterialPageRoute(
            //               builder: (context) {
            //                return ProductDetailsPage(product: products[index]);
            //               }
            //             )
            //           );
            //         },
            //         child: ProductCard(
            //           title: products[index]['title'] as String,
            //           price: products[index]['price'] as double,
            //           imageUrl: products[index]['imageUrl'] as String,
            //           backgroundColor: index.isEven ? 
            //           const Color.fromRGBO(175, 224, 238, 1) : 
            //           const Color.fromRGBO(241, 238, 238, 1),
            //         ),
            //       );
            //     },
            //   )

            //   : GridView.builder(
            //     itemCount: products.length,
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 2,
            //       childAspectRatio: 2.5,
            //     ), 
            //     itemBuilder: (context, index){
            //         return GestureDetector(
            //           onTap: () {
            //             Navigator.of(context).push(
            //               MaterialPageRoute(
            //                 builder: (context) {
            //                 return ProductDetailsPage(product: products[index]);
            //                 }
            //               )
            //             );
            //           },
            //           child: ProductCard(
            //             title: products[index]['title'] as String,
            //             price: products[index]['price'] as double,
            //             imageUrl: products[index]['imageUrl'] as String,
            //             backgroundColor: index.isEven ? 
            //             const Color.fromRGBO(175, 224, 238, 1) : 
            //             const Color.fromRGBO(241, 238, 238, 1),
            //           ),
            //         );
            //     }
            //   )
            // )

            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 1080) {
                    return GridView.builder(
                      itemCount: products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.75,
                      ),
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return ProductDetailsPage(product: product);
                                },
                              ),
                            );
                          },
                          child: ProductCard(
                            title: product['title'] as String,
                            price: product['price'] as double,
                            imageUrl: product['imageUrl'] as String,
                            backgroundColor: index.isEven
                                ? const Color.fromRGBO(216, 240, 253, 1)
                                : const Color.fromRGBO(245, 247, 249, 1),
                          ),
                        );
                      },
                    );
                  } else {
                    return ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return ProductDetailsPage(product: product);
                                },
                              ),
                            );
                          },
                          child: ProductCard(
                            title: product['title'] as String,
                            price: product['price'] as double,
                            imageUrl: product['imageUrl'] as String,
                            backgroundColor: index.isEven
                                ? const Color.fromRGBO(216, 240, 253, 1)
                                : const Color.fromRGBO(245, 247, 249, 1),
                          ),
                        );
                      },
                    );
                  }   
                }
              )
            )
          ],
        ),
      ),    
    );
  }
}