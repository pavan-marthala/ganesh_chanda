import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ganesh_chanda/core/theme/app_theme.dart';
import 'package:ganesh_chanda/core/utils/app_utils.dart';
import 'package:ganesh_chanda/core/utils/sized_context.dart';
import 'package:ganesh_chanda/core/utils/state_status.dart';
import 'package:ganesh_chanda/features/donation/domain/enums/donation_status.dart';
import 'package:ganesh_chanda/features/donation/domain/enums/payment_mode.dart';
import 'package:ganesh_chanda/features/donation/domain/models/donation.dart';
import 'package:ganesh_chanda/features/donation/presentation/bloc/donation_bloc.dart';
import 'package:ganesh_chanda/features/donation/presentation/widgets/add_donation_bottom_sheet.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({super.key});

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  String _getInitials(String name) {
    if (name.trim().isEmpty) return 'D';
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return parts[0][0].toUpperCase();
  }

  String _getPaymentModeLabel(PaymentMode mode) {
    switch (mode) {
      case PaymentMode.cash:
        return 'Cash';
      case PaymentMode.upi:
        return 'UPI';
      case PaymentMode.bankTransfer:
        return 'Bank Transfer';
      case PaymentMode.cheque:
        return 'Cheque';
    }
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
          'Donations',
          style: typography.headlineSmall.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 22,
            color: colors.textPrimary,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
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
                  Icons.chat_bubble_outline_rounded,
                  color: colors.textPrimary,
                  size: 20,
                ),
                onPressed: () {},
              ),
            ),
          ),
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
                  AddDonationBottomSheet.show(context);
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
        child: BlocBuilder<DonationBloc, DonationState>(
          builder: (context, donationState) {
            final isLoading =
                donationState.donationsStatus == StateStatus.loading ||
                donationState.donationsStatus == StateStatus.initial;
            final donations = donationState.donations;

            if (isLoading) {
              return Skeletonizer(
                enabled: true,
                child: _buildDonationsContent(context, _getMockDonations()),
              );
            }

            if (donations.isEmpty ||
                donationState.donationsStatus == StateStatus.empty) {
              return _buildEmptyStateView(context);
            }

            if (donationState.donationsStatus == StateStatus.error) {
              return Center(
                child: Text(
                  donationState.donationsError ?? 'Something went wrong',
                ),
              );
            }

            return _buildDonationsContent(context, donations);
          },
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
                  Icons.monetization_on_outlined,
                  size: 44,
                  color: colors.primary.withValues(alpha: 0.65),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'No donations yet',
              style: typography.titleLarge.copyWith(
                fontWeight: FontWeight.w700,
                color: colors.textPrimary,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'When volunteers collect donations for this festival, they will appear here.',
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
                AddDonationBottomSheet.show(context);
              },
              icon: const Icon(Icons.add_rounded, size: 20),
              label: const Text(
                'Record First Donation',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDonationsContent(
    BuildContext context,
    List<Donation> donations,
  ) {
    final colors = context.appColors;
    final typography = context.appTypography;

    final filteredDonations = donations.where((d) {
      if (_searchQuery.isEmpty) return true;
      final nameMatch = d.donorName.toLowerCase().contains(
        _searchQuery.toLowerCase(),
      );
      final phoneMatch = d.donorPhone.contains(_searchQuery);
      return nameMatch || phoneMatch;
    }).toList();

    final totalCount = donations.length;
    final totalAmount = donations.fold<double>(
      0.0,
      (sum, d) => sum + (d.status == DonationStatus.received ? d.amount : 0.0),
    );
    final avgAmount = totalCount > 0 ? totalAmount / totalCount : 0.0;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Bar
          Container(
            decoration: BoxDecoration(
              color: colors.surfaceLight,
              borderRadius: BorderRadius.circular(99),
              border: Border.all(color: colors.border),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              children: [
                Icon(Icons.search_rounded, size: 20, color: colors.text4),
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
                      hintText: 'Search donor name or phone',
                      hintStyle: typography.bodyMedium.copyWith(
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

          Row(
            children: [
              Expanded(
                child: _buildSummaryMini(
                  context,
                  label: 'Donors',
                  value: '$totalCount',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildSummaryMini(
                  context,
                  label: 'Total Raised',
                  value: formatAmount(totalAmount),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildSummaryMini(
                  context,
                  label: 'Avg. / Donor',
                  value: formatAmount(avgAmount),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Section Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'All Donors',
                style: typography.titleLarge.copyWith(
                  fontWeight: FontWeight.w700,
                  color: colors.textPrimary,
                  fontSize: 18,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Donation List Rows
          Column(
            children: filteredDonations.map((donation) {
              return _buildDonorCard(context, donation);
            }).toList(),
          ),
          SizedBox(height: context.viewInsets.bottom + 100),
        ],
      ),
    );
  }

  Widget _buildSummaryMini(
    BuildContext context, {
    required String label,
    required String value,
  }) {
    final colors = context.appColors;
    final typography = context.appTypography;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: colors.surfaceLight,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: colors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: typography.caption.copyWith(
              color: colors.text4,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: typography.titleLarge.copyWith(
              fontWeight: FontWeight.w700,
              color: colors.textPrimary,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDonorCard(BuildContext context, Donation donation) {
    final colors = context.appColors;
    final typography = context.appTypography;
    final initials = _getInitials(donation.donorName);
    final isCancelled = donation.status == DonationStatus.cancelled;
    final isCash = donation.paymentMode == PaymentMode.cash;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
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
      child: Row(
        children: [
          // Avatar
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: isCash
                  ? context.appGradients.secondary
                  : context.appGradients.primary,
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

          // Donor Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  donation.donorName,
                  style: typography.titleMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colors.textPrimary,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  donation.donorPhone.isNotEmpty
                      ? donation.donorPhone
                      : 'No phone number',
                  style: typography.caption.copyWith(
                    color: colors.text4,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          // Amount & Payment Mode Badge
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                formatAmount(donation.amount),
                style: typography.titleMedium.copyWith(
                  fontWeight: FontWeight.w700,
                  color: isCancelled ? colors.warning : colors.success,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: isCancelled
                      ? colors.warning.withValues(alpha: 0.15)
                      : isCash
                      ? const Color(0xFFD4AF37).withValues(alpha: 0.18)
                      : colors.success.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Text(
                  isCancelled
                      ? 'Canceled'
                      : _getPaymentModeLabel(donation.paymentMode),
                  style: TextStyle(
                    color: isCancelled
                        ? colors.warning
                        : isCash
                        ? const Color(0xFF9A7B1E)
                        : colors.success,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Donation> _getMockDonations() {
    final now = DateTime.now();
    return [
      Donation(
        id: 'm1',
        festivalId: 'f1',
        communityId: 'c1',
        donorName: 'Suresh Kulkarni',
        donorPhone: '+91 98221 34567',
        amount: 2100,
        paymentMode: PaymentMode.upi,
        collectedBy: 'u1',
        createdAt: now,
        updatedAt: now,
      ),
      Donation(
        id: 'm2',
        festivalId: 'f1',
        communityId: 'c1',
        donorName: 'Meera Joshi',
        donorPhone: '+91 90210 98765',
        amount: 1100,
        paymentMode: PaymentMode.cash,
        collectedBy: 'u1',
        createdAt: now,
        updatedAt: now,
      ),
      Donation(
        id: 'm3',
        festivalId: 'f1',
        communityId: 'c1',
        donorName: 'Anil Pawar',
        donorPhone: '+91 88888 22110',
        amount: 0,
        paymentMode: PaymentMode.cash,
        status: DonationStatus.cancelled,
        collectedBy: 'u1',
        createdAt: now,
        updatedAt: now,
      ),
    ];
  }
}
