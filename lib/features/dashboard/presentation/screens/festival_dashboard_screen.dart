import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ganesh_chanda/core/theme/app_theme.dart';
import 'package:ganesh_chanda/core/utils/app_routes.dart';
import 'package:ganesh_chanda/core/utils/app_utils.dart';
import 'package:ganesh_chanda/core/utils/sized_context.dart';
import 'package:ganesh_chanda/features/community/presentation/bloc/community_bloc.dart';
import 'package:ganesh_chanda/features/donation/domain/models/donation.dart';
import 'package:ganesh_chanda/features/donation/presentation/bloc/donation_bloc.dart';
import 'package:ganesh_chanda/features/donation/presentation/widgets/add_donation_bottom_sheet.dart';
import 'package:ganesh_chanda/features/event/presentation/bloc/event_bloc.dart';
import 'package:ganesh_chanda/features/expense/domain/enums/expense_status.dart';
import 'package:ganesh_chanda/features/expense/domain/models/expense.dart';
import 'package:ganesh_chanda/features/expense/presentation/bloc/expense_bloc.dart';
import 'package:ganesh_chanda/features/expense/presentation/widgets/add_expense_bottom_sheet.dart';
import 'package:ganesh_chanda/features/festival/domain/models/festival.dart';
import 'package:ganesh_chanda/features/festival/presentation/bloc/festival_bloc.dart';
import 'package:ganesh_chanda/features/festival/presentation/screens/festivals_home_screen.dart';
import 'package:ganesh_chanda/features/festival/presentation/widgets/create_festival_bottom_sheet.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
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
          context.read<EventBloc>().add(
            EventEvent.loadEventsByFestivalRequested(
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
            final isUpcoming = festival == null ? false : festival.isUpcoming;
            final isActive = festival == null ? false : festival.isActive;
            final isFinalDay = festival == null ? false : festival.isFinalDay;
            final isCompleted = festival == null ? false : festival.isCompleted;

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
                        onPressed: () {
                          CreateFestivalBottomSheet.show(
                            context,
                            festival: festival,
                          );
                        },
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
                      return SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (isUpcoming)
                              _UpcomingFestivalHero(
                                festival: festivalState.festival!,
                              ),
                            if (isActive)
                              _ActiveFestivalHero(
                                festival: festivalState.festival!,
                              ),
                            if (isFinalDay)
                              _FinalDayFestivalHero(
                                festival: festivalState.festival!,
                              ),
                            if (isCompleted)
                              _CompletedFestivalHero(
                                festival: festivalState.festival!,
                              ),
                            // _HeroSection(festival: festivalState.festival!),
                            const SizedBox(height: 20),
                            _CollectionProgressCard(
                              festival: festivalState.festival!,
                            ),
                            const SizedBox(height: 16),
                            _StatisticsSection(
                              festival: festivalState.festival!,
                            ),
                            const SizedBox(height: 24),
                            const _QuickActionsSection(),
                            const SizedBox(height: 24),
                            const _RecentEventsSection(),
                            const SizedBox(height: 24),
                            const _RangoliDivider(),
                            SizedBox(height: context.viewInsets.bottom + 100),
                          ],
                        ),
                      );
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

