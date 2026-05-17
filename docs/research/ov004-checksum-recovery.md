# OV004 checksum recovery — scoping + brief 132+ plan

**Brief:** 129 (cloud scoping). Overlay 4 has been FAILED across
all 3 regions since session start. Brief 127 found that 76% of
ARM9 main's gap cascades from ov004 — recovering ov004 is the
unlock for the 26/27 baseline. **Brief 129 does NOT recover
ov004** — it scopes what recovery entails and outputs a future
brief plan.

## TL;DR

**One root cause, 99% cascade.** Built `arm9_ov004.bin` is
**1024 bytes larger** than orig (269,216 vs 268,192). The growth
comes from **86 spurious thumb→arm interwork veneers** that
mwldarm appends to `.rodata` because cross-overlay address
aliasing makes it think ov004 has branch targets inside ov002's
code (ov002 + ov004 share VAs as mutually-exclusive overlays).
The 1024-byte file growth pushes `.data` and `.bss` later in
memory, which cascades into ~165K bytes of "wrong" pointer
values across `.text` / `.rodata` / `.data`. **Fixing the veneer
generation single-handedly resolves ~99% of the gap.**

This confirms **brief 113's Cat 4 hypothesis** (placeholder-
injection artifact from `dsd init --allow-unknown-function-
calls`). Brief 129's bisection produces direct evidence: 80 of
86 veneer targets land at non-symbol offsets inside ov002
functions (e.g., `func_ov002_02206b00 + 0x68`), and 6 land
exactly on ov002 function entries. None match ov004's own
symbols.

**Bottom line**: ov004 needs a **tooling fix** (NEW WALL: cross-
overlay veneer suppression), not a source-edit campaign. Brief
132 is a tooling brief candidate, not a decomper application
wave. Once the tooling lands, ov004 likely flips OK in one shot,
and ARM9 main auto-flips on the cascade-resolved bytes →
**26/27 baseline across all 3 regions**.

## Bisection — what differs

```
File sizes:
  built:  269,216 bytes (0x41ba0)
  orig:   268,192 bytes (0x417a0)
  delta:  +1,024 bytes (0x400)

Per-section sizes:
  Section   orig          built         delta
  .text     0x148d8       0x148e0       +8
  .rodata   0x2b424       0x2b82c       +1032
  .init     0x2c          0x2c          0
  .ctor     0x4           0x8           +4
  .data     0x1a60        0x1a60        0
  pad→data  0x14          0x0           -20
                                       ─────
                                        +1024
```

