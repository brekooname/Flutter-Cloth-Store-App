import 'package:fasion_store/business_logic/blocs/cloth/cloth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/blocs/cart/cart_bloc.dart';
import 'business_logic/blocs/wishlist/wishlist_bloc.dart';
import 'presentation/router/app_router.dart';
import 'core/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ClothBloc>(create: (context) => ClothBloc()..add(LoadCloth()),),
          BlocProvider<CartBloc>(create: (context) => CartBloc()..add(LoadCart()),),
          BlocProvider<WishlistBloc>(create: (context) => WishlistBloc()..add(LoadWishlist()),)
        ],
        child: const EasyBillingApp());
  }
}

class EasyBillingApp extends StatefulWidget {
  const EasyBillingApp({
    Key? key,
  }) : super(key: key);

  @override
  _EasyBillingAppState createState() => _EasyBillingAppState();
}

class _EasyBillingAppState extends State<EasyBillingApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Easy Billing",
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.home,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
