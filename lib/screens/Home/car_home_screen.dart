import 'package:flutter/material.dart';
import 'package:car_rental_app/constants.dart';
import 'package:car_rental_app/model/car.dart';
import 'package:car_rental_app/screens/Detail/car_detail_screen.dart';
import 'package:car_rental_app/Common/card_list.dart';

// Buat kelas CarItems untuk menampilkan informasi mobil
class CarItems extends StatelessWidget {
  final String name;
  final String value;

  const CarItems({
    required this.name,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black, // Sesuaikan dengan warna teks yang diinginkan
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: Colors.black, // Sesuaikan dengan warna teks yang diinginkan
          ),
        ),
      ],
    );
  }
}

class CarHomeScreen extends StatelessWidget {
  const CarHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: backgroundColor,
        title: const Text(
          "Available Car",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        actions: const [
          Icon(
            Icons.menu,
            color: Colors.white,
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: ListView.builder(
        itemCount: carList.length,
        itemBuilder: (context, index) {
          final Car car = carList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CarDetailScreen(car),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 24, right: 24, top: 50),
                    padding: const EdgeInsets.only(
                      left: 25,
                      bottom: 15,
                      right: 20,
                      top: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: cardColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "\IDR${car.price.toString()}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        const Text(
                          "price/hr",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CarItems(name: "Brand", value: car.brand),
                            CarItems(name: "Model No", value: car.model),
                            CarItems(name: "CO2", value: car.co2),
                            CarItems(name: "Fuel Cons", value: car.fuelCons),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 15,
                    child: Hero(
                      tag: car.image,
                      child: Image.asset(
                        car.image,
                        height: 90,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
