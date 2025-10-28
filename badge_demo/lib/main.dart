import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

void main() => runApp(BadgeDemoApp());

class BadgeDemoApp extends StatelessWidget {
  const BadgeDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Badge Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: BadgeHomePage(),
    );
  }
}

class BadgeHomePage extends StatefulWidget {
  const BadgeHomePage({super.key});

  @override
  State<BadgeHomePage> createState() => _BadgeHomePageState();
}

class _BadgeHomePageState extends State<BadgeHomePage> {
  int _cartCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        title: const Text("Flutter Badge Example"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: badges.Badge(
              showBadge: _cartCount > 0,
              badgeContent: Text(
                '$_cartCount',
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              badgeStyle: badges.BadgeStyle(
                badgeColor: Colors.redAccent,
                padding: const EdgeInsets.all(6),
              ),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart, size: 28),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('You have $_cartCount item(s) in your cart!')),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: 320,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.deepPurple.shade100,
                blurRadius: 10,
                spreadRadius: 3,
                offset: const Offset(3, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.shopping_bag, color: Colors.deepPurple, size: 80),
              const SizedBox(height: 20),
              Text(
                'Items in Cart: $_cartCount',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    _cartCount++;
                  });
                },
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text("Add Item"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: _cartCount > 0
                    ? () {
                        setState(() {
                          _cartCount--;
                        });
                      }
                    : null,
                icon: const Icon(Icons.remove_circle_outline),
                label: const Text("Remove Item"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple.shade200,
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
