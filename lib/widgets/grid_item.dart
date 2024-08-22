import 'package:first_project/models/product_model.dart';
import 'package:first_project/widgets/grid_item_tile.dart';
import 'package:flutter/material.dart';

class GridItem extends StatefulWidget {
  const GridItem({super.key, required this.productList, required this.itemCount});

  final Products? productList;
  final int itemCount;

  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  @override
  Widget build(BuildContext context) {
    return widget.productList == null
        ? const Center(child: Text('No products available'))
        : GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.itemCount,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) => GridItemTile(
        productList: widget.productList,
        index: index,
      ),
    );
  }
}
