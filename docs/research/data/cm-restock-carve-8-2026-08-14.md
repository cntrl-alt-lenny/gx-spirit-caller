[//]: # (markdownlint-disable MD013)

# cm-restock-carve-8 — ov006's last 6 candidates ship; an honest re-census of what's actually left (2026-08-14)

Eighth wave of the restock-census carve series. Part 1 continues
draining the frozen 2026-08-03 census's remaining pool. Part 2 answers
the question this lane has deferred for seven waves: how much is
*actually* left, once "left" is defined honestly rather than by
whatever the original one-time discovery method happened to surface.

## Part 1 — `ov006`'s last 6 candidates

### Scoping: reconciling the frozen census against live `delinks.txt`

Re-derived the 274-symbol 2026-08-03 census's current disposition by
parsing all four of its shape tables directly (186 struct + 57 array +
29 fnptr_table + 2 jump_table = 274, confirmed) and cross-referencing
every row's address against `config/eur/arm9/**/delinks.txt` for a
`complete` entry containing it — the same method `cm-restock-carve-7`
used, re-run fresh rather than trusted from that PR's own stated
totals (which don't arithmetically reconcile against 274 — see Part 2
below for why this wave doesn't carry those numbers forward).

Result, directly verified: **226 shipped, 10 formally declined
(the P-50 misaligned-struct-arc's 9 + `data_02101e7c`), 38 remaining.**
`226 + 10 + 38 = 274`, exact.

Of those 38, module-by-module: `ov011` 4 (736 B), `main` 3 (408 B),
`ov006` 6 (352 B), `ov012` 4 (112 B), `ov009` 4 (104 B), `ov016` 4
(64 B), `ov019` 2 (36 B), and 8 more modules at 1 symbol each
(20–32 B). `ov006` is the largest group not already accounted for by
a documented blocker (see below) — this wave's Part 1 target.

**A correction before picking a target: `ov011`'s 4 and 2 of `main`'s
3 "remaining" symbols are not actually open.** They were investigated
and found wall-blocked in `cm-restock-carve-5`/`6`/`7`, but that
disposition was never back-filled into the formal declined table
(it lived only in those waves' own narrative docs), so a
mechanical "shipped ∪ declined-table" reconciliation still counts
them as "remaining":

- `data_ov011_021d323c` (126 B), `data_ov011_021d32d9` (113 B),
  `data_ov011_021d334a` (42 B), `data_ov011_021d33bc` (455 B) — all
  four are part of the P-50 / n>2-reordering family investigated in
  `cm-restock-carve-6` (the `021d33bc`+`021d3583`+`_358b` bundle,
  declined irreducible; the `021d32d8`+`_32d9`+`_334a` cell,
  non-monotonic, same wall). **Reclassified: wall-blocked, not open.**
- `data_021023d8` (192 B), `data_02102c44` (28 B) — the `.bss`-routing
  wall `cm-restock-carve-7` hit and reverted (all-zero non-`const`
  globals silently reroute to `.bss`, no file bytes; the proven fix
  needs rewriting an already-shipped neighbor TU, out of scope).
  **Reclassified: wall-blocked, not open.**
- `data_020c3e88` (188 B) — deferred pending a caller-range dig
  (`cm-restock-carve-7`), not blocked by any named wall, not simply
  open either. **Reclassified: neither bucket** (see Part 2).

This is exactly the failure mode Part 2 is about: a frozen census plus
an incomplete "declined" ledger silently re-presents already-settled
work as an open candidate. See Part 2 for the full accounting.

With those 7 reclassified, `ov006`'s 6 (352 B) is the true largest
still-open group — this wave's Part 1 target.

### Header cross-reference

All 6 are independently 4-aligned (both `delinks.txt` gap bounds
divisible by 4) — no TU composition, no P-50 exposure. Every gap
verified directly (`insert_delinks_ov.py`'s own gap-finder, not
eyeballed) before writing any file. Each candidate's sole reader
resolved via `relocs.txt` → `analyze_symbols.enclosing_function`:

| Symbol | Reader | Reader status |
|---|---|---|
| `data_ov006_021cb60c` | `func_ov006_021c12fc.c` | matched |
| `data_ov006_021cc0a0` | `func_ov006_021c0dc8.s` | unmatched |
| `data_ov006_021cc0b4` | `func_ov006_021c0dc8.s` | unmatched (same reader as `021cc0a0`) |
| `data_ov006_021cc13c` | `func_ov006_021bcedc.s` | unmatched |
| `data_ov006_021cc20c` | `func_ov006_021c0c14.s` | unmatched |
| `data_ov006_021cc4fc` | `func_ov006_021bcb94.s` | unmatched |

Every candidate's own byte span was checked against `relocs.txt` for
*internal* relocations (pointers stored inside the symbol's own
bytes) before typing anything — the check that mattered most this
wave (see below).

### The one real correction this wave's method caught

`data_ov006_021cb60c`'s only reader is matched C
(`func_ov006_021c12fc.c`) and already declares
`extern int data_ov006_021cb60c[];`, used as
`OS_SPrintf(buf, data_ov006_021cdd78, data_ov006_021cb60c[arg1])`. The
obvious reading is "plain `int` array, printf'd as a number." The
required internal-relocation check (this project's standing rule,
`cm-restock-carve-7`'s own "check every candidate's byte range before
typing" precedent) found otherwise: **all 10 words are real pointers**
— `relocs.txt` records 10 outgoing `kind:load` relocations sourced
from inside this symbol's own 40-byte span, each landing on a distinct
still-uncarved `data_ov006_021cbf*` placeholder. The existing reader's
`int` declaration isn't wrong in a way that breaks the build (same
4-byte width, same calling-convention slot an `OS_SPrintf %s` pointer
argument would occupy), but the *real* type is `void *const[10]`, not
`int[10]`. Shipped with the correct type; the older reader's extern
declaration wasn't touched (out of scope, doesn't affect byte
content). Matches the `data_ov000_021b569c.c`-family convention for a
`.rodata` pointer table into an uncarved neighbor (raw address-literal
casts, not `extern+&`, to avoid forcing the `const` global into
`.data`).

### The other 5

- `data_ov006_021cc0a0` / `data_ov006_021cc0b4` (20 B each):
  `{short x; short y;}[5]` screen-position tables, siblings of the
  already-shipped `data_ov006_021cc08c`/`_021cc0c8` 4-way dispatch
  family (`func_ov006_021c0dc8.s`, cases `self->f40 == 2` and `== 3`
  respectively — the other two members' own header comments already
  named these two as the missing siblings). Zero internal
  relocations — confirmed pure value data, not a second pointer table.
- `data_ov006_021cc13c` (40 B): plain `int[10]`, clean 4-byte-stride
  indexed load (`ldr r8,[r5,r3,lsl#0x2]`). Zero internal relocations.
- `data_ov006_021cc20c` (92 B): `short[46]`. The reader confirms
  2-byte (`ldrsh`) element access via a double-indexed formula (an
  0x12-byte outer stride against a sibling struct field, times a
  2-byte inner index) whose outer bound isn't statically knowable from
  this one call site — shipped as a flat array (element size
  evidenced, internal grouping not invented). All-zero except six
  scattered `1`s, consistent with a flag/state table.
- `data_ov006_021cc4fc` (140 B): `{short f0,f2,f4,f6; int f8,fc,f10;}[7]`
  — a 20-byte-stride record array. The period (7 × 20 = 140, exact)
  came from the real bytes' own repetition, not from the reader, which
  only ever touches record `[0]` (a fixed base pointer, never
  re-indexed across the function's 7-case dispatch). Records 1–6 are
  real, byte-exact, individually unconfirmed by any direct relocation
  — same standing as `data_ov011_021d3376`'s unconfirmed tail elements
  (`cm-restock-carve-6`).

### Result: 6 symbols shipped, 352 bytes

| # | Symbol | Addr | Sec | Size (B) | Type | `delinks.txt` span |
|---|---|---|---|---:|---|---|
| 1 | `data_ov006_021cb60c` | `0x021cb60c` | rodata | 40 | `void *const[10]` | `0x021cb60c`–`0x021cb634` |
| 2 | `data_ov006_021cc0a0` | `0x021cc0a0` | data | 20 | `{short,short}[5]` | `0x021cc0a0`–`0x021cc0b4` |
| 3 | `data_ov006_021cc0b4` | `0x021cc0b4` | data | 20 | `{short,short}[5]` | `0x021cc0b4`–`0x021cc0c8` |
| 4 | `data_ov006_021cc13c` | `0x021cc13c` | data | 40 | `int[10]` | `0x021cc13c`–`0x021cc164` |
| 5 | `data_ov006_021cc20c` | `0x021cc20c` | data | 92 | `short[46]` | `0x021cc20c`–`0x021cc268` |
| 6 | `data_ov006_021cc4fc` | `0x021cc4fc` | data | 140 | `{short×4,int×3}[7]` | `0x021cc4fc`–`0x021cc588` |

All six spans checked directly against the current `delinks.txt`
(not carried over from the census).

## Part 2 — how much is actually left?

`cm-data-restock-check-2026-08-03.md` found the pool "never emptied —
it was invisible to the old discovery methods." Seven waves later,
this lane has its own discovery method (`data_worklist.py --shape
struct,array,fnptr_table,jump_table`, ≥1 reader, the frozen 274-symbol
census). Is *that* method now exhausted, or still finding real ground?

### Re-running the original method fresh

`python tools/data_worklist.py --shape
struct,array,fnptr_table,jump_table --top 0 --no-outputs` (the exact
command the 2026-08-03 census doc cites), run today against the live
tree: **4 unmatched candidates, 432 bytes, all in `main`** —
`data_021023d8` (192 B), `data_020c3e88` (188 B), `data_02102c44`
(28 B), `data_02101e7c` (24 B). Every one of these 4 is already a
documented blocker from `cm-restock-carve-7` or earlier (2 `.bss`-wall
reverts, 1 deferred caller-range dig, 1 four-times-declined exception).

**Zero new candidates.** The original discovery method, run exactly as
specified, surfaces nothing this campaign hasn't already looked at.

This undercounts the true "reachable, not-yet-attempted" pool, though
— `data_worklist.py`'s automatic effective-size deduction silently
degrades to `SHAPE_UNKNOWN` (dropping out of any shape filter) for
symbols whose neighboring cluster has been partially renamed across
many waves. Confirmed directly: the `ov006` `kv_t` group
(`data_ov006_021ce38a` family, declined in `cm-restock-carve-4`) has 2
real relocation readers and is genuinely unmatched, yet the tool's own
size deduction returns 0 for it, so it vanishes from every shape
filter. **The frozen census's own hand-verified sizes remain more
reliable than a fresh tool run for symbols the campaign has already
touched.** This is why Part 1's reconciliation above parses the
census's own tables rather than re-running the tool for the
"still-open" count.

### The honest four-bucket breakdown

Reconciling the frozen 274-symbol census (Part 1's method) plus a
project-wide sweep beyond it (`data_worklist.py`, all shapes,
`--min-readers 0`, `ov002` excluded as a separate active lane per the
census's own convention):

| Bucket | Symbols | Bytes | Basis |
|---|---:|---:|---|
| **Shipped** (this campaign, 8 waves) | 232 | 22,771 | 226 pre-wave-8 + `ov006`'s 6 this wave |
| **Blocked by a documented wall** | 16 | 1,246 | 10 formal (P-50 + `ov004` family) + 4 `ov011` (P-50/n>2, wave 5/6, not yet in the formal table) + 2 `main` (`.bss`-routing wall) |
| **Neither** (open-ended, not wall, not simple X-ref) | 1 | 188 | `data_020c3e88`, needs a caller-range dig outside this method's shape |
| **Reachable by current method, simply untried** (within the frozen 274) | 25 | 548 | 14 modules, 1–4 symbols each; not individually re-verified this wave beyond the frozen census's own recorded sizes |
| **Reachable by the same reader-based method, wrong-shape-filtered out of the original census** | 1,076 | 11,592 | ≥1 direct reader, real, mostly `shape=string` (605 syms/11,252 B) that the original 4-shape filter excluded outright |
| **Never assessed by any method — needs new tooling** | ~9,690 | ~227,820 | 0-reader `.data` symbols, `ov002` excluded; genuinely real and structured (see below), invisible to any reader-based method |

`232 + 16 + 1 + 25 = 274` (the frozen census, exact). The last two rows
sit entirely outside that 274 — symbols the original discovery method's
shape and reader filters never surfaced as candidates at all.

**So: is the pool empty?** For the specific method this lane has run
for 8 waves — 4-shape, ≥1-reader, header-cross-reference-and-type — 
essentially yes. What's left reachable by that exact method is 25
symbols / 548 bytes: smaller than half of what a *single* module
(`ov006`) contributed this wave alone. Widening only the shape filter
(same reader evidence standard, just including `string`/`string-ascii4`
shapes the original census excluded) adds 1,076 symbols / 11,592 bytes
— real, still worth a future wave, but not a new discovery, just an
uncovered corner of the same method.

**The pool that "never emptied" claim is still true — but not in this
method's territory.** The ~9,690-entry, ~227,820-byte 0-reader pool is
~10× everything this whole 8-wave campaign has shipped combined. Sampled
directly (not assumed from the count): the largest byte contributor
(`shape=string`, 4,506 entries / 95,593 B in `.data`) is not noise —
real, readable filenames and archive paths
(`/monplane/m4062_anm.narc.LZ.`, `e0006_06_mdlanm.bin.`,
`stg_13c_sora_d_mdl.bin.`), overwhelmingly clustered into 159
contiguous runs (the largest alone: 1,588 strings / 35,424 B in one
unbroken `main` span, `0x020e65b0`–`0x020ef010`). This is almost
certainly one (or a few) real resource/archive-manifest table(s) that
`dsd`'s per-symbol boundary deduction split into one placeholder per
string, because nothing in the compiled code holds a *direct* pointer
to any individual string — the real access pattern is evidently
computed/indexed (a filesystem or archive lookup, not a static
literal-pool reference), which is exactly the signal this lane's
entire method depends on and exactly what it cannot see. The
`array`/`struct`-shaped remainder (859 + 1,038 entries, ~128,523 B)
shows the same signature under direct byte sampling: patterned,
non-random content with internal 4-byte values that resolve to valid
ARM9 addresses at a visibly non-trivial rate — real data, same
blind spot.

**Verdict: the current method is exhausted (548 B of honest headroom
left); the campaign is not.** Reaching the ~227,820-byte pool needs a
different discovery method — tracing computed/indexed access patterns
or reconstructing an archive-manifest structure — not another wave of
this lane's header-cross-reference recipe. That's a new research
thread, not a next restock-carve wave; scoping it is out of this
wave's bounds, but the finding itself (the 159-run breakdown, the
sampled string content, the byte counts) is preserved here for
whichever wave picks it up.

### Gate (verbatim)

```
[eur] SHA1 PASS
[usa] SHA1 PASS
[jpn] SHA1 PASS
```

### Typed-array / Named-struct, before → after

Measured via `tools/progress.py`'s `summarize_data_readability`,
BEFORE isolated via `git stash`, cross-checked against direct
`_has_file_scope_array_decl` / `_tu_has_named_struct_decl` calls on
each of the 6 new files (not inferred from the aggregate delta alone):

| Metric | Before | After | Delta |
|---|---:|---:|---:|
| `typed_array_bytes` | 182,200 | 182,512 | **+312** |
| `named_struct_bytes` | 73,696 | 73,876 | **+180** |

Reconciled exactly: `data_ov006_021cc0a0`/`_021cc0b4` (20 B each) and
`data_ov006_021cc4fc` (140 B) each contain both a file-scope array decl
*and* a named-struct typedef in the same declaration, so all three
credit **both** metrics (20+20+140=180, matching the `named_struct`
delta exactly). `data_ov006_021cc13c`/`_021cc20c` (40+92=132 B) are
plain arrays with no named struct, crediting `typed_array` only.
`data_ov006_021cb60c` (40 B, `void *const[10]`) credits **neither** —
the same `*const`/`*` classifier tokenization gap `cm-restock-carve-6`
first found in `ov000`, confirmed again by direct classifier call
rather than assumed. `312 + 180 = 492` looks larger than the 352 bytes
shipped only because the two metrics overlap (are not mutually
exclusive buckets) for 3 of the 6 files; every byte is accounted for
exactly once against the real shipped total.
