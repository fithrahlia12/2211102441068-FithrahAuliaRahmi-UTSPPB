import 'package:flutter/material.dart';
import 'package:car_rental_app/constants.dart';
import 'package:car_rental_app/model/car.dart';
import 'package:car_rental_app/screens/RentalConfirmationScreen.dart';
import 'package:car_rental_app/Common/card_list.dart'; // Import CarItems from the correct location

class CarDetailScreen extends StatelessWidget {
  const CarDetailScreen(this.car, {Key? key}) : super(key: key);
  final Car car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Image.asset(
            "Images/map.png",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          // Back button, title, and menu icon
          carDetailAppbar(context),
          Positioned(
            left: 10,
            right: 10,
            bottom: 25,
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(top: 35),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      cardInformation(),
                      const Divider(
                        height: 15,
                        color: Color.fromARGB(179, 75, 218, 101),
                      ),
                      Row(
                        children: [
                          // Driver image
                          Image.asset(
                            "Images/driver.png",
                            height: 85,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                // Driver name, rating, etc.
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Jessica Smith",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          "License: NWR 369852",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "369",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Color.fromARGB(255, 0, 0, 0)),
                                        ),
                                        Text(
                                          "Ride",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Row(
                                  children: [
                                    Text(
                                      "5.0",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Icon(Icons.star,
                                        color: Color.fromARGB(255, 247, 255, 92), size: 16),
                                    Icon(Icons.star,
                                        color: Color.fromARGB(255, 247, 255, 92), size: 16),
                                    Icon(Icons.star,
                                        color: Color.fromARGB(255, 247, 255, 92), size: 16),
                                    Icon(Icons.star,
                                        color: Color.fromARGB(255, 247, 255, 92), size: 16),
                                    Icon(Icons.star,
                                        color: Color.fromARGB(255, 247, 255, 92), size: 16)
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                // Book Now button aligned to the right
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              RentalConfirmationScreen(car),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 15),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: cardColor,
                                      ),
                                      child: const Text(
                                        "Book Now",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(255, 0, 0, 0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                // Car image
                Positioned(
                  right: 30,
                  child: Hero(
                    tag: car.image,
                    child: Image.asset(
                      car.image,
                      height: 95,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Column cardInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "\IDR${car.price.toString()}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        const Text(
          "price/hr",
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CarItems(name: "Brand", value: car.brand, textColor: Colors.black),
            CarItems(
                name: "Model No", value: car.model, textColor: Colors.black),
            CarItems(name: "CO2", value: car.co2, textColor: Colors.black),
            CarItems(
                name: "Fuel Cons",
                value: car.fuelCons,
                textColor: Colors.black),
          ],
        ),
      ],
    );
  }

  SafeArea carDetailAppbar(BuildContext context) {
    return SafeArea(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        const Text(
          "Car Detail",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.menu,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ],
    ));
  }
}
