[//]: # (markdownlint-disable MD013 MD041)

# Brief 362 — legacy/sp3 + new-lever backlog re-sweep PILOT (ov004/006/011)

**Brief:** 362 (decomper). The long-flagged experiment: the catalogued reg-alloc
"walls" in the ov004/006/011 `core.h` WALL sections were catalogued in the Windows
era — before tri-compile, the `(u8)` byte-pack cast, and dispatch-order inversion.
Sample ~15–20, try the **full new-lever kit** on each (tri-compile, `(u8)` cast,
dispatch-order inversion, pass-through), and **report the recovery rate** to decide
whether to scale. Fallback (recovery < ~20%): the backlog is `.s`-bound; pivot to a
fresh-overlay easy-tier re-sweep.

## Headline — recovery ~25%, but it's one narrow, mostly-drained class

**2 recovered of 8 genuinely-uncarved walls tested (~25%), 3-region `ninja sha1` OK.**
Nominally above the 20% bar — but the two recoveries are **both the same stale
status-message shape**, matched under **plain 2.0** (not tri-compile, not a new
lever), and that family is **already ~mostly shipped**. Combined with two structural
findings, the honest read is: **the catalogued backlog is effectively `.s`-bound; the
fallback (fresh-overlay re-sweep) is the better wave.**

### Two structural findings that matter more than the rate

1. **The catalog is ~69% STALE.** Of 225 addresses mentioned in the three WALL
   sections, **155 are already carved/shipped** (drained in later waves); only **70
   are genuinely uncarved** (ov004 27, ov006 13, ov011 30). The "~435 walls" the brief
   cites is mostly already-done work.
2. **Tri-compile recovered NOTHING.** ov004/006/011 are mwcc-2.0 overlays (only *main*
   is legacy); `.legacy.c`/`.legacy_sp3.c` give the wrong frame and match nothing.

## The recovery breakdown (8 genuinely-uncarved walls tested)

| addr | ov | class | result | how |
|---|---|---|:---:|---|
| `021d1264` | 004 | status-message (`func_02037208(ID,-1,0,1)` quirk) | ✅ | plain 2.0 (stale near-miss) |
| `021d12b0` | 004 | status-message (sibling) | ✅ | plain 2.0 (stale near-miss) |
| `021d48bc` | 004 | changed-bool `c=0;if(f){f=0;c=1;}` | ❌ | reg-alloc (orig reuses dead r0 for `c`) |
| `021d4870` | 004 | materialized-bool-global | ❌ | mwcc won't emit the redundant `movne#1;moveq#0` |
| `021ceffc` | 011 | nibble-reposition | ❌ | peephole — `(n<<28)>>K` fuses to `& mask` |
| `021d20e8` | 011 | load-dest reg-numbering | ❌ | reg-alloc (whole r0/r1 cascade shifted) |
| `021cc2a4` | 004 | field-pool RMW | ❌ | store-scheduling |
| `021d1308` | 004 | status-message (loaded value used 3×) | ❌ | scheduling + reg-mirror |

Both recoveries are the **simple** status-message shape (single buf const + field
stores + the documented `func_02037208(ID,-1,0,1)` mov;sub quirk). The complex
sibling `021d1308` re-walled on scheduling. The other catalogued status-message
addresses (`021ceb24`, `021d97c8`, `021d9778`, …) are **already shipped** — so the
recoverable count here is **a handful of stragglers**, not a vein.

### A correction worth recording

`021b2280` (ov006 fn-ptr `blx` dispatch) initially *looked* like a `goto`-lever
recovery — but it was **already shipped on main** (a callback-dispatch family member).
`m2c_feed` returns the original disassembly regardless of carve status, so an
already-done function can masquerade as an uncarved wall. **Always confirm a candidate
is genuinely uncarved (in a gap object / not on `origin/main`) before counting it.**
With that excluded, the `goto`/dispatch-inversion lever produced **0** genuine
recoveries in this sample.

## Which levers worked

| lever | genuine recoveries |
|---|---|
| **tri-compile** (`.legacy.c` / `.legacy_sp3.c`) | **0** — 2.0 overlays; legacy tiers give the wrong frame |
| **plain 2.0 + correct recipe** | **2** (stale status-message stragglers) |
| **dispatch-order `goto`** | **0** (the one apparent hit was an already-shipped function) |
| **`(u8)` byte-pack cast** | n/a — no byte-pack in the sampled classes |
| **pass-through** | n/a — no sink-with-live-arg near-miss in the sample |

The genuine walls (reg-alloc: changed-bool / load-dest-reg; materialized-bool;
peephole-fusion; store-scheduling) are **untouched by any lever** — exactly brief
358's "permuter plateaus on reg-alloc" finding, now confirmed for ov004/006/011.

## Verification

| Gate | Status |
|---|:---:|
| EUR / USA / JPN `ninja sha1` | **OK** (2 `.c` recoveries, byte-identical) |
| `check_match_invariants.py` | 0 errors |
| `ruff check .` | clean |

Shipped: `func_ov004_021d1264`, `func_ov004_021d12b0`. Carve-size audit caught one
guessed size (`021d12b0` 0x4c→0x58). **Gotcha:** dcheck must read a *freshly
ninja-built* `.o` — a stale `.o` shows phantom ip↔lr swaps (two false near-misses
until I rebuilt).

## Recommendation for the brain — take the fallback

Although the raw rate (~25%) nominally clears 20%, the decision should be the
**fallback**, because:

- The only recoverable class (simple status-message) is **already mostly shipped** —
  a scaled backlog sweep would net only **a handful** of stragglers.
- **Tri-compile — the headline lever of the brief — recovers nothing** on these 2.0
  overlays. There is no legacy/sp3 vein here (that's *main*'s story, not ov004/006/011).
- The genuine majority (reg-alloc / materialized-bool / peephole / scheduling) is
  `.s`-bound, unchanged by any lever.
- The catalog is ~69% stale, so even the "70 uncarved" overstates actionable work.

**So: do NOT mount a full-435 (or full-70) tri-compile campaign on this backlog.**
Instead:

1. **Pivot to the fresh-overlay easy-tier re-sweep** (the brief's fallback). The new
   levers (`(u8)`, `goto`, dispatch-inversion) shine on *fresh small functions*, not
   the catalogued reg-alloc tail — and the Windows-drained overlays may re-open like
   main did under tri-compile.
2. **Cheap mop-up (optional):** the simple status-message stragglers across
   ov004/006/011 recover under plain 2.0 with today's recipes — a short opportunistic
   pass, not a campaign.
3. **Housekeeping:** prune the ~155 already-shipped addresses from the core.h WALL
   sections so the catalog stops overstating the backlog.

## Cross-references

- `docs/research/brief-358-ov002-routing-pass.md` — permuter-plateaus-on-reg-alloc,
  confirmed here for ov004/006/011.
- `docs/research/brief-360-ov002-bytepack-drain.md` — the `(u8)` lever (not exercised
  here; no byte-pack in the sampled classes).
- `src/overlay004/ov004_core.h`, `ov006_core.h`, `ov011_core.h` — the WALL sections
  (now known to be ~69% stale).
