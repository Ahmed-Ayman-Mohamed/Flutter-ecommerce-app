import 'package:first_project/widgets/grid_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../api/api_provider.dart';
import '../models/product_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key,});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Color> _colors = [
    Colors.redAccent,
    Colors.blueAccent,
    Colors.grey,
    Colors.greenAccent
  ];

  Products? productsList;
  List? categoryList;
  bool isLoading = true;
  bool isCategoryLoading = true;
  bool seeAll = false;
  String? selectedCategory;

  Future<void> getProductsFromApiProvider() async {
    try {
      productsList = await ApiProvider().getProducts();
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching products: $e');
    }
  }

  Future<void> getAllCategoriesNames() async {
    try {
      categoryList = await ApiProvider().getAllCategory();
      setState(() {
        isCategoryLoading = false;
      });
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }

  Future<void> getProductsByCategory(String category) async {
    setState(() {
      isLoading = true;
      selectedCategory = category;
    });

    try {
      productsList = await ApiProvider().getProductsByCategory(category);
    } catch (e) {
      print('Error fetching products by category: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getProductsFromApiProvider();
    getAllCategoriesNames();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  iconButtonCustom(CupertinoIcons.cart),
                  iconButtonCustom(CupertinoIcons.search),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello Dear",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    "Let's Shopping",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  )
                ],
              ),
            ),
            // Offers Container
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  for (int i = 0; i < _colors.length; i++)
                    offersContainerCustom(index: i),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Top Categories",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        seeAll = !seeAll;
                      });
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: seeAll ? Colors.blueAccent : Colors.black45),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 11,
              child: isCategoryLoading
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : categoryList == null
                  ? const Center(child: Text('No categories available'))
                  : ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buildCategoryItem(
                      categoryList![index], index),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
                  itemCount: categoryList!.length // productsList!.products!.length
              ),
            ),
            const SizedBox(height: 10,),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : productsList == null
                ? const Center(child: Text('No products available'))
                : GridItem(productList: productsList, itemCount: productsList!.products!.length),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryItem(String category, int index) {
    return GestureDetector(
      onTap: () {
        getProductsByCategory(category);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 5),
        padding: const EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width / 2.5,
        height: 200,
        decoration: BoxDecoration(
            color: const Color(0xFFD4ECF7),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                // spreadRadius: 2,
              )
            ]),
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  category,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget offersContainerCustom({required int index}) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.only(left: 10),
      width: MediaQuery.of(context).size.width / 1.5,
      height: MediaQuery.of(context).size.height / 4.5,
      decoration: BoxDecoration(
        color: _colors[index],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "30% off Winter Collection",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            width: 80,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text("Shop Now"),
          )
        ],
      ),
    );
  }

  Widget iconButtonCustom(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: const Color(0xFFD4ECF7),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              spreadRadius: 2,
            )
          ]),
      child: Icon(
        icon,
        size: 28,
      ),
    );
  }
}
