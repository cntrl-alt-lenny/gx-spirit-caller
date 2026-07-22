[//]: # (markdownlint-disable MD013 MD041)

# Brief 609 — struct/type bank prototype

**Asked:** `m2c --context` is wired (brief 555) but its type inputs are
starved — `ov002_core.h` had 16 real structs for two of its heaviest
per-player tables (`data_ov002_022d016c`, `data_ov002_022ce288`) were
still bare `char[]`, so drafts touching them fall back to raw
offset/cast arithmetic. Two deliverables: (1) promote the curated
comment field-maps already in `ov002_core.h` into real structs — zero
mining, just formalize what's known; (2) a miner prototype
(`tools/build_struct_bank.py`) that scans every delinked `.o` for one
symbol's access sites and infers a full field layout (offset, width,
signedness, bitfield shape) by aggregation + majority vote, flagging
disagreements for human review. WINE-FREE by design — this brief proves
readability and type-correctness, not byte-match; a later wine brief
proves the match.

**Short answer: both deliverables shipped, plus a third fix that
turned out to be load-bearing for either to matter.** The miner works
and is unit-tested (21 tests). The retype is live in `ov002_core.h`
(`Ov002D016c`, 55 fields / 2077 access sites; `Ov002Ce288`, 45 fields /
1945 access sites). But wiring the retyped structs into `ov002_core.h`
alone did **not** make `m2c --context` render named fields — a real,
previously-unknown gap in the brief-555 pipeline that this brief found
and fixed (§4). With that fix, the before/after is real and clean
(§5): `data_ov002_022d016c->unkD2C` becomes `data_ov002_022d016c.f_d2c`,
and m2c also drops the defensive `(s32)` casts and folds `x = x | 1`
into `x |= 1` once it trusts the field's real type.

## 1. Deliverable 1 — promoting the curated comment field-maps

The brief's premise (via `docs/research/rnd-swarm-r7-verified.md`,
r7-19) was "~64 curated comment field-maps already in core.h." Measured
directly: only `ov002_core.h` has this pattern (checked all 63
`*_core.h` files across all three regions) and it names exactly **10**
fields, not 64 — five on `data_ov002_022d016c` (`f3300`, `f3308`,
`f3340`, `f_d50`, `f_d64`) and five on `data_ov002_022ce288` (`f1484`,
`f1488`, `f1492`, `f1496`, `f1672`), all in one comment block
(`ov002_core.h:84-87` pre-brief). Scoped Deliverable 1 to what's
actually there — `ov002_core.h` — rather than force-fitting a broader
sweep the source data doesn't support.

That comment is now gone; every field it named is a real, typed struct
member in `Ov002D016c`/`Ov002Ce288` (§2), plus every other offset the
miner found. The two pre-existing `extern char […][]` declarations for
`data_ov002_022d016c`/`data_ov002_022ce288` are untouched — see §3 for
why.

## 2. Deliverable 2 — the miner (`tools/build_struct_bank.py`)

**Method.** For a target symbol, scan every delinked `.o` for
`R_ARM_ABS32` relocations naming it. Each hit sits on a pool word
preceded by `ldr rX, [pc, #N]` — that ties the symbol to a register.
Walk forward from there with register-liveness tracking (stop at the
first instruction that overwrites the register, including
condition-coded and register-list forms like `streq`/`popeq`/`pop`) and
record every `ldr`/`str`/`ldrh`/`ldrb`/`ldrsh`/`ldrsb` on that register,
classifying width and signedness from the mnemonic. A `lsl#K1;lsr#K2`
(or `mov`-form equivalent) pair immediately after a load is a bitfield
extraction — width `32-K2`, shift `K2-K1` (this includes the
**bit-0-aligned, symmetric** case `K1==K2`; see §3 of `codegen-walls.md`-
adjacent history and the correction in §3.1 below).

`aggregate()` then groups all accesses by offset and picks a type by
**majority vote**, not "any bitfield observed → emit a bitfield" — it
counts narrowed vs. unnarrowed loads at each offset, emits whichever is
the majority, and surfaces the minority count as a `disagreement`
string. This is what makes the two false-positive bitfields below (§6)
come out correctly as plain `int`.

**Results on the brief's two named symbols** (EUR, fresh from
`build/eur/delinks`):

| Symbol | Access sites | Distinct offsets | Disagreements |
|---|---:|---:|---:|
| `data_ov002_022d016c` → `Ov002D016c` | 2077 | 55 | 2 |
| `data_ov002_022ce288` → `Ov002Ce288` | 1945 | 45 | 1 |

The brief cited "158 sites" for `data_ov002_022d016c`; that figure does
not appear anywhere in `rnd-swarm-r7-verified.md` (grepped — no match)
and its origin is unclear. The miner's own count is a direct
measurement off the real delinked build (`grep -l` confirms 660
distinct objects reference the symbol at all), so the doc below uses
2077/1945 as authoritative rather than reconciling against an
unsourced figure — consistent with how this campaign has always
preferred a fresh measurement over an inherited count.

