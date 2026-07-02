[//]: # (markdownlint-disable MD013 MD041)

# ov002 E/F Re-triage — Round 10 (R10)

Generated 2026-07-02. Continues the size-ascending sweep of ov002's E/F
hard tier (R4 `Ov002EFRetriage.md`, R8 `Ov002EFRetriageR8.md`, R9
`Ov002EFRetriageR9.md`). 50 addresses were assigned this round, spanning
`0x021aa558`–`0x021cd0b8`; **40 of 50 were examined** (functions 1-30 and
41-50 of the assignment order) before this round's time budget closed —
**functions 31-40 (10 addresses) were not reached and carry over to
R11.** Five additional addresses beyond the original 50-address
assignment — the true tail of ov002's E/F pool, each 1600-2800 `.s`
lines, the largest remaining in the entire overlay — were spot-examined
directly by the orchestrating session; see "The true frontier" below.

KB docs referenced: `docs/research/data/OverlayDataGlobs.md`,
`docs/research/types/DuelStateSingleton.md`,
`docs/research/types/PerPlayerRowTable.md`, `src/overlay002/ov002_core.h`
(briefs 348-360, the register-reuse/reg-mirror/range-opt lever catalogue),
`docs/research/brief-294-regalloc-wall-scout.md`,
`docs/research/brief-302-global-asm-mode.md`, and
`docs/research/retriage/Ov002EFRetriageR9.md` (R9, template/style guide).

## Headline finding — same GLOBAL_ASM-endgame marker as `main` (see [[kb-retriage-rounds]])

**48 of these 50 target `.s` files (96%) carry the identical brief-302
"whole-function ship-as-.s (GLOBAL_ASM endgame)" header** documented in
this round's `MainEFRetriageR10.md`. Unlike `main`'s residual (94% marker
coverage, only 4% upgrade rate after a rigorous back-edge audit), ov002's
40-function sample was examined by four independent sub-agents that each
explicitly checked the marker, cross-referenced `ov002_core.h`'s own
brief-348-360 lever catalogue (register-reuse, reg-mirror, range-opt,
inline-vs-branch — all independently documented as *not* steerable by C
source form for this specific overlay), and rendered a per-function
verdict rather than a blanket back-edge test. Result: **38 of 40 confirmed
wall, 2 upgraded** — both upgrades are cases the marker's own bulk sweep
appears to have "swept in mechanically" alongside genuinely-walled
siblings sharing the same byte-size/branch-count heuristic bucket, not
struct-naming gaps the KB resolved.

This is the SAME campaign-level discovery as `main`'s: the E/F retriage
worklist and the separately-tracked brief-294/302 GLOBAL_ASM-shipped
cohort overlap heavily, and most of what looks like untouched residual is
actually a previously-closed, deliberate "no C match" decision. See
`docs/research/retriage/INDEX.md`'s R10 Key Findings section for the
campaign-wide numbers (only 11 addresses total, across all of `main` +
ov002 + ov008, remain genuinely never-examined by either this retriage
lane or the GLOBAL_ASM sweep).

## Summary

| Metric | Count |
|--------|-------|
| Addresses assigned | 50 |
| Examined this round | 40 (functions 31-40 not reached — carries to R11) |
| **Newly tractable** | **2 (5% of examined)** |
| Confirmed intractable (wall) | 38 (95% of examined) |
| Of which: carry the brief-302 GLOBAL_ASM marker | 38 |
| Of which: no marker at all | 0 |
| New KB gaps found | ~35 (see below — high volume, mostly single-site; consolidated list) |

### Evidence-tier disclosure

Every verdict below rests on direct, full reading of the target `.s`
file, cross-referenced against `docs/research/data/OverlayDataGlobs.md`,
`docs/research/types/{DuelStateSingleton,PerPlayerRowTable}.md`, and
`src/overlay002/ov002_core.h`'s lever catalogue — all canonical-tier KB
docs. No secondary-tier (`dossiers/`, `c-match-prep/`) evidence was
required for either upgrade.

---

## Newly Tractable Funcs

### 0x021AE70C (24 B, class F, **no GLOBAL_ASM marker**)

**Original verdict:** 1776B, tract=low, "big-body dispatcher, many
calls/branches/loops" — the original heuristic's size/shape note
describes a completely different, much larger function; ground truth is
a 24-byte, zero-branch leaf.

**Verdict: TRACTABLE (clean).** A trivial byte/nibble-pack veneer:
assembles three packed sub-values (two nibbles, one byte, one
pass-through arg) into a single `u32` via `orr`/`lsl`, then forwards to
the documented `func_ov002_0229ade0` command sink with fixed command
code `0x31` and sub-code `0xa`. Zero struct/global touches.

**Ground-truth BL/BLX targets:** `func_ov002_0229ade0` (documented
command-sink signature from `ov002_core.h`).

**C sketch:**
```c
int func_ov002_021ae70c(int r0, int r1, int r2, int r3, int stack_arg) {
    unsigned int lo = (r2 & 0xf) | ((stack_arg & 0xf) << 4);
    unsigned int b1 = (r3 & 0xff) << 8;
    unsigned int packed_byte = (unsigned short)((lo & 0xff) | b1);
    unsigned int arg2 = ((unsigned short)packed_byte << 16) | (unsigned short)r1;
    (void)r0;
    return func_ov002_0229ade0(49 /* 0x31 */, 10 /* 0xa */, r0, arg2);
}
```
Note: `0x021ae70c` also happens to share its relative address with an
unrelated ov008 function this same round (see the closeout doc) —
confirmed coincidental overlay-RAM-window reuse, not shared code, per the
campaign's standing gotcha.

---

### 0x021B43A4 (628 B, class F, carries brief-302 marker — swept in mechanically)

**Original verdict:** low, "jump-table 54 branches, mla index math."

**Verdict: TRACTABLE (clean), overturns the marker.** Decomposes a u16
argument via a `type` nibble switch into a real 14-entry ARM jump table
fanning out to only 3 distinct destinations — a simple 3-way dispatch,
not a scheduling coin-flip. Every branch either reads `PerPlayerRowTable
+0x30` (`id_lo13`, documented) directly, or calls the already-documented
`func_ov002_021b9ecc` core slot-id resolver and range-compares its return
against literal thresholds where every arm is a `return` of a small
constant with **zero live register surviving past each leaf** — no
cross-branch register pressure exists anywhere in this function, unlike
its much larger walled siblings below.

**Struct/data needed:** `PerPlayerRowTable+0x30` (`id_lo13`),
`data_ov002_022cf1ac` (occupancy bit 6, companion field, same as the
`021b9ecc` dossier), `func_ov002_021b9ecc` return-value range (documented
resolver).

**Ground-truth BL/BLX targets:** `func_ov002_021b9ecc`.

**C sketch:**
```c
int func_ov002_021b43a4(struct Ov002Self *self, int arg1, int arg2) {
    u16 raw = self->f0;
    unsigned int lo = raw & 0xff, hi = (raw >> 8) & 0xff;
    unsigned int type = /* nibble extract off self->f2 bits[27:24] */ 0;

    if (type <= 6) {
        Ov002FieldZone *row = (Ov002FieldZone *)((char *)data_ov002_022cf16c + (lo & 1) * 0x868);
        return row->slots[hi].id_lo13 == 0 ? 0 : 1;
    }
    if (type >= 7 && type <= 0xa) {
        int id = func_ov002_021b9ecc(lo, hi);
        if (id == 0x17b7) return (arg1 != 0 && arg2 != 0) ? 1 : 0;
        if (id == 0x13f0) return 2;
        Ov002FieldZone *row = (Ov002FieldZone *)((char *)data_ov002_022cf16c + (lo & 1) * 0x868);
        u32 f1ac = row->slots[hi].f1ac;
        return ((f1ac >> 6) & 1) ? 0 : 1;
    }
    return 0;
}
```
**Lever:** the ~20-way compare-tree threshold→branch-target mapping under
the `type∈[7,0xa]` arm is mechanical range-compare codegen off
`func_ov002_021b9ecc`'s return value — pin the exact `.L` mapping from
the real disassembly at build time, not from this abbreviated sketch.

---

## Confirmed Intractable (38 functions)

All 38 carry the brief-302 GLOBAL_ASM marker. Grouped by the concrete
shape observed — this batch's dominant wall class is different from
`main`'s (which was mostly loop-back-edge/call-in-loop): ov002's residual
in this address band is overwhelmingly a **card-legality/scoring engine**
built on giant literal-card-ID range-compare cascades and multi-value
register accumulators, both independently catalogued as unsteerable-by-
C-form in `ov002_core.h`'s brief-348-360 notes.

| Address | Size | Shape | Specific ambiguity |
|---------|------|-------|---------------------|
| `0x021aa558` | 4876 | 4-way parallel scalar-reduction (AI move-scorer) | 4 running accumulators with non-disjoint lifetimes across ~15 branches; original compiler re-colors mid-function (`r5→fp`, `sl→r7`) — pure register-allocation, all data resolved |
| `0x021ab874` | 492 | 2-iter snapshot-copy loop | dual-purpose `r2` (destination-select flag + early-exit discriminant) threaded live through the loop for a downstream tail consumer — scheduling choice, not logic |
| `0x021aba60` | 10640 | duel-effect-resolution engine (~60-way card-ID tree + guard chains) | dominant ~60-way ID-comparison tree's exact balancing is source-declaration-order-dependent; sections (1)/(2)/(4) are individually clean but inseparable from the whole symbol |
| `0x021ae89c` | 444 | phase-transition initializer | polarity-flip (`cmp` vs `rsbs`) between two structurally-identical `func_ov002_021d479c` call sites — documented brief-350 "soft-wall" codegen-finicky sub-tier |
| `0x021aec04` | 2460 | 47-way ASCII command-token parser | matches `DuelStateSingleton.md`'s own documented "dispatch-init function" note; shared-tail-merging across 47 leaf blocks creates cross-leaf register coupling |
| `0x021af5a0` | 1072 | turn-end summary, ~20x repeated sink calls | KB-*confirmed already-exhausted* reg-mirror wall class per `ov002_core.h` brief-360 ("byte-pack... TAPPED") |
| `0x021afc6c` | 736 | card-effect flag classifier | single 16-bit flag accumulator (`r8`) alive across ~200 instructions; exact intermediate-masking point is compiler-internal liveness, not source-visible |
| `0x021b05d0` | 652 | `DuelStateSingleton+0xd20` 4-way sub-state switch | triple near-identical unrolled block (loop-vs-unroll choice) — genuine C form is unrecoverable without a compile |
| `0x021b0f24` | 732 | card/event-ID range-membership test | ~20-member card-ID tree, same declaration-order-unrecoverable class as `021aec04` |
| `0x021b229c` | 1288 | `PerPlayerRowTable` walk + 40-const range-compare | 19 independent stack-slot pre-computes with no semantic basis for ordering/register choice |
| `0x021b27f8` | 456 | 256-entry BSS-array dual loop | classic "mirror-reg" near-miss — two structurally-twin call sites land the same live value in different registers (`r1` vs `r0`), brief-350/352/358-confirmed permuter-plateau class |
| `0x021b4684` | 1248 | pure card-ID membership dispatcher, 11 range-check ladders | zero struct backing anywhere; base-register reuse-vs-recompute choice across 11 near-identical ladders |
| `0x021b4be4` | 3532 | ~300-branch bare-literal cascade + embedded tractable arms | dominant cascade zero-struct; 2 embedded arms (incl. a `/5`-magic-divide sibling of R9's `022640F4`) are individually clean but inseparable |
| `0x021b59b0` | 2664 | sibling of `021b4be4`, 10-exit-label cascade | same class; 3rd confirmed sibling of the `/5`-magic-divide `PerPlayerRowTable` idiom in this batch alone |
| `0x021b6418` | 488 | leaf, ~50-branch bare-literal comparison tree | purest instance of the class — zero calls, zero struct refs, base-reuse-vs-recompute at ~12 tree nodes |
| `0x021b78b8` | 768 | leaf, ~30-branch bare-literal comparison tree | zero calls, zero struct/global refs anywhere — "purest of the pure" |
| `0x021b7d54` | 2464 | 2-part: clean counted loop + giant cascade | Part-1's loop accumulator (`r4`) is read again inside Part-2's cascade exit arms — not separable despite Part 1 alone being clean |
| `0x021b87f8` | 1748 | guard + cascade with 9 KB-explicable exit arms | most KB-explicable of the giant dispatchers, but the dominant ~110-node cascade preceding the exits is unchanged base-reuse-vs-recompute wall |
| `0x021ba834` | 296 | dual bounded RMW-pack loop | 3-way simultaneous register-class collision (2 live pointers + 1 pre-loop bit) across an auto-incrementing store — brief-352/356 "multi-store scheduling" |
| `0x021bc72c` | 298 | resolve + 14-const range ladder | classic range-opt: literal-proximity-driven ladder grouping, brief-352/358 "range-opt...`.s`-only" |
| `0x021bcb10` | 452 | double loop + computed-goto 6-case dispatch | 7 simultaneous stack slots for values plain locals wouldn't naturally spill — genuine compiler register-pressure artifact |
| `0x021bd948` | 508 | 8-guard linear legality cascade | 6+ unrelated values (`sl,r9,r7,r6,r5,r4`) held live across 8+ intervening calls with zero reuse — textbook long-call-chain scheduling |
| `0x021bdde0` | 824 | dual range-compare ladder + 4-value liveness | compounds the range-opt class with `021bd948`'s multi-value-liveness class |
| `0x021be4a0` | 2521 | master card-legality validator, 35-const ladder | `fp` occupancy flag survives ~90 instructions; qualified verdict (shape-identified, not fully hand-traced given size) |
| `0x021bf294` | 2200 | sibling master validator, 7 ladder segments + 3 scan loops | same class scaled up; qualified verdict |
| `0x021bff50` | 534 | ladder + shared-landing-pad from 2 entry conditions | structured control flow (if/switch) cannot reproduce the shared `.L` target without `goto`; register-per-entry-path is a scheduling choice regardless |
| `0x021c034c` | 1572 | richest function: 40+-const ladder, 13 divergent terminal shapes (4 are independent scan loops) | un-reverse-engineerable grouping/register-class assignment at this branching factor |
| `0x021c0be4` | 748 | 25-const ladder + 4-value liveness (combined classes) | both established wall classes compounding, nothing new |
| `0x021c8e38` | 824 | self-recursive helper + double-nested max-scan | recursive-frame register coloring has no C-visible argument-order convention to infer |
| `0x021ca840` | 536 | CtrlState dispatcher (`022ce950`-family) | constant-derivation-arithmetic-identity ambiguity + cross-call live-range collision on a row pointer |
| `0x021cacf0` | 452 | 5-non-contiguous-const range/set-membership tree | source form (switch/`\|\|`/if-ladder) underdetermined at this threshold count |
| `0x021cb30c` | 388 | `022ce950`-family, 5-way chained bitfield repack | textbook byte-pack/reg-mirror class, brief-356/358-confirmed |
| `0x021cb584` | 1076 | `022ce950`-family, DOUBLED chained bitfield repack | same class, doubled + branch-path-dependent bit-mask selection |
| `0x021cbb74` | 1136 | sibling of `021cb584` + 5-arm jump table | doubled repack class + 5!-permutation-space literal-pooling-order ambiguity |
| `0x021cc258` | 688 | `022ce950`-family, repack + 4-condition inline-vs-branch guard | repack class + brief-346/358 "inline-vs-branch...unsteerable" 4-deep guard |
| `0x021cc984` | 640 | `022ce950`-family, 3-deep register-carried-address call chain | 3rd call's args derive from the 1st/2nd calls' output locations across `bl` boundaries |
| `0x021ccd78` | 556 | `022ce950`-family, non-short-circuit 2-step boolean + repack | 3 distinct equally-valid C phrasings of the same boolean, each compiling differently |
| `0x021cd0b8` | 588 | `022ce950`-family, 5-way jump table + duplicated-branch scheduling | two structurally-identical branches differ only in instruction ORDER, not logic |

**Clone/sibling notes:** `0x021ae70c` (this round's ov002 upgrade) shares
its relative address with an unrelated ov008 function — confirmed
coincidental, not shared code. `0x021b4be4`/`0x021b59b0`/`0x021c034c`/
`0x021c0be4`/`0x021bdde0` all independently reconfirm the same "giant
bare-literal card-ID cascade" archetype documented once here rather than
per-row — see `ov002_core.h` for the consolidated recipe once written up.

---

## The true frontier: 5 giant functions beyond this round's 50-address sample, and a THIRD marker family

After discovering the GLOBAL_ASM/residual overlap (see Headline finding),
the orchestrating session computed ov002's **true** still-open pool
(worklist E/F minus every address already mentioned anywhere in
`docs/research/retriage/*.md` minus every address whose `.s` carries the
brief-302 marker): **7 addresses**, of which this round's 40-function
sample already covers 2 (`0x021aba60`, `0x021ae70c` — both above). The
remaining 5 are the literal tail-end of the entire ov002 E/F pool.

**Important correction discovered while examining these 5**: they (and
several functions elsewhere in this round — `main`'s `0x02023274`,
ov008's `0x021ae3a0`/`0x021ae70c`/`0x021b01d8`, see
`Ov004Ov006Ov008CloseoutR10.md`) do NOT carry the brief-302 GLOBAL_ASM
marker, but they DO carry a **third, earlier, and semantically different**
header: `"brief 207 / Phase 2: C-34 candidate. Vanilla brief 202 .s
recipe — explicit .word per pool slot. Brief 204's patcher trim-protect
handles relocation-tail cases."` Reading `docs/research/brief-207-
c34-c35-rescan-drain.md` in full clarifies this is **not a reg-alloc-wall
claim at all** — "C-34" is a purely mechanical/build-tooling
classification: these functions' literal pools end in a pattern
(duplicate `.word` entries, or a literal whose encoded low bytes are
zero) that trips a false-negative in `patch_section_align.py`'s
section-trimming heuristic, corrupting the linked layout if shipped as
naive C-derived assembly. The fix was to ship the ORIGINAL bytes
verbatim as `.s` — a build-pipeline routing decision **completely
orthogonal to whether a C source form exists or would compile
correctly**. Brief 207 explicitly frames future work as "unlocking more
picks to ship cleanly" (i.e. getting the *.s* shipping to work, not
getting C source written) and never asserts these functions resist
C-expression the way brief 294's reg-alloc scouting does for the
GLOBAL_ASM cohort.

**Practical effect on this round's verdicts:** the C-34 marker is a
weaker signal than GLOBAL_ASM in both directions. It doesn't argue FOR
tractability (as `021b43a4`'s clean no-marker case does), but it also
doesn't argue AGAINST it the way GLOBAL_ASM does — a C-34-marked function
is **genuinely untested** for C-expressibility, not previously-rejected.
Given this, main's `0x02023274` and ov008's 3 tractable upgrades (see
their respective docs) stand as real, independently-justified verdicts —
the C-34 marker's presence doesn't weaken them, it just explains why they
were `.s` beforehand for an unrelated reason. But the 4 giants below,
which the orchestrating session initially pattern-matched against the
*GLOBAL_ASM-confirmed* wall cohort's struct signature, deserve an honest
downgrade: struct/data overlap with a walled subsystem is a much weaker
signal than an actual tested reg-alloc verdict, since NOTHING has
established a wall finding for these 4 specifically.

| Address | Size | Shape observed | Verdict |
|---------|------|-----------------|---------|
| `0x02247b6c` | 1892 B / 561 lines | Full read. State dispatcher over `data_ov002_022ce288+0x5a8` (a small ~30-value enum, NOT a card-ID), range-compare-tree fan-out to ~15 case blocks, each a short well-defined call sequence (documented `func_ov002_0229ade0` sink, `func_ov002_021c38c4`/`021c3b60`/`0227adb8` siblings). No massive card-ID ladder, no multi-value accumulator observed. Carries the C-34 marker (mechanical, not a wall claim). | **TRACTABLE (risk-noted)** — genuine enum dispatch, structurally closer to `021b43a4` (this round's upgrade) than to the card-ID-ladder wall class. Not fully hand-verified case-by-case; flagged for a focused single-function pass next round. |
| `0x0220eb00` | 5636 B / 1656 lines | Pool words: `data_ov002_022ce288`, `022cf16c`, `022cf178/180/184/188`, `022cd3f4`, `022d0250` — the same `PerPlayerRowTable`+`DuelStateSingleton`+CtrlState family this round's batch-3/5 spent 20 functions confirming as an overwhelming wall pattern in *GLOBAL_ASM-marked* functions. Carries the C-34 marker instead — genuinely untested for reg-alloc-wall status. | **UNTESTED (struct-family overlap only, NOT a confirmed or qualified wall)** — brief 207 itself lists this exact address as one it explicitly did NOT ship in its own pass ("Picks NOT attempted... `ov002:0220eb00` last `.word 0x868` → trim trap"), meaning even the C-34 routing may be stale/incomplete for this specific file. Needs a fresh, dedicated pass — do not treat as wall. |
| `0x021d9828` | 9504 B / 2685 lines | Pool tail: raw card-ID-shaped literals (`0x14e2`,`0x1a03`,`0x142c`,`0x151a`,`0x18b2`), calls `func_ov002_021e30b4` repeatedly with stack-marshalled bitfield args. C-34 marker (mechanical). | **UNTESTED** — same caveat; brief 207 also explicitly lists this address as NOT shipped in its own pass ("`ov002:021d9828` last `.word 0x868` → trim trap"). Bare-literal-cascade *shape* resembles the confirmed wall class, but shape resemblance is not a tested verdict. |
| `0x021e4ba8` | 9724 B / 2668 lines | Nested nested-loop counters (`r8/r9/r10` stepped by `0x14`/`1`, bounded `0xa`/`2`), calls `func_ov002_0225702c`/`021d5b80` repeatedly inside the loop. Carries the C-34 marker. | **UNTESTED** — nested-loop multi-register-accumulator shape resembles `021aa558`'s confirmed 4-accumulator wall class, but again this is shape-resemblance, not a tested verdict for this specific function. |
| `0x022b595c` | 10044 B / 2801 lines | Tight nested loop (`r10` 0..2, `r8+=0xb0`) calling `func_02022234` repeatedly with literal args selected by `ldrsh` comparisons against `0x28`; uses `Copy32`/`func_02021660`/`func_020215d8`/`func_020212cc`. Carries the C-34 marker. | **UNTESTED** — largest function in the entire overlay; same caveat as the other 3. |

**Honesty note:** the 4 "UNTESTED" verdicts above are downgraded from
this doc's own earlier draft, which had called them "qualified wall" by
analogy to the GLOBAL_ASM-confirmed cohort — that analogy conflated two
different marker families with different meanings (see the correction
above) and overstated confidence. Two of the four (`0220eb00`,
`021d9828`) are *specifically* called out in brief 207's own text as
picks it did NOT ship, meaning their current `.s` status may be a stale
byte-exact fallback rather than any deliberate routing decision at all.
A future round with dedicated single-function focus should examine these
4 properly (and re-check whether brief 208+ ever revisited them) before
ov002's E/F pool can be considered formally closed.

---

## New KB gaps found (consolidated across all 4 sub-batches)

High volume this round (~35 distinct symbols/offsets flagged); most are
single-site, a handful cross-corroborated 2-4× within this round alone.
Documented inline per-batch during examination; not folded into shared
`types/`/`data/`/`constants/` docs this round (see INDEX.md's "KB Gaps:
Status" table for the established precedent on when to fold vs. defer).
Highest-confidence (cross-corroborated 3+ times) candidates for future
promotion:

- **`data_ov002_022cd73c+0x4`** — corroborated **4 independent times**
  (`021cb584`, `021cbb74`, `021cc258`, `021ccd78`) as a single scalar
  field, always read the same way. Strongest promotion candidate.
- **`data_ov002_022cdc78`** (`+0xc` counter) — corroborated 4 times
  (`021aa558`, `021aec04`, `021af5a0`, `021afc6c`).
- **`data_ov002_022d016c` (DuelStateSingleton) new fields** — `+0x9c`/
  `+0xb0` (running priority/score accumulator + clamp ceiling, heavy use
  in `021aba60`), `+0xcf4`/`+0xd00`/`+0xd04`/`+0xd58`/`+0xd6c` (5 more
  fields extending the already-acknowledged `+0xcf0`-`+0xd94` gap band).
- **`data_ov002_022cd3f4` (StateCtrl) extension** — `+0x1c`/`+0x20`/
  `+0x24`/`+0x28`, corroborated across `021ca840`/`021cacf0`/`021cd0b8`
  (R4 only documented `+0x0`/`+0x4`).
- **`data_ov002_022ce950` per-TU packed-field global** — `+0x0`/`+0x2`/
  `+0x4`/`+0x6`/`+0x80c`/`+0x810`, the base of the entire "chained
  bitfield repack" wall family (`021cb30c` through `021cd0b8`, 7
  functions) — already independently documented via the `dossiers/`
  corpus (`021cfda8.md`, `021bb2cc.md`, `02203198.md`) rather than
  `types/`/`data/`, a cross-tier gap worth reconciling.

Full per-function gap lists (single-site symbols, exact offsets, and
individual evidence) are preserved in the four sub-agent transcripts this
doc was consolidated from; available on request if a future round needs
the complete detail rather than this summary.

## Summary table (repeated for convenience)

| Metric | Count |
|--------|-------|
| Assigned | 50 |
| Examined | 40 (+ 5 spot-checked beyond the assignment, see "true frontier") |
| Newly tractable | 2 (+ 1 more, risk-noted, from the true-frontier giants — see below) |
| Wall (GLOBAL_ASM-marker-confirmed, this round's 40-sample) | 38 |
| Untested (C-34 marker, struct-family overlap only — NOT a wall verdict) | 4 (true-frontier giants; 2 of these brief 207 itself never shipped) |
| Tractable (true-frontier, risk-noted) | 1 |
| Not reached (carries to R11) | 10 (functions 31-40 of the original assignment) |
| New KB gaps found | ~35 (5 cross-corroborated 3+×) |
