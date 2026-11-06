import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 1. Import the Translations Dictionary
import 'utils/translations.dart';

// 2. Import the Auth Controller
import 'controllers/auth_controller.dart';

// 3. Import ALL the Screens
import 'screens/splash_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'dashboard.dart'; // Make sure this path matches where your dashboard.dart is
import 'screens/shop_screen.dart';
import 'screens/orders_screen.dart';
import 'screens/shipping_screen.dart';
import 'screens/account_screen.dart';
import 'screens/wallet_screen.dart';
import 'screens/support_screen.dart';
import 'screens/warehouse_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Dependency injection: AuthController is now available app-wide
  Get.put(AuthController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DRSB Express',

      // GetX Translation Configuration
      translations: AppTranslations(),
      locale: const Locale('en', 'US'), // Default to English
      fallbackLocale: const Locale('en', 'US'),

      initialRoute: '/splash',

      // GetX Routing Table
      getPages: [
        GetPage(name: '/splash', page: () => const SplashScreen()),
        GetPage(name: '/login', page: () => const LoginScreen()),
        GetPage(name: '/register', page: () => const RegisterScreen()),
        GetPage(name: '/dashboard', page: () => const DashboardScreen()),
        GetPage(name: '/shop', page: () => const ShopScreen()),
        GetPage(name: '/orders', page: () => const OrdersScreen()),
        GetPage(name: '/shipping', page: () => const ShippingScreen()),
        GetPage(name: '/account', page: () => const AccountScreen()),
        GetPage(name: '/profile', page: () => const AccountScreen()),
        GetPage(name: '/wallet', page: () => const WalletScreen()),
        GetPage(name: '/support', page: () => const SupportScreen()),
        GetPage(name: '/warehouse', page: () => const WarehouseScreen()),
      ],
    );
  }
}