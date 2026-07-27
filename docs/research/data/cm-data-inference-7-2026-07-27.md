# cm-data-inference-7 — data wave 7

2026-07-27. Continues the opaque-blob data-retyping campaign with the
same method: parallel read-only `Explore` agents, exhaustive symbol-grep
+ `relocs.txt` address cross-check, classify fixed-offset (WEAK) vs
computed-stride (STRONG), never force a type onto insufficient
evidence, implement centrally afterward.

This wave had two parts: (1) resolve the 2 multi-symbol-boundary
CONTRADICTION clusters wave 6 found but didn't have time to fully
reconstruct, and (2) a fresh census batch for additional runway.

## Part 1: the two carried-over CONTRADICTION clusters

### `data_ov011_021d3178` → a 144-byte, 9-record pointer table

Wave 6 found this symbol's own base address had a relocation on it —
proof the declared 96-byte blob was actually the tail of something
larger. Full reconstruction from `relocs.txt` ground truth: 36
consecutive relocated words from `0x021d30f8` to `0x021d3184`
(inclusive), 9 records of 4 pointers (16-byte stride) each. Address
range before and after this run is confirmed non-pointer, giving exact
boundaries.

Implementation required touching 4 symbols:
- `data_ov011_021d30f8` (NEW, 64B, records 0-3) — previously a pure
  unclaimed `delinks.txt` gap.
- `data_ov011_021d3138` (NEW, 64B, records 4-7) — also previously
  unclaimed; absorbs a 1-byte "ghost" symbol (`data_ov011_021d3177`)
  dsd had spuriously created from a compile-time-folded byte reference
  inside a walled `.s` consumer (`func_ov011_021cabbc.s`), which was
  updated to reference `data_ov011_021d3138+0x3f` (symbol+offset,
  already-proven-safe on this toolchain) instead of the removed ghost
  name.
- `data_ov011_021d3178` (BOUNDARY FIX, 96B → 16B, record 8 only) —
  address and content unchanged, declared size shrunk to its real
  extent.
- `data_ov011_021d3188` (NEW, 80B, the genuinely-separate opaque tail
  that used to be wrongly attached to `021d3178`) — required a new
  `symbols.txt` entry, since this exact address boundary had never
  been identified by dsd's own analysis before (unlike the other three,
  which already existed as symbols without dedicated files).

### `data_ov012_021cc06c`/`078`/`07c`/`080` → one 56-byte object

Two independent wave-6 investigations (one per endpoint symbol) had
each found the same thing: `func_ov012_021ca18c.s` reads 6 bytes at
`data_ov012_021cc06c + 0x24..0x29`, an address range the symbol table
assigned to `data_ov012_021cc080`'s own offset `0x10..0x15`. A
from-scratch reconstruction (double-calibrated raw extraction from
`extract/eur/arm9_overlays/ov012.bin`, cross-checked against both
known symbols independently) confirmed the real aggregate is exactly
56 bytes, `[0x021cc06c, 0x021cc0a4)`.

Unlike the ov011 cluster, each of the 4 legacy symbols' own existing
byte range turned out to align exactly with natural field boundaries
in the reconstructed object (`021cc078`'s 4 bytes = exactly one `u16`
pair, `021cc07c`'s 4 bytes = exactly one function pointer, `021cc080`'s
36 bytes = exactly the remaining tail) — so this shipped as 4
independently-typed files at their original addresses, no merging, no
consumer edits:
- `data_ov012_021cc06c` (12B, retyped: 2 evidenced bytes + 10 opaque)
- `data_ov012_021cc078` (NEW, 4B, `unsigned short[2]`)
- `data_ov012_021cc07c` (NEW, 4B, a function pointer — doubly proven by
  `relocs.txt` and by the raw bytes decoding to the exact literal
  address of `func_ov012_021caf80`)
- `data_ov012_021cc080` (36B, retyped: 4 evidenced bytes + a 6-byte
  lookup table proven by a genuine copy-then-index consumer, rest
  opaque)

## Part 2: fresh census, 15 investigations dispatched

**14 shipped, 1 declined as a new CONTRADICTION.**

