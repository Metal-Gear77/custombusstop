import 'package:custombusstop/controller/secret_key.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

class GoHomeControllerReactive extends GetConnect {
  RxString resultStringa1 = "".obs;
  RxString resultStringa2 = "".obs;
  RxString resultStringb1 = "".obs;
  RxString resultStringb2 = "".obs;

  final queryParameters2 = {
    'serviceKey':
        SecretKey().secretKey,
    'stId': '106000195',
    'busRouteId': '100100205',
    'ord': '23',
  };

  Future<Response> getLocal2() =>
      get('http://ws.bus.go.kr/api/rest/arrive/getArrInfoByRoute',
          query: queryParameters2);

  void goHome() {
    getLocal2().then((value) => printxml2(value));
  }

  void printxml2(Response response) {
    print(response.body);
    XmlDocument? XmlData = XmlDocument.parse(response.body);
    final wantData1 = XmlData.findAllElements('arrmsg1');
    final wantData2 = XmlData.findAllElements('arrmsg2');

    resultStringb1.value = wantData1.single.innerText
        .replaceFirst('분', '분 ')
        .replaceFirst('초', '초 ')
        .replaceFirst('후', '후 도착\n')
        .replaceFirst('전', '전 정거장');
    resultStringb2.value = wantData2.single.innerText
        .replaceFirst('분', '분 ')
        .replaceFirst('초', '초 ')
        .replaceFirst('후', '후 도착\n')
        .replaceFirst('전', '전 정거장');
  }

  Future getString() async {
    goHome();
    Future.delayed(Duration(seconds: 10), () {
      getString();
    });
  }

  void onInit() {
    getString();
    super.onInit();
  }
}
