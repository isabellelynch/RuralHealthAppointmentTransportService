# User Stories and Gherkin Examples

## User Stories

A user story describes a small piece of functionality from the point of view of the person who needs it, in the form "As a [role], I want [goal], so that [benefit]" ([Cohn, 2004](../references/01-text-sources.md#cohn)). Where a use case shows the whole interaction, a user story isolates one valuable, testable slice of it. The five stories below were chosen because each rests on direct scenario evidence and each meets the INVEST criteria: independent, negotiable, valuable, estimable, small and testable. Each is linked to its use case and requirement. The full story records, with business value, priority, stakeholder goals, acceptance criteria and dependencies, are held in the [user story backlog](../requirements/04-user-story-backlog.md), this section summarises them.

| ID | User story | Use case | Requirement | Scenario evidence |
|----|------------|----------|-------------|-------------------|
| <a id="US01"></a>US01 | As an office staff member, I want the system to stop a request from being allocated until all its mandatory details are complete, so that no journey is planned around a missing detail such as an unknown finishing time. | [UC01](07-use-case-model.md#UC01) | [FR02](../requirements/01-functional-requirements.md#FR02) | Referrers sometimes omit the finishing time, and several calls may be needed "before a request is ready for allocation". |
| <a id="US02"></a>US02 | As a coordinator, I want the system to reject a vehicle that lacks the wheelchair space or companion seating a passenger needs, so that no passenger is sent a vehicle they cannot travel in. | [UC03](07-use-case-model.md#UC03) | [FR05](../requirements/01-functional-requirements.md#FR05) | Accessible-vehicle driver: "Wheelchair space and companion seating must be known before the vehicle is assigned." |
| <a id="US03"></a>US03 | As a coordinator, I want to assign a different driver to the return stage of a journey, so that a passenger whose appointment overruns can still get home when the outward driver cannot wait. | [UC03](07-use-case-model.md#UC03) | [FR08](../requirements/01-functional-requirements.md#FR08) | Coordinator: "the finishing time may be little more than a guess." A different driver may complete the return. |
| <a id="US04"></a>US04 | As a driver, I want to record collection and arrival times even when I have no mobile signal, so that the coordinator knows where my journey stands once I reconnect. | [UC06](07-use-case-model.md#UC06) | [FR10](../requirements/01-functional-requirements.md#FR10), [NFR03](../requirements/02-non-functional-requirements.md#NFR03) | "Mobile coverage is uneven." The driver records collection, arrival and return completion. |
| <a id="US05"></a>US05 | As an office staff member, I want to mark a cancellation as caused by the healthcare provider, so that the passenger is not treated as having cancelled late. | [UC07](07-use-case-model.md#UC07) | [FR11](../requirements/01-functional-requirements.md#FR11) | Staff "do not want to disadvantage passengers whose appointments are changed by a healthcare provider." |


## Gherkin Scenarios

Acceptance criteria are illustrated by Given/When/Then scenarios grouped under `Rule:` headings ([Wynne and Hellesøy, 2012](../references/01-text-sources.md#wynne)), one feature file per story in [`features/`](../features/). Features are tagged with story, use case and requirement and each scenario has an identifier such as `@US02-S4`. Names and vehicle capacities are illustrative test data.

| Story | Feature file | Scenarios | Covers |
|-------|--------------|-----------|--------|
| [US01](#US01) | [US01-incomplete-requests.feature](../features/US01-incomplete-requests.feature) | 3 | Complete request allocated. Missing details blocked and named (FR02). Estimated finishing time accepted (A02) |
| [US02](#US02) | [US02-vehicle-suitability.feature](../features/US02-vehicle-suitability.feature) | 7 (12 test cases, including an outline with 6 examples) | Wheelchair and companion seating checks (FR05). Exact-capacity boundary determined and tested. Both shortfalls reported. Check applied to the outward and return journeys (FR08). |
| [US03](#US03) | [US03-return-driver.feature](../features/US03-return-driver.feature) | 6 | Separate driver and status for each stage (FR08). Changing the return driver leaves the outward stage unchanged. Return left outstanding when the finishing time is uncertain (A05, Q04). Confirmation explains the return arrangements (FR09) |
| [US04](#US04) | [US04-offline-progress.feature](../features/US04-offline-progress.feature) | 7 | Update with signal (FR10). Update stored without signal and sent within 60 seconds of reconnecting (NFR03). Several updates keep their recorded times. 8-hour boundary (A13). Phoned-in update recorded by office staff (A08). A driver can't open another driver's stage (NFR01) |
| [US05](#US05) | [US05-provider-cancellation.feature](../features/US05-provider-cancellation.feature) | 7 | All four cancellation values are recorded and notice calculated (FR11). Change history (FR03). Reason required. Provider-caused cancellation not counted against the passenger, unlike a passenger cancellation at the same notice (BR09). Filter by reason. Single stage cancelled on its own. |

### Key acceptance examples

These five show success, failure, boundary, alternative and rule behaviour, the other scenarios extend them.

| Kind | Scenario | What it shows |
|------|----------|---------------|
| Success | `@US02-S1` Accessible vehicle is accepted for a wheelchair user | The main allocation path when needs and capacity match ([FR05](../requirements/01-functional-requirements.md#FR05)). |
| Failure | `@US01-S2` Request without a finishing time is blocked | The commonest gap in the scenario stops allocation and is named ([FR02](../requirements/01-functional-requirements.md#FR02), [BR03](06-rules-and-uncertainty-register.md#BR03)). |
| Boundary | `@US02-S4` Exactly enough companion seats is accepted | Capacity equal to need is enough; the rule is "fewer than", not "no more than". |
| Alternative | `@US03-S4` Return stage is saved as outstanding when the finishing time is uncertain | The goal is still reached by a different route when the return cannot yet be planned ([UC03](07-use-case-model.md#UC03) 6a). |
| Rule | `@US05-S4` and `@US05-S5` Short-notice cancellations, provider versus passenger | The same notice is treated differently depending on who caused it ([BR09](06-rules-and-uncertainty-register.md#BR09)). |

#### Example: `US02-vehicle-suitability.feature` (extract)

```gherkin
@US02 @UC03 @FR05 @BR05
Feature: Check vehicle suitability when assigning a journey

  Rule: A vehicle must have at least as many wheelchair spaces as the passenger needs

    @US02-S2
    Scenario: Car without wheelchair space is rejected
      Given a request for Mary, who needs 1 wheelchair space and no companion seat
      When the coordinator assigns "Volunteer car KY-01" to the outward stage
      Then the assignment is rejected
      And the reason given is "Vehicle has 0 wheelchair spaces; passenger needs 1"
      And the outward stage remains unassigned

  Rule: A vehicle must have at least as many companion seats as the passenger needs

    @US02-S4
    Scenario: Exactly enough companion seats is accepted
      Given a request for John, who needs no wheelchair space and 1 companion seat
      When the coordinator assigns "Volunteer car KY-02" to the outward stage
      Then the assignment is saved
```

#### Example: `US05-provider-cancellation.feature` (extract)

```gherkin
@US05 @UC07 @FR11 @BR09
Feature: Record who caused a cancellation

  Background:
    Given Mary has a confirmed journey with a collection window starting at 10:00 on 14 October

  Rule: A provider-caused cancellation does not count against the passenger

    @US05-S4
    Scenario: Short-notice provider cancellation is not counted as a passenger cancellation
      Given the time is 09:30 on 14 October
      When office staff cancel the journey as provider-caused
      Then the notice given is recorded as 0.5 hours
      And Mary's record shows 0 passenger-caused cancellations

    @US05-S5
    Scenario: Short-notice passenger cancellation is counted as a passenger cancellation
      Given the time is 09:30 on 14 October
      When office staff cancel the journey with:
        | who cancelled   | Passenger                 |
        | reason          | Passenger no longer needs |
        | provider caused | No                        |
      Then the notice given is recorded as 0.5 hours
      And Mary's record shows 1 passenger-caused cancellation
```