**Unit tests** (`tests/test_build_struct_bank.py`, 21 tests, all
passing): pool-load width/signedness incl. predicated stores,
bitfield detection (bit-0-aligned symmetric case, `mov`-form
rendering, offset/asymmetric case), register-liveness (base-register
overwrite, `pop`-reload, predicated `pop`, unrelated-symbol
non-interference), aggregate disagreement detection (width, signedness,
bitfield-shape, bitfield-vs-plain mix, majority-vote emission), and
struct-rendering (padding/field order, bitfield colon syntax). Fixtures
are hand-built `objdump -d -r --architecture=armv5te`-format text,
checked byte-for-byte against a real `.o`'s actual output during
development.

## 3. Why the structs are reached through a macro, not a redeclared extern

The natural first design was to retype the top-level externs directly
(`extern struct Ov002D016c data_ov002_022d016c;` in place of
`extern char data_ov002_022d016c[];`). That's unsafe here: 20 already-
matched `.c` files `#include "ov002_core.h"` and cast-offset into these
two symbols by hand (`*(int *)(data_ov002_022d016c + 0xN)`-style); a
retyped extern is a **different type for the same file-scope symbol**,
which is a hard C constraint violation the moment both declarations are
visible in one translation unit — confirmed empirically with
`cc -fsyntax-only` on exactly this pattern (it errors; this is not
scope-shadowing, which only applies to nested/local declarations). A
grep also confirmed the existing convention already avoids the
conflict: none of the ~5 pre-existing files using their own per-TU
`struct g016c`-style local struct also include `ov002_core.h`.

So `ov002_core.h` keeps both `extern char data_ov002_022d016c[];` /
`data_ov002_022ce288[];` exactly as they were, defines the two mined
structs alongside them, and exposes access through a cast-pointer
macro:

```c
#define D016C ((struct Ov002D016c *)data_ov002_022d016c)
#define CE288 ((struct Ov002Ce288 *)data_ov002_022ce288)
```

— semantically identical to what every existing offset-cast call site
already does by hand, just through one shared, comprehensively-mined
layout. Verified clean with `cc -fsyntax-only`: a bare include, the
`D016C->field`/`CE288->field` usage pattern in a fresh TU, and 3
spot-checked pre-existing consumers (`func_ov002_021d1be4.c`,
`func_ov002_02206100.c`, `func_ov002_02258384.c`) all still compile.

## 4. The wiring gap this brief found: macros are invisible to m2c

Deliverable 1's own acceptance test — "does `m2c --context` now render
named fields" — initially **failed** even with the structs correctly
retyped and macro'd into `ov002_core.h`. Before/after drafts through
`m2c_feed.py --m2c --context` were byte-identical, both showing
`data_ov002_022d016c->unkD2C`-style auto-generated names.

Root cause, confirmed by direct experiment: m2c's `--context` type
inference keys off a referenced symbol's **declared type**, not
anything reachable only through a `#define`. `#define D016C (...)` is
pure preprocessor text — real for a human-written, compiled `.c` file,
invisible to m2c's own context parser, which only ever sees
`data_ov002_022d016c` declared as `char[]`. With no usable type
attached to that symbol, m2c falls back to its own built-in heuristic:
when a global is used as a base register for several fixed-offset
accesses, it silently synthesizes an anonymous struct with auto
`unkOFFSET` field names — which is *why* the "before" draft already
looked semi-structured rather than raw pointer arithmetic, and why the
diff against a truly-untyped baseline looked like a no-op.

Manually rewriting just the **context file** (never compiled — a
separate, throwaway artifact m2ctx.py generates per `m2c --context`
call) to declare `extern struct Ov002D016c data_ov002_022d016c;`
instead of the array form immediately fixed it — m2c rendered
`data_ov002_022d016c.f_d2c` right away. Since the context file is never
compiled, the §3 redeclaration hazard doesn't apply to it — the fix
only needed to reach the one artifact where it's actually safe.

**Fix** (`tools/m2c_feed.py`, `build_context()` + `ov002_core.h`): a
`#ifdef M2C_CONTEXT_BUILD` branch, defined only while building the
`--context` file, that types the two externs as the struct value
instead of `char[]`:

```c
#ifdef M2C_CONTEXT_BUILD
extern struct Ov002D016c data_ov002_022d016c;
#else
extern char data_ov002_022d016c[];
#endif
```

