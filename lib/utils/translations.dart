import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      // Dashboard & General
      'search_hint': 'Search products or tracking ID...',
      'our_services': 'OUR SERVICES',
      'my_id': 'My ID',
      'wallet': 'Wallet',
      'support': 'Support',
      'delivery': 'Delivery',
      'china_wh': 'China WH',
      'vn_wh': 'Vietnam WH',
      'promotions': 'PROMOTIONS',
      'home': 'Home',
      'shop': 'Shop',
      'orders': 'Orders',
      'shipping': 'Shipping',
      'account': 'Account',

      // Account Screen
      'profile_title': 'Profile',
      'orders_stat': 'Orders',
      'vouchers_stat': 'Vouchers',
      'points_stat': 'Points',
      'account_settings': 'ACCOUNT SETTINGS',
      'edit_profile': 'Edit Profile',
      'security': 'Security',
      'notifications': 'Notifications',
      'language': 'Language',
      'help_center': 'Help Center',
      'my_profile': 'My Profile',
      'logout': 'Logout',

      // Login Screen
      'world_class_logistics': 'World Class Logistics Management',
      'email_label': 'Email Address',
      'email_hint': 'Enter your email',
      'password_label': 'Password',
      'password_hint': 'Enter your password',
      'forgot_password': 'Forgot Password?',
      'sign_in': 'SIGN IN',
      'no_account': 'Don\'t have an account? ',
      'register_now': 'Register Now',

      // Support Screen
      'hi_how_can_we_help': 'Hi, how can we help?',
      'support_subtitle': 'Our team is here to assist you 24/7.',
      'quick_contact': 'Quick Contact',
      'live_chat': 'Live Chat',
      'call_us': 'Call Us',
      'email_us': 'Email Us',
      'telegram': 'Telegram',
      'faq': 'Frequently Asked Questions',
      'faq_1': 'How do I track my delivery?',
      'faq_1_ans': 'You can track your parcel by entering your tracking ID in the search bar on the home screen.',
      'faq_2': 'What are the warehouse locations?',
      'faq_2_ans': 'We currently operate main hubs in China and Thailand. You can view the full addresses in the Warehouse section.',
      'faq_3': 'How long does shipping take?',
      'faq_3_ans': 'Standard delivery from our Thai warehouse takes 3-5 business days. China shipments take 7-14 business days.',

      // Support Wallet
      'total_balance': 'Total Balance',
      'top_up': 'Top Up',
      'transfer': 'Transfer',
      'withdraw': 'Withdraw',
      'history': 'History',
      'recent_transactions': 'Recent Transactions',

      // Delivery
      'track_package': 'Track Package',
      'enter_tracking': 'Enter tracking number...',
      'active_shipments': 'Active Shipments',
      'in_transit': 'In Transit',
      'expected_delivery': 'Expected Delivery',
      'shipping_methods': 'Shipping Methods',
      'air_freight': 'Air Freight',
      'sea_freight': 'Sea Freight',

      // Warehouse
      'warehouse_locations': 'Warehouse Locations',
      'how_to_use_wh': 'How to use our warehouses',
      'wh_instruction': 'Copy the address below and paste it into your shopping app (Taobao, Shopee, etc.). Always include your Receiver ID so we can identify your package!',
      'receiver': 'Receiver',
      'phone': 'Phone',
      'address': 'Address',
      'zip_code': 'Zip Code',
      'copied': 'Copied!',
      'copied_to_clipboard': 'copied to clipboard.',

      // Shop
      'search_products': 'Search for products...',
      'all': 'All',
      'electronics': 'Electronics',
      'fashion': 'Fashion',
      'beauty': 'Beauty',

      // Order
      'my_orders': 'My Orders',
      'all_orders': 'All',
      'to_pay': 'To Pay',
      'to_ship': 'To Ship',
      'to_receive': 'To Receive',
      'completed': 'Completed',
      'order_id': 'Order ID',
      'track_order': 'Track Order',
      'total_amount': 'Total',
      'items': 'items',
      'qty': 'Qty',
    },
    'km_KH': {
      // Dashboard & General
      'search_hint': 'ស្វែងរកផលិតផល ឬ លេខកូដ...',
      'our_services': 'សេវាកម្មរបស់យើង',
      'my_id': 'លេខសម្គាល់',
      'wallet': 'កាបូប',
      'support': 'គាំទ្រ',
      'delivery': 'ដឹកជញ្ជូន',
      'china_wh': 'ឃ្លាំងចិន',
      'vn_wh': 'ឃ្លាំងវៀតណាម', // Kept your specific translation here!
      'promotions': 'ការផ្តល់ជូនពិសេស',
      'home': 'ទំព័រដើម',
      'shop': 'ទិញទំនិញ',
      'orders': 'ការបញ្ជាទិញ',
      'shipping': 'ដឹកជញ្ជូន',
      'account': 'គណនី',

      // Account Screen
      'profile_title': 'ប្រវត្តិរូប',
      'orders_stat': 'ការបញ្ជាទិញ',
      'vouchers_stat': 'គូប៉ុង',
      'points_stat': 'ពិន្ទុ',
      'account_settings': 'ការកំណត់គណនី',
      'edit_profile': 'កែប្រែប្រវត្តិរូប',
      'security': 'សុវត្ថិភាព',
      'notifications': 'ការជូនដំណឹង',
      'language': 'ភាសា',
      'help_center': 'មជ្ឈមណ្ឌលជំនួយ',
      'my_profile': 'ព័ត៌មានរបស់ខ្ញុំ',
      'logout': 'ចាកចេញ',

      // Login Screen
      'world_class_logistics': 'ការគ្រប់គ្រងភស្តុភារស្តង់ដារអន្តរជាតិ',
      'email_label': 'អ៊ីមែល',
      'email_hint': 'បញ្ចូលអ៊ីមែលរបស់អ្នក',
      'password_label': 'ពាក្យសម្ងាត់',
      'password_hint': 'បញ្ចូលពាក្យសម្ងាត់របស់អ្នក',
      'forgot_password': 'ភ្លេចពាក្យសម្ងាត់?',
      'sign_in': 'ចូលគណនី',
      'no_account': 'មិនទាន់មានគណនីមែនទេ? ',
      'register_now': 'ចុះឈ្មោះឥឡូវនេះ',

      // Support Screen
      'hi_how_can_we_help': 'សួស្តី តើមានអ្វីឱ្យយើងជួយទេ?',
      'support_subtitle': 'ក្រុមការងារយើងខ្ញុំរង់ចាំបម្រើលោកអ្នក 24 ម៉ោង។',
      'quick_contact': 'ទំនាក់ទំនងរហ័ស',
      'live_chat': 'ជជែកផ្ទាល់',
      'call_us': 'ទូរស័ព្ទ',
      'email_us': 'អ៊ីមែល',
      'telegram': 'តេឡេក្រាម',
      'faq': 'សំណួរដែលសួរញឹកញាប់',
      'faq_1': 'តើខ្ញុំអាចតាមដានឥវ៉ាន់ដោយរបៀបណា?',
      'faq_1_ans': 'អ្នកអាចតាមដានឥវ៉ាន់របស់អ្នក ដោយបញ្ចូលលេខកូដតាមដាននៅក្នុងប្រអប់ស្វែងរកនៅលើទំព័រដើម។',
      'faq_2': 'តើឃ្លាំងស្តុកទំនិញនៅឯណាខ្លះ?',
      'faq_2_ans': 'បច្ចុប្បន្នយើងមានឃ្លាំងធំៗនៅប្រទេសចិន និងប្រទេសថៃ។ អ្នកអាចមើលអាសយដ្ឋានពេញលេញនៅក្នុងផ្នែកឃ្លាំង។',
      'faq_3': 'តើការដឹកជញ្ជូនចំណាយពេលប៉ុន្មានថ្ងៃ?',
      'faq_3_ans': 'ការដឹកជញ្ជូនស្តង់ដារពីឃ្លាំងថៃចំណាយពេល 3-5 ថ្ងៃ។ ការដឹកជញ្ជូនពីចិនចំណាយពេល 7-14 ថ្ងៃធ្វើការ។',

      // Wallet
      'total_balance': 'សមតុល្យទឹកប្រាក់',
      'top_up': 'បញ្ចូលប្រាក់',
      'transfer': 'ផ្ទេរប្រាក់',
      'withdraw': 'ដកប្រាក់',
      'history': 'ប្រវត្តិ',
      'recent_transactions': 'ប្រតិបត្តិការថ្មីៗ',

      //Delivery
      'track_package': 'តាមដានឥវ៉ាន់',
      'enter_tracking': 'បញ្ចូលលេខកូដតាមដាន...',
      'active_shipments': 'ការដឹកជញ្ជូនបច្ចុប្បន្ន',
      'in_transit': 'កំពុងដឹកជញ្ជូន',
      'expected_delivery': 'ថ្ងៃរំពឹងទុកនៃការទទួលបាន',
      'shipping_methods': 'មធ្យោបាយដឹកជញ្ជូន',
      'air_freight': 'ដឹកជញ្ជូនតាមផ្លូវអាកាស',
      'sea_freight': 'ដឹកជញ្ជូនតាមផ្លូវសមុទ្រ',

      // Warehouse
      'warehouse_locations': 'ទីតាំងឃ្លាំងស្តុកទំនិញ',
      'how_to_use_wh': 'របៀបប្រើប្រាស់អាសយដ្ឋានឃ្លាំង',
      'wh_instruction': 'សូមចម្លងអាសយដ្ឋានខាងក្រោម ទៅដាក់ក្នុងកម្មវិធីទិញទំនិញរបស់អ្នក (Taobao, Shopee ។ល។)។ សូមកុំភ្លេចដាក់លេខសម្គាល់ឈ្មោះរបស់អ្នក ដើម្បីងាយស្រួលចំណាំឥវ៉ាន់!',
      'receiver': 'អ្នកទទួល',
      'phone': 'ទូរស័ព្ទ',
      'address': 'អាសយដ្ឋាន',
      'zip_code': 'លេខកូដតំបន់',
      'copied': 'បានចម្លង!',
      'copied_to_clipboard': 'បានចម្លងទុកក្នុងក្ដារតម្បៀតខ្ទាស់។',

      // Shop
      'search_products': 'ស្វែងរកផលិតផល...',
      'all': 'ទាំងអស់',
      'electronics': 'គ្រឿងអេឡិចត្រូនិក',
      'fashion': 'សម្លៀកបំពាក់',
      'beauty': 'គ្រឿងសម្អាង',

      // Order
      'my_orders': 'ការបញ្ជាទិញរបស់ខ្ញុំ',
      'all_orders': 'ទាំងអស់',
      'to_pay': 'រង់ចាំការទូទាត់',
      'to_ship': 'រង់ចាំដឹកជញ្ជូន',
      'to_receive': 'រង់ចាំទទួល',
      'completed': 'បានបញ្ចប់',
      'order_id': 'លេខកូដបញ្ជាទិញ',
      'track_order': 'តាមដានឥវ៉ាន់',
      'total_amount': 'សរុប',
      'items': 'មុខទំនិញ',
      'qty': 'ចំនួន',
    }
  };
}