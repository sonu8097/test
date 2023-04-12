import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'dataconstants.dart';
import 'dealsCntroller.dart';
class Top extends StatefulWidget {
  // const Top({Key? key}) : super(key: key);

  @override
  State<Top> createState() => _TopState();
}

class _TopState extends State<Top> {

  @override
  initState() {
    // DataConstants.splitController.fetchData();
    // DataConstants();
    super.initState();
    // Add listeners to this class
    asyncMethod();
  }

  void asyncMethod() async {
    await  DataConstants.splitController.fetchData();
  }

  @override
  Widget build(BuildContext context) {

    return  RefreshIndicator(
        onRefresh: () async {
          await  DataConstants.splitController.fetchData();
        },
        child:Obx((){
          return
            SplitController.isLoading.value? const Center(
              child:  CircularProgressIndicator(),
            ):
            SplitController.dataList.isEmpty?

              Center(
              child:  ElevatedButton(
                  onPressed: ()async{
                    await DataConstants.splitController.fetchData();

                  },
                  child: Text("No Data")),
            ):

            ListView.builder(
                shrinkWrap: true,
                itemCount: SplitController.dataList.length,
                itemBuilder: (BuildContext context, int index){
                  return Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Card(
                      elevation: 5,
                      child: Container(
                        height: 130,
                        width: 200,
                        decoration:const BoxDecoration(
                          // color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(2))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    color: Colors.grey,
                                    height: 60,
                                    width: 80,
                                    child:

                                    Image.network(SplitController.dataList[index].imageMedium ,fit:BoxFit.fill ,
                                      errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
                                        return  Center(child:  Text('No Image',style: TextStyle(fontSize: 10),));
                                      },
                                    ),//SplitController.dataList[index].imageMedium    'https://picsum.photos/250?image=9'
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child:   Text(
                                        SplitController.dataList[index].store==null?"Store Name":
                                        SplitController.dataList[index].store.name.toString()

                                    ),
                                  )
                                ],
                              ),

                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.thumb_up_alt_sharp,size: 20,color: Colors.black54,  ),
                                      const  Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 5),
                                        child: Text("6",style: TextStyle(color: Colors.black54),),
                                      ),
                                      const    Icon(Icons.chat_bubble,size: 20,color: Colors.black54,),
                                      Padding(
                                        padding:const EdgeInsets.symmetric(horizontal: 5),
                                        child: Text(SplitController.dataList[index].commentsCount.toString().toString(),style:const TextStyle(color: Colors.black54),),
                                      ),
                                      const    Icon(Icons.watch_later_outlined,size: 20,color: Colors.black54,),
                                      Padding(
                                        padding:const EdgeInsets.symmetric(horizontal: 5),
                                        child: Text(
                                          DataConstants.getDate( SplitController.dataList[index].createdAt.toString().split(" ")[0].toString())

                                          // "4 Dec 2018"

                                          ,

                                          style: TextStyle(color: Colors.black54),),
                                      ),
                                    ],
                                  ),
                                  const  Text("At Other",style: TextStyle(color: Colors.lightBlue,fontSize: 14),),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );

                });
        })


    );



  }
}