`build_context()` now routes the header through a two-level include: a
wrapper (the file actually handed to `m2ctx.py`) that includes a real
on-disk shim defining `M2C_CONTEXT_BUILD` before including the real
header. The indirection is necessary, not decorative — m2ctx.py's own
include-extraction regex only recognizes `#include` lines in the file
it's directly handed (it exists to strip a scratch `.c`'s own body
before a decomp.me paste); a `#define` on its own line in that same
file is silently dropped before it ever reaches `gcc -E`. Putting the
`#define` in a separate file that's only *reached via* an `#include`
sidesteps that, since `gcc -E` expands nested includes normally
regardless of what m2ctx.py's regex saw.

This changes nothing for real compilation (`M2C_CONTEXT_BUILD` is never
defined outside `build_context()`) or for the other 15 structs already
in the various `*_core.h` files (the `#ifdef` branch is additive,
per-symbol, and only exists where added) — confirmed via the full
existing pytest suite (2708 passed / 9 skipped, no regressions) plus a
new targeted regression test, `test_struct_bank_context_yields_named_
field_not_unk_offset` (`tests/test_m2c_feed.py`), which pins the
`unkD2C`→`f_d2c` behavior directly so a future refactor of
`build_context()` can't silently regress it back to the macro-blind
state.

## 5. Before/after demo

Three real, currently-unmatched EUR functions, picked because they're
short and each touches 1-3 of the mined fields (found via `grep -l` on
the delinked `.o` corpus, cross-checked against `src/overlay002/*.c`
to confirm none has a matched `.c` yet — all three currently exist only
as hand-carved `.s`, i.e., real C-MATCH-campaign candidates, not
synthetic examples). Generated through the actual CLI
(`python tools/m2c_feed.py --version eur --obj <delink.o> --m2c
--context <func>`), swapping only `ov002_core.h` between the pristine
pre-brief version (BEFORE) and the current mined version (AFTER):

**`func_ov002_021cb174`** — before:

```c
void func_ov002_021cb174(void) {
    s32 var_r2;

    data_ov002_022d016c->unkD2C = 6;
    if (!(data_ov002_022ce950->unk2 & 1)) {
        var_r2 = 1;
    } else {
        var_r2 = 0;
    }
    data_ov002_022d016c->unkD30 = var_r2;
    data_ov002_022d016c->unkD0 = (s32) (data_ov002_022d016c->unkD0 | 1);
    data_ov002_022ce950->unk80C = 0;
}
```

after:

```c
void func_ov002_021cb174(void) {
    s32 var_r2;

    data_ov002_022d016c.f_d2c = 6;
    if (!(data_ov002_022ce950->unk2 & 1)) {
        var_r2 = 1;
    } else {
        var_r2 = 0;
    }
    data_ov002_022d016c.f_d30 = var_r2;
    data_ov002_022d016c.f_d0 |= 1;
    data_ov002_022ce950->unk80C = 0;
}
```

`data_ov002_022ce950` stays `unk2`/`unk80C` in both — it's a different
table this brief never mined, correctly left alone.

**`func_ov002_021c9af0`** — before:

```c
void func_ov002_021c9af0(s32 arg0, s32 arg1) {
    if (arg1 != 0) {
        data_ov002_022d016c->unkD0 = (s32) (data_ov002_022d016c->unkD0 | (1 << arg0));
        return;
    }
    data_ov002_022d016c->unkD0 = (s32) (data_ov002_022d016c->unkD0 & ~(1 << arg0));
}
```

after:

```c
void func_ov002_021c9af0(s32 arg0, s32 arg1) {
    if (arg1 != 0) {
        data_ov002_022d016c.f_d0 |= 1 << arg0;
        return;
    }
    data_ov002_022d016c.f_d0 &= ~(1 << arg0);
}
```

**`func_ov002_021b01f4`** — before:

```c
if (data_ov002_022d016c->unkE0 != 0) { return; }
...
data_ov002_022d016c->unkE0 = 1;
...
data_ov002_022d016c->unkD00 = var_r3;
```

after:

```c
if (data_ov002_022d016c.f_e0 != 0) { return; }
...
data_ov002_022d016c.f_e0 = 1;
...
data_ov002_022d016c.f_d00 = var_r3;
```

Beyond the rename, the AFTER drafts are shorter and cleaner: m2c drops
the defensive `(s32)` casts and expands `unkD0 = unkD0 | 1` /
`unkD0 = unkD0 & ~(...)` into `f_d0 |= 1` / `f_d0 &= ~(...)` once it
has a real type for the field instead of an inferred generic word. This
is the collapsed-guess-and-fail-iteration win the brief asked about —
not "no names to named," which m2c partially does on its own (§4), but
"guessed anonymous word to known-typed field."

## 6. Miner accuracy — the three disagreement sites

