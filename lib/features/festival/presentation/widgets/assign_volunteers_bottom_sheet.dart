import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ganesh_chanda/core/theme/app_theme.dart';
import 'package:ganesh_chanda/core/utils/app_toast.dart';
import 'package:ganesh_chanda/core/utils/state_status.dart';
import 'package:ganesh_chanda/features/auth/domain/models/app_user.dart';
import 'package:ganesh_chanda/features/community/presentation/bloc/community_bloc.dart';
import 'package:ganesh_chanda/features/festival/domain/models/festival.dart';
import 'package:ganesh_chanda/features/festival/presentation/bloc/festival_bloc.dart';
import 'package:ganesh_chanda/features/volunteer/presentation/bloc/volunteer_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AssignVolunteersBottomSheet extends StatefulWidget {
  final Festival festival;

  const AssignVolunteersBottomSheet({super.key, required this.festival});

  static Future<void> show(BuildContext context, Festival festival) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) =>
          AssignVolunteersBottomSheet(festival: festival),
    );
  }

  @override
  State<AssignVolunteersBottomSheet> createState() =>
      _AssignVolunteersBottomSheetState();
}

class _AssignVolunteersBottomSheetState
    extends State<AssignVolunteersBottomSheet> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  String? _prevActionError;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  String _getInitials(String name) {
    if (name.trim().isEmpty) return 'V';
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return parts[0][0].toUpperCase();
  }

  void _onAssignVolunteer(BuildContext context, AppUser volunteer) {
    final communityId = widget.festival.communityId;
    context.read<FestivalBloc>().add(
      FestivalEvent.assignVolunteerRequested(
        festivalId: widget.festival.id,
        volunteerId: volunteer.id,
        communityId: communityId,
      ),
    );
  }

  void _onRemoveVolunteer(BuildContext context, AppUser volunteer) {
    final communityId = widget.festival.communityId;
    context.read<FestivalBloc>().add(
      FestivalEvent.removeVolunteerRequested(
        festivalId: widget.festival.id,
        volunteerId: volunteer.id,
        communityId: communityId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;

    return BlocConsumer<FestivalBloc, FestivalState>(
      listener: (context, festivalState) {
        if (festivalState.festivalActionStatus == StateStatus.error &&
            festivalState.festivalActionError != null &&
            festivalState.festivalActionError != _prevActionError) {
          HapticFeedback.mediumImpact();
          showErrorToast(message: festivalState.festivalActionError!);
        }

        _prevActionError = festivalState.festivalActionError;
      },
      builder: (context, festivalState) {
        final currentFestival = festivalState.festival ?? widget.festival;
        final assignedIds = currentFestival.assignedVolunteerIds;
        final isActionLoading =
            festivalState.festivalActionStatus == StateStatus.loading;

        return Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: colors.background,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            children: [
              // Top Bar Solid
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: colors.surfaceLight,
                  border: Border(bottom: BorderSide(color: colors.border)),
                ),
                child: Row(
                  children: [
                    Container(
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
                          Icons.arrow_back_rounded,
                          color: colors.textPrimary,
                          size: 20,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Text(
                      'Assign Volunteers',
                      style: typography.headlineSmall.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: colors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),

              // Content Body
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Volunteers belong to your community — once added, you can assign them to any festival.',
                        style: typography.bodyMedium.copyWith(
                          color: colors.text4,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // VolunteerBloc Consumer / Builder
                      BlocBuilder<VolunteerBloc, VolunteerState>(
                        builder: (context, volunteerState) {
                          final isVolunteersLoading =
                              volunteerState.volunteersStatus ==
                                  StateStatus.loading ||
                              volunteerState.volunteersStatus ==
                                  StateStatus.initial;
                          final allVolunteers = volunteerState.volunteers;

                          final filteredVolunteers = allVolunteers.where((v) {
                            if (_searchQuery.isEmpty) return true;
                            final nameMatch = v.displayName
                                .toLowerCase()
                                .contains(_searchQuery.toLowerCase());
                            final emailMatch = v.email.toLowerCase().contains(
                              _searchQuery.toLowerCase(),
                            );
                            return nameMatch || emailMatch;
                          }).toList();

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Section Header
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Community Members',
                                    style: typography.titleLarge.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: colors.textPrimary,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    '${allVolunteers.length} total',
                                    style: typography.titleSmall.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: colors.primary,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),

                              // Search Bar
                              Container(
                                decoration: BoxDecoration(
                                  color: colors.surfaceLight,
                                  borderRadius: BorderRadius.circular(99),
                                  border: Border.all(color: colors.border),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 4,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.search_rounded,
                                      size: 20,
                                      color: colors.text4,
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: TextField(
                                        controller: _searchController,
                                        onChanged: (val) {
                                          setState(() {
                                            _searchQuery = val.trim();
                                          });
                                        },
                                        style: typography.bodyMedium.copyWith(
                                          color: colors.textPrimary,
                                          fontSize: 14,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: 'Search members',
                                          hintStyle: typography.bodyMedium
                                              .copyWith(
                                                color: colors.text4,
                                                fontSize: 14,
                                              ),
                                          border: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          filled: false,
                                          contentPadding: EdgeInsets.zero,
                                        ),
                                      ),
                                    ),
                                    if (_searchQuery.isNotEmpty)
                                      GestureDetector(
                                        onTap: () {
                                          _searchController.clear();
                                          setState(() {
                                            _searchQuery = '';
                                          });
                                        },
                                        child: Icon(
                                          Icons.close_rounded,
                                          size: 18,
                                          color: colors.text4,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),

                              // Volunteers List / Loading
                              if (isVolunteersLoading)
                                Skeletonizer(
                                  enabled: true,
                                  child: Column(
                                    children: List.generate(4, (index) {
                                      return _buildDummyVolunteerRow(context);
                                    }),
                                  ),
                                )
                              else if (filteredVolunteers.isEmpty)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 40,
                                  ),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.people_outline_rounded,
                                          size: 44,
                                          color: colors.text4,
                                        ),
                                        const SizedBox(height: 12),
                                        Text(
                                          _searchQuery.isEmpty
                                              ? 'No community members found.'
                                              : 'No matching members found.',
                                          style: typography.bodyMedium.copyWith(
                                            color: colors.text4,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              else
                                Column(
                                  children: filteredVolunteers.map((volunteer) {
                                    final isAssigned = assignedIds.contains(
                                      volunteer.id,
                                    );
                                    final initials = _getInitials(
                                      volunteer.displayName,
                                    );

                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 14,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: colors.border,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          // Avatar Circle
                                          Container(
                                            width: 44,
                                            height: 44,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              gradient: isAssigned
                                                  ? context
                                                        .appGradients
                                                        .secondary
                                                  : context
                                                        .appGradients
                                                        .primary,
                                            ),
                                            child: Center(
                                              child: Text(
                                                initials,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 14),

                                          // Name & Email
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  volunteer.displayName,
                                                  style: typography.titleMedium
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            colors.textPrimary,
                                                        fontSize: 15,
                                                      ),
                                                ),
                                                const SizedBox(height: 2),
                                                Text(
                                                  volunteer.email,
                                                  style: typography.caption
                                                      .copyWith(
                                                        color: colors.text4,
                                                        fontSize: 12,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          // Action Badge or Add/Remove Button
                                          if (isAssigned)
                                            GestureDetector(
                                              onTap: isActionLoading
                                                  ? null
                                                  : () => _onRemoveVolunteer(
                                                      context,
                                                      volunteer,
                                                    ),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 6,
                                                    ),
                                                decoration: BoxDecoration(
                                                  color: colors.success
                                                      .withValues(alpha: 0.15),
                                                  borderRadius:
                                                      BorderRadius.circular(99),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      Icons.check_rounded,
                                                      size: 14,
                                                      color: colors.success,
                                                    ),
                                                    const SizedBox(width: 4),
                                                    Text(
                                                      'Assigned',
                                                      style: TextStyle(
                                                        color: colors.success,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          else
                                            OutlinedButton(
                                              style: OutlinedButton.styleFrom(
                                                foregroundColor: colors.primary,
                                                side: BorderSide(
                                                  color: colors.primary,
                                                  width: 1.5,
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 18,
                                                      vertical: 8,
                                                    ),
                                                minimumSize: const Size(0, 36),
                                                shape: const StadiumBorder(),
                                              ),
                                              onPressed: isActionLoading
                                                  ? null
                                                  : () => _onAssignVolunteer(
                                                      context,
                                                      volunteer,
                                                    ),
                                              child: Text(
                                                'Add',
                                                style: typography.labelLarge
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: colors.primary,
                                                      fontSize: 13,
                                                    ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDummyVolunteerRow(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: colors.border)),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sanjay Patil',
                  style: typography.titleMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text('patil@gmail.com', style: typography.caption),
              ],
            ),
          ),
          OutlinedButton(onPressed: null, child: const Text('Add')),
        ],
      ),
    );
  }
}
