# Decision Log

This log records the significant analysis and modelling decisions made during the project: what was decided, what alternatives were considered and why and what follows from it. 

**How this log was compiled.** This log was written retrospectively on 20 October 2026. The decisions themselves were made as the work progressed and each record gives the date and commit in which the decision first appears in the repository so it can be checked against the version history. Most rationale was already stated in the report sections and is gathered and linked here rather than repeated in full.

Candidate concepts excluded from the domain model are recorded separately in [Rejected Candidate Concepts](rejected-candidates.md).

## Index

| ID | Decision | Area | Date | Status |
|-----|----------|------|------|--------|
| [D01](#D01) | Specify a small first release and defer the remaining candidates | Requirements | 8 Oct | Accepted |
| [D02](#D02) | Bring funder reporting and clinical-information removal into the first release | Requirements | 9 Oct | Accepted |
| [D03](#D03) | Treat driver, vehicle and unavailability records as supporting data | Requirements | 9 Oct | Accepted |
| [D04](#D04) | Remove duplicate and unmeasurable non-functional candidates | Requirements | 9 Oct | Accepted |
| [D05](#D05) | Defer requirements that depend on unresolved policy instead of inventing a policy | Requirements | 8 Oct | Accepted |
| [D06](#D06) | Give non-functional requirements measurable targets based on stated assumptions | Requirements | 8 Oct | Accepted, pending answers |
| [D07](#D07) | Treat referrers as offstage, with no supporting actors in the first release | Stakeholders | 9 Oct | Accepted, pending [Q17](../report/04-stakeholder-questions.md#Q17) |
| [D08](#D08) | Model use cases at user-goal level without include or extend | Use cases | 9 Oct | Accepted |
| [D09](#D09) | Write UC03 as the fully detailed use case | Use cases | 9 Oct | Accepted |
| [D10](#D10) | Use one Driver role for volunteer and employed drivers | Use cases | 9 Oct | Accepted |
| [D11](#D11) | Select five user stories with the strongest scenario evidence | User stories | 10 Oct | Accepted |
| [D12](#D12) | One feature file per story, tagged for traceability, with illustrative test data | Gherkin | 11 Oct | Superseded by [D24](#D24) |
| [D13](#D13) | Do not assume a threshold for a "late" cancellation | Gherkin | 11 Oct | Accepted, pending [Q06](../report/04-stakeholder-questions.md#Q06) |
| [D14](#D14) | Use noun-phrase analysis and keep rejected candidates in a separate record | Domain analysis | 12 to 15 Oct | Accepted |
| [D15](#D15) | Model Appointment separately from TransportRequest | Domain model | 15 Oct | Accepted |
| [D16](#D16) | Model outward and return as one JourneyStage class | Domain model | 15 Oct | Accepted, pending [Q04](../report/04-stakeholder-questions.md#Q04) |
| [D17](#D17) | Record travel needs as attributes of TransportRequest | Domain model | 15 Oct | Accepted |
| [D18](#D18) | Model Cancellation as a concept, not only a status | Domain model | 15 Oct | Accepted |
| [D19](#D19) | Use type attributes instead of subclasses for drivers and vehicles | Domain model | 15 Oct | Accepted |
| [D20](#D20) | Record accessible-vehicle authorisation as a yes/no attribute | Domain model | 15 Oct | Accepted, pending [Q18](../report/04-stakeholder-questions.md#Q18) |
| [D21](#D21) | Link contact attempts to a journey stage, not a whole journey | Domain model | 15 Oct | Accepted |
| [D22](#D22) | Do not model confirmations or funder reports as classes | Domain model | 15 Oct | Accepted |
| [D23](#D23) | Treat Driver as both an actor and a conceptual class | Domain model | 15 Oct | Accepted |
| [D24](#D24) | Keep a single feature file, for US03 | Gherkin | 23 Oct | Accepted |

---

## Requirements

### <a id="D01"></a>D01: Specify a small first release and defer the remaining candidates

- **Date:** 8 October 2026 (commit `b8e81ab`)
- **Context:** The first draft (7 to 8 October) listed 32 functional and 17 non-functional candidate requirements taken from the scenario. Many depended on unresolved policies or were efficiency improvements rather than core coordination.
- **Options considered:** (a) specify every candidate for the first release, (b) specify a core release and delete the rest, or (c) specify a core release and keep the rest as deferred requirements with a reason.
- **Decision:** Option (c). The first release was reduced to 12 functional and 6 non-functional requirements covering the core workflow: capturing requests, checking allocations, recording progress and changes, and protecting passenger information. All other candidates were moved to [deferred requirements](../requirements/03-deferred-requirements.md).
- **Rationale:** A smaller set can be specified properly (atomic, measurable and verifiable) instead of loosely. Keeping the deferred candidates with reasons preserves traceability from the scenario to a decision ([Gotel and Finkelstein, 1994](../references/01-text-sources.md#gotel)).
- **Consequences:** Scope must be held under control ([R11](../report/06-rules-and-uncertainty-register.md#R11)). Deferred items can be revisited once the related questions are answered.

### <a id="D02"></a>D02: Bring funder reporting and clinical-information removal into the first release

- **Date:** 9 October 2026 (commit `2f32849`)
- **Context:** After [D01](#D01), funder reports (then DFR21) and removal of clinical information (then DFR06) were deferred. On re-checking against the brief and scenario, both rest on explicit statements: summary reports "are required for funders", and referrers sometimes include diagnoses that the service does not need.
- **Options considered:** Keep both deferred, or specify them for the first release.
- **Decision:** Specify both for the first release as [FR13](../requirements/01-functional-requirements.md#FR13) and [FR14](../requirements/01-functional-requirements.md#FR14).
- **Rationale:** Without them, the first release could not meet a stated funder obligation or the data-minimisation constraint ([C06](../report/06-rules-and-uncertainty-register.md#C06), [C07](../report/06-rules-and-uncertainty-register.md#C07)). Report content could be made specific enough to test using a stated assumption ([A18](../report/05-assumptions.md#A18)).
- **Consequences:** Introduced risks [R12](../report/06-rules-and-uncertainty-register.md#R12) (clinical text surviving in change history) and [R13](../report/06-rules-and-uncertainty-register.md#R13) (small counts identifying passengers), both mitigated in the requirement wording.

### <a id="D03"></a>D03: Treat driver, vehicle and unavailability records as supporting data

- **Date:** 9 October 2026 (commit `2f32849`)
- **Context:** Earlier deferred candidates included storing driver records, storing vehicle records and recording unavailability. [FR05](../requirements/01-functional-requirements.md#FR05), [FR06](../requirements/01-functional-requirements.md#FR06) and [FR12](../requirements/01-functional-requirements.md#FR12) cannot work without this data.
- **Options considered:** Write each as its own requirement. Keep them deferred, or treat them as data implied by the requirements that use them.
- **Decision:** Treat them as supporting data, stated in a note under the [functional requirements](../requirements/01-functional-requirements.md) and shown in the [domain model](../report/10-domain-model.md).
- **Rationale:** Deferring them contradicted the first-release requirements that depend on them, while separate "store X" requirements would add little that is testable on its own.
- **Consequences:** The domain model, rather than the requirements list, is the place to check what driver and vehicle data is held.

### <a id="D04"></a>D04: Remove duplicate and unmeasurable non-functional candidates

- **Date:** 9 October 2026 (commit `2f32849`)
- **Context:** Three deferred non-functional candidates either repeated another requirement or could not be measured: "the system shall not store clinical diagnoses", "funder reports shall contain only anonymised data", and "the system shall support growth without a drop in performance".
- **Decision:** Remove them. The first two are now covered by [FR14](../requirements/01-functional-requirements.md#FR14) and [FR13](../requirements/01-functional-requirements.md#FR13). The load in the third is covered by the measurable target in [NFR02](../requirements/02-non-functional-requirements.md#NFR02).
- **Rationale:** A non-functional requirement should have a verifiable fit criterion ([Robertson and Robertson, 2012](../references/01-text-sources.md#robertson)), and duplicates make traceability harder to maintain.

### <a id="D05"></a>D05: Defer requirements that depend on unresolved policy instead of inventing a policy

- **Date:** 8 October 2026 (commits `b8e81ab`, `e201c3e`)
- **Context:** The scenario leaves eligibility review, provisional reservation, maximum waiting time and notification order undecided, and asks that uncertainty be identified rather than replaced with an invented policy.
- **Options considered:** Assume a default policy (for example, a 15-minute maximum wait) and specify against it, or defer the dependent requirements and raise a stakeholder question.
- **Decision:** Defer them ([DFR04](../requirements/03-deferred-requirements.md#DFR04), [DFR05](../requirements/03-deferred-requirements.md#DFR05), [DFR07](../requirements/03-deferred-requirements.md#DFR07), [DFR09](../requirements/03-deferred-requirements.md#DFR09), [DFR12](../requirements/03-deferred-requirements.md#DFR12), [DFR15](../requirements/03-deferred-requirements.md#DFR15)) and raise [Q01](../report/04-stakeholder-questions.md#Q01), [Q03](../report/04-stakeholder-questions.md#Q03), [Q05](../report/04-stakeholder-questions.md#Q05) and [Q07](../report/04-stakeholder-questions.md#Q07).
- **Rationale:** These are business policies for the network to set, not facts the analyst can supply. Recorded as constraint [C09](../report/06-rules-and-uncertainty-register.md#C09).
- **Consequences:** Risk [R01](../report/06-rules-and-uncertainty-register.md#R01). Where a deferred item affects a first-release feature, the gap is noted in place (for example, the open issue on [UC03](../report/07-use-case-model.md#UC03)).

### <a id="D06"></a>D06: Give non-functional requirements measurable targets based on stated assumptions

- **Date:** 8 October 2026 (commit `b8e81ab`)
- **Context:** The scenario gives no figures for performance, offline duration, availability, recovery or accessibility. Without figures, these requirements would read as "fast" or "reliable", which cannot be verified.
- **Options considered:** Leave the targets vague until stakeholders answer, or set explicit temporary figures.
- **Decision:** Set explicit figures, each recorded as an assumption ([A11](../report/05-assumptions.md#A11) to [A16](../report/05-assumptions.md#A16)) and linked to a stakeholder question ([Q09](../report/04-stakeholder-questions.md#Q09) to [Q13](../report/04-stakeholder-questions.md#Q13), [Q19](../report/04-stakeholder-questions.md#Q19)).
- **Rationale:** A stated, testable figure can be confirmed or corrected. A vague word cannot be tested at all.
- **Consequences:** Risk [R05](../report/06-rules-and-uncertainty-register.md#R05) that the targets are wrong. The figures also appear in the user story acceptance criteria (for example, the 8-hour limit in US04-AC3), which will need updating if the answers differ.

## Stakeholders and use cases

### <a id="D07"></a>D07: Treat referrers as offstage, with no supporting actors in the first release

- **Date:** 9 October 2026 (commit `2f32849`)
- **Context:** Referrers send requests by phone and email, but the scenario does not say whether they will use the system directly. Staff phone drivers and passengers today.
- **Decision:** Referrers are offstage stakeholders, marked as an assumption. There are no supporting actors, because the first release does not send messages itself ([A09](../report/05-assumptions.md#A09)).
- **Rationale:** Making referrers primary actors would add a referrer interface and access model that nothing in the scenario requires.
- **Consequences:** If referrers are given access, they become primary actors. If the system sends texts ([Q17](../report/04-stakeholder-questions.md#Q17)), the messaging service becomes a supporting actor. See the [stakeholder and actor catalogue](../report/03-stakeholder-and-actor-catalogue.md).

### <a id="D08"></a>D08: Model use cases at user-goal level without include or extend

- **Date:** 9 October 2026 (commit `78c3bd9`)
- **Context:** Checks such as vehicle capacity and driver authorisation could be drawn as separate included use cases.
- **Decision:** Each use case is a goal an actor completes in one session ([Cockburn, 2001](../references/01-text-sources.md#cockburn)). Capacity and authorisation checks are steps inside [UC03](../report/07-use-case-model.md#UC03). Only primary actors appear on the diagram.
- **Rationale:** The checks are not goals anyone pursues on their own, and include/extend relationships would add structure without adding meaning.

### <a id="D09"></a>D09: Write UC03 as the fully detailed use case

- **Date:** 9 October 2026 (commit `78c3bd9`)
- **Context:** Nine use cases were identified. One was to be written in full.
- **Decision:** Detail [UC03 Assign Driver and Vehicle](../report/07-use-case-model.md#UC03).
- **Rationale:** It has the richest scenario evidence (accessible-vehicle quotes, declined offers, uncertain finishing times, different return drivers) and the most business rules (BR03, BR04, BR05, BR08), so its alternative flows and exceptions exercise the most of the specification.

### <a id="D10"></a>D10: Use one Driver role for volunteer and employed drivers

- **Date:** 9 October 2026 (commit `78c3bd9`)
- **Context:** Volunteer and employed drivers have different rules (own car versus accessible vehicle, authorisation) but the same goal in the first release: recording journey progress.
- **Decision:** Model a general Driver actor, specialised by Volunteer driver and Employed driver, associated with [UC06](../report/07-use-case-model.md#UC06).
- **Rationale:** The differences are rules applied during assignment ([FR06](../requirements/01-functional-requirements.md#FR06)), not different goals. The same reasoning is applied in the domain model ([D19](#D19)).

## User stories and Gherkin

### <a id="D11"></a>D11: Select five user stories with the strongest scenario evidence

- **Date:** 10 October 2026 (commit `f45bc0d`)
- **Context:** Many requirements could be written as stories. Five were needed.
- **Decision:** Choose stories that each rest on a direct quote or statement in the scenario, meet the INVEST criteria ([Cohn, 2004](../references/01-text-sources.md#cohn)), and between them cover different actors and use cases: office staff (US01, US05), coordinator (US02, US03) and driver (US04).
- **Rationale:** Stories grounded in direct evidence are easier to justify and to test, and spreading them across actors shows the specification works from each point of view.

### <a id="D12"></a>D12: One feature file per story, tagged for traceability, with illustrative test data

- **Date:** 11 October 2026 (commit `a5149d7`)
- **Decision:** Each story has its own feature file in [`features/`](../features/). Each feature is tagged with its story, use case and requirement (for example `@US02 @UC03 @FR05`), each scenario has its own identifier (for example `@US02-S4`) referenced from the [user story backlog](../requirements/04-user-story-backlog.md), and scenarios are grouped under `Rule:` headings that state the business rule being tested. Names, vehicle capacities and times are illustrative test data, stated as such in each file.
- **Rationale:** Tags make it possible to trace from a failing scenario back through the specification ([Wynne and Hellesøy, 2012](../references/01-text-sources.md#wynne)). The scenario does not give real fleet capacities, so invented data is labelled rather than presented as fact. Boundary cases (capacity equal to need, the 8-hour offline limit) were included because errors cluster at boundaries.
- **Status:** Superseded by [D24](#D24). The tagging and `Rule:` conventions are kept in the remaining feature file.

### <a id="D13"></a>D13: Do not assume a threshold for a "late" cancellation

- **Date:** 11 October 2026 (commit `a5149d7`)
- **Context:** The scenario says late cancellations reduce availability but does not define "late".
- **Decision:** Record the notice given in hours and test the rule by contrasting a provider-caused and a passenger-caused cancellation at the same notice, instead of assuming a cut-off. The derived attribute `isLate` is also excluded from the domain model.
- **Rationale:** Consistent with [D05](#D05): a threshold is a policy for the network to set ([Q06](../report/04-stakeholder-questions.md#Q06)).

## Domain analysis and domain model

### <a id="D14"></a>D14: Use noun-phrase analysis and keep rejected candidates in a separate record

- **Date:** 12 to 15 October 2026 (commits `670e231` to `4d9f80b`)
- **Decision:** Identify candidate concepts by listing every noun phrase in the scenario ([Abbott, 1983](../references/01-text-sources.md#abbott), [Larman, 2004](../references/01-text-sources.md#larman)), merge synonyms under one preferred term, and classify each candidate. Retained candidates are shown in the [candidate concept analysis](../report/09-candidate-concept-analysis.md). Excluded ones are listed with reasons in [rejected-candidates.md](rejected-candidates.md).
- **Rationale:** Listing every noun shows nothing in the scenario was overlooked. Moving the roughly 50 exclusions out of the report keeps that section readable while still accounting for every candidate.

### <a id="D15"></a>D15: Model Appointment separately from TransportRequest

- **Date:** 15 October 2026 (commit `648feec`)
- **Options considered:** Appointment details as attributes of TransportRequest, or Appointment as its own class.
- **Decision:** Its own class, linked one-to-one with TransportRequest.
- **Rationale:** The appointment belongs to the healthcare provider and changes independently of the request ("especially when the clinic changes the appointment"). A separate class makes clear what changed and leaves room for one appointment needing more than one request later. See [Modelling Decisions](../report/09-candidate-concept-analysis.md#modelling-decisions).

### <a id="D16"></a>D16: Model outward and return as one JourneyStage class

- **Date:** 15 October 2026 (commit `648feec`)
- **Options considered:** Two classes (OutwardJourney, ReturnJourney). Attributes for both legs on Journey, or one JourneyStage class with a direction attribute.
- **Decision:** One JourneyStage class with a `direction` attribute. A Journey is made up of one or two stages.
- **Rationale:** Both stages have the same attributes, and a separate stage directly supports a different driver, vehicle and status for each ([FR08](../requirements/01-functional-requirements.md#FR08), [A05](../report/05-assumptions.md#A05)).
- **Consequences:** Depends on [Q04](../report/04-stakeholder-questions.md#Q04). Progress times, cancellations and contact attempts attach to the stage, not the journey.

### <a id="D17"></a>D17: Record travel needs as attributes of TransportRequest

- **Date:** 15 October 2026 (commit `648feec`)
- **Options considered:** A TravelNeed class. Attributes of Passenger, or attributes of TransportRequest.
- **Decision:** Attributes of TransportRequest.
- **Rationale:** Each need is a simple value (a number of spaces or yes/no), and needs can vary from trip to trip, for example a companion travelling on one journey but not the next.

### <a id="D18"></a>D18: Model Cancellation as a concept, not only a status

- **Date:** 15 October 2026 (commit `648feec`)
- **Options considered:** Represent a cancellation only as JourneyStage status "Cancelled", or as its own concept.
- **Decision:** Its own concept, while the stage status is still set to Cancelled for easy filtering.
- **Rationale:** A status alone would lose who cancelled, the reason, the notice given and whether the provider caused it, which [FR11](../requirements/01-functional-requirements.md#FR11) and [BR09](../report/06-rules-and-uncertainty-register.md#BR09) depend on, and could not show one cancellation covering both stages. See [Transactions and Historical Records](../report/10-domain-model.md#transactions-and-historical-records).

### <a id="D19"></a>D19: Use type attributes instead of subclasses for drivers and vehicles

- **Date:** 15 October 2026 (commit `648feec`)
- **Options considered:** Generalisation (VolunteerDriver and EmployedDriver, OwnCar and AccessibleVehicle), or a type attribute.
- **Decision:** `driverType` and `vehicleType` attributes. Plain associations are used throughout the model. Composition and generalisation were considered and not used.
- **Rationale:** The subtypes share the same attributes and differ only in the rules applied to them, so subclasses would carry no data of their own.

### <a id="D20"></a>D20: Record accessible-vehicle authorisation as a yes/no attribute

- **Date:** 15 October 2026 (commit `648feec`)
- **Options considered:** An association "Driver is authorised for Vehicle", or an attribute `accessibleAuthorised` on Driver.
- **Decision:** An attribute, following assumption [A04](../report/05-assumptions.md#A04).
- **Rationale:** Nothing in the scenario says authorisation differs between the two accessible vehicles or expires.
- **Consequences:** If authorisation turns out to be per vehicle or time-limited ([Q18](../report/04-stakeholder-questions.md#Q18)), this becomes an association (or an Authorisation concept with dates).

### <a id="D21"></a>D21: Link contact attempts to a journey stage, not a whole journey

- **Date:** 15 October 2026 (commit `648feec`)
- **Context:** [FR07](../requirements/01-functional-requirements.md#FR07) refers to contacting a driver "about a journey".
- **Decision:** ContactAttempt is associated with JourneyStage.
- **Rationale:** Because outward and return may have different drivers ([D16](#D16)), staff may be phoning different people for each stage. Linking attempts to the stage shows which stage is still uncovered.

### <a id="D22"></a>D22: Do not model confirmations or funder reports as classes

- **Date:** 15 October 2026 (commit `648feec`)
- **Decision:** Confirmations and funder reports are treated as outputs produced from stored data, not as conceptual classes.
- **Rationale:** Both are generated whenever needed and hold nothing of their own. Storing them would duplicate data that could fall out of date.

### <a id="D23"></a>D23: Treat Driver as both an actor and a conceptual class

- **Date:** 15 October 2026 (commit `4d9f80b`)
- **Context:** Drivers use the system to record progress ([UC06](../report/07-use-case-model.md#UC06)), but the system must also hold information about them: availability, preferences and accessible-vehicle authorisation.
- **Options considered:** Model drivers only as an actor, or as both an actor and a class.
- **Decision:** Both. The actor is the person interacting with the system. The class is the record kept about that person.
- **Rationale:** [FR06](../requirements/01-functional-requirements.md#FR06) and [FR12](../requirements/01-functional-requirements.md#FR12) depend on stored driver data, which an actor alone cannot hold. Office staff and the coordinator are not classes, because nothing about them needs to be remembered beyond a name in a change record.

## Later revisions

### <a id="D24"></a>D24: Keep a single feature file, for US03

- **Date:** 23 October 2026 (commit `09c3e21`)
- **Context:** On re-reading the brief, it asks for three to five concrete Gherkin examples, not a feature file for every story. Feature files had been written for all five stories ([D12](#D12)), giving about thirty scenarios.
- **Options considered:** Keep all five feature files, or keep one and verify the other stories' acceptance criteria through the verification methods already stated for their requirements.
- **Decision:** Keep [`US03-return-driver.feature`](../features/US03-return-driver.feature) and remove the other four. Trim US03 to five scenarios covering success (S1), a rule (S2), an alternative (S3), a failure (S4, an unsuitable vehicle rejected for the return stage, moved from the removed US02 file) and the confirmation rule (S5). The acceptance criteria of US01, US02, US04 and US05 remain in the [user story backlog](../requirements/04-user-story-backlog.md), each linked to the requirement test that verifies it.
- **Rationale:** US03 exercises the alternative flows of the detailed use case ([UC03](../report/07-use-case-model.md#UC03) 6a and 6b) and tests the decision to model outward and return as separate stages ([D16](#D16)), so it covers the most of the analysis in one file.
- **Consequences:** Boundary cases previously shown in Gherkin (exact vehicle capacity, the 8-hour offline limit) are now covered only by the acceptance criteria and requirement tests. The removed files remain in the version history.
