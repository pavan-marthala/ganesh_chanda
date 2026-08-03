import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ganesh_chanda/core/theme/app_theme.dart';
import 'package:ganesh_chanda/core/utils/app_routes.dart';
import 'package:ganesh_chanda/features/community/presentation/bloc/community_bloc.dart';
import 'package:ganesh_chanda/features/donation/presentation/bloc/donation_bloc.dart';
import 'package:ganesh_chanda/features/expense/presentation/bloc/expense_bloc.dart';
import 'package:ganesh_chanda/features/festival/presentation/bloc/festival_bloc.dart';
import 'package:ganesh_chanda/features/festival/presentation/screens/festivals_home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FestivalDashboardScreen extends StatefulWidget {
  const FestivalDashboardScreen({super.key, required this.id});

  final String id;

  @override
  State<FestivalDashboardScreen> createState() =>
      _FestivalDashboardScreenState();
}

class _FestivalDashboardScreenState extends State<FestivalDashboardScreen> {
  @override
  void initState() {
    context.read<FestivalBloc>().add(
      FestivalEvent.getFestivalByIdRequested(widget.id),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;
    return BlocConsumer<FestivalBloc, FestivalState>(
      listenWhen: (previous, current) {
        return previous.festivalStatus != current.festivalStatus;
      },
      listener: (context, state) {
        if (state.festivalStatus == .loaded && state.festival != null) {
          log("Loaded donations");
          context.read<DonationBloc>().add(
            DonationEvent.loadDonationsByFestivalRequested(
              festivalId: state.festival!.id,
            ),
          );
          context.read<ExpenseBloc>().add(
            ExpenseEvent.loadExpensesByFestivalRequested(
              festivalId: state.festival!.id,
            ),
          );
        }
      },
      builder: (context, festivalState) {
        final isFestivalLoading =
            festivalState.festivalStatus == .loading ||
            festivalState.festivalStatus == .initial;
        final festival = festivalState.festival;
        return BlocBuilder<CommunityBloc, CommunityState>(
          builder: (context, communityState) {
            final isCommunityLoading =
                communityState.communityStatus == .loading ||
                communityState.communityStatus == .initial;
            final community = communityState.community;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: colors.background,
                elevation: 0,
                scrolledUnderElevation: 0,
                toolbarHeight: 70,
                automaticallyImplyLeading: false,
                title: Skeletonizer(
                  enabled: isCommunityLoading,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.push(AppRoutes.profile);
                        },
                        child: Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: context.appGradients.secondary,
                          ),
                          child: Center(
                            child: Text(
                              getInitials(community?.name ?? 'Community Name'),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Your community',
                            style: typography.caption.copyWith(
                              fontSize: 12,
                              color: colors.text4,
                            ),
                          ),
                          Text(
                            community?.name ?? 'Loading Community...',
                            style: typography.titleLarge.copyWith(
                              fontWeight: FontWeight.w700,
                              color: colors.textPrimary,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: colors.surfaceLight,
                        shape: BoxShape.circle,
                        border: Border.all(color: colors.border),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.settings,
                          color: colors.textPrimary,
                          size: 20,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),

              body: SafeArea(
                child: Skeletonizer(
                  enabled: isFestivalLoading,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Center(child: Text('This is DashboardScreen'));
                    },
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
