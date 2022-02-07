import 'package:flutter/material.dart';

class ScreenOneFilledItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: 5,
      itemBuilder: (ctx, i) => GridTile(
        child: GestureDetector(
          onTap: () {
            // Navigator.of(context).pushNamed(
            //   ProductDetailScreen.routeName,
            //   arguments: product.id,
            // );
          },
          child: FadeInImage(
            placeholder: AssetImage('assets/images/Component 15 – 1@3x.png'),
            image: NetworkImage(''),
            fit: BoxFit.cover,
          ),
        ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 2 / 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 5,
      ),
    );
  }
}
