import 'package:on_a_trip/common/constants/form_data_params_model.dart';
import 'package:on_a_trip/features/destination_screen/data/models/holiday_package_model.dart';
import 'package:on_a_trip/features/destination_screen/data/models/hotel_package_model.dart';
import 'package:on_a_trip/features/destination_screen/data/models/transport_package_model.dart';
import 'package:on_a_trip/features/destination_screen/domain/usecases/get_holiday_package_usecase.dart';
import 'package:on_a_trip/features/destination_screen/domain/usecases/get_hotel_package_usecase.dart';
import 'package:on_a_trip/features/destination_screen/domain/usecases/get_transport_package_usecase.dart';

abstract class DestinationScreenRepository {
  Future<void> addPackage({required FormDataParams params});
  Future<List<TransportPackageModel>> getTransportPackages({required GetTransportPackageParams params});
  Future<List<HotelPackageModel>> getHotelPackage({required GetHotelPackageParams params});
  Future<List<HolidayPackageModel>> getHolidayPackages({required GetHolidayPackageParams params});
}
