# Candidate Concept Analysis

Candidate concept analysis identifies the things the system must know about before any domain model is drawn. Every noun phrase in the scenario was listed in order, section by section, following the noun phrase technique of [Abbott (1983)](../references/01-text-sources.md#abbott) as adapted for conceptual modelling by [Larman (2004)](../references/01-text-sources.md#larman). Synonyms were merged under one preferred term, so that the same word is used throughout the report and each candidate was then classified and given a decision: **keep** it as a concept or actor, **merge** it into another term, **convert** it into an attribute, value or association or **remove** it. **Conceptual classes** have their own identity and attributes and the system records many of them. **Attributes or values** are simple data that describe a class. **Actors** are people or roles that use the system, as modelled in the [use case model](07-use-case-model.md). **Operations or events** are things that happen rather than things that are kept.

The table below shows the candidates that remain in the model. The remaining candidates were excluded as out of scope, deferred, derived from other data, too vague or tied to today's tools rather than the business. They are listed with reasons in the [rejected candidates record](../decisions/09-rejected-candidates.md), so every noun in the scenario is accounted for.

| Candidate (synonyms merged) | Conceptual class | Attribute / value | Actor | Operation / event | Decision | Reason |
|---|:-:|:-:|:-:|:-:|---|---|
| **Conceptual classes** | | | | | | |
| Passenger *(residents, regular passengers, new passengers, passenger information)* | X | | | Keep, merge synonyms | | Has identity and contact details and makes many requests over time. Interacts through staff, so not an actor. |
| Contact person *(contact, family member)* | X | | | Keep, merge family member | | Name and phone number, may be the passenger or a family member ([FR01](../requirements/01-functional-requirements.md#FR01)). |
| Transport request *(request)* | X | | | Keep | | Created, amended and allocated, with its own lifecycle ([FR01](../requirements/01-functional-requirements.md#FR01)–[FR03](../requirements/01-functional-requirements.md#FR03)). |
| Appointment *(planned healthcare appointment)* | X | | | Keep | | Has a location, date, time and estimated finishing time, and can be changed by the provider independently of the journey. |
| Journey *(journeys, individual journeys)* | X | | | Keep | | The trip for one request, made up of an outward and a return stage ([FR08](../requirements/01-functional-requirements.md#FR08)). |
| Journey stage *(outward stage, return stage, return journey, outward and return arrangements)* | X | | | Keep, merge outward and return | | Each stage has its own driver, collection window and status ([FR08](../requirements/01-functional-requirements.md#FR08), [A05](05-assumptions.md#A05)). |
| Driver *(trained volunteer drivers, employed drivers)* | X | | X | Keep, merge driver kinds as a type | | Stored record of availability, preferences and authorisation ([FR06](../requirements/01-functional-requirements.md#FR06), [FR12](../requirements/01-functional-requirements.md#FR12)), and the actor who records progress ([UC06](07-use-case-model.md#UC06)). |
| Vehicle *(own cars, accessible vehicles)* | X | | | Keep, merge vehicle kinds as a type | | Capacity is checked on assignment ([FR05](../requirements/01-functional-requirements.md#FR05)), accessible vehicles need an authorised driver ([FR06](../requirements/01-functional-requirements.md#FR06)). |
| Contact attempt *(unsuccessful contacts)* | X | | | Keep | | Many per journey, each with date, time and outcome ([FR07](../requirements/01-functional-requirements.md#FR07)). |
| Change record *(changes)* | X | | | Keep | | Many per request, each with old value, new value, date and user ([FR03](../requirements/01-functional-requirements.md#FR03)). |
| Cancellation | X | | | Keep | | Who cancelled, reason, notice given and whether the provider caused it ([FR11](../requirements/01-functional-requirements.md#FR11)). |
| Unavailability period *(driver availability)* | X | | | Keep | | A driver unavailable from one date to another, with a reason ([FR12](../requirements/01-functional-requirements.md#FR12)). |
| **Attributes and values** | | | | | | |
| Appointment details: *appointment location, appointment date, appointment time(s), estimated duration, expected finishing time(s)* | | X | | | Convert to attributes of Appointment | Attributes of Appointment. Estimated duration and finishing time are merged, an estimate is accepted ([A02](05-assumptions.md#A02)). |
| Request details: *collection address, agreed address, notes* | | X | | | Convert to attributes of TransportRequest | Attributes of Transport request, clinical text can be removed from notes ([FR14](../requirements/01-functional-requirements.md#FR14)). |
| Travel needs: *passenger needs, practical travel needs, practical assistance information, practical needs (shared with driver), wheelchair space, assistance entering a vehicle, room for a walking aid, companion, acceptability of sharing* | | X | | | Convert to attributes of TransportRequest | Attributes of Transport request ([FR04](../requirements/01-functional-requirements.md#FR04)). Simple values that can vary from one trip to the next. |
| Vehicle capacity: *seats, wheelchair spaces, companion seats* | | X | | | Convert to attributes of Vehicle | Attributes of Vehicle, compared with travel needs ([FR05](../requirements/01-functional-requirements.md#FR05)). |
| Driver details: *general availability, familiar areas, driving after dark, authorised drivers* | | X | | | Convert to attributes of Driver | Attributes of Driver, authorisation is a yes/no value ([A04](05-assumptions.md#A04)). |
| Journey details: *collection window, expected arrangements, contribution towards travel costs, driver or service contact* | | X | | | Convert to attributes of Journey and JourneyStage | Attributes of Journey and Journey stage, shown on the confirmation ([FR09](../requirements/01-functional-requirements.md#FR09)). Taking payment is out of scope. |
| Progress: *collection, arrival, return completion* | | X | | X | Convert to time attributes of JourneyStage | Events recorded by the driver, stored as times on Journey stage ([FR10](../requirements/01-functional-requirements.md#FR10)). |
| Status values: *unallocated requests, incomplete journey records, provisional assignment, provisional journeys, confirmed journeys* | | X | | | Convert to status values | Values of the status attribute on Transport request and Journey. Provisional reservation rules are deferred ([Q03](04-stakeholder-questions.md#Q03)). |
| Cancellation details: *short notice, late cancellations, cancellation reasons, cancellation responsibility, healthcare provider, clinic* | | X | | | Convert to attributes of Cancellation | Attributes of Cancellation. The provider is recorded only as "provider caused" ([BR09](06-rules-and-uncertainty-register.md#BR09), [A06](05-assumptions.md#A06)). No "late" threshold is defined. |
| Unavailability reasons: *illness, vehicle problems, severe weather* | | X | | | Convert to values of UnavailabilityPeriod reason | Values of the reason on Unavailability period. |
| Different driver | | X | | | Convert to an association | A relationship, not a concept: each Journey stage has its own Driver. |
| **Actors** | | | | | | |
| Office staff *(staff)* | | | X | Keep as actor, not a class | | Primary actor ([UC01](07-use-case-model.md#UC01), [UC07](07-use-case-model.md#UC07)). |
| Coordinator | | | X | Keep as actor, not a class | | Primary actor ([UC03](07-use-case-model.md#UC03), [UC09](07-use-case-model.md#UC09)). |
| Referrer *(referring organisations, local support organisation)* | | | X | Keep as offstage actor, not modelled | | Offstage actor. Storing referrer details is deferred ([DFR01](../requirements/03-deferred-requirements.md#DFR01)). |
| **Operations and events** | | | | | | |
| Driver assignment *(allocation)* | | | | X | Convert to associations | The act of assigning ([UC03](07-use-case-model.md#UC03)), recorded as the link between Journey stage, Driver and Vehicle. |
| Several calls | | | | X | Convert to ContactAttempt | Each call is recorded as a Contact attempt ([UC04](07-use-case-model.md#UC04)). |
| Different collection address | | | | X | Convert to ChangeRecord | A change, recorded as a Change record ([UC02](07-use-case-model.md#UC02)). |
| Confirmation | | | | X | Remove: produced from stored data | Produced from journey data ([UC05](07-use-case-model.md#UC05), [FR09](../requirements/01-functional-requirements.md#FR09)), holds no data of its own. |
| Summary reports | | | | X | Remove: produced from stored data | Produced on demand from stored data ([UC09](07-use-case-model.md#UC09), [FR13](../requirements/01-functional-requirements.md#FR13)), not stored. |

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

## Glossary

The glossary fixes one preferred term for each concept, actor and key value and maps the scenario's synonyms onto it.

| Term | Kind | Definition | Scenario synonyms merged |
|---|---|---|---|
| Accessible-vehicle authorisation | Value | Whether a driver is permitted to drive the network's accessible vehicles, a yes/no value for now ([A04](05-assumptions.md#A04)). | authorised drivers |
| Appointment | Concept | The planned healthcare appointment a passenger must attend, with its location, date, time and estimated finishing time. | planned healthcare appointment |
| Cancellation | Concept | The withdrawal of one or both stages of a journey, recording who cancelled, why, the notice given and whether the provider caused it. | late cancellation, cancellation reason |
| Change record | Concept | One recorded change to a request: the field, old and new value, when and by whom. | changes |
| Clinical information | Value (excluded) | Any diagnosis, medical history or clinical detail. Not required by the service and removed when received ([FR14](../requirements/01-functional-requirements.md#FR14)). | clinical diagnosis, medical history |
| Collection window | Value | The period within which the passenger will be collected, given instead of an exact time. | exact collection time (rejected) |
| Confirmation | Output | The information given to a passenger once a journey is arranged, produced from stored data, not stored itself. | – |
| Contact attempt | Concept | One call to one driver about one journey stage, and its outcome: accepted, declined or no answer. | unsuccessful contacts, several calls |
| Contact person | Concept | The person staff contact about a request: the passenger or someone acting for them. | contact, family member |
| Coordinator | Actor | The staff member who allocates drivers and vehicles and oversees journeys. | – |
| Driver | Concept and actor | A person who may be assigned journey stages, of type volunteer (own car) or employed (accessible vehicle). | trained volunteer driver, employed driver |
| Funder report | Output | An anonymised summary of service use for a date range, produced on demand, not stored. | summary reports |
| Journey | Concept | The arranged trip that fulfils one transport request, made up of an outward and usually a return stage. | individual journey |
| Journey stage | Concept | The outward or return part of a journey, each with its own driver, vehicle, collection window and status. | outward stage, return stage, return journey |
| Mandatory details | Value | The request details that must be present before allocation ([A01](05-assumptions.md#A01)). | – |
| Office staff | Actor | Staff who take requests, contact drivers, confirm journeys and record changes. | staff |
| Outstanding | Status value | A journey stage that is not yet assigned, typically a return whose time is uncertain. | – |
| Passenger | Concept | An eligible resident who travels to healthcare appointments using the service. | resident, regular passenger, new passenger |
| Provider-caused | Value | A cancellation or change caused by the healthcare provider rather than the passenger, not counted against the passenger ([BR09](06-rules-and-uncertainty-register.md#BR09)). | – |
| Provisional assignment | Status value (unresolved) | An assignment awaiting confirmation, whether it reserves the driver or vehicle is unresolved ([Q03](04-stakeholder-questions.md#Q03)). | provisional journey |
| Ready for allocation | Status value | A request whose mandatory details are all present ([BR03](06-rules-and-uncertainty-register.md#BR03)). | – |
| Referrer | Actor (offstage) | A person or organisation that asks for transport on a passenger's behalf. | referring organisation, local support organisation |
| Return arrangement | Value | Whether the driver will wait, come back later or be replaced by another driver for the return. | expected arrangements |
| Transport request | Concept | A request for transport to one appointment, with the passenger's travel needs. | request |
| Travel contribution | Value | Any contribution towards travel costs the passenger is told about, payment itself is out of scope. | contribution towards travel costs |
| Travel needs | Values | Practical needs for one trip: wheelchair spaces, companion seats, boarding assistance, walking aid and agreement to share. | practical travel needs, passenger needs |
| Unavailability period | Concept | A period when a driver cannot drive, with the reason. | driver availability |
| Vehicle | Concept | A volunteer's own car or one of the network's accessible vehicles, with its seating capacity. | own car, accessible vehicle |

## Modelling Decisions

The main modelling decisions are summarised below, alternatives and consequences are recorded in the [decision log](../decisions/00-decision-log.md#domain-analysis-and-domain-model).

| Decision | Reason | Record |
|---|---|---|
| Driver is both a class and an actor. | The actor is the person recording progress, the class is the stored record of availability and authorisation that FR06 and FR12 need. | [D23](../decisions/00-decision-log.md#D23) |
| Appointment is separate from Transport request. | The clinic can change the appointment independently ("especially when the clinic changes the appointment"). | [D15](../decisions/00-decision-log.md#D15) |
| Outward and return are one class, Journey stage. | Both have the same attributes, a direction attribute supports a different driver per stage (FR08). | [D16](../decisions/00-decision-log.md#D16) |
| Travel needs are attributes, not a class. | Each is a simple value that can vary from one trip to the next. | [D17](../decisions/00-decision-log.md#D17) |
| Funder report and confirmation are not classes. | Both are produced from stored data and hold nothing of their own. | [D22](../decisions/00-decision-log.md#D22) |
| Driver and vehicle kinds are types, not subclasses. | They share attributes and differ only in the rules applied, such as authorisation (FR06). | [D19](../decisions/00-decision-log.md#D19) |

