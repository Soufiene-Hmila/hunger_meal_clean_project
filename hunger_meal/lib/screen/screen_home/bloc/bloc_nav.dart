
import 'package:core/core.dart';
import 'package:rxdart/subjects.dart';

class BlocNav extends Bloc {

  static final _getNavIndex = PublishSubject<int>();
  static PublishSubject<int> get getNavIndex => _getNavIndex;

  BlocNav.setNavIndexService(int index) {
    _getNavIndex.sink.add(index);
  }

  static final _getBookingChangeValue = PublishSubject<bool>();
  static PublishSubject<bool> get getBookingChangeValue => _getBookingChangeValue;

  BlocNav.setBookingChangeValueService(bool value) {
    _getBookingChangeValue.sink.add(value);
  }


  static final _getChangeValue = PublishSubject<bool>();
  static PublishSubject<bool> get getChangeValue => _getChangeValue;

  BlocNav.setChangeValueService(bool value) {
    _getChangeValue.sink.add(value);
  }

  static final _getCartChangeValue = PublishSubject<bool>();
  static PublishSubject<bool> get getCartChangeValue => _getCartChangeValue;

  BlocNav.setCartChangeValueService(bool value) {
    _getCartChangeValue.sink.add(value);
  }

  static final _getAppBarStatus = PublishSubject<bool>();
  static PublishSubject<bool> get getAppBarStatus => _getAppBarStatus;

  BlocNav.setAppBarStatusService(bool status) {
    _getAppBarStatus.sink.add(status);
  }

  static final _getAppBarArrow = PublishSubject<bool>();
  static PublishSubject<bool> get getAppBarArrow => _getAppBarArrow;

  BlocNav.setAppBarArrowService(bool status) {
    _getAppBarArrow.sink.add(status);
  }

  static final _getAppBarTopArrow = PublishSubject<bool>();
  static PublishSubject<bool> get getAppBarTopArrow => _getAppBarTopArrow;

  BlocNav.setAppBarTopArrowService(bool status) {
    _getAppBarTopArrow.sink.add(status);
  }

  @override
  void dispose() {

  }

}