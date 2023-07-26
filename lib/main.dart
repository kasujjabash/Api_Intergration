import 'package:flutter/material.dart';
import 'package:dealfinder/data/api_provider.dart';
import 'package:dealfinder/modules/gargets_module.dart';

void main() {
  runApp(
     MaterialApp(
      title: 'Deal finder',
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {

final productProvider = ProductProvider();

  HomePage({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gargets Page'),
      ),

      body: FutureBuilder<List<Product>>(
        future: productProvider.fetchProducts(),
        builder: (context , snapshot) {


          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator()
            );


          }else if(snapshot.hasError){
            return const Center(
              child: Text("Error Occurred"),
            );


          }else{
            List<Product> products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index){

                return ListTile(
                  title: Text(products[index].title),
                  subtitle: Text(products[index].description),
                );
              },
            );
          };
        },
      ),
    );
  }
}
