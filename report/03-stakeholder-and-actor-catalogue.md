# Stakeholder and Actor Catalogue

This section identifies who interacts with the system and who is affected by it. Actors are classified using Cockburn's categories: **primary actors** use the system directly to achieve a goal, **supporting actors** provide a service to the system, and **offstage stakeholders** have an interest in how the system behaves but do not interact with it ([Cockburn, 2001](../references/01-text-sources.md#cockburn)). Each stakeholder is then analysed by goals, concerns, influence and expected interaction, following [IIBA (2015)](../references/01-text-sources.md#babok).

*(A) = assumption: not stated directly in the scenario and requiring confirmation.*

## Actor Catalogue

| Actor | Type | Role in relation to the system |
|---|---|---|
| Coordinator | Primary | Allocates drivers and vehicles, manages changes and failures, and monitors journeys. |
| Office staff | Primary | Enters requests and travel needs, contacts drivers, confirms journeys and records changes and cancellations. |
| Volunteer driver | Primary | Accepts or declines journeys and records collection, arrival and return. |
| Employed (accessible-vehicle) driver | Primary | Completes accessible-vehicle journeys and records their progress. |
| Referrer / referring organisation | Offstage (A) | Sends requests by telephone or email. Whether referrers will use the system directly is not confirmed; if they do, they become primary actors. |
| Passenger | Offstage | The person transported. Interacts through staff and drivers rather than with the system. |
| Family member / companion | Offstage | May act as the passenger's contact or travel with them. |
| Healthcare provider / clinic | Offstage | Changes appointments and causes overruns, but has no access to the system. |
| Funders | Offstage | Receive anonymised summary reports. |
| Network management (A) | Offstage | Owns the service, sets policy and approves scope. |
| Data protection officer (A) | Offstage | Oversees compliance with data protection law. |

**Supporting actors:** none in the first release, because staff contact drivers and passengers by phone ([A09](05-assumptions.md#A09)). If the system were to send text messages ([Q17](04-stakeholder-questions.md#Q17)), the messaging service would become a supporting actor.

## Stakeholder Analysis

| Stakeholder | Goals | Concerns | Influence | Expected interaction |
|---|---|---|---|---|
| **South Kerry Community Travel Network** (network management (A)) | Deliver reliable planned transport to eligible residents, cope with rising demand and meet funder requirements. | Staff workload, confidentiality, keeping volunteers engaged, unresolved policies. | High: owns the service, sets policy and approves scope. | Sets the rules the system enforces and receives reports. |
| **Coordinator** | A reliable overview of requests, journeys, accessible-vehicle demand and driver availability; efficient allocation. | Uncertain finishing times, provisional assignments, late changes, incomplete journey records. | High: main allocation decision-maker and key user. | Daily user: allocates, manages changes and failures, takes driver calls. |
| **Office staff** | Capture complete requests and secure drivers with fewer repeated calls. | Unrecorded driver contacts, incomplete requests, confidentiality. | High: their daily workflow is what the system must support. | Daily user: enters requests, contacts drivers, confirms journeys, records changes. |
| **Volunteer driver** | Enough information to help passengers safely; journeys that fit their availability and preferences. | Receiving unnecessary medical detail, uneven mobile coverage, unclear waiting rules, freedom to decline. | Medium: the service depends on them and they may decline any journey. | Accepts or declines journeys, uses a phone or printed sheet, records journey progress. |
| **Employed (accessible-vehicle) driver** | Know wheelchair and companion seating needs before the vehicle is assigned. | Vehicle already committed; only authorised drivers may operate it. | Medium: operates one of only two accessible vehicles. | Completes accessible-vehicle journeys and records progress. |
| **Referrer / referring organisation** | Submit requests easily and update them when appointments change. | Requests changing after sending; being told promptly if transport fails. | Medium: a main source of requests. | Sends requests, receives confirmation or failure notices. Direct system access unclear (A). |
| **Passenger** (regular or new) | Reach appointments on time and get home safely. | Not knowing whether the driver will wait or return; collection times; cost; privacy; being penalised for provider changes. | Medium: the service exists for them, but they have little say in its design. | Through staff by phone; receives confirmation; requests changes or cancels. |
| **Family member / companion** | Arrange or share transport on the passenger's behalf. | Being kept informed; a seat being available. | Low | Recorded as a contact or travel need. May be contacted if the passenger cannot be reached ([Q07](04-stakeholder-questions.md#Q07)). |
| **Healthcare provider / clinic** | Patients attend their appointments (A). | Not stated in the scenario. | Medium (indirect): its changes and overruns drive many disruptions. | None; changes reach the service through passengers or referrers. |
| **Funders** | Evidence that the service is used effectively. | Accurate reports that do not identify passengers. | High: control funding. | Receive anonymised summary reports ([FR13](../requirements/01-functional-requirements.md#FR13)). |
| **Data protection officer (A)** | Compliance with data protection law ([European Parliament and Council, 2016](../references/01-text-sources.md#gdpr)). | Unnecessary clinical data, over-sharing with drivers, identifiable reports. | High (legal), though not named in the scenario. | None directly; acts as a constraint on the design. |
