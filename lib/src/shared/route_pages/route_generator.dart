import 'package:flutter/material.dart';

import '../../presentation/pages/home_page.dart';
import '../../presentation/pages/pdv_dates_page.dart';
import '../../presentation/pages/pdv_page.dart';
import '../../presentation/pages/sales_dates_page.dart';
import '../../presentation/pages/sales_pdv_page.dart';
import '../../presentation/pages/signin_page.dart';
import '../../presentation/pages/splash_page.dart';
import '../../presentation/pages/ticket_lotes_page.dart';
import '../../presentation/pages/ticket_sales_page.dart';
import '../../presentation/pages/withdraw_sales_page.dart';
import '../data_struct/event_data_struct.dart';

class RouteGenerator {
  static Route<dynamic> generatorRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const SplashPage(), settings: settings);
      case '/login':
        return MaterialPageRoute(builder: (context) => const SigninPage(), settings: settings);
      case '/home':
        return MaterialPageRoute(builder: (context) => const HomePage(), settings: settings);
      case '/ticket/sales':
        if (args is EventDataStruct) {
          return MaterialPageRoute(
              builder: (context) => TicketSalesPage(event: args), settings: settings);
        }
        return _erroRoute(settings);
      case '/sales/pdvs':
        if (args is EventDataStruct) {
          return MaterialPageRoute(
              builder: (context) => SalesPdvPage(event: args), settings: settings);
        }
        return _erroRoute(settings);
      case '/withdrawals/pdvs':
        if (args is EventDataStruct) {
          return MaterialPageRoute(
              builder: (context) => WithdrawSalesPage(event: args), settings: settings);
        }
        return _erroRoute(settings);
      case '/lotes/sale':
        if (args is EventDataStruct) {
          return MaterialPageRoute(
              builder: (context) => TicketLotesPage(event: args), settings: settings);
        }
        return _erroRoute(settings);
      case '/sales/dates':
        if (args is EventDataStruct) {
          return MaterialPageRoute(
              builder: (context) => SalesDatesPage(event: args), settings: settings);
        }
        return _erroRoute(settings);
      case '/pdvs':
        if (args is EventDataStruct) {
          return MaterialPageRoute(builder: (context) => PdvPage(event: args), settings: settings);
        }
        return _erroRoute(settings);
      case '/pdv/dates':
        if (args is EventDataStruct) {
          return MaterialPageRoute(
              builder: (context) => PdvDatesPage(event: args), settings: settings);
        }
        return _erroRoute(settings);
      default:
        _erroRoute(settings);
        return _erroRoute(settings);
    }
  }

  static Route<dynamic> _erroRoute(RouteSettings? settings) {
    return MaterialPageRoute(
        builder: (context) {
          return const Scaffold(
            body: Center(child: Text('Error')),
          );
        },
        settings: settings);
  }
}
