@US01 @UC01 @FR02
Feature: Prevent allocation of incomplete requests
  As an office staff member
  I want the system to stop a request from being allocated until all its mandatory details are complete
  So that no journey is planned around a missing detail such as an unknown finishing time

  Background:
    Given an office staff member is logged in

  # Happy Path
  Scenario: Complete request can be allocated
    Given a request with all mandatory details recorded
    When the request is submitted for allocation
    Then the request is marked as ready for allocation

  # Alternate Path 1
  Scenario: Request with one or more missing details is blocked
    Given a request with one or more missing details
    When the request is submitted for allocation
    Then allocation is blocked
    And the message alerts the user of the missing detail(s)

  # Alternate Path 2
  Scenario: An estimated finishing time is accepted
    Given a request with an estimated finishing time of "around 14:30"
    When the request is submitted for allocation
    Then the request is marked as ready for allocation