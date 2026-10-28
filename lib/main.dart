import 'package:flutter/material.dart';

void main() {
  runApp(const AirBalangApp());
}

class AirBalangApp extends StatelessWidget {
  const AirBalangApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Air Balang Restaurant',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MenuScreen(),
    );
  }
}

// Data Model for the Menu Items updated with imagePath
class MenuItem {
  final String name;
  final String shortDescription;
  final String ingredients;
  final String facts;
  final String funFact;
  final String imagePath; // <-- Added image path

  MenuItem({
    required this.name,
    required this.shortDescription,
    required this.ingredients,
    required this.facts,
    required this.funFact,
    required this.imagePath,
  });
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Menu items now include the paths to your local images
    final List<MenuItem> menuItems = [
      MenuItem(
        name: 'Air Coklat',
        shortDescription: 'A rich, creamy chocolate drink with a smooth cocoa taste — the perfect treat for chocolate lovers!',
        ingredients: 'Chocolate powder or cocoa powder, milk, sugar, and water. Ice is optional.',
        facts:
            '• Cocoa powder: Comes from cocoa beans, which naturally contain compounds that give chocolate its rich aroma and bitter taste.\n'
            '• Milk: Adds creaminess and provides protein and calcium.\n'
            '• Sugar: Balances the natural bitterness of cocoa and makes the drink sweeter.\n'
            '• Ice: Makes the drink refreshing, especially in Malaysia\'s hot weather.',
        funFact: 'Cocoa naturally contains theobromine, a compound also found in chocolate. It is different from caffeine, although both belong to a related group of stimulating compounds.',
        imagePath: 'android/assets/coklat.jpg',
      ),
      MenuItem(
        name: 'Air Bandung',
        shortDescription: 'A beautiful pink milk drink with a sweet floral aroma — creamy, refreshing, and a Malaysian favourite!',
        ingredients: 'Rose syrup, milk, water, and ice. Some recipes also use evaporated milk or condensed milk.',
        facts:
            '• Rose syrup: Gives the drink its signature pink colour and sweet floral aroma. Commercial rose syrup is usually flavoured syrup, so it does not necessarily contain actual rose petals.\n'
            '• Milk: Softens the sweetness of the syrup and creates a creamy texture.\n'
            '• Condensed milk: Adds extra sweetness and a thicker, richer taste.\n'
            '• Ice: Helps make the drink refreshing and dilutes it slightly as it melts.',
        funFact: 'Despite its name, traditional air bandung is not necessarily made from Bandung, Indonesia. The word "bandung" can mean something paired or mixed in Malay usage, and the drink is popular in Malaysia and Singapore.',
        imagePath: 'android/assets/bandung.jpg',
      ),
      MenuItem(
        name: 'Air Limau',
        shortDescription: 'A refreshing burst of citrus with a perfect balance of sweet and sour — the ultimate thirst quencher!',
        ingredients: 'Fresh lime juice, water, sugar, and ice. Mint leaves are optional.',
        facts:
            '• Fresh lime: Contains vitamin C and citric acid. Citric acid gives lime its distinctive sour taste.\n'
            '• Sugar: Balances the sourness of lime and makes the drink more enjoyable.\n'
            '• Water: Dilutes the concentrated lime juice and helps create a refreshing drink.\n'
            '• Mint leaves (optional): Add a fresh aroma and a cooling sensation to the flavour.',
        funFact: 'The sour taste of lime comes mainly from citric acid, while its vitamin C is an essential nutrient that helps the body form collagen and absorb iron from plant-based foods.',
        imagePath: 'android/assets/limau.jpg',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Air Balang Restaurant',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return Card(
            elevation: 4,
            clipBehavior: Clip.antiAlias, // Ensures the image respects the rounded corners of the card
            margin: const EdgeInsets.only(bottom: 20.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(item: item),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image added to the top of the card
                  Image.asset(
                    item.imagePath,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item.shortDescription,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Tap for details',
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 14,
                              color: Colors.blueAccent,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final MenuItem item;

  const DetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image added to the top of the detail screen
            Image.asset(
              item.imagePath,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionHeader('Menu Description'),
                  Text(
                    item.shortDescription,
                    style: const TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const Divider(height: 30, thickness: 1),

                  _buildSectionHeader('Main Ingredients'),
                  Text(item.ingredients, style: const TextStyle(fontSize: 16)),
                  const Divider(height: 30, thickness: 1),

                  _buildSectionHeader('Interesting Facts'),
                  Text(
                    item.facts,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                  const Divider(height: 30, thickness: 1),

                  _buildSectionHeader('Fun Fact!'),
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade50,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.orange.shade200),
                    ),
                    child: Text(
                      item.funFact,
                      style: const TextStyle(fontSize: 15, color: Colors.brown),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.deepOrange,
        ),
      ),
    );
  }
}
