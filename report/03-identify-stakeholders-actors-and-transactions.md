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
