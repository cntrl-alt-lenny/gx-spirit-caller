# Brief 529 — overlay small-contained c-match wave

Date: 2026-07-04
Branch: `claude/cmatch-ov-529`

## Scope

Worked small overlay (`ovNNN`) functions from
`docs/research/campaign-analytics/safe-queue-v3.md` and
`docs/research/dossiers*/`, smallest-first, skipping on-main candidates and
`021b79ac` (ov006, touched by brief 525 / PR #1095). RETRIAGE-tier rows were
included (not excluded, unlike brief 519).

`tools/containment_check.py` is main-ARM9-only and was **not used** for any
overlay candidate. Every containment verdict below is a manual byte diff:
`extract/eur/arm9_overlays/ovNNN.bin` vs `build/eur/build/arm9_ovNNN.bin`,
each differing byte's file offset translated to a VA via that overlay's own
`OVNNN_TEXT_START` (read from `build/eur/arm9.o.xMAP`), checked against the
candidate's own `[start,end)` delinks.txt range.

Three of the ~42 candidates initially compiled from safe-queue-v3.md
(`021ab460` ov022, `021ac72c` ov000, `021b8d9c` ov006) were already `.c`-routed
in delinks.txt despite the snapshot still listing them as open — skipped
without attempting, consistent with the doc's point-in-time nature.

## Summary

| Metric | Count |
|---|---:|
| candidates attempted | 6 |
| EUR matches accepted (byte-exact first try) | 2 |
| USA ports accepted | 2 |
| JPN ports accepted | 2 |
| contained near-misses parked (correct logic, reg-alloc schedule mismatch) | 2 |
| avalanche parks | 1 |
| confirmed-wall corrections (safe-queue false positive) | 1 |

Matched functions (3-region sha1 verified after each):

- EUR `src/overlay001/func_ov001_021ca2f8.c` / USA+JPN `func_ov001_021ca218.c`
- EUR `src/overlay018/func_ov018_021ace14.c` / USA+JPN `func_ov018_021acd3c.c`

## Candidate results

| Candidate | Overlay | Result | Evidence |
|---|---|---|---|
| `021ca2f8` (80B, rank 44) | ov001 | **MATCHED** | dispatch-table-advance idiom, exact copy of proven sibling `func_ov022_021ab460.c`; 0 diff bytes whole-overlay, first try |
| `021ace14` (84B, rank 42) | ov018 | **MATCHED** | same idiom + one unconditional prefix call; 0 diff bytes whole-overlay after fixing a C89 declarations-after-statements error |
| `022627ac` (88B, rank 47) | ov002 | PARK: avalanche → root-caused, see below | 45,157 runs / 356,388 bytes outside candidate range even in isolation |
| `0225368c` (92B, rank 45) | ov002 | PARK: same ov002 issue, not independently tested in isolation | reverted alongside `022627ac` |
| `021abe64` (100B, rank 40) | ov000 | **SKIPPED — confirmed wall, not attempted** | see below |
| `021ac91c` (104B, rank 123) | ov005 | PARK: contained near-miss | 8 diff runs / 38 bytes, all inside candidate range; row/col reg-alloc fixed via decl reorder, dst/tile pair resisted 1 reorder + 1 expression-combine attempt |
| `021b7a20` (128B, rank 138) | ov006 | PARK: contained near-miss | 8 diff runs / 38 bytes, all inside candidate range; word_idx/bit_idx computation semantically correct (verified via capstone diff) but reg-alloc schedule differs; 1 reshape attempt didn't resolve |
| `021ab804` (164B, rank 120) | ov022 | PARK: avalanche | 85 runs outside candidate range, scattered from `0x021aaa2c` onward; parked instantly per the ~12 min cap, not investigated further |

## ov002 avalanche — root-caused, not just parked

`022627ac` avalanched even as the **only** change in an otherwise-clean
tree (confirmed by reverting to original `.s` → 0 diff, then re-applying
`022627ac` alone → the same 356KB scattered diff reappeared, independent of
`0225368c`). A full clean rebuild of ov002's build artifacts (deleting
`build/eur/{delinks,src,dis,disasm}/src/overlay002` and the linked
`arm9_ov002.bin`) reproduced the identical diff byte-for-byte, ruling out
stale ninja object-file caching.

This overlay has a documented structural hazard:
[`docs/research/ov004-thunk-section-fix.md`](ov004-thunk-section-fix.md)
(briefs 131/132/134, the "W7" mwldarm overlay-swap-blindness bug) explains
that ov002 has the widest VA range of any overlay (0x021aa4a0..0x022d2980,
1.16 MB) and is the only one whose `.text` addresses collide with ov004's
`.rodata` pointer targets (783 known-colliding `FUNC` symbols). mwldarm
2.0/sp1p5 resolves this by emitting spurious thumb→arm interwork veneers,
which brief 134's `tools/patch_ov004_veneers.py` + `patch_module_literals.py`
surgically undo as a **post-link** step — this is why the EUR baseline is
27/27 today despite the underlying mwldarm bug never being fixed at the
link-graph level (brief 132 proved `STT_FUNC`→`STT_NOTYPE` symbol-type
rewriting is a no-op for the veneer trigger; only VA + MEMORY-region
membership gates it).

