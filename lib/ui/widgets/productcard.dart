import 'package:saa2_assignment/models/models.dart';
import 'package:saa2_assignment/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductCard extends StatelessWidget {
  final Products product;
  ProductCard({this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(8),
        child: ListTile(
          contentPadding: EdgeInsets.all(10),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailData(
                      product: product,
                    )));
          },
          title: Text(
            product.name,
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text(NumberFormat.currency(
                  locale: 'id', decimalDigits: 0, symbol: "USD ")
              .format(int.parse(product.price))),
          leading: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(product.image, scale: 40),
              child: Text(product.name[0], style: TextStyle(fontSize: 20))),
          trailing: IconButton(
            icon: Icon(Icons.remove_red_eye, color: Colors.grey),
            onPressed: () {},
          ),
        ));
  }
}
