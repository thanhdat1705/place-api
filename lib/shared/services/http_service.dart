import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_places_api_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_places_api_mobile/shared/models/response_server/response_server.dart';

//Use this class to call API Server
class HttpService {
  static const String FORMBODY = "FormBody";
  static const String FORMDATA = "FormData";
  static Dio dio = new Dio();

  static Future<ResponseServer> get(BuildContext context, url,
      {Map<String, String> headers, responseDataInstance}) async {
    //headers.remove("content-type");
    Response res = await dio.get(url, options: new Options(headers: headers));
    ResponseServer responseServer;
    if (res.statusCode == 200) {
      responseServer = //decode<ResponseServer>(res.data);
          new ResponseServer(
              data: res.data["data"],
              message: res.data["message"],
              statusCode: res.data["statusCode"]);
      if (responseDataInstance != null) {
        responseServer.data =
            responseDataInstance.fromJson(responseServer.data);
      }
      return responseServer;
    } else {
      if (res.statusCode == 500) {
        GeneralHelper.errorDialog(context, responseServer.statusCode);
      } else {
        GeneralHelper.errorDialog(context, responseServer.statusCode);
      }
      return null;
    }
  }

  static Future<ResponseServer> post(BuildContext context, String url,
      {Map<String, String> headers,
      data,
      typeRequest,
      responseDataInstance,
      Encoding encoding}) async {
    Response res;
    ResponseServer responseServer;
    if (typeRequest == FORMBODY || typeRequest == null) {
      if (data != null) {
        headers['content-type'] = 'application/json';
        res = await dio.post(url,
            data: jsonEncode(data.toJson()),
            options: new Options(headers: headers));
      } else {
        res = await dio.post(url, options: new Options(headers: headers));
      }
    } else {
      headers['content-type'] = 'multipart/form-data';
      res = await dio.post(url,
          data: data, options: new Options(headers: headers));
    }
    if (res.statusCode == 200 || res.statusCode == 201) {
      responseServer = //decode<ResponseServer>(res.data);
          new ResponseServer(
              data: res.data["data"],
              message: res.data["message"],
              statusCode: res.data["statusCode"]);
      if (responseServer.data != null && responseDataInstance != null) {
        responseServer.data =
            responseDataInstance.fromJson(responseServer.data);
      }
      return responseServer;
    } else {
      if (res.statusCode == 500) {
        GeneralHelper.errorDialog(context, responseServer.statusCode);
      } else {
        GeneralHelper.errorDialog(context, responseServer.statusCode);
      }
      return null;
    }
  }

  static Future<ResponseServer> put(BuildContext context, url,
      {Map<String, String> headers,
      data,
      typeRequest,
      responseDataInstance,
      Encoding encoding}) async {
    Response res;
    ResponseServer responseServer;
    if (typeRequest == FORMBODY || typeRequest == null) {
      headers['content-type'] = 'application/json';
      res = await dio.put(url,
          data: jsonEncode(data.toJson()),
          options: new Options(headers: headers));
    } else {
      headers['content-type'] = 'multipart/form-data';
      res = await dio.put(url,
          data: data, options: new Options(headers: headers));
      // .catchError(
      //     GeneralHelper.errorDialog(context, responseServer.statusCode)
      // );
    }
    if (res.statusCode == 200 || res.statusCode == 201) {
      responseServer = //decode<ResponseServer>(res.data);
          new ResponseServer(
              data: res.data["data"],
              message: res.data["message"],
              statusCode: res.data["statusCode"]);
      if (responseDataInstance != null) {
        responseServer.data =
            responseDataInstance.fromJson(responseServer.data);
      }
      return responseServer;
    } else {
      if (res.statusCode == 500) {
        GeneralHelper.errorDialog(context, responseServer.statusCode);
      } else {
        GeneralHelper.errorDialog(context, responseServer.statusCode);
      }
      return null;
    }
  }

  static Future<ResponseServer> delete(BuildContext context, url,
      {Map<String, String> headers}) async {
    Response res =
        await dio.delete(url, options: new Options(headers: headers));
    ResponseServer responseServer;
    if (res.statusCode == 200) {
      responseServer = //decode<ResponseServer>(res.data);
          new ResponseServer(
              data: res.data["data"],
              message: res.data["message"],
              statusCode: res.data["statusCode"]);
      return responseServer;
    } else {
      if (res.statusCode == 500) {
        GeneralHelper.errorDialog(context, responseServer.statusCode);
      } else {
        GeneralHelper.errorDialog(context, responseServer.statusCode);
      }
      return null;
    }
  }
}
