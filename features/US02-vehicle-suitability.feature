# Vehicle names, capacities and passenger details are illustrative test data,
# not the network's actual fleet. Real vehicle capacities are not stated in
# the scenario. The rule tested (FR05) holds whatever the real values are.

@US02 @UC03 @FR05 @BR05
Feature: Check vehicle suitability when assigning a journey
  As a coordinator
  I want the system to reject a vehicle that lacks the wheelchair space or companion seating a passenger needs
  So that no passenger is sent a vehicle they cannot travel in

  Background:
    Given the following vehicles are recorded:
      | vehicle             | type               | wheelchair spaces | companion seats |
      | Volunteer car KY-01 | volunteer car      | 0                 | 3               |
      | Volunteer car KY-02 | volunteer car      | 0                 | 1               |
      | Accessible van AV-1 | accessible vehicle | 1                 | 1               |
    And the driver of each vehicle is authorised to drive it

  Rule: A vehicle must have at least as many wheelchair spaces as the passenger needs
    # Success: the vehicle meets the need
    @US02-S1
    Scenario: Accessible vehicle is accepted for a wheelchair user
      Given a request for Mary, who needs 1 wheelchair space and no companion seat
      When the coordinator assigns "Accessible van AV-1" to the outward stage
      Then the assignment is saved
      And the outward stage shows "Accessible van AV-1"

    # Rejection: no wheelchair space
    @US02-S2
    Scenario: Car without wheelchair space is rejected
      Given a request for Mary, who needs 1 wheelchair space and no companion seat
      When the coordinator assigns "Volunteer car KY-01" to the outward stage
      Then the assignment is rejected
      And the reason given is "Vehicle has 0 wheelchair spaces; passenger needs 1"
      And the outward stage remains unassigned

  Rule: A vehicle must have at least as many companion seats as the passenger needs

    # Rejection: too few companion seats
    @US02-S3
    Scenario: Car with too few companion seats is rejected
      Given a request for John, who needs no wheelchair space and 2 companion seats
      When the coordinator assigns "Volunteer car KY-02" to the outward stage
      Then the assignment is rejected
      And the reason given is "Vehicle has 1 companion seat; passenger needs 2"

    @US02-S4
    Scenario: Exactly enough companion seats is accepted
      # Boundary: capacity equal to need is enough
      Given a request for John, who needs no wheelchair space and 1 companion seat
      When the coordinator assigns "Volunteer car KY-02" to the outward stage
      Then the assignment is saved

  Rule: Both needs are checked together, and every shortfall is reported

    # Rejection: both shortfalls reported together
    @US02-S5
    Scenario: Vehicle lacking both wheelchair space and companion seating is rejected with both reasons
      Given a request for Ann, who needs 1 wheelchair space and 2 companion seats
      When the coordinator assigns "Volunteer car KY-02" to the outward stage
      Then the assignment is rejected
      And the reasons given are:
        | Vehicle has 0 wheelchair spaces; passenger needs 1 |
        | Vehicle has 1 companion seat; passenger needs 2    |

    # Accepted and rejected combinations, including both boundaries.
    # Illustrative test data: the scenario names two kinds of vehicle but gives no capacities.
    @US02-S6
    Scenario Outline: Vehicle capacity is compared with the passenger's needs
      Given a request for a passenger who needs <wheelchair> wheelchair spaces and <companions> companion seats
      When the coordinator assigns "<vehicle>" to the outward stage
      Then the assignment is <result>

      Examples: Accepted
        | wheelchair | companions | vehicle             | result |
        | 0          | 0          | Volunteer car KY-02 | saved  |
        | 0          | 3          | Volunteer car KY-01 | saved  |
        | 1          | 1          | Accessible van AV-1 | saved  |

      Examples: Rejected
        | wheelchair | companions | vehicle             | result   |
        | 1          | 0          | Volunteer car KY-01 | rejected |
        | 0          | 2          | Volunteer car KY-02 | rejected |
        | 1          | 2          | Accessible van AV-1 | rejected |

  Rule: The check applies to the return stage as well as the outward stage

    @US02-S7
    Scenario: Unsuitable vehicle is rejected for the return stage
      # FR08: outward and return are separate stages, each with its own vehicle
      Given a request for Mary, who needs 1 wheelchair space and no companion seat
      And "Accessible van AV-1" is assigned to the outward stage
      When the coordinator assigns "Volunteer car KY-01" to the return stage
      Then the assignment is rejected
      And the outward stage still shows "Accessible van AV-1"
