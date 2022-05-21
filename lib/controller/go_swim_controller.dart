import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

class GoSwimControllerReactive extends GetConnect {
  RxString resultStringa1 = "".obs;
  RxString resultStringa2 = "".obs;
  RxString resultStringb1 = "".obs;
  RxString resultStringb2 = "".obs;

  final queryParameters1 = {
    'serviceKey':
        '7W7oGzJbvj3Nj324D8u6E1dbkAbUqWosKDUtUfzLjcgywWbMfdijFOTkyowfYtpfELfqWkA/wQ9G4HNXUcGjKw==',
    'stId': '106000210',
    'busRouteId': '100100205',
    'ord': '11',
  };

  Future<Response> getLocal1() =>
      get('http://ws.bus.go.kr/api/rest/arrive/getArrInfoByRoute',
          query: queryParameters1);

  void goSwim() {
    getLocal1().then((value) => printxml1(value));
  }

  void printxml1(Response response) {
    print(response.body);
    XmlDocument? XmlData = XmlDocument.parse(response.body);
    final wantData1 = XmlData.findAllElements('arrmsg1');
    final wantData2 = XmlData.findAllElements('arrmsg2');

    resultStringa1.value = wantData1.single.innerText
        .replaceFirst('분', '분 ')
        .replaceFirst('초', '초 ')
        .replaceFirst('후', '후 도착\n')
        .replaceFirst('전', '전 정거장');
    resultStringa2.value = wantData2.single.innerText
        .replaceFirst('분', '분 ')
        .replaceFirst('초', '초 ')
        .replaceFirst('후', '후 도착\n')
        .replaceFirst('전', '전 정거장');
  }

  Future getString() async {
    goSwim();
    Future.delayed(Duration(seconds: 10), () {
      getString();
    });
  }

  void onInit() {
    getString();
    super.onInit();
  }
}
