# Rural Health Appointment Transport Service: CA1 Requirements and Domain Analysis

**Module:** SAAD71000 Object-Oriented Analysis and Design <br>
**Assessment:** CA1 Individual Requirements and Domain Analysis <br>
**Scenario:** South Kerry Community Travel Network <br>
**Author and owner of all artefacts:** Isabelle Lynch - T00264026

## About the scenario

South Kerry Community Travel Network is a not-for-profit service that takes rural residents to planned healthcare appointments, using volunteer drivers in their own cars and two accessible vehicles with employed drivers. Staff currently coordinate journeys with a shared calendar, a spreadsheet and paper driver sheets. As demand has grown, requests arrive incomplete, driver contacts and refusals go unrecorded, outward and return journeys are confused, and personal and clinical information is shared more widely than it should be.

This repository analyses that scenario: what the problem is, who is affected and what a first release of a transport coordination system must do. It covers analysis only, no design or implementation is included.

## Reading order

The report sections are listed in the order they should be read. Each builds on the one before, and every requirement, rule, use case and concept is linked to its sources by identifier.

| Artefact | Purpose | Related to |
|----------|---------|------------|
| [Scenario interpretation](report/01-scenario-interpretation.md) | Evidence, underlying problems (P01–P13), business problem statement and desired outcomes (O01–O09). | Basis for everything that follows |
| [Purpose and scope](report/02-purpose-and-scope.md) | Purpose statement, first-release scope, deferred and out-of-scope items, dependencies. | 05, 06, requirements |
| [Stakeholder and actor catalogue](report/03-stakeholder-and-actor-catalogue.md) | Actors, stakeholder goals (G01–G11) and the actor-goal table. | 07, 11 |
| [Stakeholder questions](report/04-stakeholder-questions.md) | Clarification questions Q01–Q22 for unresolved policies and evidence gaps. | 05, 06, requirements |
| [Assumptions](report/05-assumptions.md) | Temporary assumptions A01–A19, each with its risk and confirming question. | 04, requirements |
| [Rules and uncertainty register](report/06-rules-and-uncertainty-register.md) | Business rules (BR), constraints (C) and risks (R). | Requirements, 07 |
| [Functional requirements](requirements/01-functional-requirements.md) | FR01–FR14 with priority, rationale and verification. | 01–06, 07, 11 |
| [Non-functional requirements](requirements/02-non-functional-requirements.md) | NFR01–NFR06 with measurable targets. | 05, 11 |
| [Deferred requirements](requirements/03-deferred-requirements.md) | Candidates held for a later release, with reasons. | 02, 04 |
| [Use case model](report/07-use-case-model.md) | System boundary, use case catalogue UC01–UC09 and detailed UC03. | 03, requirements, 08 |
| [User stories and Gherkin examples](report/08-gherkin-examples.md) | Summary of US01–US05 and the Gherkin feature for US03. | Backlog, features |
| [User story backlog](requirements/04-user-story-backlog.md) | Authoritative story records with acceptance criteria and how each is verified. | 08, features |
| [Candidate concept analysis](report/09-candidate-concept-analysis.md) | Noun-phrase candidates, keep/merge/convert/remove decisions and glossary. | 10, rejected candidates |
| [Domain model](report/10-domain-model.md) | Conceptual classes, attributes, associations and multiplicities. | 09, diagrams |
| [Traceability matrix](report/11-traceability-matrix.md) | Chains from problem to requirement, use case, scenario and concept. | All |
| [Decision log](decisions/decision-log.md) | Significant analysis decisions D01–D24 and their rationale. | All |
| [Rejected candidate concepts](decisions/rejected-candidates.md) | Every scenario noun not carried into the model, with the reason. | 09 |
| [References](references/01-text-sources.md) | Harvard references for all cited sources. | All |

## Repository structure

```
README.md
report/         Numbered dossier sections 01–11
requirements/   Functional, non-functional and deferred requirements; user story backlog
features/       Gherkin feature file for US03 (Separate return driver)
diagrams/       PlantUML sources (.puml) with exported images (.png)
decisions/      Decision log and rejected candidate concepts
references/     Text sources and AI-use records
```

## Identifiers

Every item has a stable identifier so that it can be linked and traced.

| Prefix | Item | 
|--------|------|
| P | Problem | 
| UC | Use case |
| O | Desired outcome | 
| US | User story (`US03-AC1` acceptance criterion, `@US03-S1` scenario) |
| G | Stakeholder goal | 
| A | Assumption |
| FR / NFR | First-release requirement | 
| Q | Stakeholder question |
| DFR / DNFR | Deferred requirement | 
| BR / C / R | Business rule / constraint / risk |
| D | Decision | 

## Diagrams

Each diagram is kept as an editable PlantUML source next to its exported image:

- [use-case-diagram.puml](diagrams/use-case-diagram.puml) - [use-case-diagram.png](diagrams/use-case-diagram.png)
- [domain-model.puml](diagrams/domain-model.puml) - [domain-model.png](diagrams/domain-model.png)