# objdiff-sha1 gap research index

## Files

| File | What it covers |
|------|----------------|
| gap-taxonomy.md | 5 failure modes A-E; verify.py/ninja-report/sha1 pipeline; sha1-clean recipe |

## Key finding

`verify.py` wildcards every pool word whose orig gap `.o` has an `R_ARM_ABS32` reloc.
`dsd delink` emits relocs for ALL pool words, so pool word VALUES are never checked by `verify.py` or raw `ninja objdiff`.
Modes A (wrong pool value) and B (wrong callee) explain ~80% of objdiff-100%/sha1-fail.
Fix: run `ninja report` after `verify.py` passes (before `ninja sha1`) — this resolves pool words and catches Mode A/B.

## Dossier mode distribution (first 200 HIGH candidates)

| Mode | Count | Catchable by |
|------|-------|-------------|
| E — visible instruction diff | 158 | `verify.py` directly |
| A — wrong pool word value | 31 | `ninja report` only |
| B — wrong callee address | 8 | `ninja report` only |
| D — .s-only (pool dedup) | 3 | n/a (cannot match as .c) |

See [`../dossiers-high/INDEX.md`](../dossiers-high/INDEX.md) for per-function table.
