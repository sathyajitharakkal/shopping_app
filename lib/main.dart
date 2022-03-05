import 'dart:io';

import 'package:flutter/material.dart';
import 'package:layered_arc/shopping/services/service_locator.dart';
import 'package:layered_arc/shopping.dart';


void main() {
  const environment = String.fromEnvironment('FLAVOR', defaultValue: 'staging');
  const baseUrl = String.fromEnvironment('BASE_URL',
      defaultValue:'https://mobi.maaxkart.com');

  const initialRoute =
      String.fromEnvironment('INITIAL_ROUTE', defaultValue: '/home');


  ServiceLocator locator = ServiceLocator(baseUrl: baseUrl)..config();
  HttpOverrides.global = MyHttpOverrides();
  
  runApp(
    ShoppingApp(
    initialRoute: initialRoute,
    serviceLocator: locator
  ));
}

 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}