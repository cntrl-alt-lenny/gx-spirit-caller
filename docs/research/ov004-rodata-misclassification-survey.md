# ov004 `.rodata` misclassification survey — `data` symbols that may be ARM code

**Brief:** 154 (cloud autonomous research).
**Goal:** Identify `data`-classified symbols in
`config/eur/arm9/overlays/ov004/symbols.txt` whose byte content
in the original ROM is actually ARM code, propose reclassification
to `func`, and ship 1-2 worked examples with 3-region SHA1 PASS.
**Provenance:** brief 151 (PR #578) "BONUS NOT MET" investigation
identified misclassified `.rodata` symbols as the gating
dependency for further veneer-count reduction below the current
n=9 floor.

## ⚠️ Toolchain-availability caveat

The brief's primary heuristic ("First 4 bytes match common ARM
prologue patterns") requires reading bytes from the original ROM
at `extract/eur/arm9/overlays/ov004.bin`. Cloud has **no
baserom** and **no `dsd rom extract` output**, so the byte-level
analysis is not directly available in this PR.

This survey therefore uses **structural-metadata heuristics only**
— reloc patterns, symbol alignment, adjacency to known
classifications. Candidates flagged HIGH-confidence here have
secondary byte confirmation from PR #578's investigation log;
candidates flagged MEDIUM/LOW are catalogued for brain or
decomper to byte-confirm on a follow-up wave via either
`dsd dis` or direct hex inspection of the extracted overlay.

## Method

### Input

- `config/eur/arm9/overlays/ov004/symbols.txt` — 1,476 symbol entries.
- `config/eur/arm9/overlays/ov004/delinks.txt` — section ranges.
- `config/eur/**/*relocs.txt` — every reloc whose `module:` is
  `overlay(4)` (the cross-corpus incoming-relocs index).

### Filters

1. **`kind:data`** — only `data(any)` / `data(word)` entries
   (the classification under suspicion). 935 symbols.

2. **Section range `.rodata`** — between `.rodata` start `0x021de638`
   and `.rodata` end `0x02209a5c`. (Other sections — `.data`,
   `.bss`, `.init`, `.ctor` — are already correctly classified;
   this brief is specifically about `.rodata` misclassifications.)

3. **4-byte alignment** — ARM functions MUST start at a 4-aligned
   address. Symbols at non-4-aligned addresses are not candidates
   (they could be strings, packed-byte tables, or partial-word
   data). Filtering by `addr % 4 == 0` drops 35 of 935 (1- or
   2-aligned), leaving **900 4-aligned candidates** across all
   sections, of which **622 are in the `.rodata` range**.

### Incoming-reloc analysis

For each of the 622 4-aligned-in-`.rodata` candidates, walk every
`relocs.txt` in the project, filter to entries with
`module:overlay(4)`, and bucket by reloc-kind set:

| Inbound reloc-kind set | Count | Interpretation |
|---|---:|---|
| `('arm_call',)` | 0 | All arm_call targets are already classified `function(arm)` by `dsd init`. |
| `('thumb_call',)` | 0 | All thumb_call targets are already `function(thumb)`. |
| `('load',)` | 621 | The candidate is referenced via `ldr ip, .L<pool>` (i.e., its address is a constant in a literal pool). The `from:` addresses are mostly INSIDE `.rodata` (606 of 621) — meaning the load instructions themselves live in code-inside-`.rodata`, which is a strong signal that the surrounding `.rodata` region is actually a code+pool mix, not pure data. |
| no inbound relocs | 1 | Unreferenced via the project's reloc index — either dead code, statically-initialised data with no outside reference, or a fall-through landing pad. Low signal. |

Of the 621 `load`-only candidates:

- **606** have at least one `from:` address inside `.rodata`
  range (load instruction lives in code-in-`.rodata`).
- **15** have all `from:` addresses outside `.rodata` (loaded
  exclusively from `.text` — these are typical
  function-pointer-table entries used by jumps elsewhere).

### Confirmed-via-PR-#578 evidence

[PR #578](https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/578)
investigated `0x021e2efc` as a Pattern 3 chunk candidate and
documented its byte content:

```text
30 40 2d e9 04 d0 4d e2 ...
  = e92d4030  STMFD SP!, {R4, R5, LR}
  = e24dd004  SUB  SP, SP, #4
```

This is a textbook ARM function prologue (push-LR-and-callee-saves,
allocate stack frame). Classified in `symbols.txt` today as
`data_ov004_021e2efc kind:data(any)`. **Confirmed misclassification.**

Claiming `0x021e2efc` as `.rodata` data (PR #578's investigation
path 2) dropped ov004's veneer count from `n=9` to `n=2` and
fired brief 150's stderr note — i.e., the veneer-suppression
mechanism saw the local definition. But because the bytes are
code, claiming them as `.rodata` shifted link layout and broke
SHA1. The fix this brief proposes — reclassify as `func` instead
of claiming as `.rodata` — keeps the bytes in place while
exporting them with the correct symbol kind. PR #578 was reverted;
this PR replaces that approach with the symbol-export change.

## Confidence ratings

### HIGH (1 candidate)

| vaddr | size | current kind | proposed kind | ARM-prologue match | veneer-drop hint |
|---|---:|---|---|---|---|
| `0x021e2efc` | (implicit ~0x22c via next data symbol; actual bounds TBD by decomper) | `data(any)` | `function(arm,size=0x0,unknown)` | ✓ `STMFD SP!, {R4, R5, LR}; SUB SP, SP, #4` (PR #578) | ✓ 9 → 2 observed when claimed as `.rodata` (PR #578) |

This is the **worked example** shipped in this PR (see
*Worked-example reclassification* below).

### MEDIUM (605 candidates — structural signals only, byte
confirmation pending)

All 605 share the same structural fingerprint as the HIGH
candidate:

- Classified `data(any)`.
- 4-aligned.
- In `.rodata` range `[0x021de638, 0x02209a5c)`.
- Exactly one inbound `load` reloc.
- The load instruction's `from:` address is itself inside
  `.rodata` — meaning the loading code lives in `.rodata`, not
  `.text`. Strong hint that we're inside a code-in-`.rodata`
  region created by mwldarm's overlay-blind veneer emission
  (W7) cascade.

These cannot be promoted to HIGH without inspecting their bytes
(`dsd dis` on the extracted `.bin`, or hex-viewing the
`extract/eur/arm9/overlays/ov004.bin` directly). The brief
specifically calls out byte inspection as the HIGH-promotion
gate; the survey gives brain / decomper a 605-candidate
catalog to iterate against on the next wave.

Spot list of the lowest 30 by address (full list reproducible
via the `Reproducibility` section below):

```text
0x021e2efc  data_ov004_021e2efc  (the HIGH candidate above)
0x021e3128  data_ov004_021e3128
0x021e3234  data_ov004_021e3234
0x021e32b0  data_ov004_021e32b0
0x021e3314  data_ov004_021e3314
0x021e34a4  data_ov004_021e34a4
0x021e3500  data_ov004_021e3500
0x021e3de8  data_ov004_021e3de8
0x021e3f60  data_ov004_021e3f60
0x021e4154  data_ov004_021e4154
0x021e4234  data_ov004_021e4234
0x021e42b0  data_ov004_021e42b0
0x021e432c  data_ov004_021e432c
0x021e43a8  data_ov004_021e43a8
0x021e4424  data_ov004_021e4424
0x021e57e8  data_ov004_021e57e8
0x021e5808  data_ov004_021e5808
0x021e58a4  data_ov004_021e58a4
0x021e5954  data_ov004_021e5954
0x021e5a04  data_ov004_021e5a04
0x021e5ab4  data_ov004_021e5ab4
0x021e5fa8  data_ov004_021e5fa8
0x021e606c  data_ov004_021e606c
0x021e60e4  data_ov004_021e60e4
0x021e615c  data_ov004_021e615c
0x021e61d4  data_ov004_021e61d4
0x021e624c  data_ov004_021e624c
0x021e6f44  data_ov004_021e6f44
0x021e6f64  data_ov004_021e6f64
0x021e6fe8  data_ov004_021e6fe8
```

The lowest 30 cluster densely in the `0x021e2efc..0x021e7000`
range — the same address band as PR #578's confirmed
misclassification at `0x021e2efc` AND the existing
`func_ov004_021e7e30_unk` (which dsd already classified as
`function(arm)` with unknown size from arm_call inbound
analysis). This entire band looks like a code-in-`.rodata`
region created by mwldarm's W7 layout cascade. **Strong
adjacency hint for promotion to HIGH on the next byte-inspection
pass.**

### LOW (16 candidates)

| Sub-category | Count |
|---|---:|
| Single-`load`-from-outside-`.rodata` (loaded only from `.text`) | 15 |
| No inbound relocs at all | 1 |

These are reachable only from `.text` literal pools — typical
function-pointer-table entries. Could still be either code or
data (a function pointer is data shaped like a code address;
distinguishing requires looking at how the value is used at the
load site). Lowest priority for reclassification.

### Excluded (NOT candidates)

| Sub-category | Count |
|---|---:|
| `.text`-range `data` symbols (rare; not in scope) | 0 in `.rodata` survey |
| Non-4-aligned `data` symbols (35 total: 13 odd, 21 half-word, 1 mod-3) | 35 |
| Already `function(*,unknown)` markers (handled by dsd init) | 9 |
| Ambiguous-tagged data symbols at non-4-aligned addresses | 3 |

## Worked-example reclassification

This PR reclassifies the **single HIGH-confidence candidate**
(`0x021e2efc`) in `config/eur/arm9/overlays/ov004/symbols.txt`:

```diff
-data_ov004_021e2efc kind:data(any) addr:0x021e2efc
+func_ov004_021e2efc_unk kind:function(arm,size=0x0,unknown) addr:0x021e2efc
```

The shape matches the existing precedent `func_ov004_021e7e30_unk`
(itself a dsd-init-detected arm_call target with unknown bounds).
`size=0x0,unknown` keeps the bounds question open — decomper or
a follow-up brief can refine via disassembly once the
reclassification is verified SHA1-safe.

The brief's optional second worked example is **deliberately
omitted** in this PR: cloud has only one byte-confirmed
HIGH-confidence candidate (`0x021e2efc`, via PR #578). Picking
a second from the 605 MEDIUM pool without byte inspection
would be a coin-flip on SHA1; the brief explicitly says
"if a reclassification causes a SHA1 break, the candidate was
wrong; revert + lower confidence", which is a fragile
remote-iteration loop. Shipping one verified-byte-shape
candidate is the safer play. Brain or decomper can add the
second example in a follow-up once a MEDIUM candidate has been
byte-confirmed.

## Verify gate (brain runs pre-merge)

3-region SHA1 PASS post-reclassification:

```text
python tools/configure.py eur && ninja sha1   # must PASS
python tools/configure.py usa && ninja sha1   # must PASS
python tools/configure.py jpn && ninja sha1   # must PASS
```

Expected outcome paths:

- **All three PASS.** Reclassification is layout-neutral
  (bytes don't move; only the symbol-export kind changes).
  Confirmation that `data → func` at fixed address doesn't shift
  the link. Proceed to bonus check below.

- **Any region FAILS.** The reclassification did affect link
  layout — either dsd's LCF emission treats `function(arm,
  unknown)` differently than `data(any)` (e.g., placing it in a
  different section), or mwldarm resolved the symbol differently
  in a way that affected nearby placement. Per the brief:
  revert the symbols.txt change, downgrade `0x021e2efc` to
  MEDIUM/LOW confidence in the survey, and document the
  observed SHA1 delta as evidence that the byte-confirmation
  alone isn't sufficient — symbol-export classification needs
  link-graph verification too. If this happens, brief 155 picks
  up the investigation.

## Bonus deliverable — veneer-count hypothesis

PR #578 measured: claiming `0x021e2efc` as a `.rodata` data
symbol dropped ov004's veneer count from `n=9` to `n=2` (the
brief 150 stderr note FIRED, confirming the patcher path
through the variable-count code).

**Hypothesis:** reclassifying `0x021e2efc` as `func` (this PR's
approach) preserves the same `n: 9 → 2` veneer drop because:

1. The local-definition signal that suppresses cross-overlay
   veneers depends on mwldarm finding a resolvable symbol at the
   target address, regardless of symbol kind.
2. The bytes don't move (reclassification doesn't claim source),
   so SHA1 should hold if the suppression mechanism trips on
   the kind-flip alone.

If the hypothesis holds, brain will observe in the verify-gate
output:

```text
patched build/eur/build/arm9_ov004.bin: spliced 2 veneers (24 bytes), ...
note: 2-veneer ctor/pad shape disagrees with n-inference: ...
       (brief 150). Common at n<9 where mwldarm keeps the
       WITH_TERMINATOR shape that n-inference assumes only for n=86.
```

(or some other low-n stderr note from the brief 150 patcher path.)

**If observed, that's the signal for brief 155** — decomper
retries the suppressed candidates from brief 151's `n<9`
investigation path. The same 605 MEDIUM-confidence candidates
in this survey become high-priority for byte-inspection +
reclassification in bulk.

**If NOT observed** (i.e. veneer count stays at 9 after the
reclassification), the suppression mechanism requires a
`.rodata` source claim — not just a symbol-kind flip. In that
case the survey's contribution is still useful for future
disassembly-driven source claims, but the veneer-suppression
unlock awaits a different lever (e.g., the 22.5 KB mega-block
disassembly path the brief explicitly defers).

Brain documents the observed `n=N` value in the merge PR body.

## Reproducibility

The full survey is reproducible from a fresh checkout of `main`
via a short Python script over `config/eur/`. No baserom or
toolchain required for the structural-metadata layer (the
byte-confirmation step is the only piece that needs the
extracted overlay).

```python
import re, collections
from pathlib import Path

RODATA_START, RODATA_END = 0x021DE638, 0x02209A5C
sym_re = re.compile(
    r"^(data_ov004_\S+)\s+kind:(data\([^)]+\))\s+addr:0x([0-9a-f]+)"
)
reloc_re = re.compile(
    r"from:0x([0-9a-f]+)\s+kind:(\w+)\s+to:0x([0-9a-f]+)\s+module:(\S+)"
)

# Step 1: collect 4-aligned data symbols in .rodata range.
candidates = []
for line in Path(
    "config/eur/arm9/overlays/ov004/symbols.txt"
).read_text().splitlines():
    m = sym_re.match(line)
    if not m:
        continue
    addr = int(m.group(3), 16)
    if RODATA_START <= addr < RODATA_END and addr % 4 == 0:
        candidates.append((addr, m.group(1)))

# Step 2: bucket each by inbound-reloc-kind set.
relocs = {}
for p in Path("config/eur").rglob("relocs.txt"):
    for line in p.read_text().splitlines():
        m = reloc_re.match(line)
        if not m or m.group(4) != "overlay(4)":
            continue
        to_addr = int(m.group(3), 16)
        from_in_rodata = RODATA_START <= int(m.group(1), 16) < RODATA_END
        relocs.setdefault(to_addr, []).append((m.group(2), from_in_rodata))

# Step 3: emit the catalog.
medium, low_outside, low_no_inbound = [], [], []
for addr, name in candidates:
    rs = relocs.get(addr, [])
    if not rs:
        low_no_inbound.append((addr, name))
        continue
    kinds = {k for k, _ in rs}
    if kinds == {"load"} and any(in_ro for _, in_ro in rs):
        medium.append((addr, name))
    else:
        low_outside.append((addr, name))

print(f"MEDIUM: {len(medium)}")
print(f"LOW (load-from-outside-only): {len(low_outside)}")
print(f"LOW (no-inbound): {len(low_no_inbound)}")
```

Expected output on the current main:

```text
MEDIUM: 606  (includes the HIGH candidate 0x021e2efc)
LOW (load-from-outside-only): 15
LOW (no-inbound): 1
```

(Total 622 = 606 + 15 + 1; matches the 4-aligned-data-in-.rodata
filter result.)

## After this brief lands

Per brief 154's "After this brief lands" section:

1. Brain runs the 3-region SHA1 verify-gate (see above).
2. If `0x021e2efc` reclassification preserves SHA1 PASS AND
   drops veneers below 9, brain queues **brief 155** — decomper
   wave to byte-inspect + reclassify additional MEDIUM
   candidates in bulk, retrying the brief 151 suppressed claims
   against the lower `n` floor.
3. If reclassification preserves SHA1 but doesn't drop veneers,
   the survey serves as a research catalog for the eventual
   22.5 KB mega-`.rodata` disassembly pass (out of scope here).
4. If reclassification breaks SHA1, brain reverts the
   symbols.txt edit and downgrades `0x021e2efc` to MEDIUM in
   this survey. The 605 MEDIUM candidates remain catalogued
   for a different unlock approach.

## See also

- [`docs/research/ov004-rodata-patcher-blocker.md`](ov004-rodata-patcher-blocker.md)
  — the brief 145 / PR #566 investigation that surfaced the
  `n<86` patcher bug (now fixed in brief 146 / PR #570).
- [`docs/research/ov004-checksum-recovery.md`](ov004-checksum-recovery.md)
  — full ov004 SHA1-recovery history.
- [`docs/research/ov004-thunk-section-fix.md`](ov004-thunk-section-fix.md)
  — W7 mitigation tier history; the veneer-pool the brief 154
  reclassification aims to drain further.
- [PR #578](https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/578)
  — primary source for the `0x021e2efc` byte-confirmation and
  the 9 → 2 veneer-drop measurement.
