[//]: # (markdownlint-disable MD013)

# Brief 528 - main small-contained c-match wave

Branch: `claude/cmatch-main-528`

Scope: continuing the best lane from brief 527 — MAIN-module MED-tier small
candidates from `docs/research/campaign-analytics/safe-queue-v3.md` §4, this
time the `LIKELY`-tier block (ranks 48-119) one confidence step below what
briefs 520/521/527 already drained (ranks 13-38, `YES (med)`), plus one
previously-skipped gap in that earlier range (`020779d8`, rank 26).

## Outcome

- Candidates attempted: **24**
- EUR matches accepted: **10**
- Reshape-parked: **2** (contained, but the residual is compiler-internal)
- Avalanche-parked: **12**
- USA/JPN ports: **10/10 kept**, both regions gated green

## Matched candidates

| Addr | Recipe | Key fix(es) |
|---|---|---|
| `0200c078` | comparator vs. `val` by mode, tail flag-write | Zero-shot — the dossier draft matched byte-identical on the first build. |
| `0200c284` | near-clone of `0200c078` (different struct offsets/stride/mask) | Zero-shot, confirming the dossier's own "near-clone" prediction. |
| `0202c770` | switch-of-constants → `addls pc,pc` jump table | **Dossier's case-value mapping was wrong.** It claimed `case 5..8 -> 0,1,2,4`; a byte-level diff of the jump-table branch targets against the real ROM bytes showed the actual mapping mirrors cases 0-3 onto 5-8 (`1,2,4,8` both times), with case 4 falling through to the shared default (`return 0`). Corrected the switch body to `case 0:1;case1:2;case2:4;case3:8; (gap at 4); case5:1;case6:2;case7:4;case8:8; default:0` — zero diff. |
| `0202e6f4` | sparse card-ID membership switch → 0/1 | Zero-shot — mwcc's binary-search compare tree reproduced exactly from the case set alone. |
| `0202e864` | sparse card-ID membership switch → 0/1 | Zero-shot, same family as `0202e6f4`. |
| `0202ed04` | sparse card-ID membership switch → 0/1 (two 3-value runs) | Zero-shot. |
| `0202ed90` | card-ID membership, mixed jump-table + compare-tree | Zero-shot. |
| `0202ee40` | card-ID membership, 9-entry jump-table sub-run + tree | Zero-shot. |
| `0202ef38` | card-ID membership, 19-entry jump-table sub-run + tree | Zero-shot. |
| `0202f218` | card-ID membership, pure compare tree (no jump-table) | Zero-shot. |

**The sparse card-ID membership switch is the standout productive sub-shape
this wave: 7 of 8 attempted matched** (`0202e358` is the one exception — see
Parked below). For this shape, `switch(id) { case V1: case V2: ...: return 1;
default: return 0; }` transcribed directly from the dossier's decoded member
set reproduces mwcc's binary-search compare tree (pivot selection, adjacent-
value equality folds, and jump-table sub-runs for dense clusters) byte-exactly
with **no reshape needed** — despite every one of these dossiers explicitly
flagging pivot selection as "compiler-internal, permuter-class if it
diverges." It didn't diverge; transcribing the member set as-is was
sufficient every time except once.

## The one non-zero-shot match: `0202c770`

Worth its own note since it demonstrates the structure-first diagnostic step
working as intended. `containment_check.py` reported CONTAINED with a 9-byte
diff. Rather than guessing at register/operand reshapes, decoding the raw
ARM9 bytes at the diff offsets (both the jump-table branch targets and the
case-body return values) directly against the extracted ROM showed the
dossier's documented case-value mapping (`5->0, 6->1, 7->2, 8->4`) didn't
match what the ROM's own table actually encoded. The real mapping mirrors
`case 0-3` onto `case 5-8` (both `1,2,4,8`), with `case 4` an implicit gap
that falls to the shared default block. This is a case of the dossier's own
recipe having a real bug — not a compiler-codegen issue at all — caught by
reading ground truth bytes instead of trusting the prose. First fix attempt
closed 9→5 bytes (case values only); the jump-table-target diff automatically
resolved once the underlying case mapping was corrected (the table entries
were always consistent with *some* mapping, just not the documented one).

## Parked candidates

All parked with the working tree fully reverted (`.s` restored via
`git checkout HEAD --`, `delinks.txt` line reset). One-line reasons:

