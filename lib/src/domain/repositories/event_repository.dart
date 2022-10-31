import 'package:dartz/dartz.dart';

import '../entities/balance_tickets.dart';
import '../entities/event.dart';
import '../entities/pdv.dart';
import '../entities/pdv_dates.dart';
import '../entities/sales_dates.dart';
import '../entities/sales_pdv.dart';
import '../entities/ticket_lotes.dart';
import '../entities/withdraw_pdv.dart';
import '../errors/errors.dart';

abstract class IEventRepository {
  Future<Either<IErrorsException, List<Event>>> featchEvents({bool eventWon = false});
  Future<Either<IErrorsException, BalanceTickets>> featchTicketSales(String eventId);
  Future<Either<IErrorsException, SalesPdv>> featchSalesPdv(String eventId);
  Future<Either<IErrorsException, SalesDates>> featchSalesDates(String eventId);
  Future<Either<IErrorsException, WithdrawPdv>> featchWithdrawPdv(String eventId);
  Future<Either<IErrorsException, List<Pdv>>> featchPdvs(String eventId);
  Future<Either<IErrorsException, List<TicketLotes>>> featchTicketLotes(String eventId);
  Future<Either<IErrorsException, PdvDates>> featchPdvDates(String eventId, String pdvId);
}
