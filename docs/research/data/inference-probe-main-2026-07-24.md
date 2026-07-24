[//]: # (markdownlint-disable MD013 MD041)

# cm-data-inference-probe — can opaque main blobs be retyped WITHOUT an oracle?

`cm-data-canary` (PR #1328) proved mwcc's struct-array codegen is
byte-identical, but relied on the two BSC `.inc` oracles (CharParam,
PresentCard) — the only clean oracles that exist. This item measures
whether the remaining ~66 opaque `const unsigned char data_X[N]` main
blobs can instead be retyped by **structural inference**: reading how
existing consumer code (matched C, preferably; unmatched `.s`,
failing that) indexes the blob, and using the access pattern itself
(a `base + idx*STRIDE [+ fieldOffset]` computation) as the struct
evidence in place of an external oracle.

Took the 6 largest main blobs (by byte size) and, for each, exhaustively
searched `src/` (both `.c` and `.s`, cross-checked against
`config/eur/arm9/**/relocs.txt` ground truth) for every consumer, then
judged whether the access pattern reveals real record structure.

## Result: 2/6 retyped and byte-gated, 1/6 has even stronger evidence but was deliberately not forced, 3/6 genuinely opaque

| Blob | Size | Consumer evidence | Verdict |
|---|---:|---|---|
| `data_020b52d8` | 1732 B | **4 independently matched + disassembly-verified C functions**, confirming a 12-byte-stride, 145-record array at offsets 0/4/6/8 | Evidence: strongest of all 6. **Not retyped** — structural complication (see below) |
| `data_020bef80` | 768 B | 45+ access sites across 29 unmatched `.s` files, 5 modules, exceptionless `4·n`/`4·n+2` stride, numeric sin/cos corroboration | **Retyped, byte-gated** |
| `data_020b4d60` | 1392 B | 1 unmatched `.s` consumer, genuine `idx*16` computed stride, corroborated by exact 87-record division + a `field7 == -recordIndex` regularity | **Retyped, byte-gated** |
| `data_020bf280` | 3328 B | 1 unmatched `.s` consumer, 2 fixed offsets only (no stride); plus an unresolved possible-pointer anomaly deep in the blob | Opaque — no stride evidence, and the pointer anomaly argues against forcing uniform typing |
| `data_020bff80` | 5904 B | 1 unmatched `.s` consumer (same function as `data_020c1f80`, below), 2 fixed offsets only | Opaque — no stride evidence |
| `data_020c1f80` | 4096 B | Same single consumer as `data_020bff80`; touches only 4 of 4096 bytes | Opaque — no stride evidence |

**Bottom line for the 501KB chapter**: structural inference is real and
works — half of the 6 largest blobs had genuine multiply-by-stride
evidence, and the strongest case (`data_020b52d8`) came from *matched,
disassembly-verified* C, arguably higher-confidence than an `.inc`
oracle. But it is not free: evidentiary strength varies enormously per
blob (single-consumer fixed-offset reads tell you almost nothing;
dozens of consistent computed-stride sites across many files are
strong; matched-and-disassembled consumers are strongest), and even a
well-evidenced blob can require nontrivial restructuring to execute
safely (see `data_020b52d8` below). Future sweeps of the remaining ~66
should budget per-blob investigation time accordingly, not assume a
uniform hit rate.

## The two shipped retypes

Both are exact reinterpretations of already-shipped byte content —
byte-identical, 3-region-gated. Full evidence and header comments are
in the files themselves:

- [`src/main/data_020b4d60.c`](../../../src/main/data_020b4d60.c) —
  `Record020b4d60[87]`, 8×`short` fields (16-byte stride).
- [`src/main/data_020bef80.c`](../../../src/main/data_020bef80.c) —
  `Record020bef80[192]`, 2×`short` fields (4-byte stride), very likely
  a sin/cos or unit-direction-vector table (constant ~4096 magnitude
  across every sampled record) though the exact angular domain/units
  aren't pinned down from code alone.

Neither has a matched C consumer today, so field names are
placeholders (`fieldN`) — this is evidence-strong but
semantics-unconfirmed, same caveat as the reg-alloc/family-census
levers: the struct *shape* is well-supported, the *meaning* of each
field is not.

## `data_020b52d8` — strongest evidence, deliberately not executed

Four already-matched, already-shipped C functions each independently
confirm one field of a single 12-byte record, at offsets 0 (`int`,
`func_020119dc.c`), 4 (`u16`, `func_020119f4.c`), 6 (`u16`,
`func_02011a14.c`), and 8 (`u16`, `func_02011a7c.c` — this is
`data_020b52d8` itself). Record count (145) is confirmed two
independent ways that agree exactly: a matched loop bound
(`func_02011a3c.c`, `for i in [0, 0x91)`) and the linker-symbol address
gap (`data_020b599c - data_020b52d0 == 145*12`). This is about as
strong as structural-inference evidence gets — arguably stronger than
the canary's own oracle, since it's cross-validated by real compiled,
disassembled ARM instructions rather than a single external text file.

**Why it wasn't retyped in this item**: `data_020b52d8` (the symbol
this item targeted) is not the array's base — it's a sub-symbol 8
bytes into record 0. dsd splits one physical table into one symbol per
distinct address some reader's literal pool happens to load, so the
real base, `data_020b52d0`, has **no defining `.c`/`.s` file at all
today** — its 4 bytes are still sitting in dsd's generic unclaimed-gap
filler (confirmed via `delinks.txt`: `data_020b4d60.c`'s own TU ends at
exactly `0x020b52d0`, and `data_020b52d4.s` starts at exactly
`0x020b52d4`, leaving a 4-byte gap with no named owner in between). A
correct retype means:

1. Locating `data_020b52d0`'s own 4 raw bytes (not currently in any
   source file — would need extracting from the ROM/gap object).
2. Carving a new unified TU covering the full 1740-byte range
   (`0x020b52d0`–`0x020b599c`) as `struct CardRecord data_020b52d0[145]`,
   which means editing `delinks.txt` to redirect that byte range away
   from the implicit gap pool.
3. Deleting `data_020b52d4.s` and `data_020b52d8.c`, and **rewriting
   4 already-matched, already-shipped functions** to reference struct
   fields instead of raw pointer-offset arithmetic — with a real risk
   that mwcc emits different addressing-mode instructions for
   struct-field access vs. the current `(char*)base + idx*12`
   arithmetic, which would silently regress 4 existing matches.

That's a genuine restructuring task, not a single-blob retype, and
executing it under this item's time budget risked breaking working
matches to chase one (very well-evidenced) blob. Recommending as a
dedicated follow-up queue item with its own careful verification pass
(rebuild + gate after each of the 4 rewritten consumers individually,
not just at the end) rather than rushing it here.

## Process note

All 6 investigations used parallel `Explore` sub-agents (one per blob)
for the initial consumer search + disassembly read, since the 6
questions are fully independent. Their raw byte-level claims were
spot-checked, not trusted blindly — one agent's illustrative sample
table for `data_020bef80` had an arithmetic slip in one row (claimed
record 64 = `{737, 4029}`; independently re-derived from the actual
source bytes via a small transcription script, it's `{420, 4074}`).
The structural conclusion was unaffected (the script does a direct
`struct.unpack` over the real bytes, not manual hex arithmetic), but
it's a concrete instance of why every agent-reported number worth
shipping needs an independent re-derivation before it goes in a
committed file, not just a plausibility read.
