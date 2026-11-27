# Prompt design iterations

> Retrospective reconstruction from the project conversation and visible prototype behavior. Earlier prompt strings were not saved as version-control artifacts, so these summaries are not claimed to be verbatim historical prompts. Confirm wording with the team before submission.

| Version | Change | Reason | Observed direction |
|---|---|---|---|
| v1 — baseline | Started with short, direct instruction-override and role-confusion challenges, paired with expected safe behavior. | Establish a beginner-friendly baseline and keep each test understandable. | The interface could show a challenge and let a user paste a chatbot reply for review. |
| v2 — staged challenges | Organized tests into Easy, Intermediate, and Advanced levels, adding indirect framing, authority claims, repeated pressure, hypotheticals, and multi-step wording. | Give users a progression from simple boundary checks to more layered instruction conflicts. | The prototype exposes difficulty stages and shows the boundary each test is designed to probe. |
| v3 — evaluation workflow | Refined the evaluator around per-test evidence, verdict, confidence, and recommendations; made evaluation a deliberate user action after replies are entered. | Make results easier to interpret and reduce unsupported conclusions from generic judge output. | The report flow summarizes answered checks and provides review-oriented feedback; AI scoring remains heuristic and needs human verification. |


## Verification note

This log describes the evolution visible in the project history and conversation. It does not establish that any prompt reliably fools a model. The prompts and responses should be rerun on authorized systems, and any measured results should record the model/provider, date, rules, exact input, actual output, and reviewer decision.
