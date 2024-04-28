class Car {
  String image;
  int price;
  String brand;
  String model;
  String co2;
  String fuelCons;
  String phoneNumber;

  Car(
    this.image,
    this.price,
    this.brand,
    this.model,
    this.co2,
    this.fuelCons,
    this.phoneNumber,
  );
}

List<Car> carList = [
  Car(
    'Images/bentley.png',
    400000,
    'Bentley',
    '3A 9200',
    '77/km',
    '5,5 L',
    '1234567890', 
  ),
  Car(
    'Images/rolls_royce.png',
    2000000,
    'RR',
    'Ghost 2024',
    '77/km',
    '6,6 L',
    '1234567890', 
  ),
  Car(
    'Images/maserati.png',
    1000000,
    'Maserati',
    'GranTurismo',
    '95/km',
    '4,8 L',
    '1234567890', 
  ),
  Car(
    'Images/cadillac.png',
    350000,
    'Cadillac',
    'Escalade 2015 ',
    '77/km',
    '6,2L',
    '1234567890', 
  ),
  Car(
    'Images/toyota_camry.png',
    300000,
    'Toyota',
    'Camry',
    '100 g/km',
    '5.7 L/100km',
    '1234567890',
  ),
  Car(
    'Images/honda_civic.png',
    250000,
    'Honda',
    'Civic',
    '95 g/km',
    '5.4 L/100km',
    '1234567890',
  ),
  Car(
    'Images/ford_mustang.png',
    350000,
    'Ford',
    'Mustang',
    '120 g/km',
    '7.1 L/100km',
    '1234567890',
  ),
  Car(
    'Images/chevrolet_camaro.png',
    320000,
    'Chevrolet',
    'Camaro',
    '115 g/km',
    '6.8 L/100km',
    '1234567890',
  ),
  Car(
    'Images/audi_a4.png',
    400000,
    'Audi',
    'A4',
    '110 g/km',
    '6.5 L/100km',
    '1234567890',
  ),
  Car(
    'Images/bmw_3_series.png',
    380000,
    'BMW',
    '3 Series',
    '105 g/km',
    '6.2 L/100km',
    '1234567890',
  ),
  Car(
    'Images/mercedes_benz_c_class.png',
    420000,
    'Mercedes',
    'Benz C',
    '115 g/km',
    '6.8 L/100km',
    '1234567890',
  ),
  Car(
    'Images/tesla_s_plaid.png',
    550000,
    'Tesla',
    's plaid',
    'Electric',
    '16.7 kWh/100km',
    '1234567890',
  ),
  Car(
    'Images/bmw_m4.png',
    270000,
    'BMW',
    'M4',
    '125 g/km',
    '7.4 L/100km',
    '1234567890',
  ),
  Car(
    'Images/nissan_r35.png',
    280000,
    'Nissan',
    'R35',
    '120 g/km',
    '3.8 L/100km',
    '1234567890',
  ),
];
