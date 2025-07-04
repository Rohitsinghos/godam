import 'package:flutter/material.dart';
import 'package:sssd/homepages/hom1.dart';
import 'package:sssd/homepages/profile.dart';
import 'package:sssd/homepages/search.dart';
import 'package:sssd/homepages/wish.dart';

class Category {
  final String name;
  final String imagePath;
  final String count;

  Category({required this.name, required this.imagePath, required this.count});
}

class CategoriesScreen extends StatelessWidget {
  final List<Category> categories = [
    Category(name: "GLASS", imagePath: "assets/a.png", count: "6 Items"),
    Category(name: "DC CHARGER", imagePath: "assets/a.png", count: "5 Items"),
    Category(name: "GAN CHARGER", imagePath: "assets/a.png", count: "3 Items"),
    Category(
      name: "CASE & COVERS",
      imagePath: "assets/a.png",
      count: "3 Items",
    ),
    Category(name: "EARBUDS", imagePath: "assets/a.png", count: "5 Categories"),
    Category(name: "OFFER ZONE", imagePath: "assets/a.png", count: "9 Items"),
    Category(
      name: "100% OG PREMIUM PR...",
      imagePath: "assets/a.png",
      count: "30 Items",
    ),
    Category(
      name: "EARPHONES",
      imagePath: "assets/a.png",
      count: "5 Categories",
    ),
    Category(name: "GLASS", imagePath: "assets/a.png", count: "6 Items"),
    Category(name: "DC CHARGER", imagePath: "assets/a.png", count: "5 Items"),
    Category(name: "GAN CHARGER", imagePath: "assets/a.png", count: "3 Items"),
    Category(
      name: "CASE & COVERS",
      imagePath: "assets/a.png",
      count: "3 Items",
    ),
    Category(name: "EARBUDS", imagePath: "assets/a.png", count: "5 Categories"),
    Category(name: "OFFER ZONE", imagePath: "assets/a.png", count: "9 Items"),
    Category(
      name: "100% OG PREMIUM PR...",
      imagePath: "assets/a.png",
      count: "30 Items",
    ),
    Category(name: "GLASS", imagePath: "assets/a.png", count: "6 Items"),
    Category(name: "DC CHARGER", imagePath: "assets/a.png", count: "5 Items"),
    Category(name: "GAN CHARGER", imagePath: "assets/a.png", count: "3 Items"),
    Category(
      name: "CASE & COVERS",
      imagePath: "assets/a.png",
      count: "3 Items",
    ),
    Category(name: "EARBUDS", imagePath: "assets/a.png", count: "5 Categories"),
    Category(name: "OFFER ZONE", imagePath: "assets/a.png", count: "9 Items"),
    Category(
      name: "100% OG PREMIUM PR...",
      imagePath: "assets/a.png",
      count: "30 Items",
    ),
    Category(
      name: "NECKBANDS",
      imagePath: "assets/a.png",
      count: "8 Categories",
    ),
    Category(name: "EARBUDS", imagePath: "assets/a.png", count: "5 Categories"),
    Category(name: "OFFER ZONE", imagePath: "assets/a.png", count: "9 Items"),
    Category(
      name: "100% OG PREMIUM PR...",
      imagePath: "assets/a.png",
      count: "30 Items",
    ),
    Category(
      name: "NECKBANDS",
      imagePath: "assets/a.png",
      count: "8 Categories",
    ),
    Category(name: "EARBUDS", imagePath: "assets/a.png", count: "5 Categories"),
    Category(name: "OFFER ZONE", imagePath: "assets/a.png", count: "9 Items"),
    Category(
      name: "100% OG PREMIUM PR...",
      imagePath: "assets/a.png",
      count: "30 Items",
    ),
    Category(
      name: "NECKBANDS",
      imagePath: "assets/a.png",
      count: "8 Categories",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Categories"),
        leading: BackButton(),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 15,
            childAspectRatio: 0.62,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];
            return CategoryTile(category: category);
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
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
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => CategoriesScreen()),
            // );
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
}

class CategoryTile extends StatelessWidget {
  final Category category;

  const CategoryTile({required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            color: Colors.yellow[700],

            child: Image.asset(
              category.imagePath,
              fit: BoxFit.cover,
              height: 100,
              width: double.infinity,
            ),
          ),
        ),

        const SizedBox(height: 5),
        Text(
          category.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        Text(
          category.count,
          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
        ),
      ],
    );
  }
}