New finding this session: my candidate's own bytes were **not** byte-exact
on the first attempt (14 of 88 bytes differed — a plain reg-alloc miss,
unrelated to W7). Every prior clean win in this session and in brief 519
was byte-exact on the first or second try. This suggests the veneer
patcher's un-shift arithmetic (built against the *original* 86-veneer
baseline shape) may not generalize cleanly when an ov002 function's
compiled bytes don't exactly reproduce the original — i.e. **ov002 may
need byte-perfect-or-nothing treatment**, unlike other overlays where a
contained near-miss is safe to iterate on. This is circumstantial (I did
not isolate the mechanism further, and brief 519 independently avalanched
on a *different* ov002 candidate — `021e2e18`, outside-first-byte
`0x021aaa24`, eerily close to this session's `021ab804`/ov022 avalanche at
`0x021aaa2c`, suggesting the hazard zone is genuinely centered near there
and not specific to any one candidate). Flagging for a dedicated
follow-up brief rather than resolving here — worth re-testing whether a
byte-exact ov002 candidate (built from an already-proven sibling, the way
`021ca2f8`/`021ace14` were) avoids the cascade entirely.

`021ab804` (ov022) avalanched with a similar outside-address signature
(`0x021aaa2c` onward) despite ov022 not being one of the two overlays
(ov002/ov004) named in the W7 docs — ov022 shares ov002's base address
(`0x021AA4A0`, confirmed via `arm9.o.xMAP`; ov000/ov005/ov018 also share it,
as overlays occupying the same swap-region at different times), so it may
be exposed to the same hazard indirectly. Not investigated further given
the avalanche-park discipline.

## Confirmed-wall correction: `021abe64` (ov000)

safe-queue-v3.md lists this RETRIAGE-tier row as `predicted-contained: YES
(med)`, but that column measures **containment risk only** (will it
avalanche if attempted), not matchability. Two independent deep-dive docs —
[`SmallOverlaysRetriageR9.md`](retriage/SmallOverlaysRetriageR9.md) and
[`Ov000Deep.md`](retriage/Ov000Deep.md) — both explicitly re-verify and
confirm `021abe64`/`021abec8` as a **permanent reg-alloc/instruction-schedule
wall**: a dense 4-live-register bitfield-extract-then-multiply chain with
"no natural C statement order that reproduces mwcc's exact instruction
interleave." `021abe64` is also a documented dependency of the already-`.s`
`021ac144` (which calls it 3×), so it must stay `.s` regardless. Skipped
without spending build time on it — **lesson for future waves: cross-check
a candidate's dossier/retriage doc for an explicit WALL verdict before
attempting, not just the safe-queue's containment-risk column.**

## Contained near-misses — reg-alloc scheduling, not logic errors

Both `021ac91c` and `021b7a20` are genuinely **contained** (zero risk of
landing broken code) and their C logic is semantically verified correct
(confirmed via `capstone`-disassembled instruction-by-instruction diff
against the original, not just eyeballing hex) — only physical register
assignment differs from what mwcc chose originally:

- `021ac91c` (ov005): after reordering local-variable declarations, the
  outer/inner loop counters (`row`/`col`) landed on the exact right
  registers (`lr`/`ip`, matching orig). The remaining pair — the
  destination pointer and the running tile-index — kept landing on `r3`/`r4`
  swapped from orig no matter the declaration order or expression-combining
  tried. This is the `mwcc-register-reuse-recipe` class of near-miss;
  candidate for a permuter pass rather than manual reshaping.
- `021b7a20` (ov006): copied the proven sibling `021b79ac.c`'s style
  (`int *table` + `/32` + `%32`) and adapted for the set-vs-clear /
  Copy32-vs-Fill32 differences the dossier documented. The word_idx/bit_idx
  arithmetic compiles to the *semantically identical* instruction sequence
  as orig (verified instruction-by-instruction) but reordered across a
  different register set (`r0/r1/r2/r3/r5` vs orig's `r0/r1/r2/r3/lr`).

Neither was force-fit further, per the ~12 min/candidate discipline.

## Final gates

```text
gx-spirit-caller_eur.nds: OK
gx-spirit-caller_usa.nds: OK
gx-spirit-caller_jpn.nds: OK
```

All three regions pass `ninja sha1` with only the 2 matched functions
applied (ov002/ov005/ov006/ov022 attempts all fully reverted).

## Remaining runway

Queue candidates not reached this wave (smallest-first, EUR ranks 88-248):
`021b08a8`(ov002) `021b9830`(ov002) `021d1f04`(ov011) `021b3a78`(ov016)
`021ac098`(ov000, HIGH-confidence recipe available but calls the confirmed
wall `021abe64` as a dependency — the caller itself is NOT walled, worth a
future attempt) `0228791c`(ov002) `021ae218`(ov000, complete C sketch
available in `Ov000Deep.md`, ~6-branch guard chain, higher complexity/risk
than this wave's picks) `021b2e04`(ov002) `021b3e14`(ov015) `021ca70c`(ov013)
`021ae2cc`(ov000) `021b7db0`(ov006) `021cca04`(ov011) `021c1954`(ov002)
`021b0a30`(ov002) `021b6e3c`(ov006) `021c2c54`(ov002) `021d1974`(ov002)
`021bbda8`(ov002) `021b33dc`(ov017) `021bd85c`(ov002) `021c4bd4`(ov006)
`021abcc4`(ov005) `021b29c0`(ov002) `021b3864`(ov002) `021d3a7c`(ov004).

Given this wave's finding, future ov002 attempts should either (a) only
target candidates with an exact proven-sibling template (guaranteeing
byte-exact on the first try, as `021ca2f8`/`021ace14` were), or (b) budget
extra time to fully reshape to 100% before the first containment check,
never leaving a non-byte-exact ov002 candidate applied while investigating.
