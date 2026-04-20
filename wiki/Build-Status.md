# Build Status

Current round-trip state, region by region. `ninja sha1` is the final
gate and will stay red until every module checks green.

## EUR

With the [`--allow-unknown-function-calls`](Bootstrapping-Config#why---allow-unknown-function-calls)
workaround, `ninja rom` succeeds end-to-end and produces
`gx-spirit-caller_eur.nds`.

Module-level checksum state vs the baserom (from `dsd check modules`):

| Module       | Status  |
|--------------|---------|
| ARM9 main    | ❌ checksum diff |
| ITCM         | ✅ OK   |
| DTCM         | ❌ checksum diff |
| Overlay 0    | ✅ OK   |
| Overlay 1–3  | ✅ OK   |
| Overlay 4    | ❌ checksum diff |
| Overlay 5–23 | ✅ OK   |

**24 of 27 modules round-trip byte-identically.** The 3 failures are
almost certainly artifacts of the placeholder symbols that
`--allow-unknown-function-calls` injected; expect them to resolve as
the cross-module relocations in ARM9 main / DTCM / overlay 4 are
manually filled in (or as the upstream analyzer improves).

## USA

Baserom hashed. Overlay count and full round-trip TBD — bootstrapping
not yet run.

## JPN

Baserom hashed. Overlay count and full round-trip TBD — bootstrapping
not yet run.

---

## Known Placeholders

Tracked items from `CLAUDE.md`:

1. **Exact mwcc SP revision** — `2.0/sp1p5` is the DS-era default and
   dqix's choice. Revisit after the first objdiff attempt; if everything
   is off by the same handful of instruction patterns, the SP revision
   is the usual suspect.
2. **Overlay count & NitroSDK version** — EUR has 23 arm9 overlays
   (known after the first `dsd rom extract`). USA/JPN overlay counts
   still TBD; NitroSDK version unknown until `dsd init` completes for
   those regions.
3. **`progress.py` parser** — the 0% stub counts `function` lines in
   `symbols.txt`. Adjust if ds-decomp's schema differs from what the
   heuristic expects; the real `report.json` path is already wired.
