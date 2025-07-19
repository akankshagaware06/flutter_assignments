// Flutter Assignment 1: Plant Store UI

// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const PlantStoreApp());
}

class PlantStoreApp extends StatelessWidget {
  const PlantStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomeScreen(),
    );
  }
}

// models/plant.dart
class Plant {
  final String name;
  final String imageUrl;
  final double price;
  final String category;
  final String light;
  final String water;
  final String temperature;
  final String description;

  Plant({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.category,
    required this.light,
    required this.water,
    required this.temperature,
    required this.description,
  });
}

List<Plant> demoPlants = [
  Plant(
    name: 'Fiddle Leaf',
    imageUrl: 'assets/fiddle_leaf.png',
    price: 29.99,
    category: 'Indoor',
    light: 'Bright Indirect',
    water: 'Weekly',
    temperature: '18-24°C',
    description: 'The Fiddle Leaf Fig is a popular indoor plant with large green leaves.',
  ),
  Plant(
    name: 'Snake Plant',
    imageUrl: 'assets/snake_plant.png',
    price: 19.99,
    category: 'Top Pick',
    light: 'Low to Bright',
    water: 'Every 2 Weeks',
    temperature: '15-30°C',
    description: 'The Snake Plant is a hardy plant that thrives in almost any environment.',
  ),
  Plant(
    name: 'Aloe Vera',
    imageUrl: 'assets/aloe_vera.png',
    price: 15.49,
    category: 'Popular',
    light: 'Bright',
    water: 'Every 3 Weeks',
    temperature: '20-26°C',
    description: 'Aloe Vera is a medicinal plant known for its soothing properties.',
  ),
  Plant(
    name: 'Peace Lily',
    imageUrl: 'assets/peace_lily.png',
    price: 22.00,
    category: 'Indoor',
    light: 'Low Light',
    water: 'Weekly',
    temperature: '18-23°C',
    description: 'Peace Lily is an elegant plant that purifies the air and thrives in low light.',
  ),
];

// screens/home_screen.dart
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.menu),
            Text('Hello Mia'),
            Icon(Icons.shopping_cart),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search Plants...',
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Categories
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryChip(title: 'Popular'),
                  CategoryChip(title: 'Outdoor'),
                  CategoryChip(title: 'Indoor'),
                  CategoryChip(title: 'Top Pick'),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Scrollable Plant List
            Expanded(
              child: ListView.builder(
                itemCount: demoPlants.length,
                itemBuilder: (context, index) {
                  return PlantCard(plant: demoPlants[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String title;
  const CategoryChip({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(title),
        backgroundColor: Colors.green[100],
      ),
    );
  }
}

// widgets/plant_card.dart
class PlantCard extends StatelessWidget {
  final Plant plant;
  const PlantCard({required this.plant, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Image.asset(
          plant.imageUrl,
          width: 60,
          fit: BoxFit.cover,
        ),
        title: Text(plant.name),
        subtitle: Text('\$${plant.price.toStringAsFixed(2)}'),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Placeholder for navigation
        },
      ),
    );
  }
}
