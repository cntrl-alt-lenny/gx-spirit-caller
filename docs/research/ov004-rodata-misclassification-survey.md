# ov004 `.rodata` misclassification survey — `data` symbols that may be ARM code

**Brief:** 154 (cloud autonomous research).
**Goal:** Identify `data`-classified symbols in
`config/eur/arm9/overlays/ov004/symbols.txt` whose byte content
in the original ROM is actually ARM code, propose reclassification
to `func`. Original intent included shipping 1-2 worked examples
with 3-region SHA1 PASS; **the worked-example attempt fell to the
verify gate (see *Worked-example falsification* below) — survey-
only deliverable instead**.
**Provenance:** brief 151 (PR #578) "BONUS NOT MET" investigation
identified misclassified `.rodata` symbols as the gating
dependency for further veneer-count reduction below the current
n=9 floor.

> **Calibration lesson:** brief 154 was the rare case where a
> verify-gate failure produced more research value than success
> would have. The single worked-example reclassification cloud
> picked — `0x021e2efc`, supported by byte-confirmation from PR
> #578 — broke EUR `ninja sha1` (`1da50df7…b4f75 → d83c6d20…fd3087`)
> despite the bytes pattern-matching an ARM `STMFD` prologue.
> That falsifies the "byte pattern + structural signal = real
> code" inference for at least this slot. The 605 MEDIUM-cohort
> candidates that share the same structural fingerprint must be
> treated with the same scepticism until byte-disassembled in
> context (a few ARM-prologue-shaped bytes mid-`.rodata` is
> consistent with constant data that happens to look like a
> prologue — e.g. a packed struct or table entry whose first
> word coincidentally encodes an `stmfd` opcode).

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
  = e92d4030  STMFD SP!, {R4, R5, LR}  (← interpreted as ARM)
  = e24dd004  SUB  SP, SP, #4          (← interpreted as ARM)
```

The first 8 bytes pattern-match a textbook ARM function prologue
when interpreted as instructions. Classified in `symbols.txt`
today as `data_ov004_021e2efc kind:data(any)`. The original
brief 154 draft promoted this to HIGH-confidence on the strength
of the prologue match, but **the verify-gate falsified that
promotion** — see *Worked-example falsification* below. The
pattern match is necessary but not sufficient; this byte
sequence may equally well be `.rodata` data whose first word
coincidentally encodes a common opcode.

Separately, PR #578 measured that claiming `0x021e2efc` as
`.rodata` data dropped ov004's veneer count from `n=9` to `n=2`
(the brief 150 stderr note fired). That was reverted because
claiming as `.rodata` shifted link layout and broke SHA1. This
brief proposed an alternative — reclassify as `func` to keep
bytes in place while flipping the symbol-export kind — but the
verify-gate showed that approach also broke SHA1. The `n: 9 → 2`
veneer-suppression unlock therefore remains gated on a different
lever (likely full disassembly of the surrounding region to
identify real code/data boundaries).

## Confidence ratings

### HIGH (0 candidates after falsification)

The brief defined HIGH as "multiple ARM-prologue matches +
correct alignment + size pattern". Cloud's initial draft promoted
`0x021e2efc` to HIGH on the strength of PR #578's byte-confirmation
(`30 40 2d e9 04 d0 4d e2 …` = canonical ARM `STMFD` prologue).
**The verify-gate falsified that promotion** — reclassifying as
`function(arm)` broke EUR `ninja sha1` (see *Worked-example
falsification* below). After the revert, no candidate carries HIGH
confidence in this survey: every entry below is at MEDIUM or LOW
pending **per-target byte disassembly** (not just first-4-byte
pattern match — the whole region needs to be disassembled in
context to distinguish "real ARM code" from "constant data whose
first word coincidentally encodes an opcode").

### MEDIUM (606 candidates — structural signals only, byte
confirmation pending)

All 606 share a common structural fingerprint:

- Classified `data(any)`.
- 4-aligned.
- In `.rodata` range `[0x021de638, 0x02209a5c)`.
- Exactly one inbound `load` reloc.
- The load instruction's `from:` address is itself inside
  `.rodata` — meaning the loading code lives in `.rodata`, not
  `.text`. Strong hint that we're inside a code-in-`.rodata`
  region created by mwldarm's overlay-blind veneer emission
  (W7) cascade.

`0x021e2efc` belongs to this cohort. Its byte-confirmation
(per PR #578) **did not survive** the symbol-export reclassification
verify-gate — see *Worked-example falsification* below. The
remaining 605 candidates with the same structural fingerprint
inherit the same caveat: **structural pattern + first-4-byte ARM
match is not sufficient evidence of real code**. Promotion to
HIGH requires per-target disassembly of the whole region in
context, plus an independent verify-gate (e.g. SHA1 round-trip
after reclassification, like this PR attempted) to confirm the
slot is link-graph-safe.

These cannot be promoted to HIGH without inspecting their bytes
(`dsd dis` on the extracted `.bin`, or hex-viewing the
`extract/eur/arm9/overlays/ov004.bin` directly). The brief
specifically calls out byte inspection as the HIGH-promotion
gate; the survey gives brain / decomper a 606-candidate
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

## Worked-example falsification

Cloud's initial submission of this PR (#581) shipped a worked-
example reclassification of `0x021e2efc`:

```diff
-data_ov004_021e2efc kind:data(any) addr:0x021e2efc
+func_ov004_021e2efc_unk kind:function(arm,size=0x0,unknown) addr:0x021e2efc
```

Rationale at the time:

- Bytes at the address pattern-match a canonical ARM `STMFD`
  prologue per PR #578's byte log (`30 40 2d e9 04 d0 4d e2 …` =
  `STMFD SP!, {R4, R5, LR}; SUB SP, SP, #4`).
- Structural fingerprint matches the 606-candidate
  load-from-`.rodata` cohort identified above.
- Reclassification leaves bytes in place (no source claim, no
  layout shift expected) — hypothesis was the symbol-export
  kind-flip alone would preserve the veneer-suppression signal
  observed in PR #578 (`n: 9 → 2`).

**Brain's verify-gate result: EUR `ninja sha1` FAILED.** Expected
ROM SHA1 `1da50df7c210fae96dc69b3825554b9ce13b4f75`; actual
`d83c6d20…fd3087`. Per the brief's own success criterion
("if a reclassification causes a SHA1 break, the candidate was
wrong; revert + lower confidence rating"), the reclassification
has been **reverted on this branch**. `0x021e2efc` is now classified
back as `data(any)` and lives in the MEDIUM cohort with the other
605 structurally-similar candidates.

### What the falsification tells us

The bytes at `0x021e2efc` pattern-match an ARM prologue, **but
that's not sufficient evidence the slot is real code**. Possible
explanations for the SHA1 failure consistent with the bytes
looking like a prologue:

1. **The bytes are data that incidentally encode an `stmfd` opcode.**
   `e92d4030` is a 4-byte little-endian word that happens to
   correspond to ARM `STMFD SP!, {R4, R5, LR}` when interpreted
   as an instruction. The same word value can appear in a
   struct, a function-pointer table entry, or any number of
   data contexts where the first 4 bytes coincidentally encode
   a common opcode pattern. The brief 145 PR #566 investigation
   established only that the bytes LOOK like a prologue; it
   never disassembled the rest of the region to confirm a
   coherent function follows.

2. **The slot is code but dsd's LCF emission treats `function(arm,
   unknown)` differently than `data(any)`.** `dsd lcf` may place
   `unknown`-size functions in a separate section, or omit them
   from the link entirely, or add a `WRITEW(0)` terminator
   downstream of the `.ctor` table that shifts subsequent
   sections by 4 bytes. Without a closer look at the diff between
   PR #581's failed build and main's working build, this can't
   be ruled out.

3. **The slot is code but mwldarm resolves the symbol kind in a
   way that affects nearby placement.** mwldarm's overlay-blind
   veneer-emission rule (W7) keys off symbol kind + memory-region
   membership; flipping kind from `data` to `function` might
   change which addresses mwldarm chooses to veneer-up or
   resolve locally, indirectly shifting downstream bytes.

Distinguishing (1) from (2)/(3) requires actual disassembly of
the `0x021e2efc..0x021e3128` region (extending to the next data
symbol) and comparing to mwldarm's emitted output post-
reclassification. That's a brain-host task (needs the baserom
and `dsd dis`); the structural metadata available to cloud can't
distinguish them.

### Generalisation to the MEDIUM cohort

The 605 other candidates with the same structural fingerprint
inherit the lesson: **first-4-byte pattern match against a
canonical ARM opcode is too weak a signal**. Byte-confirmation
of HIGH-promotion candidates must include at minimum:

- Disassembly of the whole slot in context (not just the first
  word).
- Verification that the disassembled stream is a coherent
  function (sensible reg-use, valid branches, plausible
  epilogue — not random instruction garbage that happens to
  parse).
- An independent reclassification verify-gate (SHA1 round-trip
  like this PR attempted) before the candidate ships.

The original brief 154 specification of HIGH-confidence — "multiple
ARM-prologue matches + correct alignment + size pattern" — held
on the alignment and size signals for `0x021e2efc` (it is
4-aligned with a 0x22c implicit size). The prologue-match signal
proved too weak on its own. Future surveys should treat the
"prologue match" criterion as **necessary but not sufficient**.

## Verify gate (brain runs pre-merge)

3-region SHA1 PASS on the **survey-only state** of this PR (after
the worked-example revert):

```text
python tools/configure.py eur && ninja sha1   # must PASS
python tools/configure.py usa && ninja sha1   # must PASS
python tools/configure.py jpn && ninja sha1   # must PASS
```

`config/eur/arm9/overlays/ov004/symbols.txt` is now back to its
main state (apart from cosmetic line edits — see `git diff` against
main for the empty-set delta on the symbols file). All three
regions should pass trivially since this PR is now docs-only plus
no-op config-state restoration.

## Bonus deliverable — veneer-count hypothesis (status: deferred)

PR #578 measured: claiming `0x021e2efc` as a `.rodata` data
symbol dropped ov004's veneer count from `n=9` to `n=2`. This PR's
original worked-example aimed to test whether reclassifying as
`func` preserved the same drop without breaking SHA1.

**With the worked-example reverted, this hypothesis stays
untested** — neither confirmed nor refuted by this PR's final
state. The 22.5 KB mega-block disassembly path remains the
alternative lever for `n<9` veneer suppression; brief 155+
(decomper) can revisit the kind-flip approach against MEDIUM
candidates that have been byte-confirmed via a different
methodology (e.g. full-region disassembly + manual code/data
boundary identification).

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

Expected output on the current main (post-revert):

```text
MEDIUM: 606  (includes the falsified-HIGH ex-candidate 0x021e2efc)
LOW (load-from-outside-only): 15
LOW (no-inbound): 1
```

(Total 622 = 606 + 15 + 1; matches the 4-aligned-data-in-.rodata
filter result.)

## After this brief lands

Updated for the survey-only state of PR #581:

1. Brain runs the 3-region SHA1 verify-gate on the docs-only +
   no-op-config-restoration PR. Expected: trivially all-PASS.
2. The 606 MEDIUM-confidence catalog stays open. Brain decides
   whether to spawn a follow-up brief that:
   - Disassembles a small handful of MEDIUM candidates (5-10
     spot checks) on a brain host to recalibrate the
     prologue-match heuristic's hit rate — i.e. of N
     byte-confirmed candidates, how many survive the
     reclassification verify-gate? If most fail (like
     `0x021e2efc` did), the MEDIUM cohort is mostly false
     positives and reclassification isn't a viable
     veneer-suppression lever.
   - Pivots to the 22.5 KB mega-`.rodata` disassembly path
     (brief 154's explicit non-scope), which is a more direct
     route to bounding real `.rodata` boundaries.
3. The `n<9` veneer-suppression bonus that PR #578 surfaced
   remains an open question. The brief 150 stderr-note path
   has been observed firing once (PR #578's revert investigation
   path 2) but never within a SHA1-preserving claim. Any
   follow-up should treat that as the gating success criterion.

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
