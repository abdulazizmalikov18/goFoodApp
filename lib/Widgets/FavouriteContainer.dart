import 'package:flutter/material.dart';
import 'package:snov/Dish.dart';

class FavouriteContainer extends StatelessWidget {
  final int? index;

  const FavouriteContainer({Key? key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 330,
      margin: EdgeInsets.only(left: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: AssetImage(favouriteDishes[index!].image!),
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  favouriteDishes[index!].name!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '\$' + favouriteDishes[index!].price.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 20),
          CircleAvatar(
            backgroundColor: Colors.blue[700],
            child: Icon(
              Icons.favorite_border,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
