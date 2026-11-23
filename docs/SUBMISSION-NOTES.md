# PromptShield repository documentation pack

This repository update adds the Milestone 2 submission materials without changing application code.

## Contents

- `docs/M2_PE-B13-22_PromptShieldAI.pdf` — Milestone 2 report.
- `docs/NovaNex_Synopsis.pdf` — two-page project synopsis.
- `prompts/final/` — ten prompt-family sheets with Easy, Intermediate, and Advanced variants.
- `prompts/v1/` through `prompts/v3/` — evaluator iteration records.
- `test-data/milestone2-test-matrix.md` — ten synthetic evaluator fixtures and outcomes.
- `CHANGELOG.md` — dated progress summary.

## Prompt inventory

The ten challenge families each contain three stage variants (30 challenge templates). The prototype also uses two distinct model-call roles: challenge answering and rubric evaluation. Verify this counting convention against the project form.

## Data and secrets

Test replies are synthetic fixtures. No API keys or passwords are included. Never commit `.env` or provider credentials.