// class _HeroSection extends StatelessWidget {
//   const _HeroSection({required this.festival});
//
//   final Festival festival;
//
//   @override
//   Widget build(BuildContext context) {
//     final colors = context.appColors;
//     final typography = context.appTypography;
//
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(22),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(24),
//         gradient: const LinearGradient(
//           colors: [Color(0xFFFFAE4D), Color(0xFFF97316), Color(0xFFC74E0E)],
//           begin: Alignment.topRight,
//           end: Alignment.bottomLeft,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: colors.primary.withValues(alpha: 0.28),
//             blurRadius: 24,
//             offset: const Offset(0, 10),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'SHREE GANESH UTSAV MANDAL',
//             style: typography.labelSmall.copyWith(
//               fontWeight: FontWeight.w700,
//               fontSize: 11,
//               letterSpacing: 1.2,
//               color: Colors.white.withValues(alpha: 0.85),
//             ),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             '${festival.name} ${festival.startDate.year}',
//             style: typography.headlineMedium.copyWith(
//               fontWeight: FontWeight.w800,
//               fontSize: 26,
//               color: Colors.white,
//             ),
//           ),
//           const SizedBox(height: 2),
//           Text(
//             'Visarjan on ${DateFormat("dd MMM").format(festival.endDate)} · Day 10',
//             style: typography.bodyMedium.copyWith(
//               fontSize: 14,
//               color: Colors.white.withValues(alpha: 0.9),
//             ),
//           ),
//           const SizedBox(height: 16),
//
//           const Row(
//             children: [
//               _CountdownBox(number: '12', label: 'DAYS'),
//               SizedBox(width: 10),
//               _CountdownBox(number: '06', label: 'HOURS'),
//               SizedBox(width: 10),
//               _CountdownBox(number: '41', label: 'MINS'),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

class _CountdownBox extends StatelessWidget {
  final String number;
  final String label;

  const _CountdownBox({required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 56),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Text(
            number,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 1),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 10,
              letterSpacing: 0.6,
              color: Colors.white.withValues(alpha: 0.85),
            ),
          ),
        ],
      ),
    );
  }
}

class _CollectionProgressCard extends StatelessWidget {
  const _CollectionProgressCard({required this.festival});

