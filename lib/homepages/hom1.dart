import 'package:flutter/material.dart';
import 'package:sssd/homepages/category.dart';
import 'package:sssd/homepages/profile.dart';
import 'package:sssd/homepages/search.dart';
import 'package:sssd/homepages/wish.dart';

import 'package:carousel_slider/carousel_slider.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  final List<Product> neckbands = [
    Product("RX-08 TUNEFUL 38H", "₹186.00", "assets/a.png"),
    Product("RX-119 COSMIC 45H NECKBAND", "₹259.00", "assets/a.png"),
    Product("WX-45 MAGNETIC", "₹456.00", "assets/a.png"),
  ];

  List category = [
    "TICON NECKBANDS",
    "ROCKMUSIC EARBUDS",
    "TICON NECKBANDS",
    "ROCKMUSIC EARBUDS",
    "TICON NECKBANDS",
    "ROCKMUSIC EARBUDS",
    "ROCKMUSIC EARBUDS",
    "ROCKMUSIC EARBUDS",
    "TICON NECKBANDS",
  ];

  final List<String> bannerImages = [
    'assets/ban.png',
    'assets/ban.png',
    'assets/ban.png',
  ];

  final List<Map<String, String>> hotCategories = [
    {"title": "STAND", "image": "assets/a.png"},
    {"title": "100% OG", "image": "assets/a.png"},
    {"title": "MOBILE BANK", "image": "assets/a.png"},
    {"title": "CASE", "image": "assets/a.png"},
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        // toolbarHeight: 0,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.location_on, color: Colors.amber),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Raipur",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Chhattisgarh, India",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          Icon(Icons.call, color: Colors.black54),
          SizedBox(width: 12),
          Icon(Icons.whatshot, color: Colors.black54),
          SizedBox(width: 12),
          Icon(Icons.person, color: Colors.black54),
          SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSearchBar(),
            _buildScrollingTextBanner(),
            SizedBox(height: 15),
            _buildImageCarousel(bannerImages),
            _buildSectionTitle("Hot Catagory"),
            _buildHotCategoryList(hotCategories),
            const SizedBox(height: 20),

            _buildSectionTitle("Shop by category"),
            _buildHeaderBanner(),
            _buildCategoryGrid(categories),

            for (int i = 0; i < category.length; i++) cateData(category[i]),

            const SizedBox(height: 16),
            _sectionHeader("ROCKMUSIC EARBUDS"),
            Image.asset(
              "assets/ban.png",
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Container(
              color: const Color.fromARGB(255, 252, 249, 227),
              height: 600,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),

                  // Location & Icons Row
                  const SizedBox(height: 80),
                  const Text(
                    "That's all for now!",
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: Text(
                      "Didn't find what you're looking for?",

                      // textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 34,

                        fontWeight: FontWeight.bold,

                        color: Color.fromARGB(255, 146, 146, 146),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 14,
                      ),
                    ),
                    onPressed: () {
                      // Navigate to categories
                    },
                    child: const Text(
                      "Explore Categories",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (index) {
          if (index == 0) {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => HomePage()),
            // );
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

  Widget cateData(String title) {
    return Column(
      children: [
        _sectionHeader(title),
        Image.asset(
          "assets/ban.png",
          height: 140,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(3.0),
                child: _productCard(neckbands[0]),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  // Widget _iconCircle(IconData icon) {
  //   return CircleAvatar(
  //     radius: 18,
  //     backgroundColor: const Color(0xFFF2F2F2),
  //     child: Icon(icon, color: Colors.grey[700], size: 18),
  //   );
  // }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.black45),
        ],
      ),
    );
  }

  Widget _productCard(Product product) {
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
              Image.asset(
                product.image,
                height: 100,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
              const Positioned(
                top: 4,
                right: 4,
                child: Icon(Icons.favorite, color: Colors.orange),
              ),
            ],
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            icon: const Icon(Icons.add, size: 16),
            label: const Text("Add", style: TextStyle(fontSize: 12)),
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              foregroundColor: Colors.orange,
              side: const BorderSide(color: Colors.orange),
            ),
          ),
          Text(
            product.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 13),
          ),
          Text(
            "${product.price} / 1pcs",
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search for items or products...',
          prefixIcon: Icon(Icons.search),
          filled: true,
          fillColor: Color(0xFFF4F4F4),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildScrollingTextBanner() {
    return Container(
      height: 30,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 0),
      color: Colors.black,
      child: Center(
        child: Text(
          "🛒 Order confirm करने के लिए 💰 token add करें",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildImageCarousel(List<String> images) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 150.0,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: images.map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(color: Colors.white),
              child: Image.asset(imagePath, fit: BoxFit.cover),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildHotCategoryList(List<Map<String, String>> categories) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Container(
            width: 80,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.yellow,
                  child: Image.asset(category["image"]!, height: 30),
                ),
                const SizedBox(height: 5),
                Text(
                  category["title"]!,
                  style: const TextStyle(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  final List<Map<String, String>> categories = const [
    {"title": "GLASS", "image": "assets/a.png"},
    {"title": "DC CHARGER", "image": "assets/a.png"},
    {"title": "GAN CHARGER", "image": "assets/a.png"},
    {"title": "CASE & COVERS", "image": "assets/a.png"},
    {"title": "EARBUDS", "image": "assets/a.png"},
    {"title": "OFFER ZONE", "image": "assets/a.png"},
    {"title": "100% OG PREMIUM P", "image": "assets/a.png"},
    {"title": "EARPHONES", "image": "assets/a.png"},
    {"title": "CABLE 1", "image": "assets/a.png"},
    {"title": "CABLE 2", "image": "assets/a.png"},
    {"title": "CABLE 3", "image": "assets/a.png"},
    {"title": "CABLE 4", "image": "assets/a.png"},
  ];

  Widget _buildHeaderBanner() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset("assets/ban.png"), // Replace with actual banner
      ),
    );
  }

  // Widget _buildSectionTitle(String title) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
  //     child: Row(
  //       children: [
  //         Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildCategoryGrid(List<Map<String, String>> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(items[index]["image"]!, fit: BoxFit.contain),
              ),
              const SizedBox(height: 6),
              Text(
                items[index]["title"]!,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          );
        },
      ),
    );
  }
}

class Product {
  final String name;
  final String price;
  final String image;

  Product(this.name, this.price, this.image);
}
