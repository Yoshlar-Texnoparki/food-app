import 'package:flutter/material.dart';
import 'package:food_app/src/ui/home/home_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final Restaurant data;
  const ProductDetailScreen({super.key, required this.data});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  List<CategoryFood> categories = [
    CategoryFood(name: "Burger",),
    CategoryFood(name: "Pizza",),
    CategoryFood(name: "Hot-Dog",),
    CategoryFood(name: "KFC",),
    CategoryFood(name: "Drink",),
    CategoryFood(name: "Tea",),
    CategoryFood(name: "NON-Burger",),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Details",style: TextStyle(fontSize: 24),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 34,),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 184,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 184,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey
                      ),),
                    Positioned(
                      bottom: 20,
                        right: 20,
                        child: CircleAvatar(child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border))))
                  ],
                ),
              ),
              SizedBox(height: 8,),
              Text(widget.data.name,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
              SizedBox(height: 12,),
              Text(widget.data.foods,style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal),),
              SizedBox(height: 22,),
              Row(
                children: [
                  Icon(
                    Icons.star_border,
                    color: Colors.orange,
                    size: 24,
                  ),
                  Text(
                    widget.data.rating.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                  ),
                  SizedBox(
                    width: 22,
                  ),
                  Icon(
                    Icons.delivery_dining_outlined,
                    color: Colors.orange,
                    size: 24,
                  ),
                  Text(
                    widget.data.delivered,
                    style: TextStyle(fontWeight: FontWeight.normal,fontSize: 18),
                  ),
                  SizedBox(
                    width: 22,
                  ),
                  Icon(
                    Icons.access_time_sharp,
                    color: Colors.orange,
                    size: 24,
                  ),
                  Text(
                    widget.data.time,
                    style: TextStyle(fontWeight: FontWeight.normal,fontSize: 18),
                  ),
                ],
              ),
              SizedBox(height: 22,),
              SizedBox(
                height: 60,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (ctx, index) {
                      return GestureDetector(
                        onTap: () {
                          // setState(() {
                          //   selectedIndex = index;
                          // });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          alignment: Alignment.center,
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white),
                          child: Text(categories[index].name),
                        ),
                      );
                    }),
              ),
              SizedBox(height: 43,),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 14,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemBuilder: (itemBuilder,index){
                return Center(
                  child: SizedBox(
                    height: 190,
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          width: 180,
                          height: 170,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey.withOpacity(0.5))
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(height: 60,),
                              Text("Burger Ferguson",style: TextStyle(fontWeight: FontWeight.bold,),),
                              Text("Spicy restaurant"),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("\$ 40"),
                                    CircleAvatar(
                                      backgroundColor: Colors.orange,
                                        child: IconButton(onPressed: (){}, icon: Icon(Icons.add)))
                                  ],
                                ),
                              ),
                              SizedBox(height: 12,)
                            ],
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 31,
                          child: Container(
                            height: 80,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
