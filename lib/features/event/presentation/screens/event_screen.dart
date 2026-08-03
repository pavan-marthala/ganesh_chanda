import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ganesh_chanda/core/theme/app_theme.dart';
import 'package:ganesh_chanda/core/utils/sized_context.dart';
import 'package:ganesh_chanda/core/utils/state_status.dart';
import 'package:ganesh_chanda/features/event/domain/enums/event_status.dart';
import 'package:ganesh_chanda/features/event/domain/models/event.dart';
import 'package:ganesh_chanda/features/event/presentation/bloc/event_bloc.dart';
import 'package:ganesh_chanda/features/event/presentation/widgets/add_event_bottom_sheet.dart';
import 'package:ganesh_chanda/features/festival/presentation/bloc/festival_bloc.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  DateTime? _selectedDate;

  void _loadEvents() {
    final festival = context.read<FestivalBloc>().state.festival;
    if (festival != null && festival.id.isNotEmpty) {
      context.read<EventBloc>().add(
        EventEvent.loadEventsByFestivalRequested(festivalId: festival.id),
      );
    }
  }

  DateTime _normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  List<DateTime> _extractUniqueSortedDates(List<Event> events) {
    final datesSet = <DateTime>{};
    for (final event in events) {
      datesSet.add(_normalizeDate(event.date));
    }
    final sortedList = datesSet.toList()..sort();
    return sortedList;
  }

  void _updateDefaultSelectedDate(List<DateTime> availableDates) {
    if (availableDates.isEmpty) {
      _selectedDate = null;
      return;
    }

    if (_selectedDate != null &&
        availableDates.any((d) => d.isAtSameMomentAs(_selectedDate!))) {
      return;
    }

    final today = _normalizeDate(DateTime.now());

    // Case 1: Today exists in available dates
    if (availableDates.any((d) => d.isAtSameMomentAs(today))) {
      _selectedDate = today;
      return;
    }

    // Case 2: First upcoming date
    final upcomingDates = availableDates
        .where((d) => d.isAfter(today))
        .toList();
    if (upcomingDates.isNotEmpty) {
      _selectedDate = upcomingDates.first;
      return;
    }

    // Case 3: All events completed -> Latest available event date
    _selectedDate = availableDates.last;
  }

  String _formatHeaderDate(DateTime date) {
    return DateFormat('EEEE, d MMMM').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        backgroundColor: colors.surfaceLight,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Events',
          style: typography.headlineSmall.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 22,
            color: colors.textPrimary,
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
                  Icons.add_rounded,
                  color: colors.textPrimary,
                  size: 20,
                ),
                onPressed: () {
                  AddEventBottomSheet.show(context);
                },
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: colors.border, height: 1),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<EventBloc, EventState>(
          builder: (context, eventState) {
            final isLoading =
                eventState.eventsStatus == StateStatus.loading ||
                eventState.eventsStatus == StateStatus.initial;
            final isError = eventState.eventsStatus == StateStatus.error;
            final events = eventState.events;

            if (isError) {
              print(eventState.eventsError);
              return _buildErrorStateView(
                context,
                eventState.eventsError ?? 'Failed to load events',
              );
            }

            if (isLoading) {
              return Skeletonizer(
                enabled: true,
                child: _buildEventsTimelineContent(context, _getMockEvents()),
              );
            }

            if (events.isEmpty ||
                eventState.eventsStatus == StateStatus.empty) {
              return _buildEmptyStateView(context);
            }

            return _buildEventsTimelineContent(context, events);
          },
        ),
      ),
    );
  }

  Widget _buildErrorStateView(BuildContext context, String errorMessage) {
    final colors = context.appColors;
    final typography = context.appTypography;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors.error.withValues(alpha: 0.12),
              ),
              child: Center(
                child: Icon(
                  Icons.error_outline_rounded,
                  size: 40,
                  color: colors.error,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Oops! Something went wrong',
              style: typography.titleLarge.copyWith(
                fontWeight: FontWeight.w700,
                color: colors.textPrimary,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              errorMessage,
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
              onPressed: _loadEvents,
              icon: const Icon(Icons.refresh_rounded, size: 20),
              label: const Text(
                'Try Again',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
              ),
            ),
          ],
        ),
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
                border: Border.all(color: colors.border, width: 1.5),
              ),
              child: Center(
                child: Icon(
                  Icons.event_note_outlined,
                  size: 44,
                  color: colors.primary.withValues(alpha: 0.65),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'No Events Scheduled',
              style: typography.titleLarge.copyWith(
                fontWeight: FontWeight.w700,
                color: colors.textPrimary,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Events and programs scheduled for this festival will appear here.',
              textAlign: TextAlign.center,
              style: typography.bodyMedium.copyWith(
                color: colors.text4,
                fontSize: 13.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventsTimelineContent(BuildContext context, List<Event> events) {
    final colors = context.appColors;
    final typography = context.appTypography;

    final sortedDates = _extractUniqueSortedDates(events);
    _updateDefaultSelectedDate(sortedDates);

    final selectedDateEvents = events.where((e) {
      if (_selectedDate == null) return true;
      return _normalizeDate(e.date).isAtSameMomentAs(_selectedDate!);
    }).toList();

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: sortedDates.asMap().entries.map((entry) {
                final index = entry.key;
                final date = entry.value;
                final isSelected =
                    _selectedDate != null &&
                    date.isAtSameMomentAs(_selectedDate!);

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedDate = date;
                    });
                  },
                  child: Container(
                    width: 64,
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      gradient: isSelected
                          ? context.appGradients.primary
                          : null,
                      color: isSelected ? null : colors.surfaceLight,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isSelected ? Colors.transparent : colors.border,
                        width: 1.5,
                      ),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: colors.primary.withValues(alpha: 0.25),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ]
                          : null,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Day ${index + 1}',
                          style: typography.caption.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 10,
                            color: isSelected
                                ? Colors.white.withValues(alpha: 0.85)
                                : colors.text4,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          DateFormat('dd').format(date),
                          style: typography.titleMedium.copyWith(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            color: isSelected
                                ? Colors.white
                                : colors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 22),

          if (_selectedDate != null)
            Text(
              _formatHeaderDate(_selectedDate!),
              style: typography.titleLarge.copyWith(
                fontWeight: FontWeight.w700,
                color: colors.textPrimary,
                fontSize: 18,
              ),
            ),

          const SizedBox(height: 16),

          if (selectedDateEvents.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 36),
              child: Center(
                child: Text(
                  'No events scheduled for this date.',
                  style: typography.bodyMedium.copyWith(
                    color: colors.text4,
                    fontSize: 14,
                  ),
                ),
              ),
            )
          else
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: selectedDateEvents.length,
              padding: .only(bottom: context.viewInsets.bottom + 100),
              itemBuilder: (context, index) {
                final event = selectedDateEvents[index];
                final isLast = index == selectedDateEvents.length - 1;
                return _buildTimelineItem(context, event, isLast);
              },
            ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(BuildContext context, Event event, bool isLast) {
    final colors = context.appColors;
    final typography = context.appTypography;
    final isDone = event.status == EventStatus.completed;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          Column(
            children: [
              Container(
                width: 16,
                height: 16,
                margin: const EdgeInsets.only(top: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDone ? colors.primary : colors.card,
                  border: Border.all(color: colors.primary, width: 3),
                ),
              ),
              if (!isLast)
                Expanded(child: Container(width: 2, color: colors.border)),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: colors.card,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: colors.border),
                  boxShadow: [
                    BoxShadow(
                      color: colors.black.withValues(
                        alpha: context.isDark ? 0.2 : 0.04,
                      ),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            event.name,
                            style: typography.titleMedium.copyWith(
                              fontWeight: FontWeight.w600,
                              color: colors.textPrimary,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        _buildStatusBadge(context, event.status),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${event.startTime} – ${event.endTime} · ${event.location}',
                      style: typography.caption.copyWith(
                        color: colors.text4,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(BuildContext context, EventStatus status) {
    final colors = context.appColors;
    final typography = context.appTypography;

    switch (status) {
      case EventStatus.completed:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: colors.success.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(99),
          ),
          child: Text(
            'Done',
            style: typography.labelSmall.copyWith(
              fontWeight: FontWeight.w700,
              color: colors.success,
              fontSize: 11,
            ),
          ),
        );
      case EventStatus.live:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: colors.primary.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(99),
          ),
          child: Text(
            'Live',
            style: typography.labelSmall.copyWith(
              fontWeight: FontWeight.w700,
              color: colors.primary,
              fontSize: 11,
            ),
          ),
        );
      case EventStatus.upcoming:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: colors.warning.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(99),
          ),
          child: Text(
            'Upcoming',
            style: typography.labelSmall.copyWith(
              fontWeight: FontWeight.w700,
              color: colors.warning,
              fontSize: 11,
            ),
          ),
        );
      case EventStatus.cancelled:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: colors.error.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(99),
          ),
          child: Text(
            'Cancelled',
            style: typography.labelSmall.copyWith(
              fontWeight: FontWeight.w700,
              color: colors.error,
              fontSize: 11,
            ),
          ),
        );
    }
  }

  List<Event> _getMockEvents() {
    final now = DateTime.now();
    final today = _normalizeDate(now);

    return [
      Event(
        id: 'ev1',
        festivalId: 'f1',
        communityId: 'c1',
        name: 'Morning Puja',
        description: 'Morning prayer ceremony',
        date: today,
        startTime: '6:00 AM',
        endTime: '7:00 AM',
        location: 'Main Mandap',
        status: EventStatus.completed,
        createdBy: 'u1',
        createdAt: now,
        updatedAt: now,
      ),
      Event(
        id: 'ev2',
        festivalId: 'f1',
        communityId: 'c1',
        name: 'Morning Aarti',
        description: 'Morning aarti worship',
        date: today,
        startTime: '7:30 AM',
        endTime: '8:00 AM',
        location: 'Main Mandap',
        status: EventStatus.completed,
        createdBy: 'u1',
        createdAt: now,
        updatedAt: now,
      ),
      Event(
        id: 'ev3',
        festivalId: 'f1',
        communityId: 'c1',
        name: 'Bhajan Sandhya',
        description: 'Devotional bhajan music evening',
        date: today,
        startTime: '7:00 PM',
        endTime: '8:30 PM',
        location: 'Community Hall',
        status: EventStatus.upcoming,
        createdBy: 'u1',
        createdAt: now,
        updatedAt: now,
      ),
      Event(
        id: 'ev4',
        festivalId: 'f1',
        communityId: 'c1',
        name: 'Cultural Program — Kids Dance',
        description: 'Dance performance by children',
        date: today,
        startTime: '9:00 PM',
        endTime: '10:30 PM',
        location: 'Open Ground',
        status: EventStatus.upcoming,
        createdBy: 'u1',
        createdAt: now,
        updatedAt: now,
      ),
      Event(
        id: 'ev5',
        festivalId: 'f1',
        communityId: 'c1',
        name: 'Evening Aarti',
        description: 'Night closing aarti',
        date: today,
        startTime: '10:30 PM',
        endTime: '11:00 PM',
        location: 'Main Mandap',
        status: EventStatus.upcoming,
        createdBy: 'u1',
        createdAt: now,
        updatedAt: now,
      ),
    ];
  }
}
