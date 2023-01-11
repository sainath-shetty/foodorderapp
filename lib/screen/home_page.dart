import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Widget bottomContainer(
      {required String image, required String title, required int price}) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(image),
          ),
          ListTile(
            leading: Text(
              title,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            trailing: Text(
              "Rs $price",
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget categoriesContainer({required String images, required String title}) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(images),
              fit: BoxFit.fill,
            ),
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 20, color: Colors.white),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0.0,
        leading: Icon(Icons.sort),
        actions: [
          CircleAvatar(
            backgroundImage:
                AssetImage('images/canteenIcon-removebg-preview.png'),
          )
        ],
      ),
      body: Container(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Container(
              height: 5,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Search for Food here",
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  filled: true,
                  fillColor: Colors.orangeAccent,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  categoriesContainer(
                      images: "images/fried_rice.png", title: "All"),
                  SizedBox(
                    width: 40,
                  ),
                  categoriesContainer(images: "images/vada.png", title: "Snacks"),
                  SizedBox(
                    width: 40,
                  ),
                  categoriesContainer(
                      images: "images/pulav_rice.png", title: "Lunch")
                ],
              ),
            ),
            Container(
              height: 1000,
              child: GridView.count(
                shrinkWrap: false,
                primary: false,
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                bottomContainer(image: "images/noodles.png", title: "Noddles(combo)", price: 40),
                bottomContainer(image: "images/pulav_rice.png", title: "Pulav(combo)", price: 40),

              ],),
            )




          ],
        ),
      ),
    );
  }
}
