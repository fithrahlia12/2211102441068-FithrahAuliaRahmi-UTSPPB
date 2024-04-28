import 'package:flutter/material.dart';
import 'package:car_rental_app/model/car.dart';

class RentalConfirmationScreen extends StatefulWidget {
  final Car car;

  RentalConfirmationScreen(this.car);

  @override
  _RentalConfirmationScreenState createState() =>
      _RentalConfirmationScreenState();
}

class _RentalConfirmationScreenState extends State<RentalConfirmationScreen> {
  int _numberOfHours = 0;
  String _paymentMethod = ''; // Definisikan variabel _paymentMethod di sini

  int calculateTotalCost() {
    // Hitung total biaya berdasarkan harga mobil per jam dan jumlah jam peminjaman
    return widget.car.price * _numberOfHours;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rental Confirmation',
          style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 171, 138),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [const Color.fromARGB(255, 255, 171, 138), const Color.fromARGB(255, 174, 255, 209)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Driver Profile',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 171, 138)),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("Images/driver.png"),
                radius: 30,
              ),
              title: Text(
                'Jessica Smith',
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
              ),
              subtitle: Text(
                'License: NWR 369852',
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
              ),
              trailing: GestureDetector(
                onTap: () {
                  _makePhoneCall(widget.car.phoneNumber);
                },
                child: Icon(Icons.phone, color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Booking Details',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Car : ${widget.car.brand} ${widget.car.model}',
                    style: TextStyle(fontSize: 18, color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Price/Hour : \IDR${widget.car.price}',
                    style: TextStyle(fontSize: 18, color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'Number of Hours: ',
                        style: TextStyle(fontSize: 18, color: const Color.fromARGB(255, 0, 0, 0)),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (_numberOfHours > 0) _numberOfHours--;
                          });
                        },
                        icon: Icon(Icons.remove, color: const Color.fromARGB(255, 0, 0, 0)),
                      ),
                      Text(
                        '$_numberOfHours',
                        style: TextStyle(fontSize: 18, color: const Color.fromARGB(255, 0, 0, 0)),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _numberOfHours++;
                          });
                        },
                        icon: Icon(Icons.add, color: const Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Total Cost: \IDR${calculateTotalCost()}',
                    style: TextStyle(fontSize: 18, color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _showPersonalInfoDialog(context); // Show personal info dialog
                },
                child: Text(
                  'Confirm Booking',
                  style: TextStyle(fontSize: 20, color: const Color.fromARGB(255, 0, 0, 0)),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 174, 255, 209),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _makePhoneCall(String phoneNumber) {
    print('Calling $phoneNumber');
  }

// Function to show personal info dialog
void _showPersonalInfoDialog(BuildContext context) {
  bool isPaymentSelected = false; // Menyimpan status apakah metode pembayaran sudah dipilih
  bool isSelfDrive = false; // Menyimpan status apakah peminjaman mobil lepas kunci

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            title: Text('Enter Your Personal Information'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Full Name'),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Phone Number'),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Pick-up Date and Time'),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Return Date and Time'),
                  ),
                  SizedBox(height: 10),
                  Text('Select Payment Method:', style: TextStyle(fontSize: 16)),
                  // Credit Card
                  RadioListTile(
                    title: Text('Credit Card'),
                    value: 'Credit Card',
                    groupValue: _paymentMethod,
                    onChanged: (String? value) {
                      setState(() {
                        _paymentMethod = value!;
                        isPaymentSelected = true; // Setelah memilih, status menjadi true
                      });
                    },
                  ),
                  // Debit Card
                  RadioListTile(
                    title: Text('Debit Card'),
                    value: 'Debit Card',
                    groupValue: _paymentMethod,
                    onChanged: (String? value) {
                      setState(() {
                        _paymentMethod = value!;
                        isPaymentSelected = true;
                      });
                    },
                  ),
                  // ATM
                  RadioListTile(
                    title: Text('ATM'),
                    value: 'ATM',
                    groupValue: _paymentMethod,
                    onChanged: (String? value) {
                      setState(() {
                        _paymentMethod = value!;
                        isPaymentSelected = true;
                      });
                    },
                  ),
                  // Cash
                  RadioListTile(
                    title: Text('Cash'),
                    value: 'Cash',
                    groupValue: _paymentMethod,
                    onChanged: (String? value) {
                      setState(() {
                        _paymentMethod = value!;
                        isPaymentSelected = true;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  CheckboxListTile(
                    title: Text('Self Drive (disc : 10%)'), // Label untuk opsi peminjaman lepas kunci
                    value: isSelfDrive,
                    onChanged: (bool? value) {
                      setState(() {
                        isSelfDrive = value ?? false; // Mengupdate status peminjaman lepas kunci
                      });
                    },
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                  if (isPaymentSelected) {
                    // Jika metode pembayaran sudah dipilih, tampilkan dialog konfirmasi
                    _showBookingSuccessDialog(context); // Show booking success dialog
                  }
                },
                child: Text('Confirm'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: Text('Cancel'),
              ),
            ],
          );
        },
      );
    },
  );
}
  
  // Function to show booking success dialog
  void _showBookingSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Booking Successful'),
          content: Text('Your booking has been confirmed successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                // Tambahkan tindakan tambahan di sini jika ada
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}