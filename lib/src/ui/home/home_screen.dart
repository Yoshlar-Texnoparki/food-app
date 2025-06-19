import 'package:flutter/material.dart';
import 'package:food_app/src/ui/deatil/product_deatil_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 2;
  String search = "all";
  List<Category> categories = [
    Category(name: "All", image: Icon(Icons.fastfood)),
    Category(name: "Burger", image: Icon(Icons.fastfood)),
    Category(name: "Pizza", image: Icon(Icons.fastfood)),
    Category(name: "Hot-Dog", image: Icon(Icons.fastfood)),
    Category(name: "KFC", image: Icon(Icons.fastfood)),
    Category(name: "Drink", image: Icon(Icons.fastfood)),
    Category(name: "Tea", image: Icon(Icons.fastfood)),
  ];
  List<Restaurant> restaurant = [
    Restaurant(
        name: "Rose garden restaurant",
        delivered: "free",
        foods: "Burger - Chiken - Riche - Wings ",
        rating: 4.7,
        time: "20 min"),
    Restaurant(
        name: "Musaffo",
        delivered: "free",
        foods: "Somsa - Lagmon - Osh - Shashlik ",
        rating: 4.7,
        time: "20 min"),
    Restaurant(
        name: "Banonza",
        delivered: "free",
        foods: "Tort - Shirinliklar - Coffe - Choy ",
        rating: 4.7,
        time: "10 min"),
    Restaurant(
        name: "Milly",
        delivered: "free",
        foods: "Tort - Shirinliklar - Coffe - Choy ",
        rating: 4.7,
        time: "10 min"),
    Restaurant(
        name: "Kafe",
        delivered: "free",
        foods: "Tort - Shirinliklar - Coffe - Choy ",
        rating: 4.7,
        time: "10 min"),
    Restaurant(
        name: "KFC",
        delivered: "free",
        foods: "Tort - Shirinliklar - Coffe - Choy ",
        rating: 4.7,
        time: "10 min"),
    Restaurant(
        name: "Pizza",
        delivered: "free",
        foods: "Tort - Shirinliklar - Coffe - Choy ",
        rating: 4.7,
        time: "10 min"),
    Restaurant(
        name: "EVOS",
        delivered: "free",
        foods: "Tort - Shirinliklar - Coffe - Choy ",
        rating: 4.7,
        time: "10 min"),
    Restaurant(
        name: "Yalla",
        delivered: "free",
        foods: "Tort - Shirinliklar - Coffe - Choy ",
        rating: 4.7,
        time: "10 min"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Deliver to",
                style: TextStyle(fontSize: 18, color: Colors.deepOrangeAccent)),
            Text("Halal lab office",
                style: TextStyle(fontSize: 18, color: Colors.black)),
          ],
        ),
        actions: [
          Container(
            width: 45,
            height: 45,
            margin: EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.black),
            child: Stack(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.shopping_bag,
                      size: 30,
                      color: Colors.white,
                    )),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    alignment: Alignment.center,
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.orange),
                    child: Text(
                      "2",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Hey Halal,",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    " Good Afternoon!",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                height: 62,
                margin: EdgeInsets.only(top: 16, bottom: 32),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFF6F6F6),
                ),
                child: TextField(
                  onSubmitted: (query){
                    for(int i =0; i<restaurant.length;i++){
                      if(restaurant[i].name.contains(query)){
                        setState(() {
                          search = query;
                        });
                      }else if(query.isEmpty){
                        search = "all";
                        setState(() {});
                      }
                      else{
                        setState(() {
                          search = query;
                        });
                      }
                    }
                    query = 'all';
                    setState(() {

                    });
                    print(search);

                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      hintText: "Search dishes, restaurants"),
                ),
              ),
              Row(
                children: [
                  Text(
                    "All Categories",
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  TextButton(onPressed: () {}, child: Text("See All")),
                  Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
              SizedBox(
                height: 60,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (ctx, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          alignment: Alignment.center,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: selectedIndex == index
                                  ? Color(0xFFFFD27C)
                                  : Colors.grey),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 8),
                                height: 44,
                                width: 44,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: categories[index].image,
                              ),
                              Text(categories[index].name),
                              SizedBox(
                                width: 8,
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  Text(
                    "Open Restaurants",
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  TextButton(onPressed: () {}, child: Text("See All")),
                  Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
            ListView.builder(
              itemCount: restaurant.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
                itemBuilder: (ctx,index){
                if(restaurant[index].name == search){
                  return GestureDetector(
                    onTap: (){
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 225,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 137,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey),
                          ),
                          Text(
                            restaurant[index].name,
                            style: TextStyle(fontSize: 23),
                          ),
                          Text(
                            restaurant[index].foods,
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star_border,
                                color: Colors.orange,
                              ),
                              Text(
                                restaurant[index].rating.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 22,
                              ),
                              Icon(
                                Icons.delivery_dining_outlined,
                                color: Colors.orange,
                              ),
                              Text(
                                restaurant[index].delivered,
                                style: TextStyle(fontWeight: FontWeight.normal),
                              ),
                              SizedBox(
                                width: 22,
                              ),
                              Icon(
                                Icons.access_time_sharp,
                                color: Colors.orange,
                              ),
                              Text(
                                restaurant[index].time,
                                style: TextStyle(fontWeight: FontWeight.normal),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }
                else if(search == "all" || search == ""){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (builder){
                        return ProductDetailScreen(data: restaurant[index],);
                      }));
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 225,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 137,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey),
                          ),
                          Text(
                            restaurant[index].name,
                            style: TextStyle(fontSize: 23),
                          ),
                          Text(
                            restaurant[index].foods,
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star_border,
                                color: Colors.orange,
                              ),
                              Text(
                                restaurant[index].rating.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 22,
                              ),
                              Icon(
                                Icons.delivery_dining_outlined,
                                color: Colors.orange,
                              ),
                              Text(
                                restaurant[index].delivered,
                                style: TextStyle(fontWeight: FontWeight.normal),
                              ),
                              SizedBox(
                                width: 22,
                              ),
                              Icon(
                                Icons.access_time_sharp,
                                color: Colors.orange,
                              ),
                              Text(
                                restaurant[index].time,
                                style: TextStyle(fontWeight: FontWeight.normal),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }
                else if(restaurant[index].name != search){
                  return SizedBox();
                }
                else{
                  return SizedBox();
                }
            })
            ],
          ),
        ),
      ),
    );
  }
}

class Category {
  String name;
  Icon image;

  Category({required this.name, required this.image});
}
class CategoryFood {
  String name;

  CategoryFood({required this.name,});
}

class Restaurant {
  String name;
  String foods;
  double rating;
  String delivered;
  String time;

  Restaurant(
      {required this.name,
      required this.delivered,
      required this.foods,
      required this.rating,
      required this.time});
}
