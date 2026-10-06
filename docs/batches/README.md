# Batches

One file per batch of work, named after the batch (`NN-short-slug`):

- `<batch>.md` — the Worker's summary: Done, Checked, Not checked, Failed or
  blocked.
- `<batch>-review.md` — the Verifier's review, for Checked batches only.

A batch is finished when its branch is merged into the default branch.
See `docs/agents/FRAMEWORK.md` for how work runs.
