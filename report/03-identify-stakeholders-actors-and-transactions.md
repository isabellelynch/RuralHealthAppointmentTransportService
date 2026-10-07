# South Kerry Community Travel Network – Analysis Notes

## Actors / Stakeholders

### Primary Actors

- Coordinator
- Office Staff
- Volunteer Drivers
- Employed Drivers (accessible-vehicle drivers)
- Referrers / Referring Organisations (includes local support organisations)
- Passengers / Residents
- Family Member (when they act as the contact for a passenger)

### Supporting Actors

- Healthcare Provider / Clinic (they change appointments, but the scenario doesn't show them using the system, so mark this as an assumption)

### Offstage Stakeholders
- South Kerry Community Travel Network (the organisation itself)
- Rural Communities
- Companions
- Regular Passenger
- New Passenger
- Funders (they receive summary reports)
- Data Protection Regulator (implied by the confidentiality concerns, not named in the scenario, so label it as an assumption)

## Candidate Use Cases (Verbs)

- Submit / Receive Request
- Assess Eligibility
- Review Eligibility
- Record Travel Needs
- Allocate / Assign Driver and Vehicle
- Provisionally Assign Journey
- Offer Journey to Driver
- Accept / Decline Journey
- Plan Shared Journey
- Confirm Journey
- Record Collection, Arrival and Return
- Record Passenger Not Ready / Not at Address / Not Travelling
- Wait / Contact Coordinator / Leave
- Change Appointment or Request
- Cancel Journey
- Record Cancellation Reason
- Find Replacement Driver
- Notify Passenger and Referrer When Transport Fails
- View Coordinator Dashboards
- Generate Summary Reports
- Print Journey Sheets

## Entities and Data the System Holds

### Requests and Passengers

- Requests, eligibility, eligibility evidence, eligibility review period
- Personal details, address, collection address, contact
- Travel needs: wheelchair space, assistance, walking aid, companion, companion seating, ability to share a journey
- Clinical diagnosis (not stored, marked as restricted)

### Appointments

- Appointment date, appointment time, appointment location
- Estimated duration, finishing time

### Journeys

- Journeys or shared journeys
- Provisional and confirmed journeys
- Outward journey and return journey
- Collection window, collection, arrival, return
- Journey completion record
- Directions, practical assistance information
- Travel costs / contributions

### Drivers and Vehicles

- Driver availability
- Own cars, accessible vehicles
- Vehicle capacity
- Authorised drivers
- Driver preferences
- Driver contact attempts

### Changes and Cancellations

- Changes
- Cancellations, cancellation reasons, late cancellations
- Cancellation responsibility
- Reasons a driver is unavailable

### Outputs and Views

- Coordinator views: unallocated requests, provisional journeys, confirmed journeys, accessible-vehicle demand, driver availability, changes, incomplete journey records
- Summary reports (anonymous)
- Confirmation
- Printed journey sheets

### Current Tools Being Replaced

- Telephone requests
- Referral emails
- Shared calendar
- Spreadsheet
- Paper driver sheets (assumed)


  ## Stakeholder Analysis

*(A) = assumption, not directly stated in the scenario and may require further clarification.*

| Stakeholder | Goals | Concerns | Influence | Expected Interaction |
|---|---|---|---|---|
| **South Kerry Community Travel Network** | Deliver reliable, planned transport to eligible residents. Cope with rising demand. Meet funder requirements. | Staff workload, protecting confidential information, keeping volunteers available, unresolved policies (eligibility reviews, waiting time, provisional assignments). | High – owns the service, sets policy and approves the system's scope. | Indirectly sets the rules the system enforces and receives reports. |
| **Rural Communities** | Access to planned healthcare appointments when there is no reasonable transport alternative. | Availability and fairness of the service. | Low – represented through individual passengers. | None directly. |
| **Coordinator** | Reliable views of unallocated requests, provisional and confirmed journeys, accessible vehicle demand, driver availability, changes and incomplete records. Efficient allocation. | Uncertain finishing times, provisional assignments, late changes and incomplete journey records. | High – main decision maker for allocation and a key user. | Daily primary user. Allocates drivers and vehicles, manages changes and failures and receives driver calls. |
| **Office Staff** | Capture complete requests, check eligibility and secure drivers with fewer repeated calls. | Unsuccessful driver contacts are not recorded, incomplete requests needing several calls and confidentiality. | High – day-to-day users whose workflow the system must support. | Daily user, enters requests and travel needs, contacts drivers, confirms journeys, records changes and cancellations. |
| **Volunteer Driver** | Enough information to help passengers safely, journeys that fit their availability and preferences. | Do not need medical history, uneven mobile coverage, unclear waiting rules, freedom to decline. | Medium – service depends on them and they can decline journeys. | Receive journey offers, accept or decline. Receive printed or mobile journey sheets. Record collection arrival and return. Contact the coordinator. |
| **Employed Drivers** | Know wheelchair space and companion seating before the vehicle is assigned. | Accessible vehicles already committed to another passenger. Only authorised drivers may operate it. | Medium – only two accessible vehicles, so a scarce resource. | Assigned accessible vehicle journeys, receive journey details, record completion. |
| **Referrers / Referring Organisations** | Submit requests easily and update them when appointments change. | Requests change after sending, being told promptly if transport fails. | Medium – a main source of requests. | Submit requests, receive confirmation or failure notices. Whether they get direct system access is unclear (A). |
| **Passengers / Residents (Regular / New)** | Reach appointments on time and get home safely. | Not knowing whether the driver is waiting or coming back later, collection times, travel cost contribution, privacy, not being penalised for provider changes. | Medium – the service exists for them, but they have little say in its design. | Mostly through staff by phone, receive confirmation, request changes or cancel, are collected and returned. |
| **Family Members** | Arrange transport on a passenger's behalf. | Being kept informed, accurate contact details. | Low | Acts as a contact, may receive confirmations, possibly contacted when the passenger cannot be reached (unresolved). |
| **Companions** | Travel with a passenger. | A seat being available. | Low | Recorded as a travel need, no direct interaction. |
| **Healthcare Provider / Clinic** | Patients attend their appointments (A). | Not directly stated. | Medium (indirect) – their appointment changes and overruns drive changes and cancellations. | None, changes reach the service through passengers or referrers. Direct access to healthcare records is out of scope. |
| **Funders** | Evidence that the service is used effectively. | Accurate reports that do not identify passengers unnecessarily. | High – control funding. | Receive anonymised summary reports. No direct system use. |
| **Data Protection Officer (A)** | Compliance with data protection law (A). | Unnecessary storage of clinical diagnoses, over-sharing passenger details with drivers, identifiable reports. | High (legal) – though not officially named in the scenario. | None, acts as a constraint on the system's design. |