| Addr | Bucket | One-line reason |
|---|---|---|
| `020779d8` | avalanche | `do{--n}while` draft compiled 32 bytes over budget (SIZE DELTA +32) — never reached objdiff comparison. |
| `0200a2f4` | avalanche | Same total size as orig but the whole ARM9 image scrambled from byte 0 — struct-guessed offsets (`data_02106810+0x1a00+0xa4/0xa6`) likely wrong; per the containment-gate rule, size-neutral avalanches get parked exactly like size-mismatches, not reshaped. |
| `0200f044` | avalanche | Jump-table switch + intentionally-uninitialised local; compiled 32 bytes short (SIZE DELTA -32). Confidence was LOW per its own dossier; not pursued further. |
| `0200fa90` | avalanche | Confirmed the dossier's own "permuter-class" prediction (`&head`-vs-`Node*` aliasing in `pos`). |
| `0200fb18` | avalanche | SIZE DELTA +32; bitfield-guard predication shape likely diverged. |
| `0200fd1c` | avalanche | Same total size, full-image scramble; single-load CSE across both branches likely didn't hold. |
| `02010354` | avalanche | LOW-confidence draft (`rsb` gap-subtraction operand order); scrambled from byte 0. |
| `02010a98` | reshape-parked | CONTAINED, 20-byte diff — decoded to a **systemic register substitution** (ip/r12 vs lr/r14 and several other register-field swaps) across nearly every instruction in the loop body, not a single fixable line. One reshape attempt (dropping the named `zero` local for a bare `idx = 0`) made no difference. Matches the P-11-class reg-allocator-plateau signature documented in `codegen-walls.md` — genuine wall, not a quick reshape. |
| `0201934c` | reshape-parked | CONTAINED, 17-byte diff — isolated entirely to the switch's jump-table dispatch entries (every threshold/`g0`/`g1` comparison in the case bodies already matched perfectly). Tried explicit dense `case 0/1/2/5: break;` labels to force table-layout parity with source order; zero effect — the divergence is in which case bodies mwcc treats as shareable/direct-`bx lr` targets, a table-construction internal, not reachable from the case-label reshape tried. |
| `0201d620` | avalanche | Confirmed the dossier's own "permuter-class" prediction (15-instruction byte-swap chain is scheduling/regalloc-bound). |
| `0201ddac` | avalanche | Same total size, full scramble; the else-branch reload-vs-CSE fork likely diverged. |
| `02023eb8` | avalanche | MMIO double-volatile-read RMW; predication/scheduling likely diverged. |
| `02026e38` | avalanche | SIZE DELTA -32; struct-guessed `0x16a` bitfield offset. |
| `0202e358` | avalanche | SIZE DELTA +32 — the one miss in the otherwise 7/8 card-ID-membership family. mwcc picked a different binary-search pivot tree for this specific 12-member set; per its own dossier, pivot selection is compiler-internal and not reshape-able from C. |

## Porting

All 10 EUR matches ported to USA and JPN via `tools/port_to_region.py`.
`0200c078`/`0200c284` resolved at HIGH confidence (2/2 symbols). The 8
card-ID-membership matches are pure leaf functions with **zero** relocations
to cross-check (no pool words, no callees, no globals — pure integer
comparisons), so the porter refused at the default HIGH floor and landed at
MEDIUM via the D2 v2 auto-promotion rule, all 8 sharing one **consistent
-0x54 neighbor-shift** from 5 HIGH-confidence neighbors. Same situation as
brief 527's `02033a80`/`02076cc0`/`0208b108` — accepted at
`--confidence-floor MEDIUM` and let the per-region `ninja sha1` gate be the
final arbiter. Both USA and JPN passed byte-identical for all 10.

**Tooling note:** `port_to_region.py` writes the new `.c` file and *prints*
the `delinks.txt` block that should replace the existing `.s:` entry, but
does not edit `delinks.txt` itself. Forgetting this step produces a
`ninja: error: multiple rules generate build/<region>/.../func_X.o` (both the
stale `.s` rule and the new `.c` rule target the same object) — the fix is
the same manual `.s:`→`.c:` flip + `.s` removal used for the EUR side of this
loop the whole wave.

| EUR addr | USA/JPN addr | Confidence |
|---|---|---|
| `0200c078` | `0200c05c` | HIGH |
| `0200c284` | `0200c268` | HIGH |
| `0202c770` | `0202c71c` | MEDIUM (leaf, no relocs) |
| `0202e6f4` | `0202e6a0` | MEDIUM (leaf, no relocs) |
| `0202e864` | `0202e810` | MEDIUM (leaf, no relocs) |
| `0202ed04` | `0202ecb0` | MEDIUM (leaf, no relocs) |
| `0202ed90` | `0202ed3c` | MEDIUM (leaf, no relocs) |
| `0202ee40` | `0202edec` | MEDIUM (leaf, no relocs) |
| `0202ef38` | `0202eee4` | MEDIUM (leaf, no relocs) |
| `0202f218` | `0202f1c4` | MEDIUM (leaf, no relocs) |

USA and JPN addresses are identical for all 10 candidates in this wave.

## Yield and runway

- EUR yield this wave: **10 / 24 attempted = 41.7%** — noticeably higher than
  brief 527's 26% despite this being the lower-confidence `LIKELY` tier, ​
  entirely on the strength of the card-ID membership switch sub-shape.
- Card-ID membership sub-shape yield: **7 / 8 = 87.5%**.
- Remaining safe-queue-v3 rank 48-119 pool: 62 candidates still unattempted
  after this wave's 24 (this wave covered ranks 48-52, 55-56, 60-83
  non-contiguously plus rank 26's gap; the untouched remainder is concentrated
  in ranks 84-119, not yet surveyed for further card-ID-membership siblings).

## Verification

Final SHA gates:

```text
gx-spirit-caller_eur.nds: OK
gx-spirit-caller_usa.nds: OK
gx-spirit-caller_jpn.nds: OK
```
