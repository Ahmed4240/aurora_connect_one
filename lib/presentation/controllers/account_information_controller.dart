import 'dart:convert';

import 'package:aurora_connect_one/domain/delete_my_account/delete_my_account_response.dart';
import 'package:aurora_connect_one/domain/remove_work_email/remove_work_email_request.dart';
import 'package:aurora_connect_one/domain/remove_work_email/remove_work_email_response.dart';
import 'package:aurora_connect_one/domain/update_work_email/update_work_email_request.dart';
import 'package:aurora_connect_one/domain/update_work_email/update_work_email_response.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../domain/account_info/account_information_request.dart';
import '../../domain/account_info/account_information_response.dart';
import '../commons/utils.dart';

class AccountInformationController extends GetxController {
  var accountInfoResponse = AccountInformationResponse().obs;
  var deleteMyAccountResponse = DeleteMyAccountResponse().obs;
  var updateWorkResponse = UpdateWorkEmailResponse().obs;
  var removeWorkEmailResponse = RemoveWorkEmailResponse().obs;
  var loading = false.obs;

  getAccountInformation(AccountInformationRequest request, String clientToken) async {
    print('calling for getAccountInformation');

    loading(true);
    final map = {
      "userId": request.userId,
    };
    String url = 'https://auroraconnect.absoluit.com/api/api/User/AccountInformation';
    var response_1 = await http.post(Uri.parse(url),
        headers: {
          "Accept": "text/plain",
          "content-type": "application/json",
          'Authorization': 'Bearer $clientToken'
        },
        body: jsonEncode(map));

    print("Request: ${jsonEncode(map)}");
    if (response_1.statusCode == 200) {
      accountInfoResponse.value = getAccountInformationResponse(response_1.body);

      String responseString = response_1.body;
      print("Response Data: $responseString");
      print("=====================================================");
    }
    else if (response_1.statusCode == 400)
    {
      accountInfoResponse.value = Utils.getDummyAccountInformation();
    }
    else
    {
      printError(info: "Response Error: ${response_1.statusCode}");
    }

    loading(false);
  }

  Future<bool> getDeleteMyUser(String clientUserId, String clientToken) async {
    print('calling for getDeleteMyUser');

    loading(true);
    final map = {
      "userId": clientUserId,
    };
    const url = 'https://auroraconnect.absoluit.com/api/api/User/DeleteUserAccount';
    var response_1 = await http.post(Uri.parse(url),
        headers: {
          "Accept": "text/plain",
          "content-type": "application/json",
          'Authorization': 'Bearer $clientToken'
        },
        body: jsonEncode(map));

    print("Request: ${jsonEncode(map)}");
    if (response_1.statusCode == 200) {
      deleteMyAccountResponse.value = getDeleteMyAccountResponse(response_1.body);

      String responseString = response_1.body;
      print("Response Data: $responseString");
      print("=====================================================");
      return true;
    } else {
      printError(info: "Response Error: ${response_1.statusCode}");
      return false;
    }

    loading(false);
  }

  Future<bool> updateWorkEmail(UpdateWorkEmailRequest request, String clientToken) async {
    print('calling for updateWorkEmail');

    loading(true);
    final map = {
      "isReceiptOnWorkEmail": request.isReceiptOnWorkEmail,
      "workEmail": request.workEmail,
      "userId": request.userId,
    };
    const url = 'https://auroraconnect.absoluit.com/api/api/User/UpdateWorkEmail';
    var response_1 = await http.post(Uri.parse(url),
        headers: {
          "Accept": "text/plain",
          "content-type": "application/json",
          'Authorization': 'Bearer $clientToken'
        },
        body: jsonEncode(map));

    print("Request: ${jsonEncode(map)}");
    if (response_1.statusCode == 200) {
      updateWorkResponse.value = getUpdateEmailInformationResponse(response_1.body);

      String responseString = response_1.body;
      print("Response Data: $responseString");
      print("=====================================================");
      return true;
    } else {
      printError(info: "Response Error: ${response_1.statusCode}");
      return false;
    }

    loading(false);
  }

  Future<bool> removeWorkEmail(RemoveWorkEmailRequest request, String clientToken) async {
    print('calling for removeWorkEmail');

    loading(true);
    final map = {
      "userId": request.userId,
    };
    const url = 'https://auroraconnect.absoluit.com/api/api/User/RemoveWorkEmail';
    var response_1 = await http.post(Uri.parse(url),
        headers: {
          "Accept": "text/plain",
          "content-type": "application/json",
          'Authorization': 'Bearer $clientToken'
        },
        body: jsonEncode(map));

    print("Request: ${jsonEncode(map)}");
    if (response_1.statusCode == 200) {
      removeWorkEmailResponse.value = getRemoveEmailInformationResponse(response_1.body);

      String responseString = response_1.body;
      print("Response Data: $responseString");
      print("=====================================================");
      return true;
    } else {
      printError(info: "Response Error: ${response_1.statusCode}");
      return false;
    }

    loading(false);
  }
}
