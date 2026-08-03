import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ganesh_chanda/core/theme/app_theme.dart';
import 'package:ganesh_chanda/core/utils/app_text_field.dart';
import 'package:ganesh_chanda/core/utils/app_toast.dart';
import 'package:ganesh_chanda/core/utils/state_status.dart';
import 'package:ganesh_chanda/features/auth/domain/models/app_user.dart';
import 'package:ganesh_chanda/features/community/presentation/bloc/community_bloc.dart';
import 'package:ganesh_chanda/features/event/domain/enums/event_status.dart';
import 'package:ganesh_chanda/features/event/domain/models/event.dart';
import 'package:ganesh_chanda/features/event/presentation/bloc/event_bloc.dart';
import 'package:ganesh_chanda/features/festival/presentation/bloc/festival_bloc.dart';
import 'package:ganesh_chanda/features/volunteer/presentation/bloc/volunteer_bloc.dart';
import 'package:intl/intl.dart';

class AddEventBottomSheet extends StatefulWidget {
  const AddEventBottomSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      useRootNavigator: true,
      builder: (sheetContext) => const AddEventBottomSheet(),
    );
  }

  @override
  State<AddEventBottomSheet> createState() => _AddEventBottomSheetState();
}

class _AddEventBottomSheetState extends State<AddEventBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  DateTime? _selectedDate;
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;

  final List<String> _assignedVolunteerIds = [];

  StateStatus _prevActionStatus = StateStatus.initial;
  String? _prevActionError;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  String _formatDate(DateTime date) {
    return DateFormat('d MMM yyyy').format(date);
  }

  String _formatTimeOfDay(TimeOfDay tod) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    return DateFormat('h:mm a').format(dt);
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now().subtract(const Duration(days: 30)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _pickStartTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _startTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _startTime = picked;
      });
    }
  }

  Future<void> _pickEndTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _endTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _endTime = picked;
      });
    }
  }

  bool _isEndTimeValid() {
    if (_startTime == null || _endTime == null) return false;
    final startMinutes = _startTime!.hour * 60 + _startTime!.minute;
    final endMinutes = _endTime!.hour * 60 + _endTime!.minute;
    return endMinutes > startMinutes;
  }

  void _onSaveEvent(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedDate == null) {
      showErrorToast(message: 'Please select date');
      return;
    }

    if (!_isEndTimeValid()) {
      showErrorToast(message: 'End Time must be later than Start Time');
      return;
    }

    final festival = context.read<FestivalBloc>().state.festival;
    final community = context.read<CommunityBloc>().state.community;

    final festivalId = festival?.id ?? '';
    final communityId = community?.id ?? festival?.communityId ?? '';

    if (festivalId.isEmpty) {
      showErrorToast(message: 'No active festival selected.');
      return;
    }

    final event = Event(
      id: '',
      festivalId: festivalId,
      communityId: communityId,
      name: _titleController.text.trim(),
      description: _descriptionController.text.trim(),
      bannerUrl: null,
      date: _selectedDate!,
      startTime: _formatTimeOfDay(_startTime!),
      endTime: _formatTimeOfDay(_endTime!),
      location: _locationController.text.trim(),
      assignedVolunteerIds: _assignedVolunteerIds,
      status: EventStatus.upcoming,
      createdBy: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    context.read<EventBloc>().add(
      EventEvent.createEventRequested(event: event),
    );
  }

  void _toggleVolunteerAssignment(String volunteerId) {
    setState(() {
      if (_assignedVolunteerIds.contains(volunteerId)) {
        _assignedVolunteerIds.remove(volunteerId);
      } else {
        _assignedVolunteerIds.add(volunteerId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return BlocConsumer<EventBloc, EventState>(
      listener: (context, eventState) {
        if (eventState.eventActionStatus == StateStatus.loaded &&
            _prevActionStatus == StateStatus.loading) {
          HapticFeedback.lightImpact();
          showSuccessToast(message: 'Event Scheduled Successfully!');
          Navigator.of(context).pop();
        } else if (eventState.eventActionStatus == StateStatus.error &&
            eventState.eventActionError != null &&
            eventState.eventActionError != _prevActionError) {
          HapticFeedback.mediumImpact();
          showErrorToast(message: eventState.eventActionError!);
        }

        _prevActionStatus = eventState.eventActionStatus;
        _prevActionError = eventState.eventActionError;
      },
      builder: (context, eventState) {
        final isLoading = eventState.eventActionStatus == StateStatus.loading;

        return Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.9,
          ),
          decoration: BoxDecoration(
            color: colors.background,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handlebar
              const SizedBox(height: 12),
              Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: colors.border,
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
              const SizedBox(height: 12),

              // Header
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
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
                      'Add Event',
                      style: typography.headlineSmall.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: colors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),

              // Form Content
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20 + bottomInset),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Event Title
                        AppTextField(
                          controller: _titleController,
                          labelText: 'Event Title',
                          hintText: 'e.g. Bhajan Sandhya',
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter event title';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Description
                        AppTextField(
                          controller: _descriptionController,
                          labelText: 'Description',
                          hintText: 'Describe the event...',
                          validator: (_) => null,
                        ),
                        const SizedBox(height: 16),

                        // Date Picker Field
                        GestureDetector(
                          onTap: _pickDate,
                          child: AbsorbPointer(
                            child: AppTextField(
                              controller: TextEditingController(
                                text: _selectedDate == null
                                    ? "mm/dd/yyyy"
                                    : _formatDate(_selectedDate!),
                              ),
                              labelText: 'Date',
                              prefixIcon: Icon(
                                Icons.calendar_today_rounded,
                                color: colors.text4,
                                size: 18,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select date';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: _pickStartTime,
                                child: AbsorbPointer(
                                  child: AppTextField(
                                    controller: TextEditingController(
                                      text: _startTime == null
                                          ? "HH : MM"
                                          : _formatTimeOfDay(_startTime!),
                                    ),
                                    labelText: 'Start Time',
                                    prefixIcon: Icon(
                                      Icons.access_time_rounded,
                                      color: colors.text4,
                                      size: 18,
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Select start time';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: GestureDetector(
                                onTap: _pickEndTime,
                                child: AbsorbPointer(
                                  child: AppTextField(
                                    controller: TextEditingController(
                                      text: _endTime == null
                                          ? "HH : MM"
                                          : _formatTimeOfDay(_endTime!),
                                    ),
                                    labelText: 'End Time',
                                    prefixIcon: Icon(
                                      Icons.access_time_rounded,
                                      color: colors.text4,
                                      size: 18,
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Select end time';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Location
                        AppTextField(
                          controller: _locationController,
                          labelText: 'Location',
                          hintText: 'e.g. Main Mandap',
                          prefixIcon: Icon(
                            Icons.location_on_outlined,
                            color: colors.text4,
                            size: 20,
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter location';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Banner Image Upload Box Placeholder (HTML prototype)
                        Text(
                          'Banner Image',
                          style: typography.titleMedium.copyWith(
                            fontWeight: FontWeight.w700,
                            color: colors.textSecondary,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          decoration: BoxDecoration(
                            color: colors.surfaceLight,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: colors.border,
                              width: 1.5,
                            ),
                          ),
                          child: Column(
                            children: [
                              Icon(
                                Icons.file_upload_outlined,
                                size: 28,
                                color: colors.primary,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Upload event banner',
                                style: typography.titleSmall.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: colors.textPrimary,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Recommended 1200×600px',
                                style: typography.caption.copyWith(
                                  color: colors.text4,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        BlocBuilder<VolunteerBloc, VolunteerState>(
                          builder: (context, volunteerState) {
                            final volunteers = volunteerState.volunteers;
                            if (volunteers.isEmpty) {
                              return const SizedBox.shrink();
                            }

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Assign Volunteers',
                                  style: typography.titleMedium.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: colors.textSecondary,
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                ...volunteers.map((volunteer) {
                                  final isAssigned = _assignedVolunteerIds
                                      .contains(volunteer.id);
                                  return _buildVolunteerPickerRow(
                                    context: context,
                                    volunteer: volunteer,
                                    isAssigned: isAssigned,
                                    onTap: () => _toggleVolunteerAssignment(
                                      volunteer.id,
                                    ),
                                  );
                                }),
                                const SizedBox(height: 16),
                              ],
                            );
                          },
                        ),

                        // Save Event Action Button
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  minimumSize: const Size(0, 52),
                                  shape: const StadiumBorder(),
                                  side: BorderSide(color: colors.border),
                                ),
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text(
                                  'Cancel',
                                  style: typography.titleMedium.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: colors.textPrimary,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: colors.primary,
                                  foregroundColor: Colors.white,
                                  minimumSize: const Size(0, 52),
                                  shape: const StadiumBorder(),
                                  elevation: 4,
                                ),
                                onPressed: isLoading
                                    ? null
                                    : () => _onSaveEvent(context),
                                child: isLoading
                                    ? const SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2.5,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                Colors.white,
                                              ),
                                        ),
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.check_rounded,
                                            size: 20,
                                          ),
                                          const SizedBox(width: 6),
                                          Text(
                                            'Save Event',
                                            style: typography.titleMedium
                                                .copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                ),
                                          ),
                                        ],
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildVolunteerPickerRow({
    required BuildContext context,
    required AppUser volunteer,
    required bool isAssigned,
    required VoidCallback onTap,
  }) {
    final colors = context.appColors;
    final typography = context.appTypography;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: isAssigned
            ? colors.primary.withValues(alpha: 0.05)
            : colors.surfaceLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isAssigned ? colors.primary : colors.border,
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: isAssigned
                  ? context.appGradients.secondary
                  : context.appGradients.primary,
            ),
            child: Center(
              child: Text(
                volunteer.displayName.isNotEmpty
                    ? volunteer.displayName[0].toUpperCase()
                    : 'V',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              volunteer.displayName,
              style: typography.titleSmall.copyWith(
                fontWeight: FontWeight.w600,
                color: colors.textPrimary,
                fontSize: 14,
              ),
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isAssigned
                    ? colors.success.withValues(alpha: 0.15)
                    : colors.surfaceLight,
                borderRadius: BorderRadius.circular(99),
                border: Border.all(
                  color: isAssigned ? colors.success : colors.border,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isAssigned ? Icons.check_rounded : Icons.add_rounded,
                    size: 14,
                    color: isAssigned ? colors.success : colors.textPrimary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    isAssigned ? 'Assigned' : 'Assign',
                    style: TextStyle(
                      color: isAssigned ? colors.success : colors.textPrimary,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
