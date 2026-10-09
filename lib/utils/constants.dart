const String currencySymbol = '\$';
const String imageDirectory = 'userPictures/';
List<String> cities = [
  'Lagos',
  'Abuja',
  'Kano',
  'Ibadan',
  'Port Harcourt',
  'Benin City',
  'Maiduguri',
  'Zaria',
  'Aba',
  'Jos',
  'Ilorin',
  'Oyo',
  'Enugu',
  'Abeokuta',
  'Onitsha',
  'Warri',
  'Sokoto',
  'Kaduna',
  'Owerri',
  'Akure',
  'Ife',
  'Ikeja',
  'Uyo',
  'Calabar',
  'Makurdi',
  'Minna',
  'Bauchi',
  'Yola',
  'Katsina',
  'Gombe',
];

abstract class OrderStatus {
  static const String pending = 'Pending';
  static const String processing = 'Processing';
  static const String delivered = 'Delivered';
  static const String cancelled = 'Cancelled';
  static const String returned = 'Returned';
}

abstract class PaymentMethod {
  static const String cod = 'Cash on Delivery';
  static const String online = 'Online Payment';
}

const String userImageDirectory = "profile_images";
