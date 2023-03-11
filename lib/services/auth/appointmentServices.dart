import 'package:http/http.dart';
import 'package:mmdapp_doctor/services/urlconstants.dart' as UrlConsts;
import 'package:mmdapp_doctor/utils/api_utils.dart';

// Appointments
Future<Map> getAppointments() async {
  try {
    Response data = await getApi(UrlConsts.GET_APPOINTMENTS, {});
    var body = decodeBody(data.body);
    if (data.statusCode == 200) {
      return body;
    }

    return {
      "today_appointments": [],
      "past_appointments": [],
      "upcoming_appointments": []
    };
  } catch (e) {
    print(e);
    return {
      "today_appointments": [],
      "past_appointments": [],
      "upcoming_appointments": []
    };
  }
}

// "/api/appointment/datetimeslots/"

Future<Map> updateAppointment(String objId, int status) async {
  try {
    Response data = await postApi(
        "/api/appointment/${objId}/update-status/", {'status': status}, {});
    var body = decodeBody(data.body);
    if (data.statusCode == 200) {
      return {'success': true};
    }

    return {'success': false};
  } catch (e) {
    return {'success': false};
  }
}
