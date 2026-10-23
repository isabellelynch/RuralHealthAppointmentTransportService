# Rejected Candidate Concepts

This record supports the [candidate concept analysis](../report/09-candidate-concept-analysis.md). It lists every noun phrase from the scenario that was **not** carried into the model, grouped by the reason it was excluded. Keeping the rejections here keeps the report section focused on the concepts that remain, while still showing that every candidate was considered and why each was left out ([Larman, 2004](../references/01-text-sources.md#larman)).

## Reasons for exclusion

| Category | Meaning |
|---|---|
| Context | Describes the organisation or setting. There is only one, or nothing to record. |
| Out of scope | Excluded by the [purpose and scope](../report/02-purpose-and-scope.md) or a constraint. |
| Deferred | Needed only by a [deferred requirement](../requirements/03-deferred-requirements.md), usually because a policy is unresolved. |
| Current tool or channel | Part of how the service works today, not a business concept. |
| Derived | Can be calculated or displayed from data already held. Storing it would duplicate data. |
| Rule or constraint | A quality or access rule handled by a requirement, not a thing to record. |
| Vague | Too general to have identity or attributes. |

## Rejected candidates

| Candidates | Category | Reason | Related |
|---|---|---|---|
| South Kerry Community Travel Network, network, not-for-profit service, rural communities | Context | The organisation that owns the system. There is only one, so it is the system's context rather than a class. The system records individual passengers, not communities. | None |
| first release | Context | A project scope term, not a business concept. | [Purpose and scope](../report/02-purpose-and-scope.md) |
| emergency transport, emergency dispatch | Out of scope | The service does not provide emergency transport. | [BR01](../report/06-rules-and-uncertainty-register.md#BR01), [C01](../report/06-rules-and-uncertainty-register.md#C01) |
| clinical diagnosis, medical history, healthcare records, clinical decision-making | Out of scope | Must not be held or shown. The system has no access to healthcare records. | [C01](../report/06-rules-and-uncertainty-register.md#C01), [C07](../report/06-rules-and-uncertainty-register.md#C07), [FR14](../requirements/01-functional-requirements.md#FR14) |
| directions | Out of scope | Navigation is out of scope. The collection address and destination are enough. | [Purpose and scope](../report/02-purpose-and-scope.md) |
| funders | Out of scope | Offstage stakeholders who receive reports. They do not use the system and no funder data is recorded. | [FR13](../requirements/01-functional-requirements.md#FR13) |
| eligibility, eligibility discussion, eligibility evidence, review period, transport alternative | Deferred | Eligibility policy is unresolved, so eligibility records are deferred. Expected to become an Eligibility decision class once the policy is agreed. | [Q01](../report/04-stakeholder-questions.md#Q01), [BR02](../report/06-rules-and-uncertainty-register.md#BR02), [DFR04](../requirements/03-deferred-requirements.md#DFR04), [DFR05](../requirements/03-deferred-requirements.md#DFR05) |
| shared journeys, compatible passengers, nearby locations | Deferred | Shared journeys are an efficiency gain deferred from the first release. Agreement to share is still recorded as a travel need. | [DFR08](../requirements/03-deferred-requirements.md#DFR08), [BR06](../report/06-rules-and-uncertainty-register.md#BR06) |
| suitable driver | Deferred | Suggesting suitable drivers is deferred. Staff choose manually, with FR05 and FR06 preventing unsafe choices. | [DFR06](../requirements/03-deferred-requirements.md#DFR06) |
| maximum waiting time | Deferred | No waiting policy has been agreed, so exception recording is deferred. | [Q05](../report/04-stakeholder-questions.md#Q05), [DFR12](../requirements/03-deferred-requirements.md#DFR12) |
| replacement (driver) | Deferred | Finding a replacement automatically is deferred. Reassignment uses UC03. | [DFR14](../requirements/03-deferred-requirements.md#DFR14) |
| printed journey sheets | Deferred | An output format that depends on what may be shared with drivers. | [DFR11](../requirements/03-deferred-requirements.md#DFR11), [Q02](../report/04-stakeholder-questions.md#Q02) |
| telephone, referral email, emails | Current tool or channel | Ways requests arrive. Emails are not stored, and recording the channel is deferred. | [A19](../report/05-assumptions.md#A19), [DFR01](../requirements/03-deferred-requirements.md#DFR01) |
| shared calendar, spreadsheet, paper driver sheet, spreadsheet entry | Current tool or channel | Tools being replaced by the new system. | [C08](../report/06-rules-and-uncertainty-register.md#C08) |
| demand, accessible-vehicle demand | Derived | Figures calculated from requests and journeys. The coordinator overview is deferred. | [DFR16](../requirements/03-deferred-requirements.md#DFR16) |
| views | Derived | Screens showing data already held. | [DFR16](../requirements/03-deferred-requirements.md#DFR16) |
| confidential information, unrelated personal details, restricted information | Rule or constraint | Handled by access rules on what drivers can see, not recorded as data. | [NFR01](../requirements/02-non-functional-requirements.md#NFR01), [BR07](../report/06-rules-and-uncertainty-register.md#BR07) |
| mobile coverage | Rule or constraint | An environmental constraint met by offline storage. | [C02](../report/06-rules-and-uncertainty-register.md#C02), [NFR03](../requirements/02-non-functional-requirements.md#NFR03) |
| exact collection time | Rule or constraint | Not promised. A collection window is used instead. | [FR09](../requirements/01-functional-requirements.md#FR09) |
| circumstances, plans, suitable transport, another passenger, unnecessary travel, previous appointments | Vague | Too general to record. No identity or attributes. Some describe goals or explain why times slip. | None |