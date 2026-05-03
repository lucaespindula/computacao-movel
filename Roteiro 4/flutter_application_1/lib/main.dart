import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProdutoPage(),
    );
  }
}

class ProdutoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double largura = MediaQuery.of(context).size.width;

    return Scaffold(

      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        title: Text("LOJA OFICIAL DA NIKE"),
        centerTitle: true,
      ),

      body: Center(

        child: Container(

          width: largura * 0.9, // RESPONSIVO

          padding: EdgeInsets.all(16),

          decoration: BoxDecoration(

            color: Colors.white,

            borderRadius: BorderRadius.circular(15),

            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: Offset(0,4),
              )
            ],

          ),

          child: Column(

            mainAxisSize: MainAxisSize.min,

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              ClipRRect(

                borderRadius: BorderRadius.circular(10),

                child: Image.network(

                  "data:image/webp;base64,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",

                  width: double.infinity,

                  height: 200,

                  fit: BoxFit.cover,

                ),

              ),

              SizedBox(height: 12),

              Text(

                "IPHONE 17 PRO MAX",

                style: TextStyle(

                  fontSize: 22,

                  fontWeight: FontWeight.bold,

                ),

              ),

              SizedBox(height: 8),

              Text(

                "IPHONE 17 PRO MAX 2TB LARANJA",

                style: TextStyle(

                  fontSize: 16,

                  color: Colors.grey[700],

                ),

              ),

              SizedBox(height: 16),

              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  Text(

                    "R\$ 12499,99",

                    style: TextStyle(

                      fontSize: 24,

                      fontWeight: FontWeight.bold,

                      color: Colors.green,

                    ),

                  ),

                  ElevatedButton(

                    style: ElevatedButton.styleFrom(

                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),

                    ),

                    onPressed: () {

                      print("Produto comprado");

                    },

                    child: Text(
                      "Comprar",
                      style: TextStyle(fontSize: 16),
                    ),

                  ),

                ],

              ),

            ],

          ),

        ),

      ),

    );

  }

}