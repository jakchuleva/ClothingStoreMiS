import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothing Store',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}



class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> clothingItems = [
    {
      'name': 'Фустан',
      'description': 'Црн фустан со долги ракави',
      'price': '1,500 ден.'
    },
    {
      'name': 'Тренерки',
      'description': 'Памучни, комотни долни тренерки',
      'price': '800 ден.'
    },
    {
      'name': 'Блуза',
      'description': 'Бела блуза со кратки ракави',
      'price': '1,100 ден.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('211107'),
      ),
      body: ListView.builder(
        itemCount: clothingItems.length,
        itemBuilder: (context, index) {
          final item = clothingItems[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(

              title: Text(item['name']),
              subtitle: Text(item['price']),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(product: item),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}


class ProductDetailScreen extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              product['name'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(product['description']),
            SizedBox(height: 16),
            Text(
              'Цена: ${product['price']}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}


