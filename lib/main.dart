import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ganesh_chanda/core/DI/injection.dart';
import 'package:ganesh_chanda/core/theme/app_theme.dart';
import 'package:ganesh_chanda/core/utils/app_routes.dart';
import 'package:ganesh_chanda/features/app_shell/presentation/screens/app_shell_screen.dart';
import 'package:ganesh_chanda/features/auth/domain/models/account_setup_status.dart';
import 'package:ganesh_chanda/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ganesh_chanda/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:ganesh_chanda/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:ganesh_chanda/features/community/presentation/bloc/community_bloc.dart';
import 'package:ganesh_chanda/features/community/presentation/screens/create_community_screen.dart';
import 'package:ganesh_chanda/features/dashboard/presentation/screens/festival_dashboard_screen.dart';
import 'package:ganesh_chanda/features/donation/presentation/screens/donation_screen.dart';
import 'package:ganesh_chanda/features/event/presentation/screens/event_screen.dart';
import 'package:ganesh_chanda/features/expense/presentation/screens/expense_screen.dart';
import 'package:ganesh_chanda/features/festival/presentation/bloc/festival_bloc.dart';
import 'package:ganesh_chanda/features/festival/presentation/screens/festivals_home_screen.dart';
import 'package:ganesh_chanda/features/festival/presentation/screens/festival_setup_screen.dart';
import 'package:ganesh_chanda/features/profile/presentation/screens/profile_screen.dart';
import 'package:ganesh_chanda/features/splash/presentation/screens/splash_screen.dart';
import 'package:ganesh_chanda/features/volunteer/presentation/bloc/volunteer_bloc.dart';
import 'package:ganesh_chanda/firebase_options.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

final GlobalKey<NavigatorState> _shellNavigatorKeyDashboard =
    GlobalKey<NavigatorState>(debugLabel: 'shell-dashboard');
final GlobalKey<NavigatorState> _shellNavigatorKeyDonations =
    GlobalKey<NavigatorState>(debugLabel: 'shell-donations');
final GlobalKey<NavigatorState> _shellNavigatorKeyExpense =
    GlobalKey<NavigatorState>(debugLabel: 'shell-expense');
final GlobalKey<NavigatorState> _shellNavigatorKeyEvents =
    GlobalKey<NavigatorState>(debugLabel: 'shell-events');
final GlobalKey<NavigatorState> _shellNavigatorKeyProfile =
    GlobalKey<NavigatorState>(debugLabel: 'shell-profile');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "app_config.env");
  await configureDependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<AuthBloc>()..add(const AuthEvent.started()),
        ),
        BlocProvider(create: (context) => getIt<CommunityBloc>()),
        BlocProvider(create: (context) => getIt<FestivalBloc>()),
        BlocProvider(create: (context) => getIt<VolunteerBloc>()),
      ],
      child: const MyApp(),
    ),
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription<dynamic> _subscription;

  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
      (dynamic _) => notifyListeners(),
    );
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GoRouter _goRouter;
  late final AuthBloc _authBloc;

  @override
  void initState() {
    _authBloc = context.read<AuthBloc>();
    _goRouter = GoRouter(
      initialLocation: AppRoutes.splash,
      navigatorKey: rootNavigatorKey,
      debugLogDiagnostics: true,
      refreshListenable: GoRouterRefreshStream(_authBloc.stream),
      redirect: (context, state) {
        final authState = _authBloc.state;
        final matchedLocation = state.matchedLocation;

        final isSplash = matchedLocation == AppRoutes.splash;
        final isSignIn = matchedLocation == AppRoutes.signIn;
        final isSignUp = matchedLocation == AppRoutes.signUp;

        return authState.map(
          initial: (_) {
            if (!isSplash) {
              return AppRoutes.splash;
            }
            return null;
          },
          authenticated: (authenticatedState) {
            final appUser = authenticatedState.user;
            final targetRoute = switch (appUser.accountSetupStatus) {
              AccountSetupStatus.adminRegistered => AppRoutes.createCommunity,
              AccountSetupStatus.communityCreated => AppRoutes.festivalsHome,
              AccountSetupStatus.onboardingCompleted => AppRoutes.dashboard,
            };

            if (isSplash || isSignIn || isSignUp) {
              return targetRoute;
            }

            return null;
          },
          unauthenticated: (_) {
            if (!isSignIn && !isSignUp) {
              return AppRoutes.signIn;
            }
            return null;
          },
        );
      },
      routes: [
        GoRoute(
          path: AppRoutes.splash,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: AppRoutes.signIn,
          builder: (context, state) => const SignInScreen(),
        ),
        GoRoute(
          path: AppRoutes.signUp,
          builder: (context, state) => const SignUpScreen(),
        ),
        GoRoute(
          path: AppRoutes.createCommunity,
          builder: (context, state) => const CreateCommunityScreen(),
        ),
        GoRoute(
          path: AppRoutes.festivalsHome,
          builder: (context, state) => const FestivalsHomeScreen(),
        ),
        GoRoute(
          path: AppRoutes.profile,
          builder: (context, state) => const ProfileScreen(),
        ),
        GoRoute(
          path: AppRoutes.festivalSetup,
          builder: (context, state) {
            final id = state.pathParameters['id'] as String;
            return FestivalSetupScreen(festivalId: id);
          },
        ),
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) =>
              AppShellScreen(navigationShell: navigationShell),
          branches: [
            StatefulShellBranch(
              navigatorKey: _shellNavigatorKeyDashboard,
              routes: [
                GoRoute(
                  path: AppRoutes.dashboard,
                  name: AppRoutes.dashboard,
                  pageBuilder: (context, state) {
                    final id = state.extra as String;
                    return NoTransitionPage(
                      child: FestivalDashboardScreen(id: id),
                    );
                  },
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorKeyDonations,
              routes: [
                GoRoute(
                  path: AppRoutes.donations,
                  name: AppRoutes.donations,
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: DonationScreen()),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorKeyExpense,
              routes: [
                GoRoute(
                  path: AppRoutes.expense,
                  name: AppRoutes.expense,
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: ExpenseScreen()),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorKeyEvents,
              routes: [
                GoRoute(
                  path: AppRoutes.events,
                  name: AppRoutes.events,
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: EventScreen()),
                ),
              ],
            ),
            // StatefulShellBranch(
            //   navigatorKey: _shellNavigatorKeyProfile,
            //   routes: [
            //     GoRoute(
            //       path: AppRoutes.profile,
            //       name: AppRoutes.profile,
            //       pageBuilder: (context, state) =>
            //           const NoTransitionPage(child: ProfileScreen()),
            //     ),
            //   ],
            // ),
          ],
        ),
      ],
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _goRouter,
      title: 'Ganesh Chanda',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return child ?? const Scaffold();
      },
    );
  }
}
