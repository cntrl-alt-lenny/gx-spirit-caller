# Brief 665 — main small/medium sweep, upper range (queue item cm-main-small-c)

**Result: 2/8 real attempts shipped, headline finding: retired the P-6 "permanent" wall.**

## Method

The other half of brief 661's small/medium campaign (0x02040000+, ≤256B).
`wall_aware_headroom.py --json` for main's candidate/unknown/coercible
pools filtered to this exact address+size range yielded only **10
files** using the old on-disk `.s` byte-length proxy. That is not a
validated ≤256 B `.text` selection, so the conclusion that most of the
range had already been swept is void. Header-read all 10 before compiling.

### Measurement correction

The authoritative rerun is `wall_aware_headroom.py --json --max-size 256`,
whose `text_size` values come from committed EUR `delinks.txt` `.text`
ranges. Do not use the historical count of 10 to close out this address
range.

## Headline finding: P-6 "permanent" wall was a routing-tier gap, not a real wall

Two of the ten candidates — `func_02067b8c` and `func_0207f8f8` — are
named in `codegen-walls.md`'s **P-6** entry ("predication threshold,
≥4-op if-body") alongside a third sibling, `func_02087d10`, all three
tagged **permanent** by brief 033 after exhaustive source-shape
iteration under the default compiler tier.

`func_02087d10` was independently recovered by a **later** brief (216)
via `.legacy.c` routing (mwcc `1.2/sp2p3` predicates 4-op if-bodies that
`2.0/sp1p5` refuses) — but nobody went back and re-tested the other two
P-6 siblings under the same fix. Both do:

| Function | Default tier | `.legacy.c` |
|---|---:|---:|
| `func_02067b8c` | branch instead of predication (37.5%) | **100%** |
| `func_0207f8f8` | branch instead of predication (37.5%) | **100%** |

**`codegen-walls.md`'s P-6 section is corrected in this PR** — struck
through and replaced with the routing-tier explanation, plus an
explicit lesson: a `P-NN` citation naming multiple sibling functions is
not proof every sibling was re-tested after any ONE of them gets a
later fix. Check every named sibling.

## Ships (2)

- `func_02067b8c` — bounded-counter array append (`if (count<0x14) {
  arr[count++]=v; }`), P-6 recovery via `.legacy.c`.
- `func_0207f8f8` — guarded 2-field setter (`if (flag==1) { f12|=4;
  f10=v; }`), P-6 recovery via `.legacy.c`.

Both ported to USA + JPN, individually verified 100%.

## Genuinely-unshippable (3)

- `func_02074e4c`, `func_020a9914` — pure shared-epilogue-tail stubs
  (body is ONLY stack teardown + return, no real instructions). Not
  representable as a standalone C function; these are fall-through
  jump targets from elsewhere, not real call targets.
- `func_0206be1c` — same pathology, already correctly marked with a
  header comment identifying it as a shared-tail branch target by an
  earlier session. Confirms the other two are the same genuine class,
  not an oversight.

## Parked near-misses (4)

| Function | Match% | Diagnosis |
|---|---:|---|
| `func_020947b8` (Thumb, zero 9 words via 3× `stmia`) | 0% | No C form tried (9 scalar stores, array-indexed stores, struct-copy×3) reproduces the 3-register `stmia` burst batching; mwcc's Thumb store-coalescing pass wasn't triggered by any natural shape tried. |
| `func_02098cdc` (bit-packed flag test + masked/plain field return) | 14.3% | Flag test reads a single BYTE at a fixed offset (`ldrb`+`ands #1`), not a 32-bit word-level bit test (`ldr`+`tst #0x01000000`) as modeled — same numeric result, different memory access width. Needs a byte-typed bitfield/union model, not attempted further under time pressure. |
| `func_020b3850` (64-bit × 64-bit multiply, `umull`+2×`mla`) | 0% | `long long a * b` reproduces the exact algorithm but mwcc picks `lr`/`r12` as scratch registers where target uses `r4`/`r5`; identical residue on both the default and `.legacy.c` tiers — a genuine reg-alloc wall, not tier-routing. |
| `func_02096040` (zero a 2-int struct via `*p = {0,0}`) | 66.7% | A local `zero` struct assigned via `*p = zero;` reproduces the exact instruction sequence except mwcc materializes an explicit `add r2,sp,#0` address register for the local instead of using direct SP-relative stores; the fields-direct form (no local) drops to 25% (loses the stack frame entirely). Closest near-miss of the batch. |

## Gate

`python tools/gate3.py --scope all --no-tests` — 3-region PASS.
