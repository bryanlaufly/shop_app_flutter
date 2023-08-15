import 'package:flutter/material.dart';
import 'package:shop_app_flutter/pages/cart_page.dart';
import 'package:shop_app_flutter/widgets/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  List<Widget> pages = const [ ProductList(), CartPage()];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // body: pages[currentPage],
      body : IndexedStack(
        index :currentPage,
        children: pages
      ),

      bottomNavigationBar:BottomNavigationBar(
        selectedFontSize: 10,
        unselectedFontSize: 10,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home' ),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label:'Cart'),
        ]     
      ),
    );
  }
}


