Key: X = classification. A candidate may have two ticks where it plays two roles, such as Driver, which is both a stored record and an actor.

| Candidate | Conceptual class | Attribute / value | Actor | Operation / event | Out of scope / implementation | Reason |
|---|:-:|:-:|:-:|:-:|:-:|---|
| **Organisation and current service** | | | | | | |
| South Kerry Community Travel Network | | | | | X | The organisation that owns the system. There is only one, so it is the system's context rather than a class. |
| network | | | | | X | Synonym of South Kerry Community Travel Network. |
| not-for-profit service | | | | | X | Describes the organisation; no data to record. |
| residents |X| | | | | Synonym of **Passenger**, which is used throughout. |
| rural communities | | | | | X | Context; the system records individual passengers, not communities. |
| planned healthcare appointment | X | | | | | **Appointment**: has a location, date, time and estimated finishing time, and can be changed by the provider independently of the journey. |
| emergency transport | | | | | X | Out of scope ([BR01](06-rules-and-uncertainty-register.md#BR01), [C01](06-rules-and-uncertainty-register.md#C01)). |
| journeys | X | | | | | **Journey**: the trip for one request, made up of an outward and a return stage ([FR08](../requirements/01-functional-requirements.md#FR08)). |
| trained volunteer drivers | X | | X | | | **Volunteer driver**: a subtype of Driver. Stored record ([FR06](../requirements/01-functional-requirements.md#FR06)) and actor ([UC06](07-use-case-model.md#UC06)). Training is not recorded. |
| own cars | X | | | | | **Own car**: a subtype of Vehicle supplied by a volunteer. |
| accessible vehicles | X | | | | | **Accessible vehicle**: a subtype of Vehicle that requires an authorised driver ([FR06](../requirements/01-functional-requirements.md#FR06)). |
| employed drivers | X | | X | | | **Employed driver**: a subtype of Driver. Stored record and actor. |
| request | X | | | | | **Transport request**: created, amended and allocated, with its own lifecycle ([FR01](../requirements/01-functional-requirements.md#FR01)–[FR03](../requirements/01-functional-requirements.md#FR03)). |
| telephone | | | | | X | A channel by which requests arrive; recording the channel is deferred ([DFR01](../requirements/03-deferred-requirements.md#DFR01)). |
| referral email | | | | | X | A channel; emails are not stored ([A19](05-assumptions.md#A19)). |
| local support organisation | | | X | | | A kind of referrer (offstage actor). |
| staff | | | X | | | Generic term; split into Office staff and Coordinator. |
| shared calendar | | | | | X | Current tool being replaced. |
| spreadsheet | | | | | X | Current tool being replaced. |
| paper driver sheet | | | | | X | Current tool; the new printed journey sheet is deferred ([DFR11](../requirements/03-deferred-requirements.md#DFR11)). |
| demand | | | | | X | Vague; a figure that can be derived from requests. |
| eligibility | | | | | X | Deferred: the policy is unresolved ([Q01](04-stakeholder-questions.md#Q01), [DFR04](../requirements/03-deferred-requirements.md#DFR04)). |
| passenger needs | | X | | | | Synonym of travel needs; attributes of Transport request ([FR04](../requirements/01-functional-requirements.md#FR04)). |
| driver assignment | | | | X | | The act of assigning ([UC03](07-use-case-model.md#UC03)); recorded as the link between Journey stage, Driver and Vehicle. |
| changes | X | | | | | **Change record**: many per request, each with old value, new value, date and user ([FR03](../requirements/01-functional-requirements.md#FR03)). |
| confidential information | | | | | X | A quality concern handled by access rules ([NFR01](../requirements/02-non-functional-requirements.md#NFR01)), not a concept. |
| **Transport requests and eligibility** | | | | | | |
| passenger | X | | | | | **Passenger**: has identity and contact details and makes many requests over time. Interacts through staff, so not an actor. |
| appointment location | | X | | | | Attribute of Appointment. |
| appointment time | | X | | | | Attribute of Appointment. |
| appointment date | | X | | | | Attribute of Appointment. |
| estimated duration | | X | | | | Synonym of estimated finishing time; attribute of Appointment. |
| collection address | | X | | | | Attribute of Transport request; may differ from the passenger's home address. |
| travel needs | | X | | | | Attributes of Transport request ([FR04](../requirements/01-functional-requirements.md#FR04)). |
| referrer | | | X | | | Offstage actor. Storing referrer details is deferred ([DFR01](../requirements/03-deferred-requirements.md#DFR01)). |
| expected finishing time | | X | | | | Attribute of Appointment; an estimate is accepted ([A02](05-assumptions.md#A02)). |
| family member |X| | | | | Synonym; recorded as a **Contact person**. |
| contact | X | | | | | **Contact person**: name and phone number; may be the passenger or a family member ([FR01](../requirements/01-functional-requirements.md#FR01)). |
| several calls | | | | X | | Describes repeated contact; the calls themselves are recorded as Contact attempts. |
| allocation | | | | X | | Synonym of driver assignment. |
| transport alternative | | | | | X | An eligibility criterion; deferred ([BR02](06-rules-and-uncertainty-register.md#BR02)). |
| regular passengers |X| | | | | Synonym of **Passenger**; not a separate class. |
| new passengers |X| | | | | Synonym of **Passenger**; "new" only matters for eligibility, which is deferred. |
| eligibility discussion | | | | X | X | An event; recording it is deferred ([DFR04](../requirements/03-deferred-requirements.md#DFR04)). |
| circumstances | | | | | X | Vague. |
| practical travel needs | | X | | | | Synonym of travel needs. |
| wheelchair space | | X | | | | Attribute of Transport request (needed) and of Vehicle (capacity) ([FR05](../requirements/01-functional-requirements.md#FR05)). |
| assistance entering a vehicle | | X | | | | Attribute of Transport request. |
| room for a walking aid | | X | | | | Attribute of Transport request. |
| walking aid | | X | | | | Same as room for a walking aid. |
| companion | | X | | | | Number of companion seats needed; attribute of Transport request. The companion is not recorded as a person. |
| clinical diagnosis | | | | | X | Must not be held ([C07](06-rules-and-uncertainty-register.md#C07), [FR14](../requirements/01-functional-requirements.md#FR14)). |
| emails | | | | | X | Channel; not stored ([A19](05-assumptions.md#A19)). |
| notes | | X | | | | Free-text attribute of Transport request; clinical text can be removed ([FR14](../requirements/01-functional-requirements.md#FR14)). |
| **Planning and driver allocation** | | | | | | |
| suitable driver | | | | | X | Vague; suggesting suitable drivers is deferred ([DFR06](../requirements/03-deferred-requirements.md#DFR06)). |
| unnecessary travel | | | | | X | A goal, not data. |
| compatible passengers | | | | | X | Shared journeys are deferred ([DFR08](../requirements/03-deferred-requirements.md#DFR08)). |
| nearby locations | | | | | X | Shared journeys are deferred. |
| shared journeys | | | | | X | Deferred ([DFR08](../requirements/03-deferred-requirements.md#DFR08)). |
| appointment times | | X | | | | Synonym of appointment time. |
| vehicle capacity | | X | | | | Attributes of Vehicle: seats, wheelchair spaces, companion seats. |
| acceptability of sharing | | X | | | | Agreement to share; yes/no attribute of Transport request ([FR04](../requirements/01-functional-requirements.md#FR04)). |
| general availability | | X | | | | Attribute of Driver. |
| individual journeys |X| | | | | Synonym of **Journey**. |
| familiar areas | | X | | | | Preferred areas; attribute of Driver. |
| dark (driving after dark) | | X | | | | Yes/no attribute of Driver. |
| authorised drivers | | X | | | | Accessible-vehicle authorisation; yes/no attribute of Driver ([A04](05-assumptions.md#A04)). |
| another passenger | | | | | X | Vague; refers to a vehicle already being committed. |
| unsuccessful contacts | X | | | | | **Contact attempt**: many per journey, each with date, time and outcome ([FR07](../requirements/01-functional-requirements.md#FR07)). |
| provisional assignment | | X | | | | A status value of Journey; reservation rules are deferred ([Q03](04-stakeholder-questions.md#Q03), [DFR09](../requirements/03-deferred-requirements.md#DFR09)). |
| confirmation | | | | X | | Produced from journey data ([UC05](07-use-case-model.md#UC05), [FR09](../requirements/01-functional-requirements.md#FR09)); holds no data of its own. |
| **Journey confirmation and completion** | | | | | | |
| collection window | | X | | | | Attribute of Journey stage (start and end time). |
| driver or service contact | | X | | | | Contact number shown on the confirmation. |
| expected arrangements | | X | | | | Return arrangement (driver waits or returns later); attribute of Journey. |
| contribution towards travel costs | | X | | | | Amount shown to the passenger; attribute of Journey. Taking payment is out of scope. |
| exact collection time | | | | | X | Not promised; a collection window is used instead. |
| previous appointments | | | | | X | Explains why times slip; no data to record. |
| directions | | | | | X | Navigation is out of scope; the collection address and destination are enough. |
| practical assistance information | | X | | | | Synonym of travel needs. |
| unrelated personal details | | | | | X | Must not be shown to drivers ([NFR01](../requirements/02-non-functional-requirements.md#NFR01)). |
| collection | | X | | X | | An event recorded by the driver; stored as the collection time on Journey stage ([FR10](../requirements/01-functional-requirements.md#FR10)). |
| arrival | | X | | X | | An event; stored as the arrival time on Journey stage. |
| return completion | | X | | X | | An event; stored as the completion time on the return stage. |
| agreed address | |X| | | | Synonym of collection address. |
| coordinator | | | X | | | Primary actor ([UC03](07-use-case-model.md#UC03), [UC09](07-use-case-model.md#UC09)). |
| maximum waiting time | | | | | X | Policy unresolved ([Q05](04-stakeholder-questions.md#Q05)); deferred ([DFR12](../requirements/03-deferred-requirements.md#DFR12)). |
| finishing times | |X| | | | Synonym of expected finishing time. |
| return journey | X | | | | | Merged into **Journey stage**, with direction = return. |
| different driver | | X | | | | A relationship, not a concept: each Journey stage has its own Driver. |
| outward and return arrangements | X | | | | | Merged into **Journey stage**. |
| plans | | | | | X | Vague. |
| **Changes, cancellations and disruption** | | | | | | |
| short notice | | X | | | | Notice given; attribute of Cancellation (hours before the collection window). |
| cancellation | X | | | | | **Cancellation**: who cancelled, reason, notice given and whether the provider caused it ([FR11](../requirements/01-functional-requirements.md#FR11)). |
| different collection address | | | | X | | A change, recorded as a Change record. |
| illness | | X | | | | A value of the reason on Unavailability period. |
| vehicle problems | | X | | | | A value of the reason on Unavailability period. |
| severe weather | | X | | | | A value of the reason on Unavailability period. |
| replacement (driver) | | | | X | X | Finding a replacement is deferred ([DFR14](../requirements/03-deferred-requirements.md#DFR14)); reassignment uses [UC03](07-use-case-model.md#UC03). |
| passenger information |X| | | | | Synonym of **Passenger** details. |
| suitable transport | | | | | X | Vague. |
| late cancellations | | X | | | | Derived from notice given; no threshold is defined in the scenario. |
| driver availability | X | | | | | **Unavailability period**: a driver unavailable from one date to another, with a reason ([FR12](../requirements/01-functional-requirements.md#FR12)). |
| healthcare provider | | X | | | | Recorded only as "provider caused" on Cancellation; providers have no access ([BR09](06-rules-and-uncertainty-register.md#BR09)). |
| cancellation reasons | | X | | | | Attribute of Cancellation, chosen from a standard list. |
| **Information and organisational context** | | | | | | |
| views | | | | | X | Screens showing existing data; the coordinator overview is deferred ([DFR16](../requirements/03-deferred-requirements.md#DFR16)). |
| unallocated requests | | X | | | | A status value of Transport request. |
| provisional journeys | | X | | | | A status value of Journey. |
| confirmed journeys | | X | | | | A status value of Journey. |
| accessible-vehicle demand | | | | | X | Derived figure. |
| incomplete journey records | | X | | | | A status value: request not ready for allocation ([FR02](../requirements/01-functional-requirements.md#FR02)). |
| summary reports | | | | X | X | Produced on demand from stored data ([UC09](07-use-case-model.md#UC09), [FR13](../requirements/01-functional-requirements.md#FR13)); derived output, not stored. |
| funders | | | | | X | Offstage stakeholders who receive reports; they do not use the system. |
| office staff | | | X | | | Primary actor. |
| referring organisations | | | X | | | Synonym of referrer. |
| mobile coverage | | | | | X | Environmental constraint ([C02](06-rules-and-uncertainty-register.md#C02), [NFR03](../requirements/02-non-functional-requirements.md#NFR03)). |
| printed journey sheets | | | | | X | An output format; deferred ([DFR11](../requirements/03-deferred-requirements.md#DFR11)). |
| first release | | | | | X | Project scope term. |
| emergency dispatch | | | | | X | Out of scope ([C01](06-rules-and-uncertainty-register.md#C01)). |
| healthcare records | | | | | X | Out of scope ([C01](06-rules-and-uncertainty-register.md#C01)). |
| clinical decision-making | | | | | X | Out of scope ([C01](06-rules-and-uncertainty-register.md#C01)). |
| **Stakeholder evidence** | | | | | | |
| medical history | | | | | X | Must not be held or shown ([C07](06-rules-and-uncertainty-register.md#C07)). |
| clinic | |X| | | | Synonym of healthcare provider. |
| spreadsheet entry | | | | | X | Current tool. |
| **Unresolved matters** | | | | | | |
| eligibility evidence | | | | | X | Deferred ([Q01](04-stakeholder-questions.md#Q01)). |
| review period | | | | | X | Deferred ([Q01](04-stakeholder-questions.md#Q01)). |
| practical needs (shared with driver) | | X | | | | Synonym of travel needs; what drivers see is limited by [NFR01](../requirements/02-non-functional-requirements.md#NFR01). |
| restricted information | | | | | X | An access rule ([NFR01](../requirements/02-non-functional-requirements.md#NFR01)), not a concept. |
| outward stage | X | | | | | Merged into **Journey stage**, with direction = outward. |
| return stage | X | | | | | Merged into **Journey stage**, with direction = return. |
| cancellation responsibility | | X | | | | "Who cancelled" and "provider caused" attributes of Cancellation ([A06](05-assumptions.md#A06)). |
