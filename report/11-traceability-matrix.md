# Traceability Matrix

Requirements traceability is the ability to follow a requirement both backwards to its origin and forwards to how it is verified ([Gotel and Finkelstein, 1994](../references/01-text-sources.md#gotel)). The first table traces each requirement back to the scenario, stakeholder evidence, business rules, assumptions and questions, and forward to its verification method. The second shows which stakeholders each requirement serves. Together they show that every requirement has a source and a test, and which requirements would be affected if an assumption changes.

## Requirements to sources and verification

| Req | Priority | Scenario section | Stakeholder evidence | Rules / constraints | Assumptions | Questions | Verification |
|-------|----------|------------------|----------------------|---------------------|-------------|-----------|--------------|
| [FR01](../requirements/01-functional-requirements.md#FR01) | Must | Transport requests and eligibility | Coordinator, referrer | BR03 | A01 | Q08 | Test |
| [FR02](../requirements/01-functional-requirements.md#FR02) | Must | Transport requests and eligibility | Coordinator | BR03 | A01, A02 | Q08 | Test |
| [FR03](../requirements/01-functional-requirements.md#FR03) | Must | Changes, cancellations and disruption | Referrer | – | – | – | Test |
| [FR04](../requirements/01-functional-requirements.md#FR04) | Must | Transport requests and eligibility | Accessible-vehicle driver | BR05, BR06 | A03 | Q02 | Test |
| [FR05](../requirements/01-functional-requirements.md#FR05) | Must | Planning and driver allocation | Accessible-vehicle driver | BR05, C04 | – | – | Test |
| [FR06](../requirements/01-functional-requirements.md#FR06) | Must | Planning and driver allocation | – (scenario text) | BR04, C04 | A04 | Q18 | Test |
| [FR07](../requirements/01-functional-requirements.md#FR07) | Should | Planning and driver allocation | Office staff | BR08, C05 | A09 | Q17 | Test |
| [FR08](../requirements/01-functional-requirements.md#FR08) | Must | Journey confirmation and completion | Coordinator, passenger | – | A05 | Q04 | Test |
| [FR09](../requirements/01-functional-requirements.md#FR09) | Must | Journey confirmation and completion | Passenger | – | A10 | Q15 | Inspection |
| [FR10](../requirements/01-functional-requirements.md#FR10) | Must | Journey confirmation and completion | – (scenario text) | C02 | A08 | Q14 | Demonstration |
| [FR11](../requirements/01-functional-requirements.md#FR11) | Should | Changes, cancellations and disruption | Referrer | BR09 | A06 | Q06 | Test |
| [FR12](../requirements/01-functional-requirements.md#FR12) | Must | Changes, cancellations and disruption | – (scenario text) | C04 | A07 | Q16 | Test |
| [FR13](../requirements/01-functional-requirements.md#FR13) | Must | Information and organisational context | – (scenario text) | BR11, C06 | A18 | Q21 | Test |
| [FR14](../requirements/01-functional-requirements.md#FR14) | Must | Transport requests and eligibility | Volunteer driver | C06, C07 | A19 | Q22 | Test |
| [NFR01](../requirements/02-non-functional-requirements.md#NFR01) | Must | Journey confirmation and completion | Volunteer driver | BR07, C06 | A03, A17 | Q02, Q20 | Test |
| [NFR02](../requirements/02-non-functional-requirements.md#NFR02) | Should | Organisation and current service | Office staff | – | A11, A12 | Q09, Q10 | Test |
| [NFR03](../requirements/02-non-functional-requirements.md#NFR03) | Should | Information and organisational context | – (scenario text) | C02, C03 | A08, A13 | Q11, Q14 | Test |
| [NFR04](../requirements/02-non-functional-requirements.md#NFR04) | Should | Journey confirmation and completion | – (inferred) | – | A14 | Q12 | Analysis |
| [NFR05](../requirements/02-non-functional-requirements.md#NFR05) | Must | Organisation and current service | – (inferred) | C08 | A15, A17 | Q13, Q20 | Test |
| [NFR06](../requirements/02-non-functional-requirements.md#NFR06) | Should | Information and organisational context | – (inferred) | – | A16 | Q19 | Inspection |

## Requirements to stakeholders

| Req | Coordinator | Office staff | Volunteer driver | Employed driver | Passenger | Referrer | Funder |
|-------|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
| FR01 | ✓ | ✓ | | | ✓ | ✓ | |
| FR02 | ✓ | ✓ | | | | ✓ | |
| FR03 | ✓ | ✓ | | | | ✓ | |
| FR04 | | ✓ | ✓ | ✓ | ✓ | | |
| FR05 | ✓ | | | ✓ | ✓ | | |
| FR06 | ✓ | | | ✓ | | | |
| FR07 | ✓ | ✓ | ✓ | | | | |
| FR08 | ✓ | | ✓ | ✓ | ✓ | | |
| FR09 | | ✓ | | | ✓ | | |
| FR10 | ✓ | | ✓ | ✓ | | | |
| FR11 | ✓ | ✓ | | | ✓ | ✓ | |
| FR12 | ✓ | ✓ | ✓ | ✓ | | | |
| FR13 | ✓ | | | | ✓ | | ✓ |
| FR14 | | ✓ | ✓ | ✓ | ✓ | ✓ | |
| NFR01 | ✓ | | ✓ | ✓ | ✓ | | |
| NFR02 | ✓ | ✓ | | | | | |
| NFR03 | ✓ | | ✓ | ✓ | | | |
| NFR04 | ✓ | ✓ | ✓ | ✓ | | | |
| NFR05 | ✓ | ✓ | | | ✓ | | |
| NFR06 | | ✓ | ✓ | ✓ | | | |
