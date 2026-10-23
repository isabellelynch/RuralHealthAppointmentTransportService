# Traceability: US05 -> UC07 -> FR11, FR03 -> BR09
# Scenario evidence: staff "do not want to disadvantage passengers whose
# appointments are changed by a healthcare provider". Cancellation reasons are
# recorded inconsistently.
# Provider responsibility is recorded from what the passenger or referrer
# reports, not verified (A06, Q06). The scenario does not define what notice
# counts as "late", so notice is recorded in hours and no threshold is assumed.
# Names, dates and times are illustrative test data.

@US05 @UC07 @FR11 @BR09
Feature: Record who caused a cancellation
  As an office staff member
  I want to mark a cancellation as caused by the healthcare provider
  So that the passenger is not treated as having cancelled late

  Background:
    Given Mary has a confirmed journey with a collection window starting at 10:00 on 14 October

  Rule: Every cancellation records who cancelled, the reason, the notice given and whether the provider caused it

    @US05-S1
    Scenario: Provider-caused cancellation is recorded with all four values
      Given the time is 08:00 on 14 October
      When office staff cancel the journey with:
        | who cancelled   | Referrer                          |
        | reason          | Appointment rescheduled by clinic |
        | provider caused | Yes                               |
      Then the cancellation shows who cancelled as "Referrer"
      And the reason as "Appointment rescheduled by clinic"
      And the notice given as 2 hours
      And provider caused as "Yes"

    @US05-S2
    Scenario: The cancellation is added to the request's change history
      When office staff cancel the journey as provider-caused
      Then the request's history shows the status change to "Cancelled" with the date and staff member

    @US05-S3
    Scenario: A cancellation cannot be saved without a reason
      When office staff try to cancel the journey without choosing a reason
      Then the cancellation is not saved
      And the message names "Reason" as missing

  Rule: A provider-caused cancellation does not count against the passenger

    @US05-S4
    Scenario: Short-notice provider cancellation is not counted as a passenger cancellation
      Given the time is 09:30 on 14 October
      When office staff cancel the journey as provider-caused
      Then the notice given is recorded as 0.5 hours
      And Mary's record shows 0 passenger-caused cancellations

    @US05-S5
    Scenario: Short-notice passenger cancellation is counted as a passenger cancellation
      # Contrast case: same notice, but the passenger cancelled
      Given the time is 09:30 on 14 October
      When office staff cancel the journey with:
        | who cancelled   | Passenger                  |
        | reason          | Passenger no longer needs  |
        | provider caused | No                         |
      Then the notice given is recorded as 0.5 hours
      And Mary's record shows 1 passenger-caused cancellation

  Rule: Cancellations can be analysed by reason

    @US05-S6
    Scenario: Cancellations are filtered by reason
      Given the following cancellations are recorded this month:
        | passenger | reason                            | provider caused |
        | Mary      | Appointment rescheduled by clinic | Yes             |
        | John      | Passenger unwell                  | No              |
        | Ann       | Appointment rescheduled by clinic | Yes             |
      When the coordinator filters cancellations by "Appointment rescheduled by clinic"
      Then 2 cancellations are listed
      And both are marked as provider caused

  Rule: Part of a journey can be cancelled

    @US05-S7
    Scenario: Only the return stage is cancelled when the passenger has a lift home
      When office staff cancel only the return stage with reason "Passenger has own transport home"
      Then the return stage shows status "Cancelled"
      And the outward stage still shows status "Confirmed"
