part of 'models.dart';

class Products extends Equatable{

  final String id;
  final String name;
  final String price;
  final String image;

  Products(this.id, this.name, this.price, this.image);

  @override
  List<Object> get props => [id, name, price, image];

}