  final Festival festival;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colors.card,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: colors.border),
        boxShadow: [
          BoxShadow(
            color: colors.black.withValues(alpha: context.isDark ? 0.25 : 0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 104,
            height: 104,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 104,
                  height: 104,
                  child: CircularProgressIndicator(
                    value: calculateGoalProgress(
                      totalCollected: festival.totalDonationAmount,
                      goalAmount: festival.goal,
                    ),
                    strokeWidth: 10,
                    backgroundColor: colors.border,
                    valueColor: AlwaysStoppedAnimation<Color>(colors.primary),
                    strokeCap: StrokeCap.round,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      goalProgressPercentage(
                        totalCollected: festival.totalDonationAmount,
                        goalAmount: festival.goal,
                      ),
                      style: typography.headlineSmall.copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: 19,
                        color: colors.textPrimary,
                      ),
                    ),
                    Text(
                      'OF GOAL',
                      style: typography.caption.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 9,
                        color: colors.text4,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),

          // Total Collection Text Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Collection',
                  style: typography.caption.copyWith(
                    color: colors.text4,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  formatAmount(festival.totalDonationAmount),
                  style: typography.headlineMedium.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 26,
                    color: colors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Goal ${formatAmount(festival.goal)}',
                  style: typography.bodyMedium.copyWith(
                    fontSize: 12.5,
                    color: colors.text4,
                  ),
                ),
                const SizedBox(height: 8),

                // Today badge
                BlocSelector<DonationBloc, DonationState, List<Donation>>(
                  selector: (state) {
                    return state.donations;
                  },
                  builder: (context, donations) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: colors.success.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(99),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colors.success,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '${formatAmount(DonationUtils.getTodayCollection(donations))} today',
                            style: TextStyle(
                              color: colors.success,
                              fontWeight: FontWeight.w700,
                              fontSize: 11.5,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatisticsSection extends StatelessWidget {
  const _StatisticsSection({required this.festival});

  final Festival festival;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return BlocSelector<DonationBloc, DonationState, List<Donation>>(
      selector: (state) {
        return state.donations;
      },
      builder: (context, donations) {
        final totalRaised = festival.totalDonationAmount;
        final availableBalance = (totalRaised - festival.totalExpenseAmount)
            .clamp(0.0, double.infinity);

        return GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.45,
          children: [
            _StatCard(
              icon: Icons.bar_chart_rounded,
              iconBg: colors.success.withValues(alpha: 0.15),
              iconColor: colors.success,
              value: formatAmount(DonationUtils.getTodayCollection(donations)),
              label: "Today's Collection",
            ),
            _StatCard(
              icon: Icons.remove_rounded,
              iconBg: colors.error.withValues(alpha: 0.15),
              iconColor: colors.error,
              value: formatAmount(festival.totalExpenseAmount),
              label: 'Total Expenses',
            ),
            _StatCard(
              icon: Icons.currency_rupee_rounded,
              iconBg: const Color(0xFFD4AF37).withValues(alpha: 0.15),
              iconColor: const Color(0xFF9A7B1E),
              value: formatAmount(availableBalance),
              label: 'Available Balance',
            ),
            _StatCard(
              icon: Icons.group_outlined,
              iconBg: colors.primary.withValues(alpha: 0.12),
              iconColor: colors.primary,
              value: donations.length.toString(),
              label: 'Total Donors',
            ),
          ],
        );
      },
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String value;
  final String label;

  const _StatCard({
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: colors.card,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colors.border),
        boxShadow: [
          BoxShadow(
            color: colors.black.withValues(alpha: context.isDark ? 0.2 : 0.04),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 18, color: iconColor),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: typography.titleLarge.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                  color: colors.textPrimary,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: typography.caption.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: colors.text4,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuickActionsSection extends StatelessWidget {
  const _QuickActionsSection();

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: typography.titleLarge.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: colors.textPrimary,
          ),
        ),
        const SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _QuickActionItem(
              title: 'Add Donation',
              icon: Icons.add_rounded,
              gradient: context.appGradients.primary,
              iconColor: Colors.white,
              onTap: () {
                AddDonationBottomSheet.show(context);
              },
            ),
            _QuickActionItem(
              title: 'Add Expense',
              icon: Icons.account_balance_wallet_outlined,
              gradient: context.appGradients.secondary,
              iconColor: Colors.white,
              onTap: () {
                AddExpenseBottomSheet.show(context);
              },
            ),
            _QuickActionItem(
              title: 'Volunteers',
              icon: Icons.group_outlined,
              backgroundColor: colors.surfaceLight,
              iconColor: colors.primary,
            ),
            _QuickActionItem(
              title: 'Reports',
              icon: Icons.show_chart_rounded,
              backgroundColor: colors.surfaceLight,
              iconColor: colors.primary,
            ),
          ],
        ),
      ],
    );
  }
}

