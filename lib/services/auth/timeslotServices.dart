import 'dart:convert';

import 'package:http/http.dart';
import 'package:mmdapp_doctor/services/urlconstants.dart' as UrlConsts;
import 'package:mmdapp_doctor/utils/api_utils.dart';

// {
//     "timeslots": [
//         {
//             "startTime": "01:32",
//             "endTime": "04:35",
//             "idx": 0
//         },
//         {
//             "startTime": "11:34",
//             "endTime": "00:35",
//             "idx": 1
//         },
//         {
//             "startTime": "01:53",
//             "endTime": "00:35",
//             "idx": 2
//         }
//     ],
//     "timespan": {
//         "fromDate": "2023-03-14",
//         "toDate": "2023-03-21"
//     },
//     "deletePrev": false
// }
// Appointments

Future<Map> addDateTimeSlots(req_data) async {
  try {
    Response data = await postApi(UrlConsts.ADD_DATE_TIMESLOTS, (req_data), {});
    Map body = decodeBody(data.body);
    print('body');
    print(body);
    if (data.statusCode == 200) {
      if (body.containsKey("msg")) {
        return {"msg": body['msg'], 'success': true};
      }

      return {"msg": 'Something Went Wrong', 'success': false};
    } else {
      if (body.containsKey("msg")) {
        return {"msg": body['msg'], 'success': false};
      }

      return {'msg': "Something Went Wrong", 'success': false};
    }
  } catch (e) {
    // throw e;
    return {"msg": 'Something Went Wrong', 'success': false};
  }
}

String getYYMMDD(String date) {
  var newDate = date.split("/").reversed.toList().join("-");
  return newDate;
}
