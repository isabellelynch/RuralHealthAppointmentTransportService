# Traceability: US04 -> UC06 -> FR10, NFR03, NFR01
# Scenario evidence: "Mobile coverage is uneven" and some volunteers prefer
# printed journey sheets. "The driver records collection, arrival and return
# completion."
# The 8-hour storage period and 60-second sending target are temporary
# assumptions (A13, Q11). Names and times are illustrative test data.

@US04 @UC06 @FR10 @NFR03 @NFR01
Feature: Record journey progress without a mobile signal
  As a driver
  I want to record collection and arrival times even when I have no mobile signal
  So that the coordinator knows where my journey stands once I reconnect

  Background:
    Given volunteer driver Seán has accepted the outward stage of Mary's journey
    And Seán records his own progress during the journey

  Rule: Progress recorded with a signal reaches the coordinator straight away

    @US04-S1
    Scenario: Collection recorded with a signal appears in the coordinator's view
      Given Seán's phone has a mobile signal
      When Seán records collection at 09:40
      Then the outward stage shows collection at 09:40 in the coordinator's view

  Rule: Progress recorded without a signal is stored and sent later, with nothing lost

    @US04-S2
    Scenario: Update recorded with no signal is kept until it can be sent
      Given Seán's phone has no mobile signal
      When Seán records collection at 09:40
      Then the update is kept
      And Seán is told that the update has not yet been sent

    @US04-S3
    Scenario: Stored update is sent when the signal returns
      Given Seán's phone has no mobile signal
      And Seán has recorded collection at 09:40
      When the mobile signal returns
      Then the collection at 09:40 appears in the coordinator's view within 60 seconds

    @US04-S4
    Scenario: Several stored updates are all sent, keeping their original times
      Given Seán's phone has no mobile signal
      And Seán has recorded the following updates:
        | update     | time  |
        | Collection | 09:40 |
        | Arrival    | 10:35 |
      When the mobile signal returns
      Then both updates appear in the coordinator's view within 60 seconds
      And they show the times 09:40 and 10:35, not the time they were sent

    # Boundary case: the longest period without signal assumed in A13
    @US04-S5
    Scenario: An update stored for 8 hours is still sent
      Given Seán's phone has had no mobile signal for 8 hours
      And Seán recorded collection at the start of that period
      When the mobile signal returns
      Then the collection appears in the coordinator's view within 60 seconds

  Rule: Drivers without a smartphone can still have their progress recorded

    # Assumes drivers without a smartphone use a printed sheet and phone in (A08, Q14)
    @US04-S6
    Scenario: Office staff record progress phoned in by a driver
      Given volunteer driver Aoife uses a printed journey sheet
      And Aoife has accepted the return stage of Mary's journey
      When Aoife phones the office to report collection at 13:15
      And office staff record the collection on Aoife's behalf
      Then the return stage shows collection at 13:15
      And the update is recorded as entered by office staff for Aoife

  Rule: A driver can only record progress on stages they have accepted

    # NFR01: drivers see only the journeys they have accepted
    @US04-S7
    Scenario: Driver cannot open a stage assigned to someone else
      Given the return stage of Mary's journey is assigned to Aoife
      When Seán tries to open the return stage
      Then access is refused
