import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cookpad Clone',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> popularIngredients = [
    {'title': 'Tahu Campur', 'image': 'assets/makansatu.jpg'},
    {'title': 'Nasi Uduk', 'image': 'assets/makandua.jpg'},
    {'title': 'Rendang Daging', 'image': 'assets/makantiga.jpg'},
    {'title': 'Kue Basah', 'image': 'assets/makanempat.jpg'},
    {'title': 'Oyong', 'image': 'assets/makanlagi.jpg'},
    {'title': 'Rawon', 'image': 'assets/makanenam.jpg'},
    {'title': 'Brushchetta', 'image': 'assets/makantujuh.jpg'},
    {'title': 'Sushi', 'image': 'assets/makandelapan.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cari'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Ketik bahan-bahan...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Bahan populer',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: popularIngredients.length,
                itemBuilder: (context, index) {
                  return IngredientCard(
                    title: popularIngredients[index]['title']!,
                    imagePath: popularIngredients[index]['image']!,
                  );
                },
              ),
              SizedBox(height: 16.0),
              Container(
                color: Colors.brown[700],
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cookpad Premium',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Temukan resep-resep terpopuler yang menjadi resep andalan komunitas Cookpad',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      onPressed: () {},
                      child: Text('Berlangganan Rp40.000 / 1 bulan'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Cari',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Koleksi Resep',
          ),
        ],
      ),
    );
  }
}

class IngredientCard extends StatelessWidget {
  final String title;
  final String imagePath;

  IngredientCard({required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
