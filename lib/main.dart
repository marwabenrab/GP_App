import 'package:fikra_app/AppProvider.dart';
import 'package:fikra_app/add_process/add_info.dart';
import 'package:fikra_app/add_process/add_producr/product_one.dart';
import 'package:fikra_app/add_process/add_wheat.dart';
import 'package:fikra_app/admin/complaint_list.dart';
import 'package:fikra_app/admin/farmer_list.dart';
import 'package:fikra_app/admin/land_list.dart';
import 'package:fikra_app/admin/page_add.dart';
import 'package:fikra_app/admin/pageone.dart';
import 'package:fikra_app/auth/map_auth.dart';
import 'package:fikra_app/auth/page_auth.dart';
import 'package:fikra_app/auth/page_info_auth.dart';
import 'package:fikra_app/const/forgetpassword.dart';
import 'package:fikra_app/const/home_const.dart';
import 'package:fikra_app/const/resetpassword.dart';
import 'package:fikra_app/const/verfiycode.dart';
import 'package:fikra_app/controllers/user_session_controller.dart';
import 'package:fikra_app/language/translations.dart';
import 'package:fikra_app/models/details.dart';
import 'package:fikra_app/screen/homescreen.dart';
import 'package:fikra_app/screen/persone.dart';
import 'package:fikra_app/screen/pests_screen.dart';
import 'package:fikra_app/screenns/parametre.dart';
import 'package:fikra_app/screenns/profil_screnns.dart';
import 'package:fikra_app/screenns/welcome_screen.dart';
import 'package:fikra_app/screens/adv_secreens.dart';
import 'package:fikra_app/screens/login_secreens.dart';
import 'package:fikra_app/screens/myadv_screen.dart';
import 'package:fikra_app/screens/ownership.dart';
import 'package:fikra_app/screens/products_screens.dart';
import 'package:fikra_app/screens/singup_screen.dart';
import 'package:fikra_app/services/local_db_service.dart';
import 'package:fikra_app/utilities/videos_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //bool isLogin = false;

  // share >>> login or not
  // initialize database - put  the service in the memory
  await Get.putAsync(
    () => LocalDBService().initDb(),
    permanent: true,
  );
  //await Get.putAsync(
  //   () async => await UserSessionController().checkAuthStatus());
  //isLogin = Get.find<UserSessionController>().isLocked.value;
  Get.put(
    () => UserSessionController(),
    permanent: true,
  );
  runApp(MyApp());

  //isLogin: isLogin,
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //final bool isLogin;
  //dynamic get itemIndex => null;
  // dynamic get  product => null;
  @override
  Widget build(BuildContext context) {
    //var screenRoute;

    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AppProvider())],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Falah',
        theme: ThemeData(
          brightness: Brightness.light,
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 97, 188, 114)),
          useMaterial3: true,
        ),
        // darkTheme: ThemeData(
        //  primaryColor: kPrimarydColor,
        //hintColor: kPrimarydColor,

        //   brightness: Brightness.dark,
        //  ),
        // themeMode: ThemeMode.system,

        //home: VerfiyCode(),

        translations: Translation(),
        locale: const Locale('en'),
        fallbackLocale: const Locale('fr'),

        initialRoute: Welcomescreen.screenRoute,
        routes: {
          Welcomescreen.screenRoute: (context) => const Welcomescreen(),
          Mapauth.screenRoute: (context) => Mapauth(),
          loginscreens.screenRoute: (context) => const loginscreens(),
          Advsecreens.screenRoute: (context) => const Advsecreens(),
          Pageinfoauth.screenRoute: (context) => const Pageinfoauth(),
          Pageauth.screenRoute: (context) => const Pageauth(),
          Homeconst.screenRoute: (context) => const Homeconst(),
          HomeScreen.screenRoute: (context) => HomeScreen(),
          ProductsScreens.screenRoute: (context) => const ProductsScreens(),
          Details.screenRoute: (context) => const Details(),
          Pestsscreen.screenRoute: (conxtet) => const Pestsscreen(),
          Persone.screenRoute: (context) => const Persone(),
          Profilscrenns.screenRoute: (context) => Profilscrenns(),
          Parametre.screenRoute: (context) => const Parametre(),
          Ownership.screenRoute: (context) => const Ownership(),
          ForgetPassword.screenRoute: (context) => ForgetPassword(),
          VerfiyCode.screenRoute: (context) => const VerfiyCode(),
          ResetPassword.screenRoute: (context) => const ResetPassword(),
          singupscreen.screenRoute: (context) => const singupscreen(),
          VideosPage.screenRoute: (context) => const VideosPage(),
          Pageone.screenRoute: (context) => const Pageone(),
          Land_list.screenRoute: (context) => const Land_list(),
          farmer_list.screenRoute: (context) => const farmer_list(),
          Complaint_list.screenRoute: (context) => const Complaint_list(),
          MyadvScreen.screenRoute: (context) => const MyadvScreen(),
          PageAdd.screenRoute: (context) => const PageAdd(),
          AddInfo.screenRoute: (context) => const AddInfo(),
          AddWheat.screenRoute: (context) => AddWheat(),
          ProductOne.screenRoute: (context) => const ProductOne()
        },
      ),
    );
  }
}