class _QuickActionItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Gradient? gradient;
  final Color? backgroundColor;
  final Color iconColor;
  final Function()? onTap;

  const _QuickActionItem({
    required this.title,
    required this.icon,
    this.gradient,
    this.backgroundColor,
    required this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              gradient: gradient,
              color: backgroundColor,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: colors.black.withValues(
                    alpha: context.isDark ? 0.2 : 0.05,
                  ),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(icon, size: 22, color: iconColor),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: typography.caption.copyWith(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: colors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _RecentEventsSection extends StatelessWidget {
  const _RecentEventsSection();

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Today's Events",
              style: typography.titleLarge.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: colors.textPrimary,
              ),
            ),
            Text(
              'See all',
              style: typography.titleSmall.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 13,
                color: colors.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          child: Row(
            children: [
              _EventCard(
                time: '6:30 AM',
                title: 'Morning Aarti',
                location: 'Main Mandap',
              ),
              SizedBox(width: 12),
              _EventCard(
                time: '7:00 PM',
                title: 'Bhajan Sandhya',
                location: 'Community Hall',
              ),
              SizedBox(width: 12),
              _EventCard(
                time: '9:00 PM',
                title: 'Cultural Program',
                location: 'Open Ground',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _EventCard extends StatelessWidget {
  final String time;
  final String title;
  final String location;

  const _EventCard({
    required this.time,
    required this.title,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;

    return Container(
      width: 156,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: colors.card,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colors.border),
        boxShadow: [
          BoxShadow(
            color: colors.black.withValues(alpha: context.isDark ? 0.2 : 0.04),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
            decoration: BoxDecoration(
              color: colors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(99),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.access_time_rounded,
                  size: 12,
                  color: colors.primary,
                ),
                const SizedBox(width: 4),
                Text(
                  time,
                  style: TextStyle(
                    color: colors.primary,
                    fontWeight: FontWeight.w700,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: typography.titleMedium.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: colors.textPrimary,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            location,
            style: typography.caption.copyWith(
              fontSize: 12,
              color: colors.text4,
            ),
          ),
        ],
      ),
    );
  }
}

class _RangoliDivider extends StatelessWidget {
  const _RangoliDivider();

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, colors.border, Colors.transparent],
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Icon(Icons.spa_rounded, size: 16, color: Color(0xFFD4AF37)),
        ),
        Expanded(
          child: Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, colors.border, Colors.transparent],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _UpcomingFestivalHero extends StatelessWidget {
  const _UpcomingFestivalHero({required this.festival});

  final Festival festival;

  @override
  Widget build(BuildContext context) {
    final typography = context.appTypography;
    final countdown = festival.upcomingCountdown;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [Color(0xFFF3D06B), Color(0xFFD4AF37), Color(0xFF9A7B1E)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFD4AF37).withValues(alpha: 0.25),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              border: Border.all(color: Colors.white.withValues(alpha: 0.35)),
              borderRadius: BorderRadius.circular(99),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 7,
                  height: 7,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  'UPCOMING',
                  style: typography.labelSmall.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 11,
                    letterSpacing: 0.4,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${festival.name} ${festival.startDate.year}',
            style: typography.headlineMedium.copyWith(
              fontWeight: FontWeight.w800,
              fontSize: 26,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'Begins ${DateFormat("dd MMM").format(festival.startDate)} · Get your community ready',
            style: typography.bodyMedium.copyWith(
              fontSize: 14,
              color: Colors.white.withValues(alpha: 0.9),
            ),
          ),
          const SizedBox(height: 16),

          Row(
            spacing: 10,
            children: [
              Expanded(
                child: _CountdownBox(
                  number: countdown.days.toString(),
                  label: 'DAYS',
                ),
              ),
              Expanded(child: _CountdownBox(number: countdown.hours.toString(), label: 'HOURS')),
              Expanded(
                child: _CountdownBox(
                  number: countdown.minutes.toString(),
                  label: 'MINS',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActiveFestivalHero extends StatelessWidget {
  const _ActiveFestivalHero({required this.festival});

  final Festival festival;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;
    final countdown = festival.visarjanCountdown;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [Color(0xFFFFAE4D), Color(0xFFF97316), Color(0xFFC74E0E)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        boxShadow: [
          BoxShadow(
            color: colors.primary.withValues(alpha: 0.28),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Live Now Pulse Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              border: Border.all(color: Colors.white.withValues(alpha: 0.35)),
              borderRadius: BorderRadius.circular(99),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 7,
                  height: 7,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  'LIVE NOW',
                  style: typography.labelSmall.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 11,
                    letterSpacing: 0.4,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${festival.name} ${festival.startDate.year}',
            style: typography.headlineMedium.copyWith(
              fontWeight: FontWeight.w800,
              fontSize: 26,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'Visarjan on ${DateFormat("dd MMM").format(festival.endDate)} · Day ${festival.currentDay} of ${festival.totalDays}',
            style: typography.bodyMedium.copyWith(
              fontSize: 14,
              color: Colors.white.withValues(alpha: 0.9),
            ),
          ),
          const SizedBox(height: 16),

          // Countdown Row
          Row(
            spacing: 10,
            children: [
              Expanded(
                child: _CountdownBox(
                  number: countdown.days.toString(),
                  label: 'DAYS',
                ),
              ),
              Expanded(
                child: _CountdownBox(
                  number: countdown.hours.toString(),
                  label: 'HOURS',
                ),
              ),
              Expanded(
                child: _CountdownBox(
                  number: countdown.minutes.toString(),
                  label: 'MINS',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FinalDayFestivalHero extends StatelessWidget {
  const _FinalDayFestivalHero({required this.festival});

  final Festival festival;

  @override
  Widget build(BuildContext context) {
    final typography = context.appTypography;
    final countdown = festival.visarjanCountdown;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [Color(0xFFE8542E), Color(0xFFC0392B), Color(0xFF7A1F1F)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFC0392B).withValues(alpha: 0.32),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Final Day Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              border: Border.all(color: Colors.white.withValues(alpha: 0.35)),
              borderRadius: BorderRadius.circular(99),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 7,
                  height: 7,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  'FINAL DAY · VISARJAN TODAY',
                  style: typography.labelSmall.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 11,
                    letterSpacing: 0.4,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${festival.name} ${festival.startDate.year}',
            style: typography.headlineMedium.copyWith(
              fontWeight: FontWeight.w800,
              fontSize: 26,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'Procession begins ${DateFormat("dd MMM").format(festival.endDate)}',
            style: typography.bodyMedium.copyWith(
              fontSize: 14,
              color: Colors.white.withValues(alpha: 0.9),
            ),
          ),
          const SizedBox(height: 16),

          // Countdown Row (Hours & Mins only)
          Row(
            spacing: 10,
            children: [
              Expanded(child: _CountdownBox(number: countdown.hours.toString(), label: 'HOURS')),
              Expanded(
                child: _CountdownBox(
                  number: countdown.minutes.toString(),
                  label: 'MINS',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CompletedFestivalHero extends StatelessWidget {
  const _CompletedFestivalHero({required this.festival});

  final Festival festival;

  @override
  Widget build(BuildContext context) {
    final typography = context.appTypography;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [Color(0xFF6B5A4A), Color(0xFF4A3B2E)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2D1B12).withValues(alpha: 0.18),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Concluded Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(99),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.check_rounded, size: 13, color: Colors.white),
                const SizedBox(width: 4),
                Text(
                  'CONCLUDED',
                  style: typography.labelSmall.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 11,
                    letterSpacing: 0.4,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${festival.name} ${festival.startDate.year}',
            style: typography.headlineMedium.copyWith(
              fontWeight: FontWeight.w800,
              fontSize: 26,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'Visarjan completed ${DateFormat("dd MMM").format(festival.endDate)} · ${festival.totalDays} wonderful days 🙏',
            style: typography.bodyMedium.copyWith(
              fontSize: 14,
              color: Colors.white.withValues(alpha: 0.85),
            ),
          ),
          const SizedBox(height: 16),

          // Stat Chip Recap Row
          Row(
            children: [
              _StatChipBox(
                value: formatAmount(festival.totalDonationAmount),
                label: 'COLLECTED',
              ),
              SizedBox(width: 10),
              _StatChipBox(
                value: festival.totalDonationCount.toString(),
                label: 'DONORS',
              ),
              SizedBox(width: 10),
              _StatChipBox(value: festival.totalDays.toString(), label: 'DAYS'),
            ],
          ),
          const SizedBox(height: 16),

          // CTA Ghost Button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.16),
              border: Border.all(color: Colors.white.withValues(alpha: 0.4)),
              borderRadius: BorderRadius.circular(99),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'View Festival Report',
                  style: typography.titleSmall.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 12.5,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 6),
                const Icon(
                  Icons.arrow_forward_rounded,
                  size: 14,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatChipBox extends StatelessWidget {
  final String value;
  final String label;

  const _StatChipBox({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.10),
          border: Border.all(color: Colors.white.withValues(alpha: 0.20)),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 9.5,
                letterSpacing: 0.5,
                color: Colors.white.withValues(alpha: 0.75),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