| Symbol | Shape | Evidence |
|---|---|---|
| `data_ov002_022ca544` | `unsigned short[44]` | bounds-checked computed-stride (`caseId` guarded to exactly 44 values) |
| `data_ov017_021b7ef8` | `unsigned int[17]` | loop-bound-proven bulk copy + computed-stride readback + literal cross-check |
| `data_ov017_021b7e8c` | `unsigned int[17]` | same evidence class, different consumer; byte-identical to the above (2 real, separate tables) |
| `data_ov006_021cb848` | `int[20]` | loop-bound-proven bulk copy + magic-number-division index bound |
| `data_ov008_021b23e0` | `int[20]` | same evidence class, different overlay; byte-identical to the above (shared animation/ramp table) |
| `data_ov022_021ab8a8` | `unsigned short[30]` | 4 computed-stride reads across 2 consumers, runtime-variable index each time |
| `data_ov006_021ce5c4` | `{short key,val}[35]` | computed-stride, hardcoded per-case loop bound (35) |
| `data_ov006_021ce56c` | `{short key,val}[22]` | same consumer pair as above, distinct hardcoded bound (22) |
| `data_ov002_022cacc0` | 3-field bitfield struct `{id:13,idHigh:13,field3:6}[29]` | 2 already-matched C consumers (`id`) + 4 shipped byte-verbatim `.s` consumers (`idHigh`, `field3`) |
| `data_ov002_022ca790` | `{void *ptr; unsigned int value;}[11]` | byte size × relocs.txt (11 relocations, 8B apart) × consumer loop bound, triple-corroborated |
| `data_ov006_021cbac0` | fn-ptr array `[18]`, NULL-terminated | 2 already-matched C consumers + relocs.txt (17 consecutive relocated words + NULL) |
| `data_ov000_021b56b4` | `{short f0,f1,f2,f3}[3][5]` | 6 consumers share `row*0x28+local*8` addressing; one has an explicit `mode+2` loop bound independently verified against all 15 records by hand |
| `data_ov013_021cb750` | mixed struct, 14/25 words proven pointers (2 by code+relocs, 12 by relocs alone) | STRONG-partial, matching the established evidence tier already accepted for shipped sibling `data_ov012_021cc1e8` |
| `data_ov005_021b15b4` | **no type change** — real semantics recovered (Shift-JIS codepoint-range bounds, index-aligned 1:1 with an already-shipped sibling table) but the correct C representation stays the existing flat `unsigned char[100]`, since the consumer reads it via 4 separate byte loads, not native 16-bit loads | documented for the record, not re-investigated by a future wave |
| `data_ov002_022ca3dc` | **CONTRADICTION, declined** — 17 clean `{s32 attr; void *ptr;}` records (136 bytes) plus one orphan trailing word (offset 0x88) that belongs to a separate, still-undelinked next symbol | filed as a carried-over lead |

## A new, generalizable toolchain finding: `const` placement controls section selection

Two real implementation bugs were caught only by rebuilding and
independently inspecting the compiled objects — not by trusting a
plausible-looking derivation.

**1. mwcc places any global containing an `&symbol` relocation into
`.data`, never `.rodata`, regardless of the `const` qualifier.**
Confirmed against this project's own D-1 recipe worked example
(`src/main/data_0210210c.c`, itself declared `.data` in `delinks.txt`
for exactly this reason). The first implementation attempt for the
`data_ov011_021d30f8`/`021d3138`/`021d3178` pointer table used
`extern char TARGET; ... &TARGET` (this project's usual not-yet-carved-
target idiom) and built with those bytes silently absent from
`.rodata`, corrupting the whole module (confirmed via `dsd delink`'s
own consistency error once a related boundary issue was fixed, and via
`dsd check modules`/`dsd rom extract` byte comparison once it wasn't).
**Fix:** raw `(void *)0x...` address-literal casts instead of `&symbol`
references — no relocation, no `.data` placement — matching the
precedent wave 6 had *already* set for exactly this situation
(`data_ov012_021cc180`) but which this wave initially didn't recognize
as generalizable.

**2. Within a pointer type, whether `const` binds to the pointer or the
pointee changes the section placement outcome, independent of the
first finding.** `const void *arr[N]` (pointer-to-const, pointer itself
mutable) and `void *const arr[N]` (const pointer, pointee mutable) are
different C types, and only the latter reliably produces `.rodata`
output on this compiler — even after switching to literal casts (the
first fix alone), the pointer-table files still linked with a `.data`-not-written
warning until the `const` was moved to the correct side of the `*`.
Caught via `mwldarm`'s own link-time warning
(`.data(.data) in file X.o is referenced but has not been written`),
not by guessing. Independently corroborated by an unrelated finding in
this same wave's census batch: the investigating agent for
`data_ov006_021ce56c` surfaced a pre-existing project dossier that had
already hit and documented this exact footgun from the *opposite*
direction (warning against accidentally adding `const`/`static` to a
`.data`-sited array, which would incorrectly relocate it into
`.rodata` and break the link).

**Generalized rule for future waves:** before typing any data symbol
whose value is (or contains) a pointer, check the symbol's *ground-truth*
section in `delinks.txt` first. For a `.rodata`-sited pointer or
pointer-containing struct: use `TargetType *const arr[N]` (or a `const`
struct/array whose pointer *members* inherit that const-ness from the
outer qualifier) and raw address-literal casts for any not-yet-carved
target, never `&symbol`. For a `.data`-sited one: leave it deliberately
non-`const`/non-`static`, exactly matching the original declaration.
Verify with an incremental build's link-stage output (watch for the
`.data`/`.rodata`-mismatch warning) before trusting a full rebuild's
SHA1 result alone — the warning is much faster to spot than a
whole-ROM byte diff.

## Gate

Full `python tools/gate3.py --scope all` — 3-region `ninja sha1`
individually confirmed PASS for `[eur]`/`[usa]`/`[jpn]`, full pytest
suite green. EUR additionally re-verified via a full `ninja -t clean`
rebuild after the section-placement fix, before the census batch was
implemented on top.

## Hit rate

14 of 15 fresh census investigations shipped (93%) — well above this
campaign's established 55-69% range, likely reflecting that this
batch's candidates were smaller/simpler on average (52-140 bytes) than
prior waves' mix. Both carried-over CONTRADICTION clusters from wave 6
were fully resolved (9 symbols total: 4 new/fixed in ov011, 4 new/fixed
in ov012, matching the earlier count including the merge). One new
CONTRADICTION found and correctly declined rather than forced.
