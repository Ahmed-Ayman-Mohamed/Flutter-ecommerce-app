import 'package:flutter/material.dart';

import '../detail_screen.dart';
import '../models/product_model.dart';

class GridItemTile extends StatefulWidget {
  const GridItemTile({super.key, required this.productList, required this.index});
  final int index;
  final Products? productList;

  @override
  State<GridItemTile> createState() => _GridItemTileState();
}

class _GridItemTileState extends State<GridItemTile> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemScreen(product: widget.productList!.products?[widget.index]),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xFFD4ECF7),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "30% off",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: isFavorite ? Colors.redAccent : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                flex: 3,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.network(widget.productList!.products![widget.index].thumbnail!),
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: Text(
                    widget.productList!.products![widget.index].title!,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: Text(
                    "${widget.productList!.products![widget.index].category}",
                    style: const TextStyle(
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: Text(
                    "\$${widget.productList!.products![widget.index].price!.toString()}",
                    style: const TextStyle(
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
