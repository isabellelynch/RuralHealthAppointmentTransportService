# Candidate Concept Analysis

Candidate concept analysis identifies the things the system must know about before any domain model is drawn. Every noun phrase in the scenario was listed in order, section by section, following the noun phrase technique of [Abbott (1983)](../references/01-text-sources.md#abbott) as adapted for conceptual modelling by [Larman (2004)](../references/01-text-sources.md#larman). About 120 candidates were found. Synonyms were merged under one preferred term, so that the same word is used throughout the report, and each candidate was then classified. **Conceptual classes** have their own identity and attributes, and the system records many of them. **Attributes or values** are simple data that describe a class. **Actors** are people or roles that use the system, as modelled in the [use case model](07-use-case-model.md). **Operations or events** are things that happen rather than things that are kept.

The table below shows the candidates that remain in the model. The remaining candidates were excluded as out of scope, deferred, derived from other data, too vague, or tied to today's tools rather than the business. They are listed with reasons in the [rejected candidates record](../decisions/09-rejected-candidates.md), so every noun in the scenario is accounted for.

| Candidate (synonyms merged) | Conceptual class | Attribute / value | Actor | Operation / event | Reason |
|---|:-:|:-:|:-:|:-:|---|
| **Conceptual classes** | | | | | |
| Passenger *(residents, regular passengers, new passengers, passenger information)* | X | | | | Has identity and contact details and makes many requests over time. Interacts through staff, so not an actor. |
| Contact person *(contact, family member)* | X | | | | Name and phone number; may be the passenger or a family member ([FR01](../requirements/01-functional-requirements.md#FR01)). |
| Transport request *(request)* | X | | | | Created, amended and allocated, with its own lifecycle ([FR01](../requirements/01-functional-requirements.md#FR01)–[FR03](../requirements/01-functional-requirements.md#FR03)). |
| Appointment *(planned healthcare appointment)* | X | | | | Has a location, date, time and estimated finishing time, and can be changed by the provider independently of the journey. |
| Journey *(journeys, individual journeys)* | X | | | | The trip for one request, made up of an outward and a return stage ([FR08](../requirements/01-functional-requirements.md#FR08)). |
| Journey stage *(outward stage, return stage, return journey, outward and return arrangements)* | X | | | | Each stage has its own driver, collection window and status ([FR08](../requirements/01-functional-requirements.md#FR08), [A05](05-assumptions.md#A05)). |
| Driver *(trained volunteer drivers, employed drivers)* | X | | X | | Stored record of availability, preferences and authorisation ([FR06](../requirements/01-functional-requirements.md#FR06), [FR12](../requirements/01-functional-requirements.md#FR12)), and the actor who records progress ([UC06](07-use-case-model.md#UC06)). |
| Vehicle *(own cars, accessible vehicles)* | X | | | | Capacity is checked on assignment ([FR05](../requirements/01-functional-requirements.md#FR05)); accessible vehicles need an authorised driver ([FR06](../requirements/01-functional-requirements.md#FR06)). |
| Contact attempt *(unsuccessful contacts)* | X | | | | Many per journey, each with date, time and outcome ([FR07](../requirements/01-functional-requirements.md#FR07)). |
| Change record *(changes)* | X | | | | Many per request, each with old value, new value, date and user ([FR03](../requirements/01-functional-requirements.md#FR03)). |
| Cancellation | X | | | | Who cancelled, reason, notice given and whether the provider caused it ([FR11](../requirements/01-functional-requirements.md#FR11)). |
| Unavailability period *(driver availability)* | X | | | | A driver unavailable from one date to another, with a reason ([FR12](../requirements/01-functional-requirements.md#FR12)). |
| **Attributes and values** | | | | | |
| Appointment details: *appointment location, appointment date, appointment time(s), estimated duration, expected finishing time(s)* | | X | | | Attributes of Appointment. Estimated duration and finishing time are merged; an estimate is accepted ([A02](05-assumptions.md#A02)). |
| Request details: *collection address, agreed address, notes* | | X | | | Attributes of Transport request; clinical text can be removed from notes ([FR14](../requirements/01-functional-requirements.md#FR14)). |
| Travel needs: *passenger needs, practical travel needs, practical assistance information, practical needs (shared with driver), wheelchair space, assistance entering a vehicle, room for a walking aid, companion, acceptability of sharing* | | X | | | Attributes of Transport request ([FR04](../requirements/01-functional-requirements.md#FR04)). Simple values that can vary from one trip to the next. |
| Vehicle capacity: *seats, wheelchair spaces, companion seats* | | X | | | Attributes of Vehicle, compared with travel needs ([FR05](../requirements/01-functional-requirements.md#FR05)). |
| Driver details: *general availability, familiar areas, driving after dark, authorised drivers* | | X | | | Attributes of Driver; authorisation is a yes/no value ([A04](05-assumptions.md#A04)). |
| Journey details: *collection window, expected arrangements, contribution towards travel costs, driver or service contact* | | X | | | Attributes of Journey and Journey stage, shown on the confirmation ([FR09](../requirements/01-functional-requirements.md#FR09)). Taking payment is out of scope. |
| Progress: *collection, arrival, return completion* | | X | | X | Events recorded by the driver, stored as times on Journey stage ([FR10](../requirements/01-functional-requirements.md#FR10)). |
| Status values: *unallocated requests, incomplete journey records, provisional assignment, provisional journeys, confirmed journeys* | | X | | | Values of the status attribute on Transport request and Journey. Provisional reservation rules are deferred ([Q03](04-stakeholder-questions.md#Q03)). |
| Cancellation details: *short notice, late cancellations, cancellation reasons, cancellation responsibility, healthcare provider, clinic* | | X | | | Attributes of Cancellation. The provider is recorded only as "provider caused" ([BR09](06-rules-and-uncertainty-register.md#BR09), [A06](05-assumptions.md#A06)). No "late" threshold is defined. |
| Unavailability reasons: *illness, vehicle problems, severe weather* | | X | | | Values of the reason on Unavailability period. |
| Different driver | | X | | | A relationship, not a concept: each Journey stage has its own Driver. |
| **Actors** | | | | | |
| Office staff *(staff)* | | | X | | Primary actor ([UC01](07-use-case-model.md#UC01), [UC07](07-use-case-model.md#UC07)). |
| Coordinator | | | X | | Primary actor ([UC03](07-use-case-model.md#UC03), [UC09](07-use-case-model.md#UC09)). |
| Referrer *(referring organisations, local support organisation)* | | | X | | Offstage actor. Storing referrer details is deferred ([DFR01](../requirements/03-deferred-requirements.md#DFR01)). |
| **Operations and events** | | | | | |
| Driver assignment *(allocation)* | | | | X | The act of assigning ([UC03](07-use-case-model.md#UC03)); recorded as the link between Journey stage, Driver and Vehicle. |
| Several calls | | | | X | Each call is recorded as a Contact attempt ([UC04](07-use-case-model.md#UC04)). |
| Different collection address | | | | X | A change, recorded as a Change record ([UC02](07-use-case-model.md#UC02)). |
| Confirmation | | | | X | Produced from journey data ([UC05](07-use-case-model.md#UC05), [FR09](../requirements/01-functional-requirements.md#FR09)); holds no data of its own. |
| Summary reports | | | | X | Produced on demand from stored data ([UC09](07-use-case-model.md#UC09), [FR13](../requirements/01-functional-requirements.md#FR13)); not stored. |

## Conceptual Classes Carried Forward

These classes go forward to the [domain model](10-domain-model.md):

| Class | Attributes | Requirement|
|---|---|---|
| Passenger | name, home address, phone | FR01 |
| Contact person | name, phone, relationship to passenger | FR01 |
| Transport request | collection address, travel needs, agreement to share, notes, status | FR01, FR02, FR04, FR14 |
| Appointment | location, date, time, estimated finishing time | FR01, A02 |
| Journey | status, return arrangement, travel contribution | FR08, FR09 |
| Journey stage | direction (outward / return), collection window, collection, arrival and completion times, status | FR08, FR10 |
| Driver | name, phone, driver type (volunteer / employed), general availability, preferred areas, drives after dark, accessible-vehicle authorisation | FR06, FR12 |
| Vehicle | registration, vehicle type (own car / accessible), seats, wheelchair spaces, companion seats | FR05 |
| Contact attempt | date, time, outcome | FR07 |
| Change record | field, old value, new value, date, user | FR03 |
| Cancellation | who cancelled, reason, notice given, provider caused | FR11 |
| Unavailability period | start date, end date, reason | FR12 |

## Modelling Decisions

- **Driver is both a class and an actor.** As an actor, a driver records journey progress. As a class, the system stores drivers' availability, preferences and authorisation, which FR06 and FR12 depend on. The two views are kept consistent: the actor is the person, and the class is the record about that person.
- **Appointment is separate from Transport request.** The appointment belongs to the healthcare provider and can change on its own ("especially when the clinic changes the appointment"). Keeping it separate makes clear what changed, and leaves room for one appointment needing more than one request in future.
- **Outward and return are one class, Journey stage, rather than two.** Both stages have the same attributes, so a single class with a direction attribute avoids duplication and directly supports a different driver on each stage (FR08, A05).
- **Travel needs are attributes, not a class.** Each need is a simple value (a number of spaces or a yes/no), and needs can vary by request. For example, a companion may travel on one trip and not another.
- **Funder report and confirmation are not classes.** Both are produced from stored data whenever needed and hold nothing of their own. Storing them would duplicate data and risk it falling out of date.
- **Volunteer and employed drivers, and own cars and accessible vehicles, are types rather than subclasses.** They share the same attributes and differ only in the rules applied to them, such as accessible-vehicle authorisation (FR06). A type attribute records the difference without adding subclasses that carry no data of their own.