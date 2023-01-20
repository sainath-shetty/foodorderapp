import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:food_order_app/screen/add_new_food.dart';

class AdminPage extends StatefulWidget {
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  late Future<ListResult> futureFiles;

  @override
  void initState() {
    super.initState();
    FirebaseStorage.instance.ref('/files').listAll();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Select Menu',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 110,
              ),
              Container(
                width: 200,
                height: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddFood()),
                    );
                  },
                  child: Image.asset('images/add_menu.png'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Column(
            children: [
              Text(
                "Enter the new food info here",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Center(
              child: Container(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Read()));
              },
              child: Text(
                'List of Food Items ',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          )),
          Center(
              child: Container(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ReadPayment()));
              },
              child: Text(
                'List of Orders and payments ',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ))
          //here display the list of food shown to the user and give the option to show the food or not
        ],
      ),
    );
  }
}

class Read extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Food').snapshots(),
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
                            image: item["foodimage"],
                            title: item["foodtitle"],
                            price: item["foodprice"],
                            stars: item["foodrating"],
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

  bottomContainer(
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
          ),
        ],
      ),
    );
  }
}

class ReadPayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Payment').snapshots(),
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
                      crossAxisCount: 1,
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      children: [
                        for (var item in snapshot.data!.docs)
                          ListPayments(
                            Totalprice: item["Total Price"],
                            title: item["foodtitle"],
                            quantity: item["quantity"],
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

  ListPayments(
      {required String Totalprice,
      required String title,
      required String quantity}) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(

        color: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(

            child:  Text(
                title,
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,

                ),
              ),



          ),
          SizedBox(height: 40,),
          Text(
            "Paid: Rs $Totalprice",style:TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold) ,
          ),
          SizedBox(height: 30,),
          Text("quantity : $quantity",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),)
        ],
      ),
    );
  }
}
