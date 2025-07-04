import 'package:flutter/material.dart';
import 'package:sssd/homepages/category.dart';
import 'package:sssd/homepages/hom1.dart';
import 'package:sssd/homepages/profile.dart';
import 'package:sssd/homepages/search.dart';

class WishlistScreen extends StatelessWidget {
  final List<Product> wishlist = [
    Product(
      name: "UNIVARSAL 3 PIN PLUG M314",
      price: "₹25.00",
      image: "assets/a.png", // replace with your asset
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(),
        title: const Text("Wishlist"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: 6,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.6,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final product = wishlist[0];
            return _buildWishlistItem(product);
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchScreen()),
            );
          } else if (index == 3) {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => WishlistScreen()),
            // );
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

  Widget _buildWishlistItem(Product product) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
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
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 4,
                right: 4,
                child: Icon(Icons.favorite, color: Colors.orange, size: 20),
              ),
            ],
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add, size: 16),
            label: const Text("Add"),
            style: OutlinedButton.styleFrom(
              foregroundColor: product.inStock ? Colors.orange : Colors.grey,
              side: BorderSide(
                color: product.inStock ? Colors.orange : Colors.grey,
              ),
              textStyle: const TextStyle(fontSize: 12),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            ),
          ),
          const SizedBox(height: 4),
          if (!product.inStock)
            const Text(
              "Out of Stock",
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          Text(
            product.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4),
          Text("${product.price} / 1pcs", style: const TextStyle(fontSize: 13)),
          if (product.reviews > 0)
            Container(
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xFFF2F2F2),
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
