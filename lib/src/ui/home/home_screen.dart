import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
        title: Column(
          children: [
            Text("Deliver to"),
            Text("Halal lab office"),
          ],
        ),
        actions: [
          Container(
            width: 45,
            height: 45,
            margin: EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.black
            ),
            child: Stack(
              children: [
                IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.shopping_bag,size: 30,color: Colors.white,)),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    alignment: Alignment.center,
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.orange
                    ),
                    child: Text("2",style: TextStyle(color: Colors.white),),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
