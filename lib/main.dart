import 'package:firebase_core/firebase_core.dart';
import 'package:fitpulse/core/routes/app_router.dart';
import 'package:fitpulse/core/utils/app_colors.dart';
import 'package:fitpulse/firebase_options.dart';
import 'package:fitpulse/manager/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ChangeNotifierProvider(
      create: (context) => MyProvider(), child: const FitPulse()));
}

class FitPulse extends StatelessWidget {
  const FitPulse({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(412, 917),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                shadowColor: AppColors.blackColor,
                toolbarHeight: 90.h,
                elevation: 0.5,
                backgroundColor: AppColors.scaffoldBackgroundColor),
            scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor),
        initialRoute:
            provider.firebaseUser != null ? AppRouter.home : AppRouter.splash,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
