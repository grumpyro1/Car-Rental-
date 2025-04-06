import 'package:car_rental/data/models/Car.dart';
import 'package:car_rental/presentation/widgets/car_card.dart';
import 'package:flutter/material.dart';

class CarListScreen extends StatelessWidget {
  // const CarListScreen({super.key});
  final List<Car> cars = [
    Car('Fortuner GR', 870, 50, 45),
    Car('Fortuner GR', 870, 50, 45),
    Car('Fortuner GR', 870, 50, 45),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Your Car'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index){
          return CarCard(car: cars[index]);
        }
      ),
    );
  }
}