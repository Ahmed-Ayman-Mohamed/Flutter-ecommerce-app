import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  const CartItem({
    super.key,
    required this.title,
    required this.image,
    required this.rating,
    required this.price,
    required this.totalPrice,
    required this.onPressed,
  });
  final String title;
  final String image;
  final double rating;
  final double price;
  final double totalPrice;
  final void Function(int count) onPressed;
  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int itemCount = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      height: 120,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 248, 248, 248),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 5),
            height: 100,
            width: MediaQuery.of(context).size.width / 4,
            decoration: BoxDecoration(
              color: const Color(0xFFD4ECF7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(widget.image),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // title
                    Text(
                      widget.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    Row(
                      children: [
                        const Text(
                          "Rating: ",
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          "${widget.rating.toStringAsFixed(1)}",
                          style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ],
                    )
                  ],
                ),
              )),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "\$${(widget.price - (widget.price * 0.30)).toStringAsFixed(2)}",
                  style: const TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                      color: const Color(0xFFD4ECF7),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (itemCount > 1) {
                                itemCount--;
                              }
                            });
                            widget.onPressed(itemCount);
                          },
                          icon: const Icon(Icons.remove)),
                      Text(
                        itemCount.toString(),
                        style: const TextStyle(fontSize: 17),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              itemCount++;
                            });
                            widget.onPressed(itemCount);
                          },
                          icon: const Icon(Icons.add)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