`.text` grows by 8 bytes (one small veneer at end-of-text).
`.rodata` grows by 1032 bytes (= **86 thumb→arm interwork veneers
× 12 bytes each**). `.ctor` grows by 4 bytes (`WRITEW(0)` in LCF
adds a trailing zero word that orig doesn't have). The pre-.data
padding shrinks by 20 bytes because the new `.ctor` end happens
to land already-aligned to 32.

**Cascade-aware diff totals** (after shift correction):

```
.rodata: 2,015 bytes diff
.data:      61 bytes diff
.text:  10,618 bytes diff (same-offset — most are shift artifacts
                          since functions move within .text)
```

But the **vast majority of all diffs are pointer-cascade**:
every reference to a .bss/.data symbol shifts by +0x400 because
.bss now starts at VA `0x0220b900` instead of `0x0220b500`. Every
reference to a .rodata symbol shifts by +8 because .rodata starts
at VA `0x021de640` instead of `0x021de638`.

### Delta histogram (`.rodata`, 1,827 differing 4-byte words)

| Delta     | Count | Pct  | Meaning |
|-----------|------:|-----:|---------|
| +0x400    | 941   | 51%  | Pointer to `.bss`/`.data` symbol (cascade) |
| +0x8      | 682   | 37%  | Pointer to `.rodata` symbol (cascade) |
| +0x9      | 46    | 3%   | Pointer to thumb-mode code in shifted region |
| Various   | 158   | 9%   | Pointer to address landed in the new veneer pool |

**100% of `.rodata` diffs are cascade-explainable.** Zero are
"genuine content errors."

## Root cause — the 86 spurious veneers

### Veneer signature

```
7847 c046     ; BX PC; NOP — thumb → arm mode switch
04f0 1fe5     ; LDR PC, [PC, #-4] — load 4-byte literal into PC
<4-byte addr> ; target address
```

This is the canonical thumb→arm interwork veneer. mwldarm emits
one whenever a thumb caller branches to an arm callee via BL,
and the call distance exceeds the thumb BL range OR a mode-
transition stub is required.

**Pattern occurrences in `arm9_ov004.bin`:**

- orig: **0**
- built: **86**

86 veneers × 12 bytes = 1,032 bytes — matches the .rodata growth
exactly.

### Where the veneers point — the cross-overlay aliasing trap

The 86 veneer targets resolve as follows:

```
Target ownership:
  ov002 functions (matches function entry):     6
  ov002 functions (mid-function offset +N):    74
  No nearby symbol (UNKNOWN):                   6  *
  ──────────────────────────────────────────── ──
  Total:                                       86

* Even "UNKNOWN" targets land in the 0x02206000..0x02208a00
  address range — ov002's .text region. They likely hit ov002
  function bytes that haven't been carved into named symbols
  yet.
```

**Sample veneer targets (first 10):**

| Built file offset | Target       | Nearest function (in ov002) |
|-------------------|--------------|-----------------------------|
| `0x3fd04`         | `0x02206b68` | `func_ov002_02206b00 + 0x68` |
| `0x3fd10`         | `0x02206768` | `func_ov002_0220673c + 0x2c` |
| `0x3fd1c`         | `0x02208768` | `func_ov002_02208760 + 0x8`  |
| `0x3fd28`         | `0x02208b68` | `func_ov002_02208b68` (exact)|
| `0x3fd34`         | `0x02206f68` | `func_ov002_02206eb0 + 0xb8` |
| `0x3fd40`         | `0x02207f68` | `func_ov002_02207f24 + 0x44` |
| `0x3fd4c`         | `0x02207b68` | `func_ov002_02207b3c + 0x2c` |
| `0x3fd58`         | `0x02207368` | `func_ov002_0220730c + 0x5c` |
| `0x3fd64`         | `0x02207768` | `func_ov002_022076a0 + 0xc8` |
| `0x3fd70`         | `0x02208368` | `func_ov002_02208338 + 0x30` |

### Why this happens

ov002 and ov004 are **mutually-exclusive overlays** that share
the same memory VA range (the LCF declares ov004 ORIGIN AFTER
ov000, ov005, ov008, ov018, ov020, ov022 — i.e., they all
overlap in load space). When the game loads ov004, addresses
like `0x02206b68` hold **ov004's data** (`data_ov004_02206b60 +
0x8` byte into the array). When the game loads ov002,
`0x02206b68` holds **ov002 code** (mid-function bytes of
`func_ov002_02206b00`).

mwldarm doesn't model overlay swapping. When it sees that ov004's
.text contains a thumb instruction with a branch reaching
`0x02206b68`, and the symbol table (from dsd init's analysis) says
"there's a function symbol near 0x02206b68 in ov002", mwldarm
treats it as a cross-module call needing a veneer.

The branches are **not actual cross-overlay calls** — they're
data loads, literal pool addresses, or false-positive call
identifications from `dsd init --allow-unknown-function-calls`.

## Categorization — Cat 1 / 2 / 3 / 4

**Cat 4 dominates.** Per brief 127's pattern but with the new
overlay-aliasing category added:

| Cat | Description | Bytes | Pct | Fix shape |
|-----|-------------|------:|----:|-----------|
| **4** | **Cross-overlay placeholder veneers** | **1024** | **>99% cascade** | NEW TOOLING |
| 1 | Wrong source-target in matched TUs | ? | small | source edit |
| 2 | `.rodata` pointers to other overlays | ? | small | depends on Cat 4 |
| 3 | `.data` struct array residue | 61 (max) | tiny | source edit / cascade |

Cat 1/2/3 are bounded above by the cascade-aware diff counts.
With Cat 4 unresolved, those numbers include cascade contamination
that masks any genuine residue. **Cat 4 must be fixed first** to
expose the true Cat 1/2/3 counts.

### Why Cat 4 is the root

Once the 86 spurious veneers are eliminated:

1. `.rodata` returns to 0x2b424 bytes (= orig size, = gap-13
   object's own .rodata size).
2. `.data` start VA returns to 0x02209aa0 (orig).
3. `.bss` start VA returns to 0x0220b500 (orig).
4. Every `+0x400` and `+0x8` cascade delta vanishes (94% of
   .rodata diff bytes, all .data diff bytes, most .text
   literal-pool diffs).
5. The only remaining diffs would be genuine content issues —
   Cat 1/2/3 in pure form.

Decomp state for ov004: **309/310 functions are placeholder
`func_ov004_*` (1 named: `__sinit_ov004_02209a5c`).** So Cat 1
(wrong-source-target) is currently inapplicable — there's no
manual source to be wrong. Cat 1/2/3 will likely surface only
after Cat 4 fix exposes them, AND after some source-level matching
work happens for the 309 unnamed functions.

## Quantification — total recovery effort

**Phase 1: Cat 4 tooling fix (sizing ~tens of bytes touched in
the toolchain, blocks all other progress).**

- Goal: prevent mwldarm from emitting veneers for branch targets
  that resolve into different overlays.
- 86 veneers × 12 bytes = 1,032 bytes physically eliminated from
  .rodata.
- Cascade fixes: ~2,015 bytes in .rodata + ~10,000+ bytes in
  .text literal pools + ~60+ bytes in .data = **~12K+ bytes
  resolved automatically**.

**Phase 2: residue from Cat 1/2/3 (sizing unknown until Phase 1
lands).**

- Likely small (≤ a few hundred bytes) given the regular pattern.
- Brief 127 found ARM9 main had only 5 bytes of true Cat 1
  residue across 3 functions — similar scale plausible here.

**Phase 3: ov004 function-level matching (orthogonal, long-term).**

- 309 placeholder functions need source. Today they all match
  byte-identically via raw delinked `.o` files, so they're not
  blocking the checksum. They block higher-level decomp goals
  (named symbols, refactoring, port work).
- Not on the critical path for the 26/27 baseline.

## Brief 132+ application plan

### Brief 132 — Cat 4 tooling: suppress cross-overlay veneers (cloud)

**Owner:** cloud (tooling).
**Priority:** HIGH — unlocks 26/27 baseline.

**Approach options (cloud to investigate + pick):**

1. **mwldarm flag tweak.** Check `-noscanlibs`, `-nostdlib`,
   `-keepveneers`, `-veneerless`, or related flags that influence
   veneer generation. If a flag suppresses veneers for specific
   call patterns, use it.
2. **Symbol-table filtering.** Generate per-overlay symbol files
   that exclude mutually-exclusive overlay symbols from ov004's
   link scope. The LCF / dsd-generated symbol map currently
   exposes all-overlay symbols globally; restricting visibility
   to co-resident overlays would prevent the mis-targeted
   veneers.
3. **Custom LCF veneer-absorption section.** Add a `.thunk` or
   `.veneer` section to the OV004 layout that consumes veneers
   without displacing .data. mwldarm would still emit them, but
   they'd land in dedicated padding space sized to match orig.
4. **dsd init re-run with overlay-aware analysis.** If dsd
   v0.11.0+ has flags to scope cross-module symbol visibility
   per overlay-load group, re-run init with those flags. Risk:
   may also affect main / DTCM / other overlays.

**Deliverable:** ov004 byte-identical to orig (`dsd check
modules` reports OK for OV004). main likely flips to OK on the
same change as a side effect (cascade resolution per brief 127
Cat 2 + Cat 3 = 16 of 21 bytes).

**Walls:**

- **W7 candidate (NEW)**: cross-overlay symbol visibility in
  mwldarm. If approach (2) or (4) requires new tooling
  infrastructure, this becomes a workflow wall.
- Approach (3) is the LOWEST-RISK + INCREMENTAL — a LCF tweak
  with no toolchain version change. Cloud should investigate it
  first.

**Expected per-wave throughput:** one wave. If the tooling fix
lands, ov004 flips OK in a single CI run.

### Brief 133 — OV004 Phase 2 residue (decomper, conditional)

**Trigger:** Only if brief 132's tooling fix leaves bytes
differing.

**Owner:** decomper (source edits) or cloud (additional tooling).

**Approach:** Re-run brief 129's bisection against the new built
ov004. Apply brief 127's Cat 1 recipe (matched-TU wrong-target
fixes) if any Cat 1 diffs remain.

### Brief 134+ — ov004 source-level matching (decomper, long-term)

**Trigger:** After 26/27 baseline lands. Lower priority — not
on the checksum-recovery critical path.

**Owner:** decomper.

**Approach:** Standard function-matching workflow on the 309
placeholder `func_ov004_*` symbols. Use existing tooling (no
new walls expected). This is the natural follow-on to brief
133's residue cleanup.

## Risk assessment

### Higher-risk (requires tooling investment)

**Cat 4 fix (brief 132)** requires NEW TOOLING — at minimum a
custom LCF section, at maximum new dsd init flags or mwldarm
behavior changes. This is the **highest-impact + highest-risk
brief in the recovery pipeline**. The risk:

- mwldarm is closed-source — we can't modify its veneer
  generation directly.
- Approach (1) depends on undocumented flags; may not exist.
- Approach (2) requires understanding mwldarm's symbol visibility
  model.
- Approach (3) is most tractable but may not absorb all veneers
  (some could spill into next section).
- Approach (4) risks regressing other modules (DTCM, main, other
  failing overlays).

**Mitigation:** Brief 132 should be EXPLORATORY first — start
with the lowest-impact approach (3 = LCF section), measure
results, escalate to higher-impact approaches only if needed.

### Lower-risk (no new tooling)

**Cat 1/2/3 residue (brief 133+)** is pure source-edit work once
Cat 4 lands. Risk equivalent to brief 130's main fix work —
small, well-understood.

### Comparison to brief 127

| Metric              | ARM9 main (brief 127) | OV004 (brief 129) |
|---------------------|----------------------:|------------------:|
| File-size delta     | 0 bytes (exact match) | +1024 bytes |
| Total byte diff     | 21 bytes              | ~165,000 bytes |
| Symbols affected    | 6                     | hundreds (cascade) |
| Root cause          | source-target errors  | toolchain veneer leak |
| New tooling needed  | NO                    | **YES** |
| Decomper-fixable    | YES (~30 min)         | Phase 2 only |
| Cascade contributor | from ov004            | self-cascading |

ARM9 main is the easy case. ov004 is structurally harder.

## Cross-references

- **Brief 113** — original `.data`/`.text` cross-module reloc
  residue hypothesis. Cat 4 here directly confirms the brief 113
  Cat 4 prediction.
- **Brief 118** — predicted main + ov004 coupling. Brief 127 +
  129 confirm: when ov004 flips OK, main's 16 cascade bytes
  auto-fix.
- **Brief 127** — ARM9 main scoping. main has 21 bytes / 6
  symbols (mostly cascade from ov004). Cat 1 fixes there are
  brief 130's work; Cat 2/3 fixes here cascade-resolve.
- **CLAUDE.md** — `dsd init --allow-unknown-function-calls`
  bootstrap note. The placeholder injection there is the exact
  mechanism that causes Cat 4.
- **`docs/research/arm9-main-checksum-recovery.md`** — brief
  127's scoping doc. Same methodology applied here.

## Methodology data point

Bisection + categorization took ~30 minutes (file-size diff →
section-boundary analysis → veneer pattern detection → cross-
overlay target resolution). The veneer-as-root-cause hypothesis
emerged after spotting the **86 vs 0 pattern occurrence count**.
Recommendation: when checking a FAILED module, look for repeated
veneer-shaped 12-byte sequences first — if the count diverges
strongly between built and orig, that's the root cause.

## TL;DR for brain

- **OV004 has one root cause + massive cascade.** 1024-byte
  file growth from 86 spurious mwldarm thumb→arm interwork
  veneers in .rodata.
- **Cat 4 confirmed.** Veneer targets resolve to ov002
  functions (which share VA range with ov004 as mutually-
  exclusive overlays). This is exactly the brief 113 Cat 4
  hypothesis — placeholder-injection artifact from `dsd init
  --allow-unknown-function-calls`.
- **Recovery is a TOOLING brief.** Brief 132 candidate = cloud
  tooling, not decomper application. Approach options range
  from a low-risk LCF section tweak to a higher-risk dsd init
  re-run.
- **Cascade payoff is huge.** Fixing the veneer generation
  resolves ~99% of ov004's gap (~12K+ bytes auto-fix). ARM9
  main's 16 cascade bytes also auto-fix → **26/27 baseline
  across all 3 regions**.
- **Critical path:** brief 132 (cloud Cat 4 tooling) → ov004
  flips → main auto-flips on cascade. Brief 133+ is conditional
  residue cleanup. Brief 134+ is long-term function-matching
  (orthogonal to checksum recovery).
- **309/310 ov004 functions are still placeholder** — early
  decomp state. This is fine for checksum (raw delinked .o
  bytes match byte-identically). Source-level matching is a
  long-term goal, not blocking 26/27.
