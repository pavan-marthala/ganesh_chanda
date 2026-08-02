import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ganesh_chanda/core/utils/state_status.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/donation.dart';
import '../../domain/repository/donation_repository.dart';

part 'donation_event.dart';
part 'donation_state.dart';
part 'donation_bloc.freezed.dart';

@injectable
class DonationBloc extends Bloc<DonationEvent, DonationState> {
  final DonationRepository _donationRepository;

  DonationBloc(this._donationRepository) : super(const DonationState()) {
    on<DonationEvent>((event, emit) async {
      await event.map(
        loadDonationsByFestivalRequested: (e) async {
          emit(
            state.copyWith(
              donationsStatus: StateStatus.loading,
              donationsError: null,
            ),
          );
          try {
            final donations = await _donationRepository.getDonationsByFestival(
              e.festivalId,
            );
            emit(
              state.copyWith(
                donations: donations,
                donationsStatus: donations.isEmpty
                    ? StateStatus.empty
                    : StateStatus.loaded,
                donationsError: null,
              ),
            );
          } catch (error) {
            final errorMessage = error.toString().replaceFirst('Exception: ', '');
            emit(
              state.copyWith(
                donationsStatus: StateStatus.error,
                donationsError: errorMessage,
              ),
            );
          }
        },
        loadDonationsByCommunityRequested: (e) async {
          emit(
            state.copyWith(
              donationsStatus: StateStatus.loading,
              donationsError: null,
            ),
          );
          try {
            final donations =
                await _donationRepository.getDonationsByCommunity(
              e.communityId,
            );
            emit(
              state.copyWith(
                donations: donations,
                donationsStatus: donations.isEmpty
                    ? StateStatus.empty
                    : StateStatus.loaded,
                donationsError: null,
              ),
            );
          } catch (error) {
            final errorMessage = error.toString().replaceFirst('Exception: ', '');
            emit(
              state.copyWith(
                donationsStatus: StateStatus.error,
                donationsError: errorMessage,
              ),
            );
          }
        },
        getDonationByIdRequested: (e) async {
          emit(
            state.copyWith(
              donationDetailsStatus: StateStatus.loading,
              donationDetailsError: null,
            ),
          );
          try {
            final donation = await _donationRepository.getDonationById(
              e.donationId,
            );
            if (donation != null) {
              emit(
                state.copyWith(
                  selectedDonation: donation,
                  donationDetailsStatus: StateStatus.loaded,
                  donationDetailsError: null,
                ),
              );
            } else {
              emit(
                state.copyWith(
                  selectedDonation: null,
                  donationDetailsStatus: StateStatus.empty,
                  donationDetailsError: 'Donation not found.',
                ),
              );
            }
          } catch (error) {
            final errorMessage = error.toString().replaceFirst('Exception: ', '');
            emit(
              state.copyWith(
                donationDetailsStatus: StateStatus.error,
                donationDetailsError: errorMessage,
              ),
            );
          }
        },
        createDonationRequested: (e) async {
          emit(
            state.copyWith(
              donationActionStatus: StateStatus.loading,
              donationActionError: null,
            ),
          );
          try {
            final createdDonation = await _donationRepository.createDonation(
              e.donation,
            );
            final updatedList = [createdDonation, ...state.donations];
            emit(
              state.copyWith(
                donations: updatedList,
                selectedDonation: createdDonation,
                donationsStatus: StateStatus.loaded,
                donationActionStatus: StateStatus.loaded,
                donationActionError: null,
              ),
            );
            if (e.donation.festivalId.isNotEmpty) {
              add(
                DonationEvent.loadDonationsByFestivalRequested(
                  festivalId: e.donation.festivalId,
                ),
              );
            }
          } catch (error) {
            final errorMessage = error.toString().replaceFirst('Exception: ', '');
            emit(
              state.copyWith(
                donationActionStatus: StateStatus.error,
                donationActionError: errorMessage,
              ),
            );
          }
        },
        updateDonationRequested: (e) async {
          emit(
            state.copyWith(
              donationActionStatus: StateStatus.loading,
              donationActionError: null,
            ),
          );
          try {
            final updatedDonation = await _donationRepository.updateDonation(
              e.donation,
            );
            final updatedList = state.donations.map((d) {
              return d.id == updatedDonation.id ? updatedDonation : d;
            }).toList();
            emit(
              state.copyWith(
                donations: updatedList,
                selectedDonation: updatedDonation,
                donationActionStatus: StateStatus.loaded,
                donationActionError: null,
              ),
            );
            if (e.donation.festivalId.isNotEmpty) {
              add(
                DonationEvent.loadDonationsByFestivalRequested(
                  festivalId: e.donation.festivalId,
                ),
              );
            }
          } catch (error) {
            final errorMessage = error.toString().replaceFirst('Exception: ', '');
            emit(
              state.copyWith(
                donationActionStatus: StateStatus.error,
                donationActionError: errorMessage,
              ),
            );
          }
        },
        deleteDonationRequested: (e) async {
          emit(
            state.copyWith(
              donationActionStatus: StateStatus.loading,
              donationActionError: null,
            ),
          );
          try {
            await _donationRepository.deleteDonation(e.donationId);
            final updatedList =
                state.donations.where((d) => d.id != e.donationId).toList();
            emit(
              state.copyWith(
                donations: updatedList,
                donationActionStatus: StateStatus.loaded,
                donationActionError: null,
              ),
            );
            if (e.festivalId.isNotEmpty) {
              add(
                DonationEvent.loadDonationsByFestivalRequested(
                  festivalId: e.festivalId,
                ),
              );
            }
          } catch (error) {
            final errorMessage = error.toString().replaceFirst('Exception: ', '');
            emit(
              state.copyWith(
                donationActionStatus: StateStatus.error,
                donationActionError: errorMessage,
              ),
            );
          }
        },
      );
    });
  }
}
