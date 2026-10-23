# Scenario Interpretation

This section interprets the scenario before any requirements are written. Step 1 extracts the evidence and states what each item implies for the system. Step 2 traces the symptoms people experience back to their underlying problems and likely consequences. The business problem statement then summarises the case for change. Keeping observation separate from interpretation reduces the risk of jumping to a solution before the problem is understood ([Sommerville, 2016](../references/01-text-sources.md#sommerville), [IIBA, 2015](../references/01-text-sources.md#babok)). Where the scenario is incomplete, the gap is flagged as an uncertainty and linked to a stakeholder question rather than resolved by invention.

## Step 1: Identify evidence from the scenario

Each row pairs a piece of scenario evidence with what it tells us about the service and the system it needs.

| Evidence from the scenario | What it tells us |
|---|---|
| **Organisation and scope** | |
| Not-for-profit service for planned healthcare appointments. No emergency transport, the first release excludes emergency dispatch, healthcare records and clinical decision-making. | The system handles planned, non-emergency bookings only and must not store or depend on clinical data. This is a firm scope boundary. |
| Volunteer drivers use their own cars, two accessible vehicles are operated by employed drivers. | There are two driver types with different rules (availability, authorisation, vehicle ownership) so drivers and vehicles must be recorded separately. |
| Staff coordinate using a shared calendar, a spreadsheet and paper driver sheets. | Information is fragmented and duplicated, making errors and missed updates highly likely. This is the main justification for a new system. |
| **Requests and eligibility** | |
| Requests arrive by telephone, referral email or local support organisations. | Request capture needs one consistent format whatever the channel. |
| Requests may lack a finishing time or name a family member as contact and several calls may be needed before a request is ready. | Requests pass through stages before allocation. Minimum required details must be defined and the contact person recorded separately from the passenger ([Q08](04-stakeholder-questions.md#Q08)). |
| The service is for people with no reasonable transport alternative who can travel safely. New passengers may need an eligibility discussion and the review frequency is unclear. | **Uncertainty:** eligibility evidence and the review period are not defined ([Q01](04-stakeholder-questions.md#Q01)). |
| Practical needs are recorded: wheelchair space, boarding assistance, walking aid, companion and willingness to share. | These needs drive vehicle and driver matching so they must be structured data rather than free text. |
| Referrers sometimes include clinical diagnoses in emails or notes. | Unnecessary sensitive data is entering the service. The system must allow it to be removed ([Q22](04-stakeholder-questions.md#Q22)). |
| **Planning and allocation** | |
| Staff try to limit unnecessary travel. Shared journeys depend on times, needs, vehicle capacity and whether sharing is acceptable. | Sharing requires both passenger agreement and compatibility checks. |
| Volunteers give general availability, may decline, may prefer familiar areas or avoid driving after dark. | Driver preferences and restrictions must be recorded and considered during allocation. |
| Accessible vehicles need authorised drivers and may already be committed. Accessible-vehicle driver: "Wheelchair space and companion seating must be known before the vehicle is assigned." | Driver authorisation, vehicle capacity and existing commitments must all be checked before assignment. |
| Office staff: "the spreadsheet only shows the person who finally accepted." | Contact attempts and refusals are lost so staff repeat calls and real driver capacity is invisible. |
| A journey may be provisionally assigned. Staff disagree whether this reserves the driver. | **Uncertainty:** the provisional-assignment rule is undefined, risking double-booking or idle drivers ([Q03](04-stakeholder-questions.md#Q03)). |
| **Confirmation and completion** | |
| Passengers should receive a collection window, a contact, the arrangements and any cost contribution, exact times are hard to promise. | Confirmation content is defined, and collection is expressed as a window rather than a fixed time ([Q15](04-stakeholder-questions.md#Q15)). |
| Drivers need directions and assistance information. Volunteer driver: "I do not need a medical history." | Information must be shared on a need-to-know basis so different roles need different views ([Q02](04-stakeholder-questions.md#Q02)). |
| The driver records collection, arrival and return completion. | Journey progress is captured by drivers in the field, often with poor coverage. |
| A passenger may not be ready, may not be at the address or may decide not to travel. There is no agreed maximum waiting time. | **Uncertainty:** no waiting policy exists and these outcomes need to be recordable ([Q05](04-stakeholder-questions.md#Q05)). |
| Coordinator: "the finishing time may be little more than a guess." A different driver may complete the return. Outward and return are not always recorded separately. Passenger: "Please tell me whether the driver is waiting or coming back later." | Outward and return should be separate stages, each with its own driver and status and the return arrangement must be told to the passenger ([Q04](04-stakeholder-questions.md#Q04)). |
| **Changes and disruption** | |
| Referrer: "A request can change after I send it, especially when the clinic changes the appointment." | Requests must be amendable, with a history of what changed. |
| Drivers may become unavailable through illness, vehicle problems or severe weather. Replacements must be found without disclosing passenger information more widely than necessary. | Affected journeys must be identified quickly and passenger details limited until a replacement accepts. |
| If no transport can be provided, the passenger and referrer must be told promptly. Who to contact first is unclear. | **Uncertainty:** the notification order is undefined ([Q07](04-stakeholder-questions.md#Q07)). |
| Late cancellations reduce availability, but passengers should not be disadvantaged by provider changes. Reasons are recorded inconsistently. | Each cancellation needs a standard reason and a record of who caused it ([Q06](04-stakeholder-questions.md#Q06)). |
| **Information and users** | |
| The coordinator needs views of unallocated, provisional and confirmed journeys, accessible-vehicle demand, driver availability, changes and incomplete records. | This defines the coordinator's monitoring needs. |
| Summary reports are required for funders but should not identify passengers unnecessarily. | Reporting must be aggregated and anonymised. ([Q21](04-stakeholder-questions.md#Q21)). |
| Office staff, volunteer drivers, employed drivers and referrers need different information. | Access must be controlled by role. |
| Mobile coverage is uneven. Some volunteers prefer printed journey sheets. | Driver features cannot rely on a constant connection and paper must remain an option. ([Q11](04-stakeholder-questions.md#Q11), [Q14](04-stakeholder-questions.md#Q14)). |

## Step 2: Identify the underlying problems and likely consequences

Symptoms are what staff, drivers and passengers experience day to day. The underlying problem is the cause that a new system or a new policy must address. Problem identifiers (P01 to P13) are used in the outcomes below and the [traceability matrix](11-traceability-matrix.md).

| ID | Observation or symptom | Underlying problem | Likely consequence |
|---|---|---|---|
| <a id="P01"></a>P01 | Journeys are coordinated across a shared calendar, a spreadsheet and paper sheets. | No single, reliable source of journey information. | Records conflict or go out of date, and staff waste time cross-checking. Errors grow with demand. |
| <a id="P02"></a>P02 | Requests arrive without finishing times or with a family member as contact, needing several calls. | No standard request format or minimum required information. | Allocation is delayed and journeys may be planned on incomplete or incorrect details. |
| <a id="P03"></a>P03 | Staff are unsure how often eligibility should be reviewed. | No defined eligibility policy or review process. | Decisions are inconsistent. Limited capacity may go to people who no longer qualify, or eligible people may be refused. |
| <a id="P04"></a>P04 | Diagnoses arrive in referral emails and replacement drivers are sought with no defined way to limit what they see. | No control over what personal data is collected or who can see it. | Sensitive data is held unnecessarily and may be over-shared, breaching data protection law. |
| <a id="P05"></a>P05 | Only the accepting driver is recorded. Volunteer preferences are known informally. | Driver availability, preferences and refusals are not captured in a structured way. | The same volunteers are called repeatedly, unsuitable offers are made and knowledge is lost when staff are absent. |
| <a id="P06"></a>P06 | Staff disagree about provisional assignments. Accessible vehicles may already be committed. | No reservation rule and vehicle commitments are not checked against passenger needs. | Double-booking, idle vehicles or the wrong vehicle being sent could cause a missed appointment. |
| <a id="P07"></a>P07 | Outward and return arrangements are not recorded separately. | A journey is treated as one event rather than two stages. | Confusion when plans change. A passenger may be unsure of the return or left stranded. |
| <a id="P08"></a>P08 | There is no agreed maximum waiting time. | No waiting policy for passengers not ready or appointments that overrun. | Inconsistent driver decisions, wasted driver time and knock-on delays. |
| <a id="P09"></a>P09 | Appointments change at short notice after the request is sent. | No structured process for amending requests and tracking changes. | Drivers work from outdated details, causing missed or wasted journeys. |
| <a id="P10"></a>P10 | Cancellation reasons are recorded inconsistently. | No standard cancellation categories or record of responsibility. | Passengers may be blamed for provider changes and lost capacity cannot be analysed. |
| <a id="P11"></a>P11 | It is unclear who to contact first when the passenger cannot be reached. | No defined notification or escalation procedure. | The passenger is not told and misses the appointment or information goes to the wrong person. |
| <a id="P12"></a>P12 | The coordinator lacks an overview and funder reports must be produced without identifying passengers. | Request and journey status is not tracked consistently in one place. | Requests are overlooked and funder reports are slow, inaccurate or risk identifying passengers. |
| <a id="P13"></a>P13 | Mobile coverage is uneven and some volunteers prefer printed sheets. | Information reaches drivers through mixed, unreliable channels. | Drivers miss late changes and printed sheets containing personal data may be lost. |

## Business Problem Statement

South Kerry Community Travel Network is a not-for-profit service that helps eligible rural residents travel to planned healthcare appointments, using trained volunteer drivers and two accessible vehicles with employed drivers. Requests arrive by telephone, referral email and local support organisations. Staff coordinate journeys using a shared calendar, a spreadsheet and paper driver sheets.

As demand has increased, this approach has become unreliable. Requests often arrive incomplete so several calls may be needed before a journey can be allocated. Eligibility is discussed informally and never formally reviewed. Allocation is slow because driver availability, declined offers and accessible-vehicle commitments are not reliably recorded. Outward and return journeys are not always recorded separately. Changes and cancellations are recorded inconsistently and clinical information is sometimes received even though it is not needed.

As a result, staff and drivers spend unnecessary time on coordination, passengers can be unsure whether their driver will wait or return later and the coordinator lacks a reliable overview of journeys. Passenger privacy is put at risk and funder reports are difficult to produce without identifying passengers. These issues increase administrative effort, reduce confidence in the service's records and may contribute to late or missed appointments. Most of them trace back to three root causes: no single source of information, several undefined policies and no control over who sees personal data.

## Desired Outcomes

Outcomes are stated in business terms, not as features, so that requirements can be judged against them. P03, P08 and P11 are policy gaps that software cannot close, so their outcome is an agreed policy.

| ID | Desired outcome | Problems addressed | Main requirements |
|----|-----------------|--------------------|-------------------|
| <a id="O01"></a>O01 | Staff and the coordinator work from one reliable, up-to-date record of every request and journey. | [P01](#P01), [P12](#P12) | [FR01](../requirements/01-functional-requirements.md#FR01), [FR03](../requirements/01-functional-requirements.md#FR03), [FR08](../requirements/01-functional-requirements.md#FR08) |
| <a id="O02"></a>O02 | A request is only allocated once its essential details are known and missing details are obvious. | [P02](#P02) | [FR01](../requirements/01-functional-requirements.md#FR01), [FR02](../requirements/01-functional-requirements.md#FR02) |
| <a id="O03"></a>O03 | Every allocation suits the passenger's needs, the vehicle's capacity and the driver's authorisation and no driver is contacted twice about the same stage without staff knowing. | [P05](#P05), [P06](#P06) | [FR04](../requirements/01-functional-requirements.md#FR04) to [FR07](../requirements/01-functional-requirements.md#FR07) |
| <a id="O04"></a>O04 | Passengers know when they will be collected, who to contact, what they may contribute and how they will get home. | [P07](#P07) | [FR08](../requirements/01-functional-requirements.md#FR08), [FR09](../requirements/01-functional-requirements.md#FR09) |
| <a id="O05"></a>O05 | Changes, cancellations and driver unavailability are recorded consistently and passengers are not penalised for provider changes. | [P09](#P09), [P10](#P10) | [FR03](../requirements/01-functional-requirements.md#FR03), [FR11](../requirements/01-functional-requirements.md#FR11), [FR12](../requirements/01-functional-requirements.md#FR12) |
| <a id="O06"></a>O06 | Personal information is collected and shared only where needed and no clinical information is kept. | [P04](#P04) | [FR14](../requirements/01-functional-requirements.md#FR14), [NFR01](../requirements/02-non-functional-requirements.md#NFR01) |
| <a id="O07"></a>O07 | Journey progress reaches the office even where mobile coverage is poor. | [P13](#P13) | [FR10](../requirements/01-functional-requirements.md#FR10), [NFR03](../requirements/02-non-functional-requirements.md#NFR03) |
| <a id="O08"></a>O08 | Funders receive evidence of the service's use that does not identify passengers. | [P12](#P12) | [FR13](../requirements/01-functional-requirements.md#FR13) |
| <a id="O09"></a>O09 | The network agrees its eligibility, waiting-time and notification policies. | [P03](#P03), [P08](#P08), [P11](#P11) | Policy decisions: [Q01](04-stakeholder-questions.md#Q01), [Q05](04-stakeholder-questions.md#Q05), [Q07](04-stakeholder-questions.md#Q07) |
