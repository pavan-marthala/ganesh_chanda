import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ganesh_chanda/core/theme/app_theme.dart';
import 'package:ganesh_chanda/core/utils/app_routes.dart';
import 'package:ganesh_chanda/core/utils/state_status.dart';
import 'package:ganesh_chanda/features/auth/domain/models/app_user.dart';
import 'package:ganesh_chanda/features/community/domain/models/community.dart';
import 'package:ganesh_chanda/features/community/presentation/bloc/community_bloc.dart';
import 'package:ganesh_chanda/features/festival/domain/models/festival.dart';
import 'package:ganesh_chanda/features/festival/domain/models/festival_status.dart';
import 'package:ganesh_chanda/features/festival/presentation/bloc/festival_bloc.dart';
import 'package:ganesh_chanda/features/volunteer/presentation/bloc/volunteer_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FestivalSetupScreen extends StatefulWidget {
  final String festivalId;

  const FestivalSetupScreen({super.key, required this.festivalId});

  @override
  State<FestivalSetupScreen> createState() => _FestivalSetupScreenState();
}

class _FestivalSetupScreenState extends State<FestivalSetupScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FestivalBloc>().add(
      FestivalEvent.getFestivalByIdRequested(widget.festivalId),
    );
  }

  String _formatDateRange(DateTime start, DateTime end) {
    final startFormat = DateFormat('d MMM');
    final endFormat = DateFormat('d MMM yyyy');
    return '${startFormat.format(start)} – ${endFormat.format(end)}';
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  bool _isLive(Festival festival, DateTime now) {
    final startDay = DateTime(
      festival.startDate.year,
      festival.startDate.month,
      festival.startDate.day,
    );
    final endDay = DateTime(
      festival.endDate.year,
      festival.endDate.month,
      festival.endDate.day,
    );
    final today = DateTime(now.year, now.month, now.day);
    return (today.isAfter(startDay) || _isSameDay(today, startDay)) &&
        (today.isBefore(endDay) || _isSameDay(today, endDay));
  }

  bool _isUpcoming(Festival festival, DateTime now) {
    final startDay = DateTime(
      festival.startDate.year,
      festival.startDate.month,
      festival.startDate.day,
    );
    final today = DateTime(now.year, now.month, now.day);
    return startDay.isAfter(today);
  }

  String _getStatusLabel(Festival festival, DateTime now) {
    if (_isLive(festival, now)) return 'Live now';
    if (_isUpcoming(festival, now)) return 'Upcoming';
    return 'Completed';
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;

    return BlocSelector<CommunityBloc, CommunityState, Community?>(
      selector: (state) {
        return state.community;
      },
      builder: (context, community) {
        final communityName = community?.name ?? 'Mandal / Community Name';

        return BlocSelector<VolunteerBloc, VolunteerState, List<AppUser>>(
          selector: (state) {
            return state.volunteers;
          },
          builder: (context, volunteers) {
            return BlocBuilder<FestivalBloc, FestivalState>(
              builder: (context, festivalState) {
                final isFestivalLoading =
                    festivalState.festivalStatus == StateStatus.loading ||
                    festivalState.festivalStatus == StateStatus.initial;
                final festival = festivalState.festival;

                if (festivalState.festivalStatus == StateStatus.error) {
                  return Scaffold(
                    backgroundColor: colors.background,
                    appBar: AppBar(
                      backgroundColor: colors.surfaceLight,
                      title: const Text('Festival Setup'),
                    ),
                    body: Center(
                      child: Text(
                        festivalState.festivalError ??
                            'Failed to load festival',
                        style: typography.bodyMedium.copyWith(
                          color: colors.error,
                        ),
                      ),
                    ),
                  );
                }

                final mockFestival = Festival(
                  id: widget.festivalId,
                  communityId: '',
                  name: 'Ganesh Chaturthi 2026',
                  description: '',
                  startDate: DateTime.now(),
                  endDate: DateTime.now().add(const Duration(days: 9)),
                  status: FestivalStatus.active,
                  createdBy: '',
                  createdAt: DateTime.now(),
                  updatedAt: DateTime.now(),
                );

                final displayFestival = isFestivalLoading
                    ? mockFestival
                    : festival;
                double volunteersProgress = volunteers.isNotEmpty ? 0.25 : 0.0;
                double assignedVolunteersProgress =
                    (displayFestival?.totalDonationCount ?? 0) > 0 ? 0.25 : 0.0;
                final progress =
                    0.5 + volunteersProgress + assignedVolunteersProgress;
                return Scaffold(
                  backgroundColor: colors.background,
                  appBar: AppBar(
                    backgroundColor: colors.background,
                    elevation: 0,
                    scrolledUnderElevation: 1,
                    surfaceTintColor: Colors.transparent,
                    leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: colors.textPrimary,
                      ),
                      onPressed: () => Navigator.of(context).maybePop(),
                    ),
                    title: Text(
                      'Festival Setup',
                      style: typography.titleLarge.copyWith(
                        fontWeight: FontWeight.w700,
                        color: colors.textPrimary,
                      ),
                    ),
                  ),
                  body: Skeletonizer(
                    enabled: isFestivalLoading,
                    child: SafeArea(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Card Feature (Banner / Info)
                            if (displayFestival != null)
                              _buildFestivalBannerCard(
                                context,
                                displayFestival,
                                DateTime.now(),
                              ),

                            const SizedBox(height: 24),

                            Text(
                              'Get your festival ready',
                              style: typography.titleLarge.copyWith(
                                fontWeight: FontWeight.w700,
                                color: colors.textPrimary,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Complete these steps so volunteers can start collecting donations.',
                              style: typography.bodyMedium.copyWith(
                                color: colors.text4,
                                fontSize: 13,
                              ),
                            ),

                            const SizedBox(height: 16),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(99),
                              child: LinearProgressIndicator(
                                value: progress,
                                minHeight: 8,
                                backgroundColor: colors.surfaceLight,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  colors.primary,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              decoration: BoxDecoration(
                                color: colors.card,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: colors.border),
                              ),
                              child: Column(
                                children: [
                                  _buildChecklistItem(
                                    context,
                                    isDone: true,
                                    title: 'Community Created',
                                    subtitle: communityName,
                                    isFirst: true,
                                  ),
                                  _buildChecklistItem(
                                    context,
                                    isDone: true,
                                    title: 'Festival Created',
                                    subtitle:
                                        displayFestival?.name ??
                                        'Ganesh Chaturthi',
                                  ),
                                  _buildChecklistItem(
                                    context,
                                    isDone: volunteersProgress == 0.25,
                                    title: 'Add Volunteers',
                                    subtitle:
                                        'Bring community members onto the platform',
                                    showChevron: true,
                                    onTap: volunteersProgress == 0.25
                                        ? null
                                        : () {},
                                  ),
                                  _buildChecklistItem(
                                    context,
                                    isDone: assignedVolunteersProgress == 0.25,
                                    title: 'Assign Volunteers',
                                    subtitle:
                                        'Give volunteers an area & role for this festival',
                                    showChevron: true,
                                    isLast: true,
                                    onTap: assignedVolunteersProgress == 0.25
                                        ? null
                                        : () {},
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 24),

                            // Go to Full Dashboard Button
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: colors.surfaceLight,
                                side: BorderSide(color: colors.border),
                                shape: const StadiumBorder(),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                minimumSize: const Size(double.infinity, 48),
                              ),
                              onPressed: () {
                                context.pushReplacement(
                                  AppRoutes.dashboard,
                                  extra: displayFestival!.id,
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Go to Full Dashboard',
                                    style: typography.titleMedium.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: colors.textPrimary,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Icon(
                                    Icons.arrow_forward_rounded,
                                    size: 18,
                                    color: colors.textPrimary,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _buildFestivalBannerCard(
    BuildContext context,
    Festival festival,
    DateTime now,
  ) {
    final colors = context.appColors;
    final typography = context.appTypography;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: context.appGradients.primary,
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.22),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(radius: 3, backgroundColor: Colors.white),
                const SizedBox(width: 6),
                Text(
                  _getStatusLabel(festival, now),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            festival.name,
            style: typography.headlineMedium.copyWith(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            _formatDateRange(festival.startDate, festival.endDate),
            style: typography.bodyMedium.copyWith(
              color: Colors.white.withValues(alpha: 0.85),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChecklistItem(
    BuildContext context, {
    required bool isDone,
    required String title,
    required String subtitle,
    bool showChevron = false,
    bool isFirst = false,
    bool isLast = false,
    void Function()? onTap,
  }) {
    final colors = context.appColors;
    final typography = context.appTypography;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: isLast
              ? null
              : Border(bottom: BorderSide(color: colors.border)),
        ),
        child: Row(
          children: [
            // Checklist Icon
            Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDone ? colors.success : Colors.transparent,
                border: isDone
                    ? null
                    : Border.all(color: colors.border, width: 1.5),
              ),
              child: isDone
                  ? const Icon(
                      Icons.check_rounded,
                      size: 16,
                      color: Colors.white,
                    )
                  : null,
            ),
            const SizedBox(width: 14),

            // Title & Subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: typography.titleMedium.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colors.textPrimary,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: typography.caption.copyWith(
                      color: colors.text4,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            if (showChevron)
              Icon(Icons.chevron_right_rounded, size: 20, color: colors.text4),
          ],
        ),
      ),
    );
  }
}
