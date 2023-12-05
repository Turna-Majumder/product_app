import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductDetailsPage(),


    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Dove Ultra Care Shampoo',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Image.network(
              'https://m.media-amazon.com/images/I/71enDA8w01L._SL1500_.jpg',
              height: 200,
            ),
            SizedBox(height: 16),
            Text(
              'Product Price: \ 150tk',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'About this item',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'INGREDIENTS:Water (Aqua), Sodium Laureth Sulfate, Cocamidopropyl Betaine, Sodium Chloride, Fragrance (Parfum), Sodium Benzoate, Citric Acid, PPG-9, Polyquaternium-10, Disodium EDTA, Cocos Nucifera (Coconut) Oil, Cocos Nucifera (Coconut) Liquid Endosperm, Citrus Aurantifolia (Lime) Juice, Citronellol, Limonene, Linalool, Yellow 5\n\nHOW TO USE: Apply this nourishing shampoo to wet hair, lather and rinse. For best results, use with Dove Ultra Care Daily Moisture Conditioner. Suitable for daily use',
              style: TextStyle(fontSize: 13),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                  MaterialPageRoute(builder: (context) => BuyNowPage() ),
                );

              },
              child: Text('Buy Now'),
            ),
            // Add other widgets as needed
          ],
        ),
      ),
    );
  }
}


class BuyNowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy Now'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Choose Payment Method:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PaymentButton(imageUrl: 'assets/bkash.png', onPressed: () => choosePayment('BKash')),
                PaymentButton(imageUrl: 'assets/rocket.png', onPressed: () => choosePayment('Rocket')),
                PaymentButton(imageUrl: 'assets/visa.png', onPressed: () => choosePayment('Visa')),
                PaymentButton(imageUrl: 'assets/mastercard.png', onPressed: () => choosePayment('Mastercard')),
                //PaymentButton(imageUrl: 'assets/amex.png', onPressed: () => choosePayment('AmEx')),
              ],
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              items: ['Large size', 'Medium size', 'Small size']
                  .map((String value) => DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              ))
                  .toList(),
              onChanged: (String? value) {},
              hint: Text('Select an option'),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }

  void choosePayment(String paymentMethod) {
    print('Selected Payment Method: $paymentMethod');
    // Add your logic for handling the selected payment method
  }
}

class PaymentButton extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onPressed;

  const PaymentButton({required this.imageUrl, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Image.asset(
        imageUrl,
        height: 40,
        width: 40,
      ),
    );
  }
}

