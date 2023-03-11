import 'package:http/http.dart';
import 'package:mmdapp_doctor/services/urlconstants.dart' as UrlConsts;
import 'package:mmdapp_doctor/utils/api_utils.dart';

Future<Map<String, dynamic>> getQueueCustomers({String query = ''}) async {
  try {
    Response data =
        await getApi((UrlConsts.GET_QUEUE + "searchText=${query}"), {});
    Map<String, dynamic> body = decodeBody(data.body);
    if (body.containsKey("records")) {
      return {
        'success': true,
        'message': "Fetched Successfully",
        'data': body['records']
      };
    } else {
      return {'success': false, 'message': 'Something Went Wrong'};
    }
  } catch (e) {
    return {'success': false, 'message': "Something Went Wrong"};
  }
}

Future<List<dynamic>> getDoctors() async {
  try {
    Response data = await getApi(UrlConsts.GET_DOCTORS, {});
    List<dynamic> body = decodeBody(data.body);
    return body;
  } catch (e) {
    return [];
  }
}

// {
//     "first_name": "Arun",
//     "email": "arun@gmail.com",
//     "mobile": "9837664970",
//     "address_line1": "asdfdsafsf",
//     "note": "dsdafsdf",
//     "customer": null
// }

Future<Map<String, dynamic>> addNewCustomerQueue(Map userData) async {
  try {
    Response data = await postApi(UrlConsts.ADD_QUEUE, userData, {});
    var body = decodeBody(data.body);

    if (body == true) {
      return {"success": true};
    }
    return {"success": false, 'body': body, "error": true};
  } catch (e) {
    print("error");
    print(e);
    return {'success': false, 'message': "Something Went Wrong"};
  }
}

// Resp
// {
//     "id": 2,
//     "customer": 5,
//     "customer_name": "Arun",
//     "email": "arun@gmail.com",
//     "mobile": 9837664970,
//     "note": "dsdafsdf",
//     "status": 0,
//     "deleted": false,
//     "created_by": 4,
//     "created_at": "2023-03-02T11:40:04.180954Z",
//     "prescription_id": 0
// }

Future<Map<String, dynamic>> getQueueDetails(int queue_id) async {
  try {
    Response data = await getApi('/api/queue/${queue_id}', {});
    var body = decodeBody(data.body);
    if (data.statusCode == 200) {
      return {"success": true, 'data': body};
    }
    return {"success": false};
  } catch (e) {
    return {'success': false, 'message': "Something Went Wrong"};
  }
}

Future<Map<String, dynamic>> getCustomerDetail(int customer_id) async {
  try {
    Response data =
        await getApi('/api/doctors_m/${customer_id}/get-customer-detail/', {});
    var body = decodeBody(data.body);
    if (data.statusCode == 200) {
      return {"success": true, 'customer_status': body['status']};
    }
    return {"success": false};
  } catch (e) {
    return {'success': false, 'message': "Something Went Wrong"};
  }
}

// Request
// {
//     "customer_name": "Arun",
//     "mobile": 9837664970,
//     "clinic_name": "sdsaf",
//     "dateTime": "2023-03-15",
//     "purpose_of_visit": "adsfasdf",
//     "symptoms": "sdafdasf",
//     "note": "",
//     "medicine_name": "",
//     "drug_to_taken": "1",
//     "queue_id": 2,
//     "prescription": null,
//     "prescriptionsData": [
//         {
//             "idx": 1,
//             "note": "sdff",
//             "medicine_name": "dfsf",
//             "drug_to_taken": 1,
//             "exists": false
//         },
//         {
//             "idx": 2,
//             "note": "sdf",
//             "medicine_name": "sdaf",
//             "drug_to_taken": 1,
//             "exists": false
//         }
//     ]
// }

Future<Map<String, dynamic>> createPrescription(Map prescription_data) async {
  try {
    Response data = await postApi('/api/prescription/', prescription_data, {});

    var body = decodeBody(data.body);
    print(data);
    print(body);
    if (data.statusCode == 200) {
      return {"success": true};
    }
    return {"success": false};
  } catch (e) {
    return {'success': false, 'message': "Something Went Wrong"};
  }
}

Future<List<dynamic>> getCustomers(String query) async {
  try {
    Response data =
        await getApi('/api/users/get-customers/?searchText=${query}', {});
    var body = decodeBody(data.body);
    print("body");
    print(body);
    if (data.statusCode == 200) {
      return body;
    }
    return [{}];
  } catch (e) {
    print(e);
    return [{}];
  }
}