import 'dart:convert';

class Coffee {
  String name;
  double price;
  String image;
  String description;
  double rate;
  CoffeeType type;
  CoffeeSize size;

  Coffee({
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.rate,
    this.type = CoffeeType.latte,
    this.size = CoffeeSize.small,
  });
  

  Coffee copyWith({
    String? name,
    double? price,
    String? image,
    String? description,
    double? rate,
  }) {
    return Coffee(
      name: name ?? this.name,
      price: price ?? this.price,
      image: image ?? this.image,
      description: description ?? this.description,
      rate: rate ?? this.rate,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'name': name});
    result.addAll({'price': price});
    result.addAll({'image': image});
    result.addAll({'description': description});
    result.addAll({'rate': rate});
  
    return result;
  }

  factory Coffee.fromMap(Map<String, dynamic> map) {
    return Coffee(
      name: map['name'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      image: map['image'] ?? '',
      description: map['description'] ?? '',
      rate: map['rate']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Coffee.fromJson(String source) => Coffee.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Coffee(name: $name, price: $price, image: $image, description: $description, rate: $rate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Coffee &&
      other.name == name &&
      other.price == price &&
      other.image == image &&
      other.description == description &&
      other.rate == rate;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      price.hashCode ^
      image.hashCode ^
      description.hashCode ^
      rate.hashCode;
  }
}

enum CoffeeType { latte, cappuccino, espresso, coldbrew, mocha, americano }

enum CoffeeSize { small, medium, large }
final List<Coffee> coffees = [
  Coffee(
    name: 'Caramel Latte',
    price: 4.99,
    image: 'assets/coffees/caramel_latte.png',
    description: 'Sweet caramel mixed with creamy latte',
    rate: 4.8,
    type: CoffeeType.latte,
    size: CoffeeSize.medium,
  ),
  Coffee(
    name: 'Iced Cappuccino',
    price: 5.49,
    image: 'assets/coffees/iced_cappuccino.png',
    description: 'Chilled cappuccino with foam art',
    rate: 4.5,
    type: CoffeeType.cappuccino,
    size: CoffeeSize.large,
  ),
  Coffee(
    name: 'Espresso Shot',
    price: 3.99,
    image: 'assets/coffees/espresso_shot.png',
    description: 'Strong single-origin espresso',
    rate: 4.7,
    type: CoffeeType.espresso,
    size: CoffeeSize.small,
  ),
  Coffee(
    name: 'Vanilla Cold Brew',
    price: 5.99,
    image: 'assets/coffees/vanilla_cold_brew.png',
    description: 'Smooth cold brew with vanilla notes',
    rate: 4.9,
    type: CoffeeType.coldbrew,
    size: CoffeeSize.medium,
  ),
  Coffee(
    name: 'Mocha Dream',
    price: 6.49,
    image: 'assets/coffees/mocha_dream.png',
    description: 'Rich chocolate and coffee blend',
    rate: 4.6,
    type: CoffeeType.mocha,
    size: CoffeeSize.large,
  ),
];