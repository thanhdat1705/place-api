import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_places_api_mobile/shared/models/account/account.dart';
import 'package:project_places_api_mobile/shared/models/response/respone_search_feild/respone_search_field.dart';
import 'package:project_places_api_mobile/shared/models/response/respone_search_zone/respone_search_zone.dart';
import 'package:project_places_api_mobile/shared/models/response/response_search_brand/response_search_brand.dart';
import 'package:project_places_api_mobile/shared/models/response/response_search_province/response_search_province.dart';
import 'package:project_places_api_mobile/shared/models/response/response_search_store/response_search_store.dart';
import 'package:project_places_api_mobile/shared/models/response/response_search_street_segments/response_search_street_segments.dart';
import 'package:project_places_api_mobile/shared/models/response_server/response_server.dart';
import 'package:project_places_api_mobile/shared/models/street_segments/street_segments.dart';
import 'package:project_places_api_mobile/shared/models/store_detail/store_detail.dart';
import 'package:project_places_api_mobile/shared/requests/auth_request/auth_request.dart';
import 'package:project_places_api_mobile/shared/requests/search_request/search_request.dart';
import 'package:project_places_api_mobile/shared/requests/store_request/store_request.dart';
import 'package:project_places_api_mobile/shared/requests/street_segments_request/street_segments_request.dart';
import 'package:project_places_api_mobile/shared/requests/update_profile_request/update_profile_request.dart';
import 'package:project_places_api_mobile/shared/requests/zones_request/zones_request.dart';

import 'package:project_places_api_mobile/shared/services/http_service.dart';
import 'package:project_places_api_mobile/shared/shared_server_api_urls/server_api__urls.dart';

Map<String, String> header = {
  'Accept': '/',
  'content-type': 'application/json; charset=UTF-8',
  'Accept-Encoding': 'gzip, deflate, br'
};

void addHeader(String key, String value) {
  header[key] = value;
}

Future<ResponseServer> authUser(
    BuildContext context, AuthRequest request) async {
  return HttpService.post(context, APIUSERAUTHORIZE,
      responseDataInstance: Account.instance(), headers: header, data: request);
}

Future<ResponseServer> getProfileUser(BuildContext context) async {
  return HttpService.get(context, APIGETUSERPROFILE,
      responseDataInstance: Account.instance(), headers: header);
}

Future<ResponseServer> getStoreDetailAPI(
    BuildContext context, String id) async {
  return HttpService.get(context, APISTOREDETAIL + '/' + id,
      responseDataInstance: StoreDetail.instance(), headers: header);
}

Future<ResponseServer> getStreetSegmentDetailAPI(
    BuildContext context, String id) async {
  return HttpService.get(context, APIGETSTREETSEGMENT + '/' + id,
      responseDataInstance: StreetSegments.instance(), headers: header);
}

Future<ResponseServer> postFollowingStoreAPI(
    BuildContext context, String id) async {
  return HttpService.post(context, APIFOLLOWINGSTORE + '/' + id,
      headers: header);
}

Future<ResponseServer> getFollowingStoreAPI(BuildContext context) async {
  return HttpService.get(context, APIGETFOLLOWINGSTORE, headers: header);
}

Future<ResponseServer> updateProfileUser(
  BuildContext context,
  UpdateProfileRequest updateProfileRequest,
) async {
  FormData formData;
  if (updateProfileRequest.avatarFile != null) {
    formData = new FormData.fromMap({
      'displayName': updateProfileRequest.displayName,
      'description': updateProfileRequest.description,
      'phoneNumber': updateProfileRequest.phoneNumber,
      'email': updateProfileRequest.email,
      'avatarFile':
          await MultipartFile.fromFile(updateProfileRequest.avatarFile.path),
    });
  } else {
    formData = new FormData.fromMap({
      'displayName': updateProfileRequest.displayName,
      'description': updateProfileRequest.description,
      'phoneNumber': updateProfileRequest.phoneNumber,
      'email': updateProfileRequest.email,
      'avatarFile': null,
    });
  }
  return HttpService.put(context, APIUPDATEUSERPROFILE,
      responseDataInstance: Account.instance(),
      data: formData,
      typeRequest: HttpService.FORMDATA,
      headers: header);
}

Future<ResponseServer> searchField(
    BuildContext context, SearchRequest request) async {
  return HttpService.get(
    context,
    APISEARCHFIELD +
        "/?Limit=" +
        request.limit.toString() +
        "&Page=" +
        request.limit.toString() +
        "&SortField=" +
        request.sortField +
        "&SortOrder=" +
        request.sortOrder.toString() +
        "&SearchMain=" +
        request.searchMain +
        "&",
    responseDataInstance: ResponseSearchField.instance(),
    headers: header,
  );
}

Future<ResponseServer> searchZone(
    BuildContext context, ZonesRequest request) async {
  return HttpService.get(
    context,
    APISEARCHZONE +
        "/?Latitude=" +
        request.latitude.toString() +
        "&Longitude=" +
        request.longitude.toString() +
        "&Address=" +
        request.address +
        "&SearchBy=" +
        request.searchBy.toString() +
        "&Limit=" +
        request.limit.toString() +
        "&Page=" +
        request.page.toString() +
        "&SortField=" +
        request.sortField +
        "&SortOrder=" +
        request.sortOrder.toString() +
        "&SearchMain=" +
        request.searchMain +
        "&",
    responseDataInstance: ResponseSearchZone.instance(),
    headers: header,
  );
}

Future<ResponseServer> searchStreetSegment(
    BuildContext context, StreetSegmentsRequest request) async {
  return HttpService.get(
      context,
      APISEARCHSTREETSEGMENT +
          "/?ZoneId=" +
          request.zoneId +
          "&Limit=" +
          request.limit.toString() +
          "&Page=" +
          request.page.toString() +
          "&SortField" +
          request.sortField +
          "&SortOrder" +
          request.sortOrder.toString() +
          "&SearchMain" +
          request.searchMain,
      responseDataInstance: ResponseSearchStreetSegments.instance(),
      headers: header);
}

Future<ResponseServer> searchBrand(
    BuildContext context, SearchRequest request) async {
  return HttpService.post(context, APISEARCHBRAND,
      responseDataInstance: ResponseSearchBrand.instance(),
      headers: header,
      data: request);
}

Future<ResponseServer> searchProvince(
    BuildContext context, SearchRequest request) async {
  return HttpService.post(context, APISEARCHPROVINCE,
      responseDataInstance: ResponseSearchProvince.instance(),
      headers: header,
      data: request);
}

Future<ResponseServer> searchStore(
    BuildContext context, StoreRequest request) async {
  return HttpService.get(
    context,
    APISEARCHSTORE +
        "/?ZoneId=" +
        request.zoneId +
        "&FieldId=" +
        request.fieldId +
        "&Limit=" +
        request.limit.toString() +
        "&Page=" +
        request.page.toString() +
        "&SortField=" +
        request.sortField +
        "&SortOrder=" +
        request.sortOrder.toString() +
        "&SearchMain=" +
        request.searchMain +
        "&",
    responseDataInstance: ResponseSearchStore.instance(),
    headers: header,
  );
}
