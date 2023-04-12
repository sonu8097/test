import 'dart:convert';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dealsModel.dart';


class SplitController extends GetxController {
  static var isLoading = true.obs;
  static var dealsData = DealsModel().obs;
  static RxInt sortVal = 0.obs, sortPrevVal = 0.obs;
  static List<Deal> dataList = <Deal>[].obs;
  static List<Deal> dataListhFilter = <Deal>[].obs;
  static RxDouble totalVal = 0.0.obs;
  @override
  void onInit() {
    fetchData();
    super.onInit();
  }
  Future<void> fetchData() async {
    try{
      isLoading(false);
      // SplitDataList = null;

      var url =
          "http://stagingauth.desidime.com/v4/home/discussed?per_page=10&page=1&fields=id,created_at,created_at_in_millis,image_medium,comments_count,store{name}";
      var response = await http.get(Uri.parse(url), headers: {
        'X-Desidime-Client': '08b4260e5585f282d1bd9d085e743fd9'
      });

      var responses = response.body;

      log("Split Response  => $responses");
      // Fluttertoast.showToast(
      //     msg: responses,
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //
      //     fontSize: 16.0
      // );

      try {
        dealsData.value = dealsModelFromJson(responses.toString());
        dataList = DealsModel.fromJson(json.decode(responses)).deals;
        totalVal.value = 0.0;
      } catch (e) {
        var jsons = json.decode(responses);
      } finally {
        isLoading(false);
      }
    }catch (e) {
     print(e);
    }
    // return;

  }



}