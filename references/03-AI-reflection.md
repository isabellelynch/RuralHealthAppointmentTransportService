# Reflection

## Decisions and revisions

The biggest revision was the scope of the first release. My first draft on 7 October listed 32 functional and 17 non-functional requirements because I had turned almost every sentence of the scenario into a “shall” statement. Many of them depended on policies the scenario leaves unresolved, such as eligibility review, provisional reservation and maximum waiting time. On 8 October I cut the first release to 12 functional requirements and moved the rest to a deferred list with reasons, rather than inventing policies to make them specifiable (D01, D05). The next day, checking against the brief, I realised I had cut too far. Funder reports are stated as required and clinical diagnoses are already arriving in referrals, so deferring FR13 and FR14 would have left a stated obligation and a data protection constraint unmet. I brought both back (D02).

In the domain model, I first expected to record a cancellation as a status on the journey stage. Working through FR11 showed that a status alone would lose who cancelled, the reason, the notice given and whether the provider caused it. A status also could not show one cancellation covering both stages. Cancellation therefore became its own concept (D18). Writing the Gherkin for US03 confirmed the earlier choice to model outward and return as separate stages, because changing the return driver had to leave the outward stage untouched.

## Limitations

Every non-functional target is an assumption (A11–A16). If drivers are out of coverage for longer than eight hours, NFR03 is wrong, and so is the boundary scenario US04-S5. Four Must requirements (FR06, FR12, FR13, FR14) have tests but no Gherkin examples. A final consistency review also found places where my text and diagrams disagreed, which I corrected before submission.

## Unresolved questions

The question that matters most for CA2 is Q03: whether a provisional assignment reserves a driver or vehicle. Staff disagree and until it is answered the design cannot prevent double-booking of the two accessible vehicles (DFR07).

## AI Use

The use of AI is a constant internal battle for me. While I recognize its benefits, I am hesitant to rely on it heavily throughout college. I am here to learn and I do not want AI to hinder that process. In my experience, relying heavily on AI for coding or learning exercises resulted in superficial understanding, leading me to avoid using it for the bulk of my coursework.

However, ignoring AI entirely would be disadvantageous. Throughout this assignment, I found it most useful as a practical assistant, specifically for formatting raw text into clean Markdown tables, recommending relevant readings to save research time and proofreading my spelling and grammar.

That said, using AI can also be frustrating. Without complete context, it frequently makes critical errors. For example, when asking it to reformat my text, it often altered the wording or added filler that was nonsensical. This required me to carefully review all outputs to ensure my original thoughts and work remained intact.