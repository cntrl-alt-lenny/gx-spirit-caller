# Brief 655 — C-match sweep on `main`

Date: 2026-07-22
Branch: `claude/main-sweep-655`

## Headline

**6/34 real attempts shipped** (4 coercible + 2 unknown), byte-verified
across all 3 regions. The bigger finding is a new, precise sub-defect
in the taxonomy: of the 40 main files carrying the "brief 207 / Phase
2: C-34 candidate. Vanilla brief 202 `.s` recipe" boilerplate header,
**30 (75%) have no address-duplication pattern at all** — they were
mechanically bulk-stamped with the C-34 citation, not individually
verified. Only 8 of the 40 are genuine C-34; 2 are jump-table
dispatchers that structurally can't exhibit the CSE risk C-34
describes (flagged, not yet tested). `main`'s candidate pool is now
**2,456** (was 2,462): 58 coercible + 2,370 unknown + 28 no-marker.

## Pool at start

`python tools/wall_aware_headroom.py --json` for `main`: 2,462
candidates (62 coercible, 2,372 unknown, 28 no-marker), 31
confirmed-permanent — exactly matching the brief's numbers.

## Part 1 — the 62 coercible files

All 62 cite a taxonomy code; 60 cite `C-34` (alone or combined), 1
cites `C-31`, 1 cites `C-23`+`C-36`. Reading `docs/research/codegen-
walls.md` § C-34 in full first: its own "Wall family note" gives the
discriminator — genuine C-34 is **two separate `ldr [pc,...]` loads of
the SAME address**, where mwcc's IR-CSE would collapse them to one
load + register-reuse in natural C (all 6 source-coercion attempts in
the entry's own table failed, per brief 201). That is a real,
falsifiable criterion, so every citing file was checked against it
directly rather than trusted.

### The 40-file "Vanilla" sub-tag is unreliable

Grouping the 60 `C-34` files by header text found **two families**:

- **~20 files, "brief 205 / Phase 2: Duplicate pool entries..."** —
  each hand-read; every one genuinely has 2 pool slots for the same
  symbol (one via `.extern symbol`, one via the raw hex value — a
  documented trick from brief 204 to defeat the section-trim
  patcher). All confirmed genuine C-34 on inspection.
- **40 files, "brief 207 / Phase 2: ... Vanilla brief 202 `.s`
  recipe."** Read every one. Result:

  | Class | Count | Evidence |
  |---|---:|---|
  | Genuine C-34 | 8 | 2 distinct `.word` labels, same symbol, loaded close together (e.g. `func_02023274`, `func_0202111c`) |
  | Jump-table, likely false-positive | 2 | `func_020037d0`, `func_02003d98`: ONE pool word loaded from 5 mutually-exclusive `switch`-case blocks — no code path exists where mwcc would have an actual CSE opportunity (the blocks never execute together), so the citation's mechanism doesn't apply here even though the detector's raw "2+ loads, same target" test technically fires. Flagged, not attempted (out of time budget this brief). |
  | **Mistagged — zero duplicate-address evidence** | **30** | Some cite the *identical* boilerplate paragraph verbatim across totally unrelated bodies: `func_020061bc` is a **SWAR population-count** routine (4 pool constants `0xaaaaaaaa/0xcccccccc/0xf0f0f0f0/0xff00ff00`, no address anywhere); `func_02007f38` builds a single 32-bit MMIO-shadow constant via 3 `orr`s; `func_0200b2f4`/`func_0201a32c`/`func_0203244c`/`func_0206d79c` (as `.s`) etc. have **no `.word` pool entries whatsoever**. None of these 30 involve loading the same address twice. |

  The 30-mistag figure is a **verified count, not an estimate** — each
  file was read and its pool-word/label structure checked by hand
  (see the per-file table in "Attempts" below for a sample).

**Why this happened (traced, not guessed):** the "brief 205" header is
individually-worded per file (cites the specific symbol, the specific
sibling exemplar). The "brief 207 Vanilla" header is byte-identical
across all 40 regardless of the body — a mechanical bulk-stamp from
whatever batch operation brief 207 ran, analogous to (but distinct
from) the `asm_escape.py` `GLOBAL_ASM` cohort stamp brief 640/651
already found. This is a **new instance of the same meta-problem**:
a second, narrower mechanical over-tagging sitting *inside* what brief
651's classifier calls "coercible," undetectable without opening each
file.

### Attempts (all 62 coercible; only files with real C-source attempts are gated)

| Function | Result | Note |
|---|---|---|
| `func_0200b2f4` | **SHIPPED 100%** | mistagged C-34 (loop w/ Fill32); lever: loop counter/index must be `unsigned` — orig uses `beq`+`blo` (unsigned), signed `int` produced `ble`+`blt` |
| `func_020a32e4` | **SHIPPED 100%** | mistagged C-34 (5 trivial byte-zero writes, no pool words) |
| `func_0208b0d0` | **SHIPPED 100%** | mistagged C-34 (set-then-reload pattern); lever: `volatile` struct fields — C-3 ("volatile-cast to suppress CSE on self-copy/redundant load") applies here even though this citation was C-34 |
| `func_02097238` | **SHIPPED 100%** | mistagged C-34 (2-field conditional set), first-try match |
| `func_02007f38` | parked, 37% | mistagged; residual is constant-materialization choice (mwcc pool-loads `0x52008421` where orig builds it via 3 `orr`s) — not a lever I found in the time available |
| `func_020061bc` | parked, 37% | mistagged (real popcount); found the mask-reuse-via-shift lever (`(x&0xaaaaaaaa)>>1)+(x&0x55555555)`, term order matters — but stage-1 register choice (r0 vs r1 for the second AND) resisted every reshape tried |
| `func_0201904c` | parked, 27% | mistagged (packed-u16 saturating add); a plain 2×`u16`-struct model only got 20% (LDRH/STRH instead of orig's LDR/STR-word-with-shifts); modeling the field as one `u32` manipulated via explicit shift/mask got closer (26.7%, matching the LDR/STR shape) but the mask-reuse-via-shift lever that worked elsewhere didn't move this one further |
| `func_02034094` | parked, 44% | mistagged (range check); classic predicate-vs-branch — mwcc predicates a 1-line early-return regardless of `if`/switch restructuring |
| `func_0206d79c` | parked, 67% | mistagged (ring-buffer used-space calc); hoisting the capacity load out of the `if` (66.7%) was the biggest single win found this brief; residual is load-order register choice for 2 adjacent `u16` fields |
| `func_0209bf18` | parked, 57% | mistagged (base-60 combine, `(a*60+b)*60+c`); orig fuses the 2 adjacent-field loads into one `ldmia`, mine never did regardless of phrasing |
| `func_020a7368` | parked, 75% | mistagged (byte copy loop); orig copies dest into `ip` before the loop, mine keeps using r0 — reg-choice |
| `func_020aee58` | parked, 50% | mistagged (u16 string copy with reload-after-store); `volatile` got the reload back (was being optimized away entirely) but not the exact register plumbing |
| `func_0203c70c` | parked, 33% | mistagged (2-condition flag test); predicate-vs-branch on the leading null check |
| `func_020644a4` | parked, 0-25% | mistagged (big-endian u16 read); structurally different register plan, no working lever found in time |
| `func_02067850` | parked, 62.5% | mistagged (bounds-checked array write); first bound branches correctly, second bound predicates instead of branching regardless of how the condition was inverted |
| `func_0207f8d8` / `func_0207f914` | parked, 25% / 33% | mistagged twins (conditional 2-3 field set + flag OR); orig keeps the WHOLE if-body predicated (no branch at all), mine always emits `bxne` — apparent predication-size threshold that reordering the 3 statements didn't cross |
| `func_0209aa48` / `func_0209d788` | parked, 85.7% each | mistagged (MMIO/RAM bit-test-and-clear twins); residual is `tst`+`movne/moveq` (mine) vs `ands`-keeping-the-masked-value (target) even though the masked value is never read afterward in EITHER version — a real, reproducible, previously undocumented mwcc quirk (see "New findings" below) |
| `func_020323f4` | parked, 37.5% | mistagged (nested-IRQ critical section + callback); real logic recovered correctly but register allocation across 3 basic blocks diverges — needs more iteration than this brief's budget allowed |
| `func_0209085c` | not attempted (confirmed genuine, read only) | `C-31`, ARM interwork veneer — literally 3 raw instructions (`ldr r1,[pc,#0]; bx r1; .word target`), not expressible in C by construction |
| `func_02021b38` | not attempted (confirmed genuine, read only) | own header documents an exhaustive 15-tier mwcc sweep (brief 204) already ruled out every compiler variant |
| `func_02023478` | not attempted (confirmed genuine, read only) | `C-23`+`C-36`, own header cites 4 prior briefs' worth of dedicated investigation (202/204/205/207/208) plus a standalone research doc |
| ~16 more "brief 205" family files | not attempted (confirmed genuine via reading) | same hex-literal-duplicate-pool shape as the exemplar; recompiling would just re-derive brief 201/202's already-exhaustive negative result |
| Remaining ~12 "Vanilla" mistags + 2 branched | not attempted (time-boxed) | identified as mistagged/suspect by reading, not yet compiled — real candidates for a follow-up wave |

## Part 2 — a sample of the 2,372 unknown files

Sorted `main`'s unknown-bucket `.s` files by disk size and took the
smallest ~25; all carry only the generic `asm_escape.py`
`GLOBAL_ASM`/brief-294/302 boilerplate (never individually assessed,
confirming brief 640's finding). Read ~18, attempted 9:

| Function | Result | Note |
|---|---:|---|
| `func_020ace98` | **SHIPPED 100%** | linear search returning a pointer (`unsigned short*`), first try |
| `func_020a6a00` | **SHIPPED 100%** | strlen-like counter; lever: converge both paths to ONE shared `return` instead of an early separate `return 0` — turned a predicated 81.8% near-miss into a real branch and 100% |
| `func_02052704` | parked, 60% | 3-way equality → constant; `switch` beat `\|\|` (10%→60%) but the 2 `beq`s to a shared label still collapse to `cmpne` chains in my version |
| `func_02077094` | parked, 80% | strcspn-like ('.' or NUL); swapping which condition comes first in the `&&` got 70%→80%; an explicit `for(;;){if..break;if..break;}` rewrite made it worse (10%), reverted |
| `func_02001e5c` | parked, 60% | null-or-empty-string check; register choice for the intermediate flag (r0 vs r1) |
| `func_020534b4` | parked, 62.5% | callback-result-gated pointer return; mine reuses one register throughout, orig keeps the arg pristine in r4 and computes the result independently in r0 |
| `func_02031794` | parked, 45.5% | 2-constant equality-OR; same tiny-body predication pattern as `func_02052704` |
| `func_02084ac4` | parked, 70% | conditional callback + counter++; register choice only (r0 vs r1 for the callback pointer) |
| `func_0200f01c` | parked, 80% | null-check + 2-step bitfield update; the null check matched exactly (predicated, correctly) — residual is a `bic`+`orr` register-reuse choice |

Not attempted (identified, deprioritized under time pressure):
`func_02079e4c` (loop-based popcount via `clz` — needs to confirm
mwcc has a usable CLZ intrinsic first), `func_0206e504` (linked-list
walk), `func_02067328` (bounds-checked ring buffer), `func_0208bf14`
(hardware-divider poll+read, returns 2 values — needs a struct-return
or `long long` model), `func_0209640c` (bit-test in a flag array).

## New findings (beyond the C-34 mistag)

1. **Shared-exit convergence beats early-return predication.**
   Restructuring `if (cond) return X; <rest>; return Y;` into a form
   where BOTH paths converge on one final `return` (wrapping `<rest>`
   in the `else` instead of returning early) got a real `beq`/`bne`
   branch out of mwcc instead of `moveq`/`bxeq` predication, in a case
   where several other reshapes of the SAME condition didn't. Net new
   lever, distinct from C-1's "pure pred-exec vs early-return" (which
   is about the OPPOSITE direction — collapsing branches into
   predicates, not the reverse).
2. **`volatile` on a struct field that's set then immediately
   re-read/re-written recovers the redundant load/store mwcc's -O4
   otherwise eliminates.** Confirmed on 2 independent functions
   (`func_0208b0d0`, partially on `func_020aee58`). This is exactly
   C-3 in the taxonomy ("volatile-cast to suppress CSE on self-copy /
   redundant load") — worth noting that C-3 fires even on functions
   whose OWN wall citation is unrelated (C-34), since the citations in
   this corpus aren't reliable pointers to the actual mechanism.
3. **`tst`-vs-`ands` when the masked value is provably dead.** Two
   independent bit-test-and-clear functions (`func_0209aa48`,
   `func_0209d788`) both hit the exact same 85.7% ceiling: mwcc
   compiles `if (x & mask)` to `tst` (flags-only) when the masked
   VALUE is never used again, but the original ROM keeps the value in
   a register via `ands` even though it's equally unused there. Every
   reshape tried (ternary, boolean cast, explicit named intermediate)
   still produced `tst`. Not resolved this brief — flagging as a
   candidate new codegen-walls.md entry rather than silently dropping
   it, since it reproduced identically twice.
4. **A "predication-size threshold" is visible but not controllable
   from source.** Across ~10 near-misses, mwcc consistently predicates
   1-2 instruction conditional bodies and branches for 3+ instruction
   bodies, but exactly where that line falls didn't move under any
   restructuring tried (switch vs if/else vs ternary vs statement
   reordering). This matches brief 641's "reg-alloc/scratch-register-
   choice wall = 100% lever-insensitive" in spirit — likely a similar
   floor, not yet proven exhaustively swept the way C-34's is.

## Queue reconciliation

`docs/queue/claude-decomper.md` had 3 stale `[TODO]` items from the
brief-651 rework:

- **`cm-coercible-651`** → marked `[DONE]`. This brief covered main's
  62-file slice (the biggest single concentration); overlay004/6/8/11
  is scaffolder's separate `cm-coercible-overlays-651` item; ov002's
  33 coercible files are tracked by the parallel ov002 sweep campaign
  (brief 650, PR #1231) — noted explicitly so the ~14 remaining
  main "Vanilla" mistags + genuine sibling files aren't lost.
- **`cm-unknown-main-651`** → marked `[DONE]` for this batch, replaced
  with a new `cm-unknown-main-655-batch2` `[TODO]` pointing at the
  remaining ~2,362 unknown main files (this brief only sampled ~25 of
  the smallest, attempted 9) — same convention as the existing
  `cm-main-batch1`/`cm-main-batch2` pattern.
- **`cm-unknown-ov002-651`** → left `[TODO]` (out of this brief's main-
  only scope), annotated that brief 650 already ran a first 15-file
  sample there (PR #1231, 5 shipped) so a picker doesn't re-attempt
  the same files.

## Coercible vs. unknown hit rate

| Bucket | Real attempts | Shipped | Hit rate |
|---|---:|---:|---:|
| Coercible (main) | 20 | 4 | 20% |
| Unknown (main sample) | 9 | 2 | 22% |

Statistically indistinguishable at this sample size (29 total
attempts). The taxonomy code's PRESENCE doesn't predict matchability
here — what predicts it is whether the citation's own criteria
actually apply to that specific function, which for 30 of 62 main
coercible files, they don't. The unknown bucket, despite having zero
documented lever, matched at the same rate as coercible once
mistagged citations are accounted for — consistent with brief 650's
ov002 finding (33%) and brief 640's original thesis that the
`unknown` bucket is a real, unassessed frontier rather than a lesser
one.

## Gate

- `python tools/gate3.py --scope all --no-tests`: **GATE PASS**, all
  3 regions individually confirmed (`[eur] SHA1 PASS`, `[usa] SHA1
  PASS`, `[jpn] SHA1 PASS`), verified via a forced-clean rebuild of
  the 6 changed objects (removed the `.o` files and `gx-spirit-
  caller_*.nds` before rebuilding, not just an incremental `ninja`) —
  see "Process note" below for why that extra step mattered.
- `main` module, before → after: 2,462 → 2,456 candidates (62→58
  coercible, 2,372→2,370 unknown), 31 confirmed-permanent (unchanged).
- USA/JPN unaffected: `main` is routed per-region
  (`src/usa/main/`, `src/jpn/main/`), separate from EUR's `src/main/`
  — these 6 matches are EUR-only this brief, consistent with the
  project's phased EUR-first strategy (porting deferred).

### Process note (for future briefs using activate/revert scripting)

Built small helper scripts (`activate.py`/`revert.py` in the
scratchpad dir) to flip a `delinks.txt` entry + `git rm` the `.s` /
restore it, for fast iterate-and-park cycling. `revert.py`'s `git
checkout -- delinks.txt` resets the WHOLE file to HEAD, not just the
one entry — after enough activate/attempt/revert cycles, a revert
silently wiped out earlier SHIPPED entries' delinks.txt edits too
(their `.c` files were fine on disk, but delinks.txt pointed back at
`.s` files that no longer existed). A `gate3.py --scope all` run
during that broken window still reported PASS, which needs its own
follow-up (ninja may be trusting a stale `.o` rather than erroring on
the dangling reference — not diagnosed further here, flagged for a
tooling brief). Caught it by re-checking `git status`/`grep delinks.txt`
before the final commit, fixed by re-applying the 6 edits and forcing
a clean rebuild of exactly those 6 objects before re-gating. Lesson:
when scripting activate/revert cycles, re-verify the FULL set of
intended routing changes against delinks.txt right before the final
gate — don't trust an earlier in-session gate pass if any revert ran
after it.

## Files changed

- `src/main/func_0200b2f4.c`, `func_0208b0d0.c`, `func_02097238.c`,
  `func_020a32e4.c`, `func_020a6a00.c`, `func_020ace98.c` — new
  matches (their `.s` siblings removed).
- `config/eur/arm9/delinks.txt` — 6 entries routed `.s:` → `.c:`.
- `docs/queue/claude-decomper.md` — 2 items marked `[DONE]`, 1 new
  `[TODO]` batch-2 item added, 1 existing `[TODO]` annotated.
- `docs/research/brief-655-main-sweep.md` — this report.