Per the brief's honesty requirement, every offset where the miner's
per-site evidence wasn't unanimous is flagged, not silently resolved.
All three, cross-checked against real shipped `.c` source (not just
the miner's own aggregate):

- **`Ov002D016c` +0xce8** — 4/5 sites unnarrowed, 1/5 narrows to a
  16-bit read. Emitted `int` (majority).
- **`Ov002D016c` +0xd44** — 141/142 sites unnarrowed, 1/142 narrows.
  Emitted `int` (majority). Directly checked against
  `func_ov002_021d1be4.c`'s actual shipped disassembly at this offset:
  `ldr r1, [r1, #3396]` with no follow-on shift — confirms the
  majority reading, not the minority, is what's actually shipped.
- **`Ov002Ce288` +0x69c** — 23/24 sites unnarrowed, 1/24 narrows.
  Emitted `int` (majority).

In development, an earlier (buggy) version of the aggregator emitted a
confident `unsigned int f_d44 : 16` here — 305-site "confidence" that
was actually 1 real bitfield read outvoted by 141 plain-word reads the
aggregator wasn't checking against. Cross-referencing the shipped
reference caught it; §7 below is the general fix, not a one-off patch.

Each minority site is worth a second look (a union member the
majority-typed field doesn't capture, or a miscompiled/misattributed
access) — the full site list for each disagreement is in the aggregator
output (`FieldInference.sites`), not reproduced here in full.

## 7. Bugs found and fixed while building the miner

Six, each caught by either a unit test failing against the project's
own documented ground truth or a direct cross-check against real
shipped source — not by trusting the tool's own output:

1. **ARM condition-code blindness** — `streq`/`popeq`-style suffixed
   mnemonics weren't recognized by the width/signedness lookup or the
   register-clobber detector, silently dropping real accesses.
2. **Backwards bitfield-symmetry logic** — the original detector
   rejected `lsl#K;lsr#K` (symmetric) shift pairs as "not a bitfield."
   This directly contradicts the project's own documented ground truth:
   `ov002_core.h`'s `Ov002Slot.id : 13` is exactly `lsl#19;lsr#19`,
   symmetric by construction (any bit-0-aligned field's extraction is).
   The confusion traced to brief 596/604's P-1 finding, which is about
   mwcc *collapsing* a symmetric shift pair written as C source into a
   single `and` — the opposite signal from a symmetric pair *surviving*
   in real disassembly, which only a genuine bitfield member access
   produces.
3. **Invalid bitfield declaration syntax** — `unsigned int : 13 f_0;`
   (name after the width) instead of `unsigned int f_0 : 13;`. Fixed by
   separating a type-only `c_type()` from a full `declaration(name)`.
4. **No bitfield-vs-plain-load disagreement check** — the aggregator
   compared bitfield *shapes* against each other but never checked
   whether a "confident" bitfield offset was actually mostly plain
   words (see §6's `f_d44` case).
5. **Majority-vote selection was missing even after (4) added
   detection** — the struct-emission step still defaulted to whatever
   single bitfield shape existed, regardless of whether it was 1-of-142
   or 141-of-142. Fixed with explicit majority-vote gating.
6. **Self-inflicted output truncation** — a `head -40` in one of my own
   ad hoc shell commands truncated a captured struct before its closing
   brace; caught via a line-count check on the capture file, not a tool
   bug.

## 8. Limitations

- m2c's own known limits still apply: pool literals it can't resolve
  render as `?`/`void*` regardless of context (visible in
  `func_ov002_021b01f4`'s `data_ov002_022cd73c` — a symbol this brief
  didn't mine). Named fields are a comprehension win, not a match
  guarantee.
- WINE-FREE by the brief's own design — nothing here has been compiled
  under mwcc or checked against `ninja sha1`. The bitfield/width
  inferences are evidence-based (majority vote over real disassembly),
  not proven; that's the next brief's job.
- Scope is the two symbols the brief named. `data_ov002_022ce950` and
  `data_ov002_022cd73c` (visible un-mined in §5's demo) are two more
  `char[]`-declared per-player tables of the same shape in the same
  header — natural next targets for the same miner.

## 9. Tests

```
$ python3.13 -m pytest tests/ -q
.................................................................... [ 66%]
................................................................... [ 68%]
........................................................................ [ 71%]
........................................................................ [ 73%]
........................................................................ [ 76%]
........................................................................ [ 79%]
........................................................................ [ 81%]
........................................................................ [ 84%]
........................................................................ [ 87%]
........................................................................ [ 89%]
........................................................................ [ 92%]
........................................................................ [ 95%]
........................................................................ [ 97%]
..............................................................           [100%]
2708 passed, 9 skipped, 9 subtests passed in 16.21s
```

New this brief: `tests/test_build_struct_bank.py` (21 tests, the miner)
and one addition to `tests/test_m2c_feed.py` (the `M2C_CONTEXT_BUILD`
regression, §4). `docs/tools-index.md` regenerated
(`python tools/generate_tool_index.py`) to include the new tool
(100 → 101 tools).
