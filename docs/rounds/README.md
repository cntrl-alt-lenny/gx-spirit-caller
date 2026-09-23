# Rounds

One folder per round of work, named `NNN-short-slug`:

- `brief.md` — the task, written by Brain.
- `worker.md` (or the project's executor name) — the executor's report.
- `verifier.md` — the Verifier's findings, for Tier 2 rounds.

Reports are written by the seat and stamped and committed with
`python3 tools/fw.py report`. A round is finished when its folder is merged
into the default branch; a rejected round's brief lives on its branch, and the
round that replaces it names it under `Supersedes:`.

See `docs/agents/FRAMEWORK.md` for the process.
