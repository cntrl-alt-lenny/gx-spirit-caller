---
description: Run tools/nitro_suggest_renames.py to propose NitroSDK names for placeholder functions. Surfaces HIGH/MEDIUM confidence suggestions by default; LOW hidden.
argument-hint: [--include-failing-modules] [--show-low-confidence] [--limit N]
allowed-tools: Bash, Read
---

Run `tools/nitro_suggest_renames.py` against `config/eur` with any flags the user passed in `$ARGUMENTS`.

Common flag usage:

- **No args** — default scan. Tractable set ≈ 330 placeholders outside failing modules; scorer surfaces HIGH/MEDIUM only.
- **`--include-failing-modules`** — expands the scan to ~1000 targets including main/dtcm/ov004. Useful when looking for cascade picks in main specifically (most named callees are there, so this is where `BARE_NAME_SUBSYSTEMS` signal fires).
- **`--show-low-confidence`** — surfaces every scored target including LOW. Produces 1000+ rows; prefer only when hunting for a specific address.
- **`--limit N`** — caps the report at N targets.

Before running, check whether the Nitro dictionary is built:

```bash
ls build/analysis/nitro_dict.json
```

If missing, offer to build it first:

```bash
python tools/nitro_dict.py build --nitro-sdk /path/to/NitroSDK-clone
```

The typical clone target is `/tmp/NitroSDK` (cloud sessions) or `../NitroSDK` (local); check both. If no clone exists, the user has to clone `https://github.com/ntrtwl/NitroSDK` first.

Invoke:

```bash
python tools/nitro_suggest_renames.py --version eur $ARGUMENTS
```

Summarise for the user:

1. **Confidence breakdown** headline — `0 HIGH / M MEDIUM / L LOW`.
2. **Top MEDIUM hits** (up to 5) as a compact list: `<module>|<addr>` | top candidate name | score.
3. **Signal reality check** — how many tractable targets carry any callee signal. If it's tiny (current corpus is ~0.1%), flag that the suggester is signal-starved and the main win is candidate quality on the handful of signalled targets, not corpus-wide coverage.
4. **Natural next step** — if the user hasn't run `/cascade` yet, suggest pairing: the suggester gives names; `/cascade` picks leverage. If they've already done that, suggest the concrete top target + `scratch_bundle.py` for drafting.

Do NOT dump the full report to the terminal. The report.md under `build/eur/analysis/` is 500+ lines; summarise + offer to read specific sections.

Cross-refs:
- `docs/research/nitro-rename-suggestions-round3.md` — latest analysis with the signal-coverage math
- PRs #114, #117, #121, #134 — the name-suggestion evolution

Arguments: $ARGUMENTS
