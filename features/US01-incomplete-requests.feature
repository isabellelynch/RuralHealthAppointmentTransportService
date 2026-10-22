# Traceability: US01 -> UC01, UC03 (exception 1a) -> FR02 -> BR03
# Scenario evidence: referrers sometimes omit the finishing time, and staff may
# need several calls "before a request is ready for allocation".
# Mandatory details are a temporary assumption (A01, Q08).

@US01 @UC01 @FR02 @BR03
Feature: Prevent allocation of incomplete requests
  As an office staff member
  I want the system to stop a request from being allocated until all its mandatory details are complete
  So that no journey is planned around a missing detail such as an unknown finishing time

  # Happy path
  @US01-S1
  Scenario: Complete request can be allocated
    Given a request with all mandatory details recorded
    When the request is submitted for allocation
    Then the request is marked as ready for allocation

  # Exception: a mandatory detail is missing
  @US01-S2
  Scenario: Request without a finishing time is blocked
    Given a request with no estimated finishing time
    When the request is submitted for allocation
    Then allocation is blocked
    And the message names "Estimated finishing time" as missing

  # Edge case: an estimate counts as complete (A02)
  @US01-S3
  Scenario: An estimated finishing time is accepted
    Given a request with an estimated finishing time of "around 14:30"
    When the request is submitted for allocation
    Then the request is marked as ready for allocation
