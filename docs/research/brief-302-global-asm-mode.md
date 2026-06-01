[//]: # (markdownlint-disable MD013 MD041)

# Brief 302 — whole-function ship-as-.s (GLOBAL_ASM) endgame mode

**Status:** built + verified. decomp.me / research / tools only — no SHA1,
no `.c`/`.s` shipped (the emitted `.s` land in gitignored `build/`; the
decomper commits them on demand). Fetched content as data. **Headline:
`tools/asm_escape.py` gains a `--whole-function` mode that emits any
function's original disassembly verbatim as a byte-exact mwasm `.s` TU — no
C, no near-match. Piloted on 3 reg-alloc-walled ov002 picks (1 straight-line
reg-numbering wall + 2 loops), all byte-identical vs the delinked `.o`. This
completes the toolkit: every unmatched function now has a ship path — C,
canonicalisation-`.s`, or whole-`.s`.**

## The mode — `asm_escape.py --whole-function`

Brief 294 settled the endgame: the ~46 % reg-alloc-walled tail ships as
byte-exact assembly (the scene's `NON_MATCHING`/`GLOBAL_ASM` norm). The
existing `asm_escape.py` only handled the single-instruction canonicalisation
class and **REFUSEs** whole-function reg-alloc walls (the allocation differs
everywhere, not at one swap). This brief builds the whole-function path:

```text
delinked .o  --objdump-->  orig instrs
  emit the WHOLE stream verbatim as mwasm .s (no C, no diff, no classify):
    * UAL -> mwasm conversion (reused: push/pop, shifts, hex imm)
    * pc-relative pool loads -> `_LITn: .word` slots (reused)
    * INTERNAL branches (b/bcc, no reloc) -> `.L_<addr>` local labels  [NEW]
    * external calls (bl/b/blx + PC24 reloc) -> the symbol (reused)
  assemble with mwasmarm + byte-verify vs the delinked .o.
```

The one genuinely-new piece is **internal-branch local labels**
(`branch_targets()` + an `emit_asm(whole=True)` path): the canonicalisation
class is straight-line, so it never needed them, but reg-alloc-walled
functions are loops/dispatchers with back-edges and forward branches. The
mode reuses the rest of the brief-290/292 machinery (`to_mwasm`,
`emit_asm`, `bytes_match`) — it is byte-exact by construction (it IS the
orig disassembly), and the assemble-and-byte-verify step proves the mwasm
round-trip. Backward-compatible: the canonicalisation mode (`--c`) is
unchanged; 22 unit tests pass (4 new, CI-safe, no build).

## Pilot — 3 reg-alloc-walled picks, byte-identical

`asm_escape.py func_ov002_<x> --whole-function` (it finds the gap `.o`
itself):

| pick | shape | result |
|---|---|---|
| `021d8128` | straight-line reg-numbering wall (wave-13/14) | ✅ byte-identical (23 words) |
| `0229d154` | loop | ✅ byte-identical (12 words) |
| `0223b3cc` | loop (counted scan + back-edge) | ✅ byte-identical (13 words) |

The two loops exercise the new internal-label path; e.g. `0223b3cc` emits a
`.L_1640:` loop-top label, `bcc .L_1640` back-edge, the `ldr rN, _LIT0`
pool, and `lsl`→`mov rN, rM, lsl #n` — a clean GLOBAL_ASM TU that assembles
to the exact original bytes.

## The completed toolkit — every function has a ship path

| path | for | tool | output |
|---|---|---|---|
| **C** | the ~50 % reachable cohort | hand-RE + `ov002_core.h` | matched `.c` |
| **canonicalisation-`.s`** | single commutative-add wall (brief 288/290) | `asm_escape.py --c` | surgical `.s` |
| **whole-`.s`** | reg-alloc-walled tail (~46 %, brief 294) | `asm_escape.py --whole-function` | verbatim `.s` |

With this mode, no unmatched function is without a byte-exact ship route —
the project can reach SHA1-completeness (the walled tail as asm, C as it
gets written). This is the **last toolkit piece**; the scaffolder research
arc (map → header → `.s` hatch → endgame scout → whole-`.s`) is complete.

**Readiness, not a usage decision.** This does not change the drain order:
the decomper still writes C first and only reaches for `--whole-function`
when a function is confirmed reg-alloc-walled (no C match, not the
1-instruction class). It just makes the walled tail *shippable on demand*
instead of blocked.

## Falsification

- "byte-exact": `asm_escape.py <func> --whole-function` assembles the
  emitted `.s` with mwasmarm and byte-compares vs the delinked `.o`; 3/3
  pilots ✅ (re-runnable).
- "internal labels correct": `branch_targets` unit test ({0x8, 0x1c} for the
  loop fixture, ∅ for straight-line); the `0223b3cc` `.s` shows
  `.L_1640`/`bcc .L_1640`.
- "canonicalisation mode unchanged": its 18 tests still pass; the `--c`
  path and header are untouched.

## Scope

Tool + research: `asm_escape.py` extended (+ 4 tests); no `.c`/`.s` shipped
(emitted `.s` are in gitignored `build/_asm_escape/`, regenerated on
demand). No SHA1. The mode is readiness for the decomper, not a wave.

## Cross-references

- `tools/asm_escape.py` / `tests/test_asm_escape.py` — the tool (now
  two-mode) + tests.
- `docs/research/brief-294-regalloc-wall-scout.md` — the endgame this
  implements (ship-as-`.s` for the walled tail).
- `docs/research/brief-290-asm-escape-hatch.md` /
  `brief-292-consolidate...` — the canonicalisation hatch + the consolidation
  this extends.
- `docs/research/brief-288-wave7-addorder-residue.md` — the
  canonicalisation wall (the other `.s` class).
