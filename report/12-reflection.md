# Reflection

## Decisions and revisions

The biggest revision was the scope of the first release. My first draft on 7 October listed 32 functional and 17 non-functional requirements because I had turned almost every sentence of the scenario into a “shall” statement. Many of them depended on policies the scenario leaves unresolved, such as eligibility review, provisional reservation and maximum waiting time. On 8 October I cut the first release to 12 functional requirements and moved the rest to a deferred list with reasons, rather than inventing policies to make them specifiable (D01, D05). The next day, checking against the brief, I realised I had cut too far. Funder reports are stated as required and clinical diagnoses are already arriving in referrals, so deferring FR13 and FR14 would have left a stated obligation and a data protection constraint unmet. I brought both back (D02).

In the domain model, I first expected to record a cancellation as a status on the journey stage. Working through FR11 showed that a status alone would lose who cancelled, the reason, the notice given and whether the provider caused it. A status also could not show one cancellation covering both stages. Cancellation therefore became its own concept (D18). Writing the Gherkin for US03 confirmed the earlier choice to model outward and return as separate stages, because changing the return driver had to leave the outward stage untouched.

## Limitations

Every non-functional target is an assumption (A11 to A16). If drivers are out of coverage for longer than eight hours, NFR03 is wrong, and so is acceptance criterion US04-AC3. Gherkin examples cover only US03 (FR05, FR08 and FR09). The other Must requirements rely on the tests stated in the requirements catalogue, which is weaker evidence for rules such as FR02 and FR06. A final consistency review also found places where my text and diagrams disagreed, which I corrected before submission.

## Unresolved questions

The question that matters most for CA2 is Q03: whether a provisional assignment reserves a driver or vehicle. Staff disagree and until it is answered the design cannot prevent double-booking of the two accessible vehicles (DFR07).

## AI Use

The use of AI is a constant internal battle for me. While I recognize its benefits, I am hesitant to rely on it heavily throughout college. I am here to learn and I do not want AI to hinder that process. In my experience, relying heavily on AI for coding or learning exercises resulted in superficial understanding, leading me to avoid using it for the bulk of my coursework.

However, ignoring AI entirely would be disadvantageous. Throughout this assignment, I found it most useful as a practical assistant, specifically for formatting raw text into clean Markdown tables, recommending relevant readings to save research time and proofreading my spelling and grammar.

That said, using AI can also be frustrating. Without complete context, it frequently makes critical errors. For example, when asking it to reformat my text, it often altered the wording or added filler that was nonsensical. This required me to carefully review all outputs to ensure my original thoughts and work remained intact.

# AI Interaction Log

Representative interactions only, not every prompt. All analysis decisions are my own. AI output was checked against the scenario and brief before use.

| # | Tool | Purpose | Prompt (summary) | What it suggested | What I did |
|---|------|---------|------------------|-------------------|------------|
| 1 | Gemini | Formatting | Can you turn {text} into a formatted md table | It provided formatted tables, but often altered my content and hallucinated context that did not make sense. | Generally discarded the output unless only minor formatting changes were needed, in which case I kept the formatting and re-inserted my original content. |
| 2 | Claude | Reading suggestions | Can you give me an example of a book chapter or paper where I could get solid information on {topic}? | Suggested relevant, accessible academic sources and papers. | Followed up on its suggestions, which saved significant research time in identifying key materials. |
| 3 | Claude | Linking | Can you show me how to create links in my Markdown files? | Provided clear syntax instructions for Markdown cross-referencing. | Applied the advice to link requirements, references, and other project files across the repository. |
| 4 | Claude | Final review against the brief | Asked whether the repository was ready for submission (brief and scenario attached). | Advised restoring an AI interaction log, making the repository private, checking if a single combined dossier was required, and adding a boundary Gherkin scenario. | Restored the log, completed this summary table, and added the missing boundary Gherkin scenario. |
| 5 | Claude | General Corrections | Can you check that {content} makes sense? | Offered mixed feedback—some suggestions were helpful, while others introduced unnecessary or inaccurate additions. | Selectively adopted valid suggestions (e.g., catching a missing requirement) while rejecting hallucinated or irrelevant edits. |



## Example of a Suggestion I Checked and Changed or Rejected

Towards the end of the project, I asked Claude to help resolve file paths. It generated a script intended to fix broken internal links resulting from file reorganization. 

When executed, the script unexpectedly began deleting my Gherkin `.feature` files as part of a broader, unprompted restructuring effort. Because I was monitoring the changes and using **Git**, I was able to immediately halt the script and roll back the repository to a clean state. 

This experience underscored the importance of never trusting automated AI scripts blindly, maintaining human oversight and leveraging version control when integrating AI into a software development workflow.
