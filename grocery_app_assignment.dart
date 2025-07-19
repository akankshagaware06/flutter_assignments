// Flutter Assignment 2: Grocery App UI

// main.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/home_screen.dart';
import 'screens/product_details_screen.dart';
import 'models/product.dart';

void main() {
  runApp(const GroceryApp());
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/product/:id',
      builder: (context, state) {
        final id = state.params['id']!;
        final product = demoProducts.firstWhere((p) => p.id == id);
        return ProductDetailsScreen(product: product);
      },
    ),
  ],
);

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      title: 'Grocery App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Roboto',
      ),
    );
  }
}

// models/product.dart
class Product {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final double discount;
  final double rating;
  final String deliveryTime;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.discount,
    required this.rating,
    required this.deliveryTime,
  });
}

List<Product> demoProducts = [
  Product(
    id: '1',
    name: 'Fresh Apples',
    imageUrl: 'assets/apples.png',
    price: 3.99,
    discount: 10,
    rating: 4.5,
    deliveryTime: '30 mins',
  ),
  Product(
    id: '2',
    name: 'Bananas',
    imageUrl: 'assets/bananas.png',
    price: 2.49,
    discount: 5,
    rating: 4.7,
    deliveryTime: '20 mins',
  ),
];

// screens/home_screen.dart
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import '../widgets/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grocery App')),
      bottomNavigationBar: const BottomNavBar(),
      body: ListView.builder(
        itemCount: demoProducts.length,
        itemBuilder: (context, index) => ProductCard(product: demoProducts[index]),
      ),
    );
  }
}

// screens/product_details_screen.dart
import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  const ProductDetailsScreen({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(product.imageUrl, height: 150),
            const SizedBox(height: 16),
            Text('\$${product.price}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('${product.discount}% OFF', style: const TextStyle(color: Colors.green)),
            const SizedBox(height: 8),
            Text('Rating: ${product.rating} ⭐'),
            const SizedBox(height: 8),
            Text('Delivery: ${product.deliveryTime}'),
          ],
        ),
      ),
    );
  }
}

// widgets/product_card.dart
import 'package:flutter/material.dart';
import '../models/product.dart';
import 'package:go_router/go_router.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(product.imageUrl, width: 60),
      title: Text(product.name),
      subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        context.go('/product/${product.id}');
      },
    );
  }
}

// widgets/bottom_nav_bar.dart
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      currentIndex: 0,
      onTap: (index) {},
    );
  }
}
