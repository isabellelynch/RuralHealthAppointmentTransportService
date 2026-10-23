# User Stories and Gherkin Examples

## User Stories

A user story describes a small piece of functionality from the point of view of the person who needs it, in the form "As a [role], I want [goal], so that [benefit]" ([Cohn, 2004](../references/01-text-sources.md#cohn)). Where a use case shows the whole interaction, a user story isolates one valuable, testable slice of it. The five stories below were chosen because each rests on direct scenario evidence and each meets the INVEST criteria: independent, negotiable, valuable, estimable, small and testable. Each is linked to its use case and requirement. The full story records, with business value, priority, stakeholder goals, acceptance criteria and dependencies, are held in the [user story backlog](../requirements/04-user-story-backlog.md), this section summarises them.

| ID | User story | Use case | Requirement | Scenario evidence |
|----|------------|----------|-------------|-------------------|
| <a id="US01"></a>US01 | As an office staff member, I want the system to stop a request from being allocated until all its mandatory details are complete, so that no journey is planned around a missing detail such as an unknown finishing time. | [UC01](07-use-case-model.md#UC01) | [FR02](../requirements/01-functional-requirements.md#FR02) | Referrers sometimes omit the finishing time, and several calls may be needed "before a request is ready for allocation". |
| <a id="US02"></a>US02 | As a coordinator, I want the system to reject a vehicle that lacks the wheelchair space or companion seating a passenger needs, so that no passenger is sent a vehicle they cannot travel in. | [UC03](07-use-case-model.md#UC03) | [FR05](../requirements/01-functional-requirements.md#FR05) | Accessible-vehicle driver: "Wheelchair space and companion seating must be known before the vehicle is assigned." |
| <a id="US03"></a>US03 | As a coordinator, I want to assign a different driver to the return stage of a journey, so that a passenger whose appointment overruns can still get home when the outward driver cannot wait. | [UC03](07-use-case-model.md#UC03) | [FR08](../requirements/01-functional-requirements.md#FR08), [FR09](../requirements/01-functional-requirements.md#FR09) | Coordinator: "the finishing time may be little more than a guess." A different driver may complete the return. |
| <a id="US04"></a>US04 | As a driver, I want to record collection and arrival times even when I have no mobile signal, so that the coordinator knows where my journey stands once I reconnect. | [UC06](07-use-case-model.md#UC06) | [FR10](../requirements/01-functional-requirements.md#FR10), [NFR03](../requirements/02-non-functional-requirements.md#NFR03) | "Mobile coverage is uneven." The driver records collection, arrival and return completion. |
| <a id="US05"></a>US05 | As an office staff member, I want to mark a cancellation as caused by the healthcare provider, so that the passenger is not treated as having cancelled late. | [UC07](07-use-case-model.md#UC07) | [FR11](../requirements/01-functional-requirements.md#FR11) | Staff "do not want to disadvantage passengers whose appointments are changed by a healthcare provider." |


## Gherkin Scenarios

Acceptance criteria are illustrated by Given/When/Then scenarios grouped under `Rule:` headings, each stating the business rule being tested ([Wynne and Hellesøy, 2012](../references/01-text-sources.md#wynne)). US03 was chosen for the feature file because it exercises the alternative flows of the detailed use case ([UC03](07-use-case-model.md#UC03) 6a and 6b) and tests the modelling decision to treat outward and return as separate stages ([D16](../decisions/decision-log.md#D16)). The file holds five scenarios covering success, a rule, an alternative, a failure and the confirmation rule. The feature is tagged with its story, use case and requirements (`@US03 @UC03 @FR08 @FR09 @FR05`) and each scenario has its own identifier, such as `@US03-S3`, referenced from the [user story backlog](../requirements/04-user-story-backlog.md#US03). Names and times are illustrative test data. The acceptance criteria of the other four stories are verified by the tests stated for their requirements.

| Story | Feature file | Scenarios | Covers |
|-------|--------------|-----------|--------|
| [US03](#US03) | [US03-return-driver.feature](../features/US03-return-driver.feature) | 5 | Separate driver and status for each stage ([FR08](../requirements/01-functional-requirements.md#FR08)). Changing the return driver leaves the outward stage unchanged. Return left outstanding when the finishing time is uncertain ([A05](05-assumptions.md#A05), [Q04](04-stakeholder-questions.md#Q04)). An unsuitable vehicle is rejected for the return stage ([FR05](../requirements/01-functional-requirements.md#FR05)). Confirmation explains the return arrangement ([FR09](../requirements/01-functional-requirements.md#FR09)). |

### Key acceptance examples

| Kind | Scenario | What it shows |
|------|----------|---------------|
| Success | `@US03-S1` Different drivers are assigned to the outward and return stages | The main path: each stage holds its own driver and status ([FR08](../requirements/01-functional-requirements.md#FR08)). |
| Rule | `@US03-S2` Changing the return driver does not affect the outward stage | A change to one stage must not alter the other, the confusion described in problem [P07](01-scenario-interpretation.md#P07). |
| Alternative | `@US03-S3` Return stage is saved as outstanding when the finishing time is uncertain | The goal is still reached by a different route when the return cannot yet be planned ([UC03](07-use-case-model.md#UC03) 6a). |
| Failure | `@US03-S4` Unsuitable vehicle is rejected for the return stage | A car with no wheelchair space cannot be assigned to a wheelchair user's return, and the stage stays outstanding ([FR05](../requirements/01-functional-requirements.md#FR05), [BR05](06-rules-and-uncertainty-register.md#BR05), [UC03](07-use-case-model.md#UC03) 4a). |
| Rule | `@US03-S5` Confirmation explains that a different driver will collect the passenger | The passenger is told how they will get home ([FR09](../requirements/01-functional-requirements.md#FR09)). |
