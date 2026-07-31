import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ganesh_chanda/core/theme/app_theme.dart';

import 'package:ganesh_chanda/core/utils/state_status.dart';
import 'package:ganesh_chanda/features/community/presentation/bloc/community_bloc.dart';
import 'package:ganesh_chanda/features/festival/domain/models/festival.dart';
import 'package:ganesh_chanda/features/festival/domain/models/festival_status.dart';
import 'package:ganesh_chanda/features/festival/presentation/bloc/festival_bloc.dart';
import 'package:ganesh_chanda/features/festival/presentation/widgets/create_festival_bottom_sheet.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FestivalsHomeScreen extends StatefulWidget {
  const FestivalsHomeScreen({super.key});

  @override
  State<FestivalsHomeScreen> createState() => _FestivalsHomeScreenState();
}

class _FestivalsHomeScreenState extends State<FestivalsHomeScreen> {
  @override
  void initState() {
    context.read<CommunityBloc>().add(
      CommunityEvent.loadCurrentCommunityRequested(),
    );
    super.initState();
  }

  String _getInitials(String name) {
    if (name.trim().isEmpty) return 'GC';
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return name.substring(0, name.length >= 2 ? 2 : 1).toUpperCase();
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  bool _isUpcoming(Festival festival, DateTime now) {
    final startDay = DateTime(festival.startDate.year, festival.startDate.month, festival.startDate.day);
    final today = DateTime(now.year, now.month, now.day);
    return startDay.isAfter(today);
  }

  bool _isLive(Festival festival, DateTime now) {
    final startDay = DateTime(festival.startDate.year, festival.startDate.month, festival.startDate.day);
    final endDay = DateTime(festival.endDate.year, festival.endDate.month, festival.endDate.day);
    final today = DateTime(now.year, now.month, now.day);
    return (today.isAfter(startDay) || _isSameDay(today, startDay)) &&
        (today.isBefore(endDay) || _isSameDay(today, endDay));
  }

  bool _isCompleted(Festival festival, DateTime now) {
    final endDay = DateTime(festival.endDate.year, festival.endDate.month, festival.endDate.day);
    final today = DateTime(now.year, now.month, now.day);
    return endDay.isBefore(today);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;

    return BlocListener<CommunityBloc, CommunityState>(
      listener: (context, communityState) {
        if (communityState.communityStatus == StateStatus.loaded) {
          context.read<FestivalBloc>().add(
            const FestivalEvent.loadFestivalsRequested(),
          );
        }
      },
      child: BlocBuilder<CommunityBloc, CommunityState>(
        builder: (context, communityState) {
          final isCommunityLoading =
              communityState.communityStatus == StateStatus.loading ||
              communityState.communityStatus == StateStatus.initial;
          final community = communityState.community;

          return Scaffold(
            backgroundColor: colors.background,
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
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: context.appGradients.secondary,
                      ),
                      child: Center(
                        child: Text(
                          _getInitials(community?.name ?? 'Community Name'),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
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
                        Icons.add,
                        color: colors.textPrimary,
                        size: 20,
                      ),
                      onPressed: () {
                        CreateFestivalBottomSheet.show(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
            body: SafeArea(
              child: BlocBuilder<FestivalBloc, FestivalState>(
                builder: (context, festivalState) {
                  final isFestivalsLoading =
                      festivalState.festivalsStatus == StateStatus.loading ||
                      festivalState.festivalsStatus == StateStatus.initial;
                  final festivals = festivalState.festivals;

                  if (isFestivalsLoading || isCommunityLoading) {
                    return Skeletonizer(
                      enabled: true,
                      child: _buildFestivalsFilledView(context, [
                        Festival(
                          id: 'mock-1',
                          communityId: 'c1',
                          name: 'Ganesh Chaturthi 2026',
                          description: '',
                          startDate: DateTime.now(),
                          endDate: DateTime.now().add(const Duration(days: 10)),
                          status: FestivalStatus.active,
                          createdBy: 'u1',
                          createdAt: DateTime.now(),
                          updatedAt: DateTime.now(),
                        ),
                      ]),
                    );
                  }

                  if (festivals.isEmpty ||
                      festivalState.festivalsStatus == StateStatus.empty) {
                    return _buildEmptyStateView(context);
                  }

                  return _buildFestivalsFilledView(context, festivals);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyStateView(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors.surfaceLight,
                border: Border.all(
                  color: colors.border,
                  style: BorderStyle.solid,
                  width: 1.5,
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.calendar_today_outlined,
                  size: 40,
                  color: colors.primary.withValues(alpha: 0.65),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'No festivals yet',
              style: typography.titleLarge.copyWith(
                fontWeight: FontWeight.w700,
                color: colors.textPrimary,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Create your first festival to start assigning volunteers and collecting donations for your community.',
              textAlign: TextAlign.center,
              style: typography.bodyMedium.copyWith(
                color: colors.text4,
                fontSize: 13.5,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.primary,
                foregroundColor: Colors.white,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
                elevation: 4,
              ),
              onPressed: () {
                CreateFestivalBottomSheet.show(context);
              },
              icon: const Icon(Icons.add_rounded, size: 20),
              label: const Text(
                'Create First Festival',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFestivalsFilledView(
    BuildContext context,
    List<Festival> festivals,
  ) {
    final colors = context.appColors;
    final typography = context.appTypography;
    final now = DateTime.now();

    final liveFestivals = festivals.where((f) => _isLive(f, now)).toList();
    final upcomingFestivals =
        festivals.where((f) => _isUpcoming(f, now)).toList();
    final completedFestivals =
        festivals.where((f) => _isCompleted(f, now)).toList();

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Live Section
          if (liveFestivals.isNotEmpty) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Active Festival',
                  style: typography.titleLarge.copyWith(
                    fontWeight: FontWeight.w700,
                    color: colors.textPrimary,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...liveFestivals.map(
              (festival) => _buildLiveCard(context, festival),
            ),
            const SizedBox(height: 24),
          ],

          // Upcoming Section
          if (upcomingFestivals.isNotEmpty) ...[
            Text(
              'Upcoming Festivals',
              style: typography.titleLarge.copyWith(
                fontWeight: FontWeight.w700,
                color: colors.textPrimary,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 12),
            ...upcomingFestivals.map(
              (festival) => _buildUpcomingCard(context, festival),
            ),
            const SizedBox(height: 24),
          ],

          // Completed Section
          if (completedFestivals.isNotEmpty) ...[
            Text(
              'Completed Festivals',
              style: typography.titleLarge.copyWith(
                fontWeight: FontWeight.w700,
                color: colors.textPrimary,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 12),
            ...completedFestivals.map(
              (festival) => _buildCompletedRow(context, festival),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildLiveCard(BuildContext context, Festival festival) {
    final colors = context.appColors;
    final typography = context.appTypography;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: context.appGradients.primary,
        boxShadow: [
          BoxShadow(
            color: colors.primary.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.22),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(radius: 3, backgroundColor: Colors.white),
                    SizedBox(width: 6),
                    Text(
                      'Live now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: Colors.white,
                size: 22,
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            festival.name,
            style: typography.headlineMedium.copyWith(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${festival.startDate.day} Sep – ${festival.endDate.day} Sep',
            style: typography.bodyMedium.copyWith(
              color: Colors.white.withValues(alpha: 0.88),
              fontSize: 13.5,
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '₹2.4L',
                    style: typography.titleLarge.copyWith(
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    'COLLECTED',
                    style: typography.labelSmall.copyWith(
                      color: Colors.white.withValues(alpha: 0.8),
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.8,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 28),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '18',
                    style: typography.titleLarge.copyWith(
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    'VOLUNTEERS',
                    style: typography.labelSmall.copyWith(
                      color: Colors.white.withValues(alpha: 0.8),
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.8,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingCard(BuildContext context, Festival festival) {
    final colors = context.appColors;
    final typography = context.appTypography;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.card,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colors.border),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                festival.name,
                style: typography.titleMedium.copyWith(
                  fontWeight: FontWeight.w700,
                  color: colors.textPrimary,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '${festival.startDate.day} Oct – ${festival.endDate.day} Oct',
                style: typography.caption.copyWith(
                  color: colors.text4,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFF59E0B).withValues(alpha: .2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              'Upcoming',
              style: TextStyle(
                color: Color(0xFFF59E0B),
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompletedRow(BuildContext context, Festival festival) {
    final colors = context.appColors;
    final typography = context.appTypography;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: colors.border)),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors.surfaceLight,
            ),
            child: Icon(Icons.check_rounded, color: colors.text4, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  festival.name,
                  style: typography.titleMedium.copyWith(
                    fontWeight: FontWeight.w700,
                    color: colors.textPrimary,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '₹1.9L collected',
                  style: typography.caption.copyWith(
                    color: colors.text4,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: colors.surfaceLight,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              'Completed',
              style: TextStyle(
                color: colors.textPrimary,
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
