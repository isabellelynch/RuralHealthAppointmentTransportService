# Scenario Interpretation

## Step 1 : Identify evidence from the scenario

| Evidence from Scenario | What it tells us |
|---|---|
| **Organisation and Scope** |
| Not-for-profit service for planned healthcare appointments only. No emergency transport. | The system must handle planned bookings only. Emergency dispatch is out scope and must not be implied. |
| Volunteer drivers use their own cars, two accessible vehicles have employed drivers. | There are two driver types with different rules (availavility, authorisation, vehicle ownership). The system must model drivers and vehicles separately. |
| Staff use a shared calendar, spreadsheet and paper driver sheets. | Information is fragmented and duplicated, so errors and missed updates are likely. This is the main justification for a new system. |
| First realease covers planned transport, healthcare records and clinical decisions are excluded. | This sets a clear scope boundary. The system must not store or depend on clincal data. |
| **Requests and Eligibility** |
| Requests come by phone, referral email or support organisations | There are mulyiple input channels, so request capture needs a consistent format whatever the source. |
| Requests may lack a finishing time or list a family member as contact | Requests can be incomplete. The system needs a "not ready for allocation" status and must record a separate contact person. |
| Staff may need several calls before a request is ready. | A request goes through stages (received -> incomplete -> ready). Status tracking is needed. |
| Service is for people with no reasonable transport alternative who can travel safely | Eligibility criteria exist, but they are partly judgement-based. |
| New passengers may need an eligibility discussion, review frequency is unclear. | **Uncertainty:** the eligibility evidence and review period are not defined. A temporary assumption is needed, and stakeholders must confirm it. <a href="04-stakeholder-questions.md#Q01">Q01</a> |
| Travel needs recorded: wheelchair, assistance, walking aid, companion, sharing | Practical needs drive vehicle and driver matching, so they must be structured data, not free text. |
| Referrers sometimes include clinical diagnoses. | There is a data protection risk: unnecessary sensitive data is entering the service. The system needs a way to exclude or restrict it. |
| **Planning and Allocation** |
| Staff try to limit unnecessary travel. Compatible passengers may share | Allocation is an optimisation problem. Sharing depends on times, locations, needs, capacity and passenger consent. |
| Volunteers give general availability, may decline, prefer certain areas, avoid driving after dark. | Driver preferences and constraints must be recorded and checked during allocation. |
| Accessible vehicles need authorised drivers and may already be committed. | Vehicle availability and driver authorisation must both be checked. There is a risk of double-booking. |
| Unsuccessful driver contacts aren't recorded. The spreadsheet shows only the driver who accepted (office staff). | Effort and refusal history is lost. Recording contact attempts would help staff avoid repeat calls and understand capacity. | 
| Provisional assignments exist. Staff disagree whether they reserve the driver. | **Uncertainty:** the rule for provisional assignments is undefined. There is a risk of double allocation or of drivers being blocked unnecessarily. |
| Wheelchair space and companion seating must be known before assignment (accessible vehicle driver). | Needs must be complete before allocation. This is a validation rule. | 
| **Confirmation and Completion** |

## Step 2 : Identify the underlying problems and likely consequences
observation or symptom 
underlying problem 
likely consequence


## Business Problem Statement

South Kerry Community Travel Network is a not-for-profit service that helps eligible rural residents travel to planned healthcare appointments
using trained volunteer drivers and two accessible vehicles with employed drivers. Requests arrive by telephone, referral email and local support
organisations. Staff coordinate journeys using a shared calendar, a spreadsheet and paper driver sheets. As demand has increased, requests often
arrive incomplete, so staff may need several calls before a journey can be allocated. Eligibility is discussed informally with new passengers and
there is no agreed point at which it should be reviewed. Driver allocation is slow because driver availability, declined offers and 
accessible-vehicle commitments are not reliably recorded. Outward and return journeys are not always recorded separately changes and cancellations
are recorded inconsistently and personal information such as diagnoses is sometimes received even though it is not needed.

As a result, staff and drivers spend unnecessary time on coordination, passengers can be unsure whether their driver will wait or return later and
the coordinator lacks a reliable overview of the journeys. Passenger privacy is put at risk and funders depend on reports that must not identify 
passengers unnecessarily. These issues increase administrative effort, reduce confidence in the service’s records and may contribute to late or 
missed appointments.