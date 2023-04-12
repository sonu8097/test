import 'package:deals/featured.dart';
import 'package:deals/popular.dart';
import 'package:deals/top.dart';
import 'package:flutter/material.dart';

import 'dataconstants.dart';
import 'dealsCntroller.dart';
class Deals extends StatefulWidget {
  // const Deals({Key? key}) : super(key: key);

  @override
  State<Deals> createState() => _DealsState();
}

class _DealsState extends State<Deals> {
  TabController tabController;
  @override
initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await DataConstants.splitController.fetchData();
    });

  super.initState();
  // Add listeners to this class
  // asyncMethod();
  }

  void asyncMethod() async {
    await  DataConstants.splitController.fetchData();
  }


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: DefaultTabController(
        length: 3,
        child:   Scaffold(
          drawer: Drawer(

            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text(
                        "Drawer"
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 30,),
                  ListTile(title: Text("TOP"),onTap: ()async{
                   await DataConstants.splitController.fetchData();
                  },),
                  SizedBox(height: 30,),
                  ListTile(title: Text("POPULAR"),
                    onTap: ()async{
                    await DataConstants.splitController.fetchData();
                  },),
                  SizedBox(height: 30,),
                  ListTile(title: Text("FEATURED"),onTap: ()async{
                    await DataConstants.splitController.fetchData();
                  },)
                ],
              ),
            ),
          ),
floatingActionButton: FloatingActionButton(
  backgroundColor: Colors.deepOrange,
  onPressed: (){},
  child: const Text("₹",style: TextStyle(fontSize: 28),),
),
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Text("TOP")),
                Tab(icon: Text("POPULAR")),
                Tab(icon: Text("FEATURED")),

              ],
            ),
            title: const Text("Deals"),
            actions:const [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(Icons.search),
              )
            ],
          ),

          body:   TabBarView(
            physics:const AlwaysScrollableScrollPhysics(),
            controller: tabController,
        children: [
          Top(),
          Popular(),
          Featured(),
        // Icon(Icons.directions_transit),
        // Icon(Icons.directions_bike),
        ],
      ),
        ) ,
      ),
    ) ;



  }
}
