# Traceability: US03 -> UC03 (step 6, alternatives 6a and 6b) -> FR08
# Scenario evidence: coordinator, "the finishing time may be little more than a
# guess." A different driver may complete the return journey, and outward and
# return arrangements are not always recorded separately.
# Driver and passenger names are illustrative test data.

@US03 @UC03 @FR08
Feature: Assign a different driver to the return stage
  As a coordinator
  I want to assign a different driver to the return stage of a journey
  So that a passenger whose appointment overruns can still get home when the outward driver cannot wait

  Background:
    Given the coordinator is logged in
    And a ready request for Mary to attend an appointment at 11:00 with an estimated finishing time of 13:00
    And volunteer drivers Seán and Aoife are available

  Rule: Outward and return are separate stages, each with its own driver and status

    Scenario: Different drivers are assigned to the outward and return stages
      When the coordinator assigns Seán to the outward stage
      And the coordinator assigns Aoife to the return stage
      Then the outward stage shows driver Seán with status "Assigned"
      And the return stage shows driver Aoife with status "Assigned"

    Scenario: Changing the return driver does not affect the outward stage
      Given Seán is assigned to the outward stage
      And Seán is assigned to the return stage
      When the coordinator reassigns the return stage to Aoife
      Then the return stage shows driver Aoife
      And the outward stage still shows driver Seán

    Scenario: Each stage records its own progress
      Given Seán is assigned to the outward stage
      And Aoife is assigned to the return stage
      When Seán records arrival at the appointment
      Then the outward stage shows status "Completed"
      And the return stage still shows status "Assigned"

  Rule: The return stage may be left unassigned until the finishing time is clearer

    # Assumes outward and return are two linked stages of one journey (A05, Q04)
    Scenario: Return stage is saved as outstanding when the finishing time is uncertain
      Given Seán is assigned to the outward stage
      When the coordinator saves the journey without assigning the return stage
      Then the outward assignment is saved
      And the return stage is shown as "Outstanding"

    Scenario: Outstanding return stage is assigned later
      Given Seán is assigned to the outward stage
      And the return stage is "Outstanding"
      When the coordinator assigns Aoife to the return stage
      Then the return stage shows driver Aoife with status "Assigned"

  Rule: The passenger is told how they will get home

    # FR09: the confirmation states whether the driver will wait or return later
    Scenario: Confirmation explains that a different driver will collect the passenger
      Given Seán is assigned to the outward stage
      And Aoife is assigned to the return stage
      When office staff produce the passenger confirmation
      Then the confirmation states that a different driver will collect Mary after the appointment

# Out of scope for this feature:
# - Vehicle and authorisation checks on the return stage (covered by US02 and FR06)
# - Preventing a driver being double-booked across journeys (DFR07, depends on Q03)
