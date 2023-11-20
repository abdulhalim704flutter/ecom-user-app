const String currencySymboll = '৳';

const cities = ['Dhaka','Chittagong','Cumilla','Khulna','Sylhet','Borishal','Rajshahi'];

abstract final class OrderStatus{
  static const String pending = 'Pending';
  static const String deliverd = 'Deliverd';
  static const String proccessing = 'Proccessing';
  static const String cancel = 'Cancelled';
}