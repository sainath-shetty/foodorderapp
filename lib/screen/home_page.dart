import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_order_app/screen/add_to_cart.dart';

class HomePage extends StatelessWidget {
  Widget bottomContainer(
      {required String image,
      required String title,
      required String price,
      required String stars}) {
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
                for (int i = 0; i < int.parse(stars); i++)
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
              child: Column(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => ALL()));
                          },
                          child: Ink.image(
                            image: AssetImage("images/fried_rice.png"),
                            height: 200,
                            width: 200,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          height: 10,
                        ),
                      ),
                      Text(
                        "ALL",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Snacks()));
                          },
                          child: Ink.image(
                            image: AssetImage("images/vada.png"),
                            height: 200,
                            width: 200,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          height: 10,
                        ),
                      ),
                      Text(
                        "SNACKS",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Lunch()));
                          },
                          child: Ink.image(
                            image: AssetImage("images/pulav_rice.png"),
                            height: 200,
                            width: 200,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          height: 10,
                        ),
                      ),
                      Text(
                        "LUNCH",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//stateless widget for displaying the all category list of food items

class ALL extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    bottomContainer(
        {required String image,
          required String title,
          required String price,
          required String stars,
          required String category}) {
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
              backgroundColor: Colors.orange,
              //here apply background image

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
                  for (int i = 0; i < int.parse(stars); i++)
                    Icon(
                      Icons.star,
                      size: 20,
                      color: Colors.white,
                    ),
                  SizedBox(
                    width: 25,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddToCart(image, title, price, stars, category),
                          ));

      },

                        // AddToCart(image, title, price, stars, category),
                    icon: Icon(
                      // <-- Icon
                      Icons.food_bank_outlined,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                    ),
                    label: Text('buy'), // <-- Text
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('food').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, i) {
                  QueryDocumentSnapshot x = snapshot.data!.docs[i];
                  return Container(
                    height: 1000,
                    child: GridView.count(
                      shrinkWrap: false,
                      primary: false,
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: [
                        for (var item in snapshot.data!.docs)
                          bottomContainer(
                            image: (item["foodimage"]),
                            title: item["foodtitle"],
                            price: item["foodprice"],
                            stars: item["foodrating"],
                            category: item["foodcategory"],
                          ),
                      ],
                    ),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),

      ),

    );


  }

}

//widgets which is used to display the list of all the food items which come under the snacks category

class Snacks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    bottomContainer(
        {required String image,
          required String title,
          required String price,
          required String stars,
          required String category}) {
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
                  for (int i = 0; i < int.parse(stars); i++)
                    Icon(
                      Icons.star,
                      size: 20,
                      color: Colors.white,
                    ),
                  SizedBox(
                    width: 25,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddToCart(image, title, price, stars, category),
                          ));

                    },

                    // AddToCart(image, title, price, stars, category),
                    icon: Icon(
                      // <-- Icon
                      Icons.food_bank_outlined,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                    ),
                    label: Text('buy'), // <-- Text
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    return MaterialApp(
      home: Scaffold(


        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('food').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, i) {
                  QueryDocumentSnapshot x = snapshot.data!.docs[i];
                  return Container(
                    height: 1000,
                    child: GridView.count(
                      shrinkWrap: false,
                      primary: false,
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: [
                        for (var item in snapshot.data!.docs)
                          if (item["foodcategory"] == "Snacks")
                            bottomContainer(
                                image: (item["foodimage"]),
                                title: item["foodtitle"],
                                price: item["foodprice"],
                                stars: item["foodrating"],
                                category: item["foodcategory"]),
                      ],
                    ),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }


}

//widget to display the food which is having the category as LUNCH

class Lunch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    bottomContainer(
        {required String image,
          required String title,
          required String price,
          required String stars,
          required String category}) {
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
                  for (int i = 0; i < int.parse(stars); i++)
                    Icon(
                      Icons.star,
                      size: 20,
                      color: Colors.white,
                    ),
                  SizedBox(
                    width: 25,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddToCart(image, title, price, stars, category),
                          ));

                    },

                    // AddToCart(image, title, price, stars, category),
                    icon: Icon(
                      // <-- Icon
                      Icons.food_bank_outlined,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                    ),
                    label: Text('buy'), // <-- Text
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('food').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, i) {
                  QueryDocumentSnapshot x = snapshot.data!.docs[i];
                  return Container(
                    height: 1000,
                    child: GridView.count(
                      shrinkWrap: false,
                      primary: false,
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: [
                        for (var item in snapshot.data!.docs)
                          if (item["foodcategory"] == "Lunch")
                            bottomContainer(
                                image: (item["foodimage"]),
                                title: item["foodtitle"],
                                price: item["foodprice"],
                                stars: item["foodrating"],
                                category: item["foodcategory"]),
                      ],
                    ),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }


}
