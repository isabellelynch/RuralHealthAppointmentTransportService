# Purpose and Scope

This section states what the proposed system is for and where its boundaries lie. A clear scope statement lets every requirement be tested against it and helps prevent scope creep ([Wiegers and Beatty, 2013](../references/01-text-sources.md#wiegers)). Scope is divided into three parts: capabilities specified for the first release, capabilities that are in scope but deferred to a later release, and items that are out of scope altogether.

## Purpose Statement

The system will support South Kerry Community Travel Network in coordinating planned, non-emergency transport to healthcare appointments, from receiving a request through to completing the journey. It will help staff record passenger needs, allocate suitable drivers and vehicles, and manage changes, while sharing personal information only where necessary.

## In Scope: Specified for the First Release

- Recording transport requests with their mandatory details, and preventing allocation until those details are complete ([FR01](../requirements/01-functional-requirements.md#FR01), [FR02](../requirements/01-functional-requirements.md#FR02)).
- Recording changes to requests ([FR03](../requirements/01-functional-requirements.md#FR03)).
- Recording practical travel needs ([FR04](../requirements/01-functional-requirements.md#FR04)).
- Checking vehicle capacity and accessible-vehicle authorisation when a journey is assigned ([FR05](../requirements/01-functional-requirements.md#FR05), [FR06](../requirements/01-functional-requirements.md#FR06)).
- Recording driver contact attempts, including declined offers ([FR07](../requirements/01-functional-requirements.md#FR07)).
- Recording outward and return stages separately ([FR08](../requirements/01-functional-requirements.md#FR08)).
- Producing passenger confirmations ([FR09](../requirements/01-functional-requirements.md#FR09)).
- Recording journey progress by drivers, including where there is no mobile signal ([FR10](../requirements/01-functional-requirements.md#FR10), [NFR03](../requirements/02-non-functional-requirements.md#NFR03)).
- Recording cancellations with their reason and responsibility ([FR11](../requirements/01-functional-requirements.md#FR11)).
- Identifying journeys affected when a driver becomes unavailable ([FR12](../requirements/01-functional-requirements.md#FR12)).
- Producing anonymised summary reports for funders ([FR13](../requirements/01-functional-requirements.md#FR13)).
- Removing clinical information that referrers include unnecessarily ([FR14](../requirements/01-functional-requirements.md#FR14)).
- Restricting drivers to the passenger details of journeys they have accepted ([NFR01](../requirements/02-non-functional-requirements.md#NFR01)).

## In Scope: Deferred to a Later Release

These are part of the intended system but are not specified for the first release, usually because they depend on an unresolved policy. See [deferred requirements](../requirements/03-deferred-requirements.md).

- Eligibility decisions and reviews ([DFR04](../requirements/03-deferred-requirements.md#DFR04), [DFR05](../requirements/03-deferred-requirements.md#DFR05)).
- Suggesting suitable drivers and vehicles, and rechecking them after changes ([DFR06](../requirements/03-deferred-requirements.md#DFR06), [DFR13](../requirements/03-deferred-requirements.md#DFR13)).
- Shared journeys and provisional assignments ([DFR08](../requirements/03-deferred-requirements.md#DFR08), [DFR09](../requirements/03-deferred-requirements.md#DFR09)).
- Driver journey sheets, printed and on a phone ([DFR11](../requirements/03-deferred-requirements.md#DFR11)).
- Recording driver exceptions and waiting time ([DFR12](../requirements/03-deferred-requirements.md#DFR12)).
- Finding replacement drivers and notifying passengers and referrers when transport fails ([DFR14](../requirements/03-deferred-requirements.md#DFR14), [DFR15](../requirements/03-deferred-requirements.md#DFR15)).
- The coordinator overview and the full role model ([DFR16](../requirements/03-deferred-requirements.md#DFR16), [DFR17](../requirements/03-deferred-requirements.md#DFR17)).

## Out of Scope

- Emergency transport or dispatch.
- Direct access to healthcare or clinical records.
- Clinical decision-making.
- Booking or changing healthcare appointments with providers.
- Processing payments for travel contributions.
- Driver recruitment, training and vehicle maintenance.
- Live vehicle tracking or turn-by-turn navigation.
