# User Story Backlog

This file is the authoritative record of the CA1 user stories. Each story gives a stakeholder-value view of one or more formal requirements, it does not replace the [requirements catalogue](01-functional-requirements.md) or the [use case model](../report/07-use-case-model.md). Acceptance criteria are stated here as observable conditions ([Cohn, 2004](../references/01-text-sources.md#cohn)). The acceptance criteria of US03 are illustrated by concrete Gherkin scenarios in [`features/US03-return-driver.feature`](../features/US03-return-driver.feature), identified by tags such as `@US03-S4` ([Wynne and Hellesøy, 2012](../references/01-text-sources.md#wynne)). The acceptance criteria of the other stories are verified by the verification method stated for their requirement. The [user stories section](../report/08-gherkin-examples.md) of the report explains why these five stories were chosen.

## Summary

| ID | Title | Priority | Actor | Use case | Requirements | Gherkin feature |
|----|-------|----------|-------|----------|--------------|--------------|
| [US01](#US01) | Block incomplete requests | Must | Office staff | [UC01](../report/07-use-case-model.md#UC01) | [FR02](01-functional-requirements.md#FR02) | – (requirement tests) |
| [US02](#US02) | Reject unsuitable vehicles | Must | Coordinator | [UC03](../report/07-use-case-model.md#UC03) | [FR05](01-functional-requirements.md#FR05) | – (requirement tests) |
| [US03](#US03) | Separate return driver | Must | Coordinator | [UC03](../report/07-use-case-model.md#UC03) | [FR08](01-functional-requirements.md#FR08), [FR09](01-functional-requirements.md#FR09) | [US03-return-driver.feature](../features/US03-return-driver.feature) |
| [US04](#US04) | Record progress without signal | Must | Driver | [UC06](../report/07-use-case-model.md#UC06) | [FR10](01-functional-requirements.md#FR10), [NFR03](02-non-functional-requirements.md#NFR03) | – (requirement tests) |
| [US05](#US05) | Record provider-caused cancellations | Should | Office staff | [UC07](../report/07-use-case-model.md#UC07) | [FR11](01-functional-requirements.md#FR11) | – (requirement tests) |

Each story takes the priority of its main requirement.

---

### <a id="US01"></a>US01: Block incomplete requests

**As an** office staff member, **I want** the system to stop a request from being allocated until all its mandatory details are complete, **so that** no journey is planned around a missing detail such as an unknown finishing time.

| | |
|---|---|
| **Business value** | Fewer journeys planned on wrong or missing details and fewer repeat calls to referrers. Serves [G03](../report/03-stakeholder-and-actor-catalogue.md#G03) (office staff) and [G02](../report/03-stakeholder-and-actor-catalogue.md#G02) (coordinator), addresses problem [P02](../report/01-scenario-interpretation.md#P02). |
| **Related** | [FR01](01-functional-requirements.md#FR01), [FR02](01-functional-requirements.md#FR02), [BR03](../report/06-rules-and-uncertainty-register.md#BR03), [UC01](../report/07-use-case-model.md#UC01), [UC03](../report/07-use-case-model.md#UC03) exception 1a |
| **Priority** | Must |
| **Scenario evidence** | Referrers sometimes omit the finishing time, staff may need several calls "before a request is ready for allocation". |

**Acceptance criteria**

| ID | Criterion | Verified by |
|----|-----------|-----------|
| US01-AC1 | A request with every mandatory detail can be allocated. | Test: [FR02](01-functional-requirements.md#FR02) |
| US01-AC2 | A request missing any mandatory detail cannot be allocated and the missing detail is named. | Test: [FR02](01-functional-requirements.md#FR02) |
| US01-AC3 | An estimated finishing time counts as complete, an exact time is not required. | Test: [FR02](01-functional-requirements.md#FR02) |

**Assumptions, questions and dependencies:** the list of mandatory details is temporary ([A01](../report/05-assumptions.md#A01), [A02](../report/05-assumptions.md#A02), [Q08](../report/04-stakeholder-questions.md#Q08)). Saving incomplete drafts is deferred ([DFR02](03-deferred-requirements.md#DFR02)).

---

### <a id="US02"></a>US02: Reject unsuitable vehicles

**As a** coordinator, **I want** the system to reject a vehicle that lacks the wheelchair space or companion seating a passenger needs, **so that** no passenger is sent a vehicle they cannot travel in.

| | |
|---|---|
| **Business value** | Prevents missed appointments and wasted journeys caused by the wrong vehicle and protects the two accessible vehicles. Serves [G05](../report/03-stakeholder-and-actor-catalogue.md#G05) (employed driver) and [G07](../report/03-stakeholder-and-actor-catalogue.md#G07) (passenger), addresses problem [P06](../report/01-scenario-interpretation.md#P06). |
| **Related** | [FR04](01-functional-requirements.md#FR04), [FR05](01-functional-requirements.md#FR05), [FR08](01-functional-requirements.md#FR08), [BR05](../report/06-rules-and-uncertainty-register.md#BR05), [UC03](../report/07-use-case-model.md#UC03) step 4, exception 4a |
| **Priority** | Must |
| **Scenario evidence** | Accessible-vehicle driver: "Wheelchair space and companion seating must be known before the vehicle is assigned." |

**Acceptance criteria**

| ID | Criterion | Verified by |
|----|-----------|-----------|
| US02-AC1 | A vehicle with fewer wheelchair spaces than the passenger needs is rejected, with the reason given. | Test: [FR05](01-functional-requirements.md#FR05) |
| US02-AC2 | A vehicle with fewer companion seats than the passenger needs is rejected, with the reason given. | Test: [FR05](01-functional-requirements.md#FR05) |
| US02-AC3 | A vehicle whose capacity exactly equals the need is accepted. | Test: [FR05](01-functional-requirements.md#FR05) |
| US02-AC4 | When both needs are unmet, both shortfalls are reported. | Test: [FR05](01-functional-requirements.md#FR05) |
| US02-AC5 | The same check applies to the return stage and a rejection leaves the other stage unchanged. | Test: [FR05](01-functional-requirements.md#FR05), [FR08](01-functional-requirements.md#FR08) |

**Assumptions, questions and dependencies:** vehicle capacities in the examples are illustrative, the scenario gives none. Rechecking after needs change ([DFR13](03-deferred-requirements.md#DFR13)) and double-booking ([DFR07](03-deferred-requirements.md#DFR07), [Q03](../report/04-stakeholder-questions.md#Q03)) are deferred.

---

### <a id="US03"></a>US03: Separate return driver

**As a** coordinator, **I want** to assign a different driver to the return stage of a journey, **so that** a passenger whose appointment overruns can still get home when the outward driver cannot wait.

| | |
|---|---|
| **Business value** | Passengers are not left unsure how they will get home and staff can change one stage without confusing the other. Serves [G02](../report/03-stakeholder-and-actor-catalogue.md#G02) (coordinator) and [G07](../report/03-stakeholder-and-actor-catalogue.md#G07) (passenger), addresses problem [P07](../report/01-scenario-interpretation.md#P07). |
| **Related** | [FR08](01-functional-requirements.md#FR08), [FR09](01-functional-requirements.md#FR09), [UC03](../report/07-use-case-model.md#UC03) alternatives 6a and 6b, [UC05](../report/07-use-case-model.md#UC05) |
| **Priority** | Must |
| **Scenario evidence** | Coordinator: "the finishing time may be little more than a guess." Passenger: "Please tell me whether the driver is waiting or coming back later." |

**Acceptance criteria**

| ID | Criterion | Verified by |
|----|-----------|-----------|
| US03-AC1 | The outward and return stages each have their own driver and status. | `@US03-S1`, `@US03-S3` |
| US03-AC2 | Changing the return driver does not change the outward stage. | `@US03-S2` |
| US03-AC3 | The return stage can be saved without a driver and assigned later. | `@US03-S4`, `@US03-S5` |
| US03-AC4 | The passenger confirmation says how the passenger will get home. | `@US03-S6` |

**Assumptions, questions and dependencies:** outward and return are two linked stages of one journey ([A05](../report/05-assumptions.md#A05), [Q04](../report/04-stakeholder-questions.md#Q04)).

---

### <a id="US04"></a>US04: Record progress without signal

**As a** driver, **I want** to record collection and arrival times even when I have no mobile signal, **so that** the coordinator knows where my journey stands once I reconnect.

| | |
|---|---|
| **Business value** | The office knows whether passengers have been collected despite uneven coverage and no progress is lost. Serves [G04](../report/03-stakeholder-and-actor-catalogue.md#G04) (volunteer driver), [G05](../report/03-stakeholder-and-actor-catalogue.md#G05) (employed driver) and [G02](../report/03-stakeholder-and-actor-catalogue.md#G02) (coordinator), addresses problem [P13](../report/01-scenario-interpretation.md#P13). |
| **Related** | [FR10](01-functional-requirements.md#FR10), [NFR03](02-non-functional-requirements.md#NFR03), [NFR01](02-non-functional-requirements.md#NFR01), [C02](../report/06-rules-and-uncertainty-register.md#C02), [UC06](../report/07-use-case-model.md#UC06) |
| **Priority** | Must |
| **Scenario evidence** | "Mobile coverage is uneven." "The driver records collection, arrival and return completion." |

**Acceptance criteria**

| ID | Criterion | Verified by |
|----|-----------|-----------|
| US04-AC1 | Progress recorded with a signal reaches the coordinator straight away. | Demonstration: [FR10](01-functional-requirements.md#FR10) |
| US04-AC2 | Progress recorded without a signal is kept and reaches the coordinator within 60 seconds of a signal returning, with its original time. | Test: [NFR03](02-non-functional-requirements.md#NFR03) |
| US04-AC3 | Updates kept for up to 8 hours are not lost. | Test: [NFR03](02-non-functional-requirements.md#NFR03) |
| US04-AC4 | A driver without a smartphone can have progress recorded by office staff on their behalf. | Demonstration: [FR10](01-functional-requirements.md#FR10) |
| US04-AC5 | A driver cannot record progress on a stage assigned to someone else. | Test: [NFR01](02-non-functional-requirements.md#NFR01) |

**Assumptions, questions and dependencies:** the 8-hour and 60-second figures are temporary ([A13](../report/05-assumptions.md#A13), [Q11](../report/04-stakeholder-questions.md#Q11)); device ownership is assumed ([A08](../report/05-assumptions.md#A08), [Q14](../report/04-stakeholder-questions.md#Q14)). Recording exceptions such as a passenger not ready is deferred ([DFR12](03-deferred-requirements.md#DFR12)).

---

### <a id="US05"></a>US05: Record provider-caused cancellations

**As an** office staff member, **I want** to mark a cancellation as caused by the healthcare provider, **so that** the passenger is not treated as having cancelled late.

| | |
|---|---|
| **Business value** | Passengers are treated fairly and the network can see why capacity is lost. Serves [G07](../report/03-stakeholder-and-actor-catalogue.md#G07) (passenger), [G03](../report/03-stakeholder-and-actor-catalogue.md#G03) (office staff) and [G02](../report/03-stakeholder-and-actor-catalogue.md#G02) (coordinator), addresses problem [P10](../report/01-scenario-interpretation.md#P10). |
| **Related** | [FR11](01-functional-requirements.md#FR11), [FR03](01-functional-requirements.md#FR03), [BR09](../report/06-rules-and-uncertainty-register.md#BR09), [UC07](../report/07-use-case-model.md#UC07) |
| **Priority** | Should |
| **Scenario evidence** | Staff "do not want to disadvantage passengers whose appointments are changed by a healthcare provider". Reasons are recorded inconsistently. |

**Acceptance criteria**

| ID | Criterion | Verified by |
|----|-----------|-----------|
| US05-AC1 | Every cancellation records who cancelled, the reason, the notice given and whether the provider caused it, a reason is required. | Test: [FR11](01-functional-requirements.md#FR11) |
| US05-AC2 | Each cancellation appears in the request's change history. | Test: [FR03](01-functional-requirements.md#FR03) |
| US05-AC3 | A provider-caused cancellation is not counted against the passenger, whatever the notice. | Test: [FR11](01-functional-requirements.md#FR11) |
| US05-AC4 | Cancellations can be listed by reason. | Test: [FR11](01-functional-requirements.md#FR11) |
| US05-AC5 | One stage can be cancelled without the other. | Test: [FR11](01-functional-requirements.md#FR11) |

**Assumptions, questions and dependencies:** provider responsibility is recorded as reported, not verified ([A06](../report/05-assumptions.md#A06), [Q06](../report/04-stakeholder-questions.md#Q06)). No threshold for a "late" cancellation is assumed ([D13](../decisions/decision-log.md#D13)).
