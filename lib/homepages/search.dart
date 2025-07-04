import 'package:flutter/material.dart';
import 'package:sssd/homepages/category.dart';
import 'package:sssd/homepages/hom1.dart';
import 'package:sssd/homepages/profile.dart';
import 'package:sssd/homepages/wish.dart';

class SearchScreen extends StatelessWidget {
  final List<Product> trendingItems = [
    Product(
      name: "T800 ULTRA SMART WATCH",
      price: "₹290.00",
      image: "assets/a.png",
      inStock: false,
    ),
    Product(
      name: "SAMSUNG 25W TYPE-C DOCK",
      price: "₹169.00",
      image: "assets/a.png",
      inStock: true,
      rating: 3.0,
      reviews: 1,
    ),
    Product(
      name: "3 CORNER PIRAMID STAND",
      price: "₹2.90",
      image: "assets/a.png",
      inStock: true,
    ),

    Product(
      name: "T800 ULTRA SMART WATCH",
      price: "₹290.00",
      image: "assets/a.png",
      inStock: false,
    ),
    Product(
      name: "SAMSUNG 25W TYPE-C DOCK",
      price: "₹169.00",
      image: "assets/a.png",
      inStock: true,
      rating: 3.0,
      reviews: 1,
    ),
  ];

  final List<Category> spotlightItems = [
    Category("STAND & HOLDER", "assets/a.png"),
    Category("100% OG PRODUCT", "assets/a.png"),
    Category("MOBILE BANK", "assets/a.png"),
    Category("CASES", "assets/a.png"),
    Category("STAND & HOLDER", "assets/a.png"),
    Category("100% OG PRODUCT", "assets/a.png"),
    Category("MOBILE BANK", "assets/a.png"),
    Category("STAND & HOLDER", "assets/a.png"),
    Category("100% OG PRODUCT", "assets/a.png"),
    Category("MOBILE BANK", "assets/a.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(),
        title: TextField(
          decoration: InputDecoration(
            hintText: "Search for items or products...",
            hintStyle: const TextStyle(fontSize: 14),
            border: InputBorder.none,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          const Text(
            "Trending items",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 255,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: trendingItems.length,
              itemBuilder: (context, index) {
                final item = trendingItems[index];
                return _buildProductCard(item);
              },
              separatorBuilder: (_, __) => const SizedBox(width: 12),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "In the spotlight",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: spotlightItems.length,
              itemBuilder: (context, index) {
                final cat = spotlightItems[index];
                return Column(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage(cat.image),
                      backgroundColor: Colors.grey.shade100,
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      width: 80,
                      child: Text(
                        cat.name,
                        style: const TextStyle(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (_, __) => const SizedBox(width: 12),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CategoriesScreen()),
            );
          } else if (index == 2) {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => SearchScreen()),
            // );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WishlistScreen()),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AccountScreen()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_rounded, size: 30),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 30),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, size: 30),
            label: "Wishlist",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30),
            label: "Account",
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  product.image,
                  height: 90,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 6,
                right: 6,
                child: Icon(Icons.favorite, color: Colors.orange),
              ),
            ],
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            icon: const Icon(Icons.add, size: 16),
            label: const Text("Add"),
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: product.inStock ? Colors.orange : Colors.grey,
              side: BorderSide(
                color: product.inStock ? Colors.orange : Colors.grey,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              textStyle: const TextStyle(fontSize: 12),
            ),
          ),
          if (!product.inStock)
            const Padding(
              padding: EdgeInsets.only(top: 4),
              child: Text(
                "Out of Stock",
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
          Text(
            product.name,
            style: const TextStyle(fontWeight: FontWeight.w500),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          const SizedBox(height: 4),
          Text("${product.price} / 1pcs", style: const TextStyle(fontSize: 13)),
          if (product.reviews > 0)
            Container(
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, size: 14, color: Colors.amber),
                  const SizedBox(width: 4),
                  Text(
                    "${product.rating} · ${product.reviews} review",
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class Product {
  final String name;
  final String price;
  final String image;
  final bool inStock;
  final double rating;
  final int reviews;

  Product({
    required this.name,
    required this.price,
    required this.image,
    required this.inStock,
    this.rating = 0.0,
    this.reviews = 0,
  });
}

class Category {
  final String name;
  final String image;

  Category(this.name, this.image);
}
