# Domain Model

A domain model shows the concepts of the real-world problem, their essential attributes and the associations between them that must be remembered ([Larman, 2004](../references/01-text-sources.md#larman), ch. 9). It is an analysis model, so it has no methods, navigability, typed fields, foreign keys, controllers, screens or database structures. This model is built from the conceptual classes retained in the [candidate concept analysis](09-candidate-concept-analysis.md) and checked against the [functional requirements](../requirements/01-functional-requirements.md) and [use cases](07-use-case-model.md). Where the scenario leaves a matter unresolved, the model records it in a note rather than inventing a policy.

## Review and Select

All twelve conceptual classes from the [candidate concept analysis](09-candidate-concept-analysis.md#conceptual-classes-carried-forward) are needed by at least one first-release requirement, so all are kept. Class names are written in UpperCamelCase following Larman's convention.

| Class | Working definition | Needed by |
|---|---|---|
| Passenger | A resident who travels to planned healthcare appointments using the service. | [FR01](../requirements/01-functional-requirements.md#FR01) |
| ContactPerson | The person staff contact about a request: the passenger or a family member. | [FR01](../requirements/01-functional-requirements.md#FR01) |
| TransportRequest | A request for transport to one appointment, with the passenger's travel needs. | [FR01](../requirements/01-functional-requirements.md#FR01) to [FR04](../requirements/01-functional-requirements.md#FR04), [FR14](../requirements/01-functional-requirements.md#FR14) |
| Appointment | The planned healthcare appointment the passenger must attend. | [FR01](../requirements/01-functional-requirements.md#FR01) |
| Journey | The arranged trip that fulfils one request. | [FR08](../requirements/01-functional-requirements.md#FR08), [FR09](../requirements/01-functional-requirements.md#FR09) |
| JourneyStage | The outward or return part of a journey, with its own driver, vehicle and status. | [FR08](../requirements/01-functional-requirements.md#FR08), [FR10](../requirements/01-functional-requirements.md#FR10) |
| Driver | A volunteer or employed driver who may be assigned journey stages. | [FR06](../requirements/01-functional-requirements.md#FR06), [FR12](../requirements/01-functional-requirements.md#FR12) |
| Vehicle | A volunteer's own car or one of the network's accessible vehicles. | [FR05](../requirements/01-functional-requirements.md#FR05), [FR06](../requirements/01-functional-requirements.md#FR06) |
| ContactAttempt | One call to one driver about one journey stage, and its outcome. | [FR07](../requirements/01-functional-requirements.md#FR07) |
| ChangeRecord | One recorded change to a request. | [FR03](../requirements/01-functional-requirements.md#FR03) |
| Cancellation | The cancellation of one or more journey stages, with its cause. | [FR11](../requirements/01-functional-requirements.md#FR11) |
| UnavailabilityPeriod | A period when a driver cannot drive, with the reason. | [FR12](../requirements/01-functional-requirements.md#FR12) |

## Essential Attributes

Each candidate attribute was checked: is it a simple value meaningful to stakeholders, is it needed by a requirement, rule or use case and is it really another concept, a foreign key, a collection or an operation?

| Concept | Candidate attributes | Keep / remove | Reason |
|---|---|---|---|
| Passenger | name, homeAddress, phone | Keep | Needed to identify and contact the passenger ([FR01](../requirements/01-functional-requirements.md#FR01)). |
| | passengerId | Remove | An identifier is an implementation detail. |
| | diagnosis | Remove | Clinical data must not be held ([C07](06-rules-and-uncertainty-register.md#C07)). |
| | eligibilityStatus | Remove | Eligibility is deferred. The policy is unresolved ([Q01](04-stakeholder-questions.md#Q01)). |
| ContactPerson | name, phone, relationshipToPassenger | Keep | Requests may name a family member as contact ([FR01](../requirements/01-functional-requirements.md#FR01)). |
| TransportRequest | collectionAddress, notes, status | Keep | Collection may differ from home. Status shows whether the request is ready ([FR02](../requirements/01-functional-requirements.md#FR02)). Notes can be cleaned of clinical text ([FR14](../requirements/01-functional-requirements.md#FR14)). |
| | wheelchairSpacesNeeded, companionSeatsNeeded, boardingAssistance, walkingAid, agreesToShare | Keep | Practical travel needs ([FR04](../requirements/01-functional-requirements.md#FR04)), compared with vehicle capacity ([FR05](../requirements/01-functional-requirements.md#FR05)). |
| | passengerId | Remove | A foreign key. Replaced by the *makes* association. |
| | requestChannel | Remove | Deferred ([DFR01](../requirements/03-deferred-requirements.md#DFR01)). |
| Appointment | location, appointmentDate, appointmentTime, estimatedFinishTime | Keep | Mandatory request details. An estimate is accepted ([A01](05-assumptions.md#A01), [A02](05-assumptions.md#A02)). |
| | clinicalReason | Remove | Out of scope ([C01](06-rules-and-uncertainty-register.md#C01)). |
| Journey | status, returnArrangement, travelContribution | Keep | Shown on the passenger confirmation, including whether the driver waits or returns ([FR09](../requirements/01-functional-requirements.md#FR09)). |
| | paymentReceived | Remove | Payment processing is out of scope. |
| | stages (list) | Remove | A collection. Replaced by the *is made up of* association. |
| JourneyStage | direction, collectionWindowStart, collectionWindowEnd, status | Keep | Outward and return are recorded separately ([FR08](../requirements/01-functional-requirements.md#FR08)). Collection is given as a window. |
| | collectedAt, arrivedAt, completedAt | Keep | Progress recorded by the driver ([FR10](../requirements/01-functional-requirements.md#FR10)). |
| | waitingTime | Remove | No waiting policy agreed. Deferred ([Q05](04-stakeholder-questions.md#Q05), [DFR12](../requirements/03-deferred-requirements.md#DFR12)). |
| | gpsLocation | Remove | Live tracking is out of scope. |
| Driver | name, phone, driverType, generalAvailability, preferredAreas, drivesAfterDark, accessibleAuthorised | Keep | Used when choosing a driver. Authorisation is a yes/no value ([FR06](../requirements/01-functional-requirements.md#FR06), [A04](05-assumptions.md#A04)). |
| | isAvailable() | Remove | An operation, not an attribute. Availability is found from UnavailabilityPeriod. |
| | trainingRecord | Remove | Driver training is out of scope. |
| Vehicle | registration, vehicleType, passengerSeats, wheelchairSpaces, companionSeats | Keep | Capacity is checked against needs ([FR05](../requirements/01-functional-requirements.md#FR05)). Type decides whether authorisation is needed ([FR06](../requirements/01-functional-requirements.md#FR06)). |
| | ownerId | Remove | A foreign key. Replaced by the *supplies* association. |
| | maintenanceDue | Remove | Vehicle maintenance is out of scope. |
| ContactAttempt | attemptDateTime, outcome | Keep | Each call and its result: accepted, declined or no answer ([FR07](../requirements/01-functional-requirements.md#FR07)). |
| ChangeRecord | changedField, oldValue, newValue, changedAt, changedBy | Keep | Change history ([FR03](../requirements/01-functional-requirements.md#FR03)). changedBy is a name. Staff are actors, not stored concepts. |
| Cancellation | cancelledBy, reason, cancelledAt, noticeGiven, providerCaused | Keep | All values required by [FR11](../requirements/01-functional-requirements.md#FR11). ProviderCaused supports [BR09](06-rules-and-uncertainty-register.md#BR09). |
| | isLate | Remove | Derived from noticeGiven, and no "late" threshold is defined in the scenario. |
| UnavailabilityPeriod | startDate, endDate, reason | Keep | Finds affected journeys ([FR12](../requirements/01-functional-requirements.md#FR12)). Reason covers illness, vehicle problems or weather. |

## Associations

Seventeen candidate associations were considered. Each was tested: must it be remembered beyond one calculation, do stakeholders query or report on it, does it support a requirement, rule or use case, can it be read as a domain sentence, and does it duplicate another path?

| Class A | Association | Class B | Evidence | Keep? |
|---|---|---|---|---|
| Passenger | makes | TransportRequest | [FR01](../requirements/01-functional-requirements.md#FR01) | Yes |
| TransportRequest | names as contact | ContactPerson | [FR01](../requirements/01-functional-requirements.md#FR01). Requests may name a family member | Yes |
| TransportRequest | is for | Appointment | [FR01](../requirements/01-functional-requirements.md#FR01) | Yes |
| TransportRequest | is fulfilled by | Journey | [FR02](../requirements/01-functional-requirements.md#FR02), [UC03](07-use-case-model.md#UC03) | Yes |
| TransportRequest | has history of | ChangeRecord | [FR03](../requirements/01-functional-requirements.md#FR03) | Yes |
| Journey | is made up of | JourneyStage | [FR08](../requirements/01-functional-requirements.md#FR08) | Yes |
| JourneyStage | is driven by | Driver | [FR08](../requirements/01-functional-requirements.md#FR08), [UC03](07-use-case-model.md#UC03) | Yes |
| JourneyStage | uses | Vehicle | [FR05](../requirements/01-functional-requirements.md#FR05), [FR06](../requirements/01-functional-requirements.md#FR06) | Yes |
| Driver | supplies | Vehicle | Volunteers use their own cars (*Organisation and current service*) | Yes |
| Driver | is contacted in | ContactAttempt | [FR07](../requirements/01-functional-requirements.md#FR07) | Yes |
| ContactAttempt | is about | JourneyStage | [FR07](../requirements/01-functional-requirements.md#FR07) | Yes |
| Cancellation | cancels | JourneyStage | [FR11](../requirements/01-functional-requirements.md#FR11), [UC07](07-use-case-model.md#UC07) | Yes |
| Driver | is unavailable during | UnavailabilityPeriod | [FR12](../requirements/01-functional-requirements.md#FR12) | Yes |
| Passenger | attends | Appointment | Duplicates Passenger → TransportRequest → Appointment | No |
| Passenger | is driven by | Driver | Derived through the journey stages. Adds nothing | No |
| Driver | is authorised for | Vehicle | Authorisation is a yes/no value on Driver ([A04](05-assumptions.md#A04)). May become an association if authorisation is per vehicle ([Q18](04-stakeholder-questions.md#Q18)) | No |
| Referrer | refers | TransportRequest | Storing referrer details is deferred ([DFR01](../requirements/03-deferred-requirements.md#DFR01)) | No |

## Multiplicities

Each end is read separately: the value beside Class A is read from the point of view of one Class B, and the value beside Class B from the point of view of one Class A. Multiplicities express what the rules allow, not typical volumes.

| Association | At Class A | At Class B | Reading from both ends | Evidence / rule |
|---|:-:|:-:|---|---|
| Passenger makes TransportRequest | 1 | 0..* | Each request is made for exactly one passenger. A passenger may make no requests yet, or many over time. | [FR01](../requirements/01-functional-requirements.md#FR01). Regular passengers travel often. |
| TransportRequest names as contact ContactPerson | 0..* | 1 | Each request names exactly one contact. A contact may be named on many requests. | [FR01](../requirements/01-functional-requirements.md#FR01), [A01](05-assumptions.md#A01) |
| TransportRequest is for Appointment | 1 | 1 | Each request is for exactly one appointment, and each recorded appointment belongs to exactly one request. | [FR01](../requirements/01-functional-requirements.md#FR01) |
| TransportRequest is fulfilled by Journey | 1 | 0..1 | Each journey fulfils exactly one request. A request has no journey until it is allocated, then at most one. | [FR02](../requirements/01-functional-requirements.md#FR02), [BR03](06-rules-and-uncertainty-register.md#BR03) |
| TransportRequest has history of ChangeRecord | 1 | 0..* | Each change belongs to exactly one request. A request may never change, or change many times. | [FR03](../requirements/01-functional-requirements.md#FR03) |
| Journey is made up of JourneyStage | 1 | 1..2 | Each stage belongs to exactly one journey. A journey has an outward stage and, unless not needed, a return stage. | [FR08](../requirements/01-functional-requirements.md#FR08), [A05](05-assumptions.md#A05) |
| JourneyStage is driven by Driver | 0..* | 0..1 | A driver may drive no stages or many. A stage has no driver while it is outstanding, then at most one. | [UC03](07-use-case-model.md#UC03) alternative 6a |
| JourneyStage uses Vehicle | 0..* | 0..1 | A vehicle may be used on many stages. A stage has no vehicle until assigned, then at most one. | [UC03](07-use-case-model.md#UC03) |
| Driver supplies Vehicle | 0..1 | 0..* | An own car is supplied by one volunteer. An accessible vehicle is supplied by no driver. A driver may supply no vehicles or several. | *Organisation and current service*. [C04](06-rules-and-uncertainty-register.md#C04) |
| Driver is contacted in ContactAttempt | 1 | 0..* | Each attempt is a call to exactly one driver. A driver may be contacted many times. | [FR07](../requirements/01-functional-requirements.md#FR07) |
| ContactAttempt is about JourneyStage | 0..* | 1 | Each attempt is about exactly one stage. A stage may need no calls or many before a driver accepts. | [FR07](../requirements/01-functional-requirements.md#FR07). Office staff evidence |
| Cancellation cancels JourneyStage | 0..1 | 1..* | Each stage is cancelled at most once. A cancellation covers one stage or both. | [FR11](../requirements/01-functional-requirements.md#FR11), [UC07](07-use-case-model.md#UC07). A stage may be cancelled on its own ([US05](../requirements/04-user-story-backlog.md#US05)) |
| Driver is unavailable during UnavailabilityPeriod | 1 | 0..* | Each period belongs to exactly one driver. A driver may have no periods or many. | [FR12](../requirements/01-functional-requirements.md#FR12) |

## Transactions and Historical Records

Important dates, statuses and outcomes must each have a clear home, so that history is kept rather than overwritten.

| Information to retain | Best owning concept | Why |
|---|---|---|
| Whether a request is ready for allocation | TransportRequest (status) | Describes the request itself ([FR02](../requirements/01-functional-requirements.md#FR02)). |
| Old and new values when an appointment or address changes | ChangeRecord | A request changes many times, one record per change keeps the full history ([FR03](../requirements/01-functional-requirements.md#FR03)). |
| Each call to a driver and its outcome | ContactAttempt | A transaction between one driver and one stage, like an enrolment between a student and a course ([FR07](../requirements/01-functional-requirements.md#FR07)). |
| Collection, arrival and completion times | JourneyStage | Each stage may have a different driver, so times belong to the stage, not the journey ([FR10](../requirements/01-functional-requirements.md#FR10)). |
| Who cancelled, why, the notice given and whether the provider caused it | Cancellation | A cancellation carries its own information and may cover both stages ([FR11](../requirements/01-functional-requirements.md#FR11)). |
| When and why a driver is unavailable | UnavailabilityPeriod | A driver has many periods over time ([FR12](../requirements/01-functional-requirements.md#FR12)). |
| Whether the driver will wait or return later | Journey (returnArrangement) | Told to the passenger in the confirmation ([FR09](../requirements/01-functional-requirements.md#FR09)). |
| Whether a provisional assignment reserves the driver | Not modelled | Unresolved ([Q03](04-stakeholder-questions.md#Q03)), recorded as a note on the diagram. |
| Notice to the passenger and referrer when transport fails | Not modelled | Deferred, notification order unresolved ([DFR15](../requirements/03-deferred-requirements.md#DFR15), [Q07](04-stakeholder-questions.md#Q07)). |

**Decision: could Cancellation be represented as JourneyStage with status CANCELLED?** No. A status alone would lose who cancelled, the reason, the notice given and whether the provider caused it, all of which [FR11](../requirements/01-functional-requirements.md#FR11) requires and [BR09](06-rules-and-uncertainty-register.md#BR09) depends on. One cancellation can also cover both stages, which a status on each stage cannot show. The stage's status is still set to Cancelled so cancelled stages are easy to find, but the information about the cancellation lives in its own concept.

## Domain Model

![Domain model: TransportRequest links a Passenger, ContactPerson and Appointment to a Journey made up of one or two JourneyStages. Each stage may be driven by a Driver and use a Vehicle. ContactAttempt, ChangeRecord, Cancellation and UnavailabilityPeriod record history.](../diagrams/domain-model.png)

Source: [domain-model.puml](../diagrams/domain-model.puml)

Plain associations are used throughout. Business rules that cannot be drawn as lines, such as the capacity check in [FR05](../requirements/01-functional-requirements.md#FR05) and the authorisation check in [FR06](../requirements/01-functional-requirements.md#FR06), are shown as notes as is the unresolved provisional-assignment question.
