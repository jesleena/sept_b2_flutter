import 'package:get/get.dart';
import 'package:sept_b2_flutter/api/api_http&getx/service/http_service.dart';

class ProductController extends GetxController{

  RxBool isLoading=true.obs; //here isLoading now in observable state
  var productList=[].obs;
  @override
  void onInit() {
   loadProduct(); //to fetch data from service class
    super.onInit();
  }

  void loadProduct() async{
    try{
      isLoading(true);
      var products=await Httpservice.fetch_products();
      if(products!=null){
        productList.value=products;
      }

    }
    catch(e){
      print(e);
    }
    finally{
      isLoading(false);
    }

  }
}