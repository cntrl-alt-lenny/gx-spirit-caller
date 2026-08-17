[//]: # (markdownlint-disable MD013)

# cm-restock-carve-9 — the shape-filtered string pool ships in full; the "zero-reader" pool turns out not to be reader-less (2026-08-17)

Ninth wave of the `cm-restock-carve` series. Takes the two successors
`cm-restock-carve-8`'s re-census identified: Part 1 widens the shape
filter to reclaim `string`/`string-ascii4` candidates the original
census's 4-shape filter dropped; Part 2 runs a bounded PoC against the
much larger zero-reader pool — and finds, on the way to a mechanical
yes/no, that the pool isn't actually reader-less, plus a real (if
uncommon) failure mode in the "absorb multiple addresses" technique
that a first attempt hit and a second, properly-screened attempt
avoided.

## Two corrections carried in from the kickoff, both re-verified here

`cm-restock-carve-8`'s merge carried two brain corrections: the
remaining reachable-by-method pool is 548 B (not "smaller than half"
of wave 8's 352 B shipped — the comparison was inverted), and the
25-symbol module enumeration was short one module (`ov008`, 32 B,
verified independently against `delinks.txt` at merge time). Both
stand; this wave doesn't touch that 548 B pool (it's Part 1's
successor's successor, not this wave's scope).

## Part 1 — the shape-filtered pool: 690 symbols / 11,588 B, not 1,076

### A third correction: the pool's symbol count, re-derived from scratch

The kickoff cited **1,076 symbols / 11,592 B** for "shapes the original
4-shape filter excluded." Reproducing this via the exact tool
(`python tools/data_worklist.py --shape string,string-ascii4 --top 0
--no-outputs`) gives **689 symbols / 11,588 B** — the byte total is
within 4 B (one stray `shape=scalar` entry with a reader, 4 B, not
`string`-shaped and left untouched — out of this wave's explicit
`string`/`string-ascii4` scope), but the symbol count is off by 387.
No combination of shapes, reader thresholds, or module scopes tried
reproduces 1,076 while also holding the byte total at ~11,592 (full
search recorded below) — the safest read is that the cited count was
a stale or miscounted figure from an earlier pass, not a different
real pool. **This wave's number (689 symbols, 11,588 B, all in
`main`, none in any overlay) is derived fresh from the live tree and
is what the reconciliation table below accounts for exactly.**

Search performed (all `--min-readers 1`, matching the original
census's own evidence standard):

| Query | Symbols | Bytes |
|---|---:|---:|
| `--shape string` | 605 | 11,252 |
| `--shape string-ascii4` | 84 | 336 |
| `--shape scalar` | 1 | 4 |
| `--shape pointer-code` | 0 | 0 |
| `--shape pointer-data` | 0 | 0 |
| `--shape string,string-ascii4` (this wave's pool) | 689 | 11,588 |
| + `scalar` (adjacent, NOT shipped, out of scope) | 690 | 11,592 |
| `--shape unknown` (0-byte, size-undeducible, not carveable) | 715 | 0 |

The `unknown`-shape 715 are symbols `data_worklist.py` can't even size
(the same size-deduction gap `cm-restock-carve-8` flagged for
partially-renamed clusters) — not carveable candidates, excluded from
every count above.

### Alignment: every single candidate is individually 4-aligned — no TU composition needed

Checked directly (`addr % 4 == 0` and `(addr + size) % 4 == 0` for all
689): **689 of 689**. This is a materially easier shape than the
original struct/array/fnptr/jump census (which needed
`alignment-wall-tu-composition-recipe.md`'s pairing recipe for a
meaningful fraction of candidates) — every candidate here gets the
plain, zero-risk `cluster-c-recipe.md` "Pattern 1" treatment: one
symbol, one `.c` file, one `delinks.txt` TU, naturally 4-aligned, no
composition, no P-50 exposure whatsoever (P-50 requires ≥2 top-level
globals in one TU; every file here declares exactly one).

### Verification performed per candidate (scripted, all 689, not sampled)

1. **Real bytes** from `build/eur/build/arm9.bin` via
   `data_worklist.load_module_sections`/`ModuleSections.bytes_at` —
   never guessed or copied from a stale worklist.
2. **`delinks.txt` boundary check**: parsed every existing TU block
   (4,630 before this wave) directly from the file (not trusted from
   any tool's cache); confirmed zero overlap between any candidate's
   claimed `[addr, addr+size)` and any pre-existing `complete` TU.
3. **Independent size re-derivation**: re-walked `symbols.txt` myself
   (not reusing `data_worklist`'s own `build_size_table` arithmetic)
   to confirm each candidate's claimed end address equals the address
   of the true next `data`/`bss` symbol. 689/689 matched exactly.
4. **`relocs.txt` internal-relocation check** (the check
   `cm-restock-carve-8` found "mattered most"): confirmed **zero**
   outgoing relocations sourced from inside any candidate's own byte
   span, for all 689 — none of these are secretly mis-shaped pointer
   tables.
5. **Reader resolution**: every candidate's reader(s) resolved via
   `relocs.txt` → `analyze_symbols.enclosing_function` — 0 of 689 had
   an unresolvable reader address.
6. **Content check**: all 689 are null-terminated, printable ASCII
   (tab/newline allowed) before the terminator, with clean all-zero
   padding after it — every one renders safely as a plain quoted `"…"`
   C string literal (with `\\`/`\"`/`\n`/`\t` escaped where present —
   159 entries needed at least one escape, mostly the GameSpy-style
   `\key\value\` wire-protocol tokens and `\n`-terminated debug-log
   strings).

**Zero candidates flagged** by any of the above checks — this pool is
unusually clean (homogeneous shape, no structural typing ambiguity,
no internal pointers, no misalignment).

### Section / const-ness

688 of 689 are `.data` (writable) — declared as plain non-const
`char name[N] = "…";`, matching this wave's own
`data_ov008_021b275c.c`-style precedent (`cluster-c-recipe.md`'s
worked example) rather than the mid-campaign brief-era
`const char *`/`&symbol` convention, per
[[feedback_const-placement-controls-section]]: const-ness must match
each symbol's own ground-truth section, and `.data` residency here is
direct from the `delinks.txt` section header, not assumed. One
(`data_020b599c`, `"MTW\0"`) is `.rodata` and shipped `const`.

### Result: 689 symbols shipped, 11,588 bytes

Per-symbol reconciliation table (every row's Size cell independently
checked against `delinks.txt`'s post-carve state, not carried over
from the plan):

| # | Symbol | Addr | Sec | Size (B) | Shape | Readers | `delinks.txt` span |
|---:|---|---|---|---:|---|---:|---|
| 1 | `data_020b599c` | `0x020b599c` | rodata | 4 | string-ascii4 | 1 | `0x020b599c`–`0x020b59a0` |
| 2 | `data_020c3e24` | `0x020c3e24` | data | 16 | string | 1 | `0x020c3e24`–`0x020c3e34` |
| 3 | `data_020c3e34` | `0x020c3e34` | data | 20 | string | 1 | `0x020c3e34`–`0x020c3e48` |
| 4 | `data_020c3f44` | `0x020c3f44` | data | 4 | string-ascii4 | 3 | `0x020c3f44`–`0x020c3f48` |
| 5 | `data_020c3f90` | `0x020c3f90` | data | 4 | string-ascii4 | 1 | `0x020c3f90`–`0x020c3f94` |
| 6 | `data_020c3f94` | `0x020c3f94` | data | 12 | string | 1 | `0x020c3f94`–`0x020c3fa0` |
| 7 | `data_020c3fa0` | `0x020c3fa0` | data | 8 | string | 1 | `0x020c3fa0`–`0x020c3fa8` |
| 8 | `data_020c58dc` | `0x020c58dc` | data | 20 | string | 1 | `0x020c58dc`–`0x020c58f0` |
| 9 | `data_020c598c` | `0x020c598c` | data | 4 | string-ascii4 | 1 | `0x020c598c`–`0x020c5990` |
| 10 | `data_020c5990` | `0x020c5990` | data | 4 | string-ascii4 | 1 | `0x020c5990`–`0x020c5994` |
| 11 | `data_020c59c4` | `0x020c59c4` | data | 20 | string | 1 | `0x020c59c4`–`0x020c59d8` |
| 12 | `data_020c5c7c` | `0x020c5c7c` | data | 20 | string | 1 | `0x020c5c7c`–`0x020c5c90` |
| 13 | `data_020c5c90` | `0x020c5c90` | data | 24 | string | 1 | `0x020c5c90`–`0x020c5ca8` |
| 14 | `data_020c5ca8` | `0x020c5ca8` | data | 32 | string | 1 | `0x020c5ca8`–`0x020c5cc8` |
| 15 | `data_020c5cc8` | `0x020c5cc8` | data | 28 | string | 1 | `0x020c5cc8`–`0x020c5ce4` |
| 16 | `data_020c5ce4` | `0x020c5ce4` | data | 16 | string | 1 | `0x020c5ce4`–`0x020c5cf4` |
| 17 | `data_020c5cf4` | `0x020c5cf4` | data | 20 | string | 1 | `0x020c5cf4`–`0x020c5d08` |
| 18 | `data_020c5d08` | `0x020c5d08` | data | 24 | string | 1 | `0x020c5d08`–`0x020c5d20` |
| 19 | `data_020c5d20` | `0x020c5d20` | data | 24 | string | 1 | `0x020c5d20`–`0x020c5d38` |
| 20 | `data_020c5d38` | `0x020c5d38` | data | 20 | string | 1 | `0x020c5d38`–`0x020c5d4c` |
| 21 | `data_020c5d4c` | `0x020c5d4c` | data | 20 | string | 1 | `0x020c5d4c`–`0x020c5d60` |
| 22 | `data_020c5d60` | `0x020c5d60` | data | 24 | string | 1 | `0x020c5d60`–`0x020c5d78` |
| 23 | `data_020c5d78` | `0x020c5d78` | data | 24 | string | 1 | `0x020c5d78`–`0x020c5d90` |
| 24 | `data_020c5d90` | `0x020c5d90` | data | 32 | string | 1 | `0x020c5d90`–`0x020c5db0` |
| 25 | `data_020c6484` | `0x020c6484` | data | 4 | string-ascii4 | 2 | `0x020c6484`–`0x020c6488` |
| 26 | `data_020c6488` | `0x020c6488` | data | 8 | string | 1 | `0x020c6488`–`0x020c6490` |
| 27 | `data_020c6494` | `0x020c6494` | data | 48 | string | 1 | `0x020c6494`–`0x020c64c4` |
| 28 | `data_020c64c4` | `0x020c64c4` | data | 48 | string | 1 | `0x020c64c4`–`0x020c64f4` |
| 29 | `data_020c64f4` | `0x020c64f4` | data | 60 | string | 1 | `0x020c64f4`–`0x020c6530` |
| 30 | `data_020c6530` | `0x020c6530` | data | 32 | string | 3 | `0x020c6530`–`0x020c6550` |
| 31 | `data_020c6550` | `0x020c6550` | data | 40 | string | 1 | `0x020c6550`–`0x020c6578` |
| 32 | `data_020c6578` | `0x020c6578` | data | 32 | string | 1 | `0x020c6578`–`0x020c6598` |
| 33 | `data_020c6598` | `0x020c6598` | data | 28 | string | 1 | `0x020c6598`–`0x020c65b4` |
| 34 | `data_020c65b4` | `0x020c65b4` | data | 24 | string | 2 | `0x020c65b4`–`0x020c65cc` |
| 35 | `data_020c65cc` | `0x020c65cc` | data | 24 | string | 2 | `0x020c65cc`–`0x020c65e4` |
| 36 | `data_020c65e4` | `0x020c65e4` | data | 56 | string | 1 | `0x020c65e4`–`0x020c661c` |
| 37 | `data_020c661c` | `0x020c661c` | data | 24 | string | 1 | `0x020c661c`–`0x020c6634` |
| 38 | `data_020c6634` | `0x020c6634` | data | 24 | string | 1 | `0x020c6634`–`0x020c664c` |
| 39 | `data_020c664c` | `0x020c664c` | data | 20 | string | 1 | `0x020c664c`–`0x020c6660` |
| 40 | `data_020c6660` | `0x020c6660` | data | 16 | string | 1 | `0x020c6660`–`0x020c6670` |
| 41 | `data_020c6670` | `0x020c6670` | data | 40 | string | 1 | `0x020c6670`–`0x020c6698` |
| 42 | `data_020c6698` | `0x020c6698` | data | 48 | string | 1 | `0x020c6698`–`0x020c66c8` |
| 43 | `data_020c66c8` | `0x020c66c8` | data | 44 | string | 1 | `0x020c66c8`–`0x020c66f4` |
| 44 | `data_020c66f4` | `0x020c66f4` | data | 20 | string | 1 | `0x020c66f4`–`0x020c6708` |
| 45 | `data_020c6708` | `0x020c6708` | data | 32 | string | 1 | `0x020c6708`–`0x020c6728` |
| 46 | `data_020c6728` | `0x020c6728` | data | 28 | string | 1 | `0x020c6728`–`0x020c6744` |
| 47 | `data_020c6744` | `0x020c6744` | data | 24 | string | 1 | `0x020c6744`–`0x020c675c` |
| 48 | `data_020c675c` | `0x020c675c` | data | 40 | string | 1 | `0x020c675c`–`0x020c6784` |
| 49 | `data_020c6784` | `0x020c6784` | data | 52 | string | 1 | `0x020c6784`–`0x020c67b8` |
| 50 | `data_020c67b8` | `0x020c67b8` | data | 36 | string | 1 | `0x020c67b8`–`0x020c67dc` |
| 51 | `data_020c67dc` | `0x020c67dc` | data | 28 | string | 1 | `0x020c67dc`–`0x020c67f8` |
| 52 | `data_020c67f8` | `0x020c67f8` | data | 24 | string | 1 | `0x020c67f8`–`0x020c6810` |
| 53 | `data_020c6810` | `0x020c6810` | data | 28 | string | 2 | `0x020c6810`–`0x020c682c` |
| 54 | `data_020c682c` | `0x020c682c` | data | 20 | string | 1 | `0x020c682c`–`0x020c6840` |
| 55 | `data_020c6840` | `0x020c6840` | data | 28 | string | 1 | `0x020c6840`–`0x020c685c` |
| 56 | `data_020c685c` | `0x020c685c` | data | 28 | string | 1 | `0x020c685c`–`0x020c6878` |
| 57 | `data_020c689c` | `0x020c689c` | data | 12 | string | 1 | `0x020c689c`–`0x020c68a8` |
| 58 | `data_020c68a8` | `0x020c68a8` | data | 12 | string | 1 | `0x020c68a8`–`0x020c68b4` |
| 59 | `data_020c68b4` | `0x020c68b4` | data | 12 | string | 1 | `0x020c68b4`–`0x020c68c0` |
| 60 | `data_020c68c0` | `0x020c68c0` | data | 12 | string | 1 | `0x020c68c0`–`0x020c68cc` |
| 61 | `data_020c68ec` | `0x020c68ec` | data | 4 | string-ascii4 | 2 | `0x020c68ec`–`0x020c68f0` |
| 62 | `data_020c68f0` | `0x020c68f0` | data | 8 | string | 2 | `0x020c68f0`–`0x020c68f8` |
| 63 | `data_020c6958` | `0x020c6958` | data | 12 | string | 1 | `0x020c6958`–`0x020c6964` |
| 64 | `data_020c697c` | `0x020c697c` | data | 20 | string | 1 | `0x020c697c`–`0x020c6990` |
| 65 | `data_020c6990` | `0x020c6990` | data | 20 | string | 1 | `0x020c6990`–`0x020c69a4` |
| 66 | `data_020c69a4` | `0x020c69a4` | data | 28 | string | 1 | `0x020c69a4`–`0x020c69c0` |
| 67 | `data_020c69c0` | `0x020c69c0` | data | 20 | string | 1 | `0x020c69c0`–`0x020c69d4` |
| 68 | `data_020c69d4` | `0x020c69d4` | data | 20 | string | 1 | `0x020c69d4`–`0x020c69e8` |
| 69 | `data_020c69e8` | `0x020c69e8` | data | 20 | string | 1 | `0x020c69e8`–`0x020c69fc` |
| 70 | `data_020c69fc` | `0x020c69fc` | data | 20 | string | 1 | `0x020c69fc`–`0x020c6a10` |
| 71 | `data_020c6a10` | `0x020c6a10` | data | 20 | string | 1 | `0x020c6a10`–`0x020c6a24` |
| 72 | `data_020c6a24` | `0x020c6a24` | data | 20 | string | 1 | `0x020c6a24`–`0x020c6a38` |
| 73 | `data_020c6a38` | `0x020c6a38` | data | 20 | string | 1 | `0x020c6a38`–`0x020c6a4c` |
| 74 | `data_020c6a4c` | `0x020c6a4c` | data | 20 | string | 1 | `0x020c6a4c`–`0x020c6a60` |
| 75 | `data_020c6a60` | `0x020c6a60` | data | 20 | string | 1 | `0x020c6a60`–`0x020c6a74` |
| 76 | `data_020c6a74` | `0x020c6a74` | data | 20 | string | 1 | `0x020c6a74`–`0x020c6a88` |
| 77 | `data_020c6a88` | `0x020c6a88` | data | 20 | string | 1 | `0x020c6a88`–`0x020c6a9c` |
| 78 | `data_020c6ab4` | `0x020c6ab4` | data | 20 | string | 1 | `0x020c6ab4`–`0x020c6ac8` |
| 79 | `data_020c6ac8` | `0x020c6ac8` | data | 24 | string | 1 | `0x020c6ac8`–`0x020c6ae0` |
| 80 | `data_020c6ae0` | `0x020c6ae0` | data | 20 | string | 1 | `0x020c6ae0`–`0x020c6af4` |
| 81 | `data_020c6af4` | `0x020c6af4` | data | 20 | string | 2 | `0x020c6af4`–`0x020c6b08` |
| 82 | `data_020c6b08` | `0x020c6b08` | data | 20 | string | 2 | `0x020c6b08`–`0x020c6b1c` |
| 83 | `data_020c6b1c` | `0x020c6b1c` | data | 20 | string | 2 | `0x020c6b1c`–`0x020c6b30` |
| 84 | `data_020c6b30` | `0x020c6b30` | data | 20 | string | 2 | `0x020c6b30`–`0x020c6b44` |
| 85 | `data_020c6b44` | `0x020c6b44` | data | 20 | string | 1 | `0x020c6b44`–`0x020c6b58` |
| 86 | `data_020c6b58` | `0x020c6b58` | data | 28 | string | 1 | `0x020c6b58`–`0x020c6b74` |
| 87 | `data_020c6b74` | `0x020c6b74` | data | 28 | string | 1 | `0x020c6b74`–`0x020c6b90` |
| 88 | `data_020c6ca8` | `0x020c6ca8` | data | 24 | string | 1 | `0x020c6ca8`–`0x020c6cc0` |
| 89 | `data_020c6cc0` | `0x020c6cc0` | data | 28 | string | 1 | `0x020c6cc0`–`0x020c6cdc` |
| 90 | `data_020c6cdc` | `0x020c6cdc` | data | 28 | string | 1 | `0x020c6cdc`–`0x020c6cf8` |
| 91 | `data_020c6cf8` | `0x020c6cf8` | data | 24 | string | 1 | `0x020c6cf8`–`0x020c6d10` |
| 92 | `data_020c6d10` | `0x020c6d10` | data | 24 | string | 1 | `0x020c6d10`–`0x020c6d28` |
| 93 | `data_020c6d28` | `0x020c6d28` | data | 28 | string | 1 | `0x020c6d28`–`0x020c6d44` |
| 94 | `data_020c6d44` | `0x020c6d44` | data | 12 | string | 1 | `0x020c6d44`–`0x020c6d50` |
| 95 | `data_020c6d50` | `0x020c6d50` | data | 8 | string | 1 | `0x020c6d50`–`0x020c6d58` |
| 96 | `data_020c6d58` | `0x020c6d58` | data | 12 | string | 1 | `0x020c6d58`–`0x020c6d64` |
| 97 | `data_020c6d64` | `0x020c6d64` | data | 8 | string | 1 | `0x020c6d64`–`0x020c6d6c` |
| 98 | `data_020c6d6c` | `0x020c6d6c` | data | 4 | string-ascii4 | 1 | `0x020c6d6c`–`0x020c6d70` |
| 99 | `data_020c6d70` | `0x020c6d70` | data | 16 | string | 1 | `0x020c6d70`–`0x020c6d80` |
| 100 | `data_020fe46c` | `0x020fe46c` | data | 12 | string | 1 | `0x020fe46c`–`0x020fe478` |
| 101 | `data_020fe478` | `0x020fe478` | data | 8 | string | 1 | `0x020fe478`–`0x020fe480` |
| 102 | `data_020fe4c4` | `0x020fe4c4` | data | 12 | string | 1 | `0x020fe4c4`–`0x020fe4d0` |
| 103 | `data_020fe544` | `0x020fe544` | data | 12 | string | 1 | `0x020fe544`–`0x020fe550` |
| 104 | `data_020fe550` | `0x020fe550` | data | 12 | string | 2 | `0x020fe550`–`0x020fe55c` |
| 105 | `data_020fe5a0` | `0x020fe5a0` | data | 12 | string | 1 | `0x020fe5a0`–`0x020fe5ac` |
| 106 | `data_020fe5ac` | `0x020fe5ac` | data | 8 | string | 1 | `0x020fe5ac`–`0x020fe5b4` |
| 107 | `data_020fe5b4` | `0x020fe5b4` | data | 8 | string | 1 | `0x020fe5b4`–`0x020fe5bc` |
| 108 | `data_020fe5bc` | `0x020fe5bc` | data | 8 | string | 1 | `0x020fe5bc`–`0x020fe5c4` |
| 109 | `data_020fe5c4` | `0x020fe5c4` | data | 4 | string-ascii4 | 1 | `0x020fe5c4`–`0x020fe5c8` |
| 110 | `data_020fe5c8` | `0x020fe5c8` | data | 8 | string | 1 | `0x020fe5c8`–`0x020fe5d0` |
| 111 | `data_020fe5d0` | `0x020fe5d0` | data | 12 | string | 1 | `0x020fe5d0`–`0x020fe5dc` |
| 112 | `data_020fe5dc` | `0x020fe5dc` | data | 8 | string | 1 | `0x020fe5dc`–`0x020fe5e4` |
| 113 | `data_020fe5e4` | `0x020fe5e4` | data | 12 | string | 1 | `0x020fe5e4`–`0x020fe5f0` |
| 114 | `data_020fe5f0` | `0x020fe5f0` | data | 12 | string | 1 | `0x020fe5f0`–`0x020fe5fc` |
| 115 | `data_020fe5fc` | `0x020fe5fc` | data | 8 | string | 1 | `0x020fe5fc`–`0x020fe604` |
| 116 | `data_020fe604` | `0x020fe604` | data | 8 | string | 1 | `0x020fe604`–`0x020fe60c` |
| 117 | `data_020fe60c` | `0x020fe60c` | data | 12 | string | 1 | `0x020fe60c`–`0x020fe618` |
| 118 | `data_020fe618` | `0x020fe618` | data | 12 | string | 1 | `0x020fe618`–`0x020fe624` |
| 119 | `data_020fe624` | `0x020fe624` | data | 12 | string | 1 | `0x020fe624`–`0x020fe630` |
| 120 | `data_020fe630` | `0x020fe630` | data | 16 | string | 1 | `0x020fe630`–`0x020fe640` |
| 121 | `data_020fe640` | `0x020fe640` | data | 12 | string | 1 | `0x020fe640`–`0x020fe64c` |
| 122 | `data_020fe64c` | `0x020fe64c` | data | 32 | string | 1 | `0x020fe64c`–`0x020fe66c` |
| 123 | `data_020fe66c` | `0x020fe66c` | data | 16 | string | 1 | `0x020fe66c`–`0x020fe67c` |
| 124 | `data_020fe67c` | `0x020fe67c` | data | 16 | string | 1 | `0x020fe67c`–`0x020fe68c` |
| 125 | `data_020fe68c` | `0x020fe68c` | data | 12 | string | 1 | `0x020fe68c`–`0x020fe698` |
| 126 | `data_020fe698` | `0x020fe698` | data | 8 | string | 1 | `0x020fe698`–`0x020fe6a0` |
| 127 | `data_020fe6a0` | `0x020fe6a0` | data | 8 | string | 1 | `0x020fe6a0`–`0x020fe6a8` |
| 128 | `data_020fe6a8` | `0x020fe6a8` | data | 8 | string | 1 | `0x020fe6a8`–`0x020fe6b0` |
| 129 | `data_020fe6b0` | `0x020fe6b0` | data | 8 | string | 1 | `0x020fe6b0`–`0x020fe6b8` |
| 130 | `data_020fe6b8` | `0x020fe6b8` | data | 8 | string | 1 | `0x020fe6b8`–`0x020fe6c0` |
| 131 | `data_020fe6c0` | `0x020fe6c0` | data | 8 | string | 1 | `0x020fe6c0`–`0x020fe6c8` |
| 132 | `data_020fe6c8` | `0x020fe6c8` | data | 8 | string | 1 | `0x020fe6c8`–`0x020fe6d0` |
| 133 | `data_020fe6d0` | `0x020fe6d0` | data | 8 | string | 1 | `0x020fe6d0`–`0x020fe6d8` |
| 134 | `data_020fe6d8` | `0x020fe6d8` | data | 8 | string | 1 | `0x020fe6d8`–`0x020fe6e0` |
| 135 | `data_020fe6e0` | `0x020fe6e0` | data | 8 | string | 1 | `0x020fe6e0`–`0x020fe6e8` |
| 136 | `data_020fe6e8` | `0x020fe6e8` | data | 8 | string | 1 | `0x020fe6e8`–`0x020fe6f0` |
| 137 | `data_020fe6f0` | `0x020fe6f0` | data | 8 | string | 1 | `0x020fe6f0`–`0x020fe6f8` |
| 138 | `data_020fe6f8` | `0x020fe6f8` | data | 8 | string | 1 | `0x020fe6f8`–`0x020fe700` |
| 139 | `data_020fe700` | `0x020fe700` | data | 8 | string | 1 | `0x020fe700`–`0x020fe708` |
| 140 | `data_020fe708` | `0x020fe708` | data | 24 | string | 1 | `0x020fe708`–`0x020fe720` |
| 141 | `data_020fe720` | `0x020fe720` | data | 12 | string | 1 | `0x020fe720`–`0x020fe72c` |
| 142 | `data_020fe72c` | `0x020fe72c` | data | 16 | string | 1 | `0x020fe72c`–`0x020fe73c` |
| 143 | `data_020fe73c` | `0x020fe73c` | data | 8 | string | 1 | `0x020fe73c`–`0x020fe744` |
| 144 | `data_020fe744` | `0x020fe744` | data | 8 | string | 1 | `0x020fe744`–`0x020fe74c` |
| 145 | `data_020fe74c` | `0x020fe74c` | data | 8 | string | 1 | `0x020fe74c`–`0x020fe754` |
| 146 | `data_020fe754` | `0x020fe754` | data | 12 | string | 1 | `0x020fe754`–`0x020fe760` |
| 147 | `data_020fe760` | `0x020fe760` | data | 28 | string | 1 | `0x020fe760`–`0x020fe77c` |
| 148 | `data_020fe77c` | `0x020fe77c` | data | 16 | string | 1 | `0x020fe77c`–`0x020fe78c` |
| 149 | `data_020fe7b8` | `0x020fe7b8` | data | 28 | string | 1 | `0x020fe7b8`–`0x020fe7d4` |
| 150 | `data_020fe7d4` | `0x020fe7d4` | data | 28 | string | 1 | `0x020fe7d4`–`0x020fe7f0` |
| 151 | `data_020fe7f8` | `0x020fe7f8` | data | 4 | string-ascii4 | 1 | `0x020fe7f8`–`0x020fe7fc` |
| 152 | `data_020fe7fc` | `0x020fe7fc` | data | 12 | string | 1 | `0x020fe7fc`–`0x020fe808` |
| 153 | `data_020fe810` | `0x020fe810` | data | 4 | string-ascii4 | 1 | `0x020fe810`–`0x020fe814` |
| 154 | `data_020fe814` | `0x020fe814` | data | 4 | string-ascii4 | 1 | `0x020fe814`–`0x020fe818` |
| 155 | `data_020fe818` | `0x020fe818` | data | 4 | string-ascii4 | 1 | `0x020fe818`–`0x020fe81c` |
| 156 | `data_020fe81c` | `0x020fe81c` | data | 32 | string | 1 | `0x020fe81c`–`0x020fe83c` |
| 157 | `data_020fe83c` | `0x020fe83c` | data | 32 | string | 1 | `0x020fe83c`–`0x020fe85c` |
| 158 | `data_020fe85c` | `0x020fe85c` | data | 28 | string | 1 | `0x020fe85c`–`0x020fe878` |
| 159 | `data_020fe878` | `0x020fe878` | data | 28 | string | 1 | `0x020fe878`–`0x020fe894` |
| 160 | `data_020fe894` | `0x020fe894` | data | 8 | string | 1 | `0x020fe894`–`0x020fe89c` |
| 161 | `data_020fe89c` | `0x020fe89c` | data | 12 | string | 1 | `0x020fe89c`–`0x020fe8a8` |
| 162 | `data_020fe8a8` | `0x020fe8a8` | data | 4 | string-ascii4 | 1 | `0x020fe8a8`–`0x020fe8ac` |
| 163 | `data_020fe8ac` | `0x020fe8ac` | data | 4 | string-ascii4 | 1 | `0x020fe8ac`–`0x020fe8b0` |
| 164 | `data_020fe8b0` | `0x020fe8b0` | data | 16 | string | 1 | `0x020fe8b0`–`0x020fe8c0` |
| 165 | `data_020fe8c0` | `0x020fe8c0` | data | 20 | string | 2 | `0x020fe8c0`–`0x020fe8d4` |
| 166 | `data_020fe8d4` | `0x020fe8d4` | data | 20 | string | 1 | `0x020fe8d4`–`0x020fe8e8` |
| 167 | `data_020fe8e8` | `0x020fe8e8` | data | 4 | string-ascii4 | 1 | `0x020fe8e8`–`0x020fe8ec` |
| 168 | `data_020fe8ec` | `0x020fe8ec` | data | 4 | string-ascii4 | 1 | `0x020fe8ec`–`0x020fe8f0` |
| 169 | `data_020fe8f0` | `0x020fe8f0` | data | 8 | string | 1 | `0x020fe8f0`–`0x020fe8f8` |
| 170 | `data_020fe978` | `0x020fe978` | data | 24 | string | 1 | `0x020fe978`–`0x020fe990` |
| 171 | `data_020fe990` | `0x020fe990` | data | 24 | string | 1 | `0x020fe990`–`0x020fe9a8` |
| 172 | `data_020fe9a8` | `0x020fe9a8` | data | 20 | string | 1 | `0x020fe9a8`–`0x020fe9bc` |
| 173 | `data_020fe9bc` | `0x020fe9bc` | data | 12 | string | 1 | `0x020fe9bc`–`0x020fe9c8` |
| 174 | `data_020fe9c8` | `0x020fe9c8` | data | 8 | string | 1 | `0x020fe9c8`–`0x020fe9d0` |
| 175 | `data_020fe9d0` | `0x020fe9d0` | data | 4 | string-ascii4 | 1 | `0x020fe9d0`–`0x020fe9d4` |
| 176 | `data_020fe9d4` | `0x020fe9d4` | data | 16 | string | 1 | `0x020fe9d4`–`0x020fe9e4` |
| 177 | `data_020fe9e4` | `0x020fe9e4` | data | 24 | string | 1 | `0x020fe9e4`–`0x020fe9fc` |
| 178 | `data_020fe9fc` | `0x020fe9fc` | data | 24 | string | 1 | `0x020fe9fc`–`0x020fea14` |
| 179 | `data_020fea3c` | `0x020fea3c` | data | 28 | string | 1 | `0x020fea3c`–`0x020fea58` |
| 180 | `data_020fea58` | `0x020fea58` | data | 28 | string | 2 | `0x020fea58`–`0x020fea74` |
| 181 | `data_020fea74` | `0x020fea74` | data | 12 | string | 1 | `0x020fea74`–`0x020fea80` |
| 182 | `data_020fea80` | `0x020fea80` | data | 16 | string | 1 | `0x020fea80`–`0x020fea90` |
| 183 | `data_020fea90` | `0x020fea90` | data | 16 | string | 1 | `0x020fea90`–`0x020feaa0` |
| 184 | `data_020feaa0` | `0x020feaa0` | data | 32 | string | 1 | `0x020feaa0`–`0x020feac0` |
| 185 | `data_020feac0` | `0x020feac0` | data | 12 | string | 1 | `0x020feac0`–`0x020feacc` |
| 186 | `data_020feacc` | `0x020feacc` | data | 32 | string | 1 | `0x020feacc`–`0x020feaec` |
| 187 | `data_020feaec` | `0x020feaec` | data | 8 | string | 1 | `0x020feaec`–`0x020feaf4` |
| 188 | `data_020feaf4` | `0x020feaf4` | data | 8 | string | 1 | `0x020feaf4`–`0x020feafc` |
| 189 | `data_020feafc` | `0x020feafc` | data | 16 | string | 1 | `0x020feafc`–`0x020feb0c` |
| 190 | `data_020feb0c` | `0x020feb0c` | data | 32 | string | 2 | `0x020feb0c`–`0x020feb2c` |
| 191 | `data_020feb2c` | `0x020feb2c` | data | 8 | string | 1 | `0x020feb2c`–`0x020feb34` |
| 192 | `data_020feb34` | `0x020feb34` | data | 8 | string | 1 | `0x020feb34`–`0x020feb3c` |
| 193 | `data_020feb3c` | `0x020feb3c` | data | 12 | string | 1 | `0x020feb3c`–`0x020feb48` |
| 194 | `data_020feb48` | `0x020feb48` | data | 4 | string-ascii4 | 1 | `0x020feb48`–`0x020feb4c` |
| 195 | `data_020feb4c` | `0x020feb4c` | data | 8 | string | 1 | `0x020feb4c`–`0x020feb54` |
| 196 | `data_020feb54` | `0x020feb54` | data | 8 | string | 1 | `0x020feb54`–`0x020feb5c` |
| 197 | `data_020feb5c` | `0x020feb5c` | data | 12 | string | 1 | `0x020feb5c`–`0x020feb68` |
| 198 | `data_020feb68` | `0x020feb68` | data | 12 | string | 1 | `0x020feb68`–`0x020feb74` |
| 199 | `data_020feb74` | `0x020feb74` | data | 12 | string | 1 | `0x020feb74`–`0x020feb80` |
| 200 | `data_020feb80` | `0x020feb80` | data | 16 | string | 1 | `0x020feb80`–`0x020feb90` |
| 201 | `data_020feb90` | `0x020feb90` | data | 20 | string | 1 | `0x020feb90`–`0x020feba4` |
| 202 | `data_020feba4` | `0x020feba4` | data | 20 | string | 1 | `0x020feba4`–`0x020febb8` |
| 203 | `data_020febb8` | `0x020febb8` | data | 16 | string | 1 | `0x020febb8`–`0x020febc8` |
| 204 | `data_020fec28` | `0x020fec28` | data | 32 | string | 1 | `0x020fec28`–`0x020fec48` |
| 205 | `data_020ff890` | `0x020ff890` | data | 40 | string | 1 | `0x020ff890`–`0x020ff8b8` |
| 206 | `data_020ff8b8` | `0x020ff8b8` | data | 36 | string | 1 | `0x020ff8b8`–`0x020ff8dc` |
| 207 | `data_020ff8dc` | `0x020ff8dc` | data | 32 | string | 1 | `0x020ff8dc`–`0x020ff8fc` |
| 208 | `data_020ff8fc` | `0x020ff8fc` | data | 12 | string | 1 | `0x020ff8fc`–`0x020ff908` |
| 209 | `data_020ff914` | `0x020ff914` | data | 4 | string-ascii4 | 1 | `0x020ff914`–`0x020ff918` |
| 210 | `data_020ff918` | `0x020ff918` | data | 4 | string-ascii4 | 1 | `0x020ff918`–`0x020ff91c` |
| 211 | `data_020ff960` | `0x020ff960` | data | 4 | string-ascii4 | 1 | `0x020ff960`–`0x020ff964` |
| 212 | `data_020ff964` | `0x020ff964` | data | 4 | string-ascii4 | 1 | `0x020ff964`–`0x020ff968` |
| 213 | `data_020ff968` | `0x020ff968` | data | 4 | string-ascii4 | 4 | `0x020ff968`–`0x020ff96c` |
| 214 | `data_020ff96c` | `0x020ff96c` | data | 8 | string | 2 | `0x020ff96c`–`0x020ff974` |
| 215 | `data_020ff974` | `0x020ff974` | data | 12 | string | 3 | `0x020ff974`–`0x020ff980` |
| 216 | `data_020ff980` | `0x020ff980` | data | 8 | string | 7 | `0x020ff980`–`0x020ff988` |
| 217 | `data_020ff988` | `0x020ff988` | data | 12 | string | 1 | `0x020ff988`–`0x020ff994` |
| 218 | `data_020ff994` | `0x020ff994` | data | 12 | string | 1 | `0x020ff994`–`0x020ff9a0` |
| 219 | `data_020ff9a0` | `0x020ff9a0` | data | 12 | string | 3 | `0x020ff9a0`–`0x020ff9ac` |
| 220 | `data_020ff9ac` | `0x020ff9ac` | data | 12 | string | 3 | `0x020ff9ac`–`0x020ff9b8` |
| 221 | `data_020ff9b8` | `0x020ff9b8` | data | 12 | string | 3 | `0x020ff9b8`–`0x020ff9c4` |
| 222 | `data_020ff9cc` | `0x020ff9cc` | data | 4 | string-ascii4 | 1 | `0x020ff9cc`–`0x020ff9d0` |
| 223 | `data_020ff9d0` | `0x020ff9d0` | data | 4 | string-ascii4 | 1 | `0x020ff9d0`–`0x020ff9d4` |
| 224 | `data_020ff9d4` | `0x020ff9d4` | data | 8 | string | 1 | `0x020ff9d4`–`0x020ff9dc` |
| 225 | `data_020ff9dc` | `0x020ff9dc` | data | 8 | string | 1 | `0x020ff9dc`–`0x020ff9e4` |
| 226 | `data_020ff9e4` | `0x020ff9e4` | data | 4 | string-ascii4 | 1 | `0x020ff9e4`–`0x020ff9e8` |
| 227 | `data_020ff9e8` | `0x020ff9e8` | data | 4 | string-ascii4 | 1 | `0x020ff9e8`–`0x020ff9ec` |
| 228 | `data_020ff9ec` | `0x020ff9ec` | data | 88 | string | 1 | `0x020ff9ec`–`0x020ffa44` |
| 229 | `data_020ffa44` | `0x020ffa44` | data | 12 | string | 1 | `0x020ffa44`–`0x020ffa50` |
| 230 | `data_020ffa50` | `0x020ffa50` | data | 8 | string | 1 | `0x020ffa50`–`0x020ffa58` |
| 231 | `data_020ffa58` | `0x020ffa58` | data | 4 | string-ascii4 | 1 | `0x020ffa58`–`0x020ffa5c` |
| 232 | `data_020ffa5c` | `0x020ffa5c` | data | 4 | string-ascii4 | 1 | `0x020ffa5c`–`0x020ffa60` |
| 233 | `data_020ffa60` | `0x020ffa60` | data | 12 | string | 1 | `0x020ffa60`–`0x020ffa6c` |
| 234 | `data_020ffa6c` | `0x020ffa6c` | data | 12 | string | 1 | `0x020ffa6c`–`0x020ffa78` |
| 235 | `data_020ffa78` | `0x020ffa78` | data | 24 | string | 1 | `0x020ffa78`–`0x020ffa90` |
| 236 | `data_020ffa90` | `0x020ffa90` | data | 8 | string | 1 | `0x020ffa90`–`0x020ffa98` |
| 237 | `data_020ffa98` | `0x020ffa98` | data | 4 | string-ascii4 | 2 | `0x020ffa98`–`0x020ffa9c` |
| 238 | `data_020ffa9c` | `0x020ffa9c` | data | 16 | string | 1 | `0x020ffa9c`–`0x020ffaac` |
| 239 | `data_020ffaac` | `0x020ffaac` | data | 36 | string | 1 | `0x020ffaac`–`0x020ffad0` |
| 240 | `data_020ffad0` | `0x020ffad0` | data | 8 | string | 1 | `0x020ffad0`–`0x020ffad8` |
| 241 | `data_020ffadc` | `0x020ffadc` | data | 36 | string | 1 | `0x020ffadc`–`0x020ffb00` |
| 242 | `data_020ffb00` | `0x020ffb00` | data | 4 | string-ascii4 | 2 | `0x020ffb00`–`0x020ffb04` |
| 243 | `data_020ffb04` | `0x020ffb04` | data | 12 | string | 12 | `0x020ffb04`–`0x020ffb10` |
| 244 | `data_020ffb10` | `0x020ffb10` | data | 32 | string | 4 | `0x020ffb10`–`0x020ffb30` |
| 245 | `data_020ffb30` | `0x020ffb30` | data | 12 | string | 1 | `0x020ffb30`–`0x020ffb3c` |
| 246 | `data_020ffb3c` | `0x020ffb3c` | data | 32 | string | 1 | `0x020ffb3c`–`0x020ffb5c` |
| 247 | `data_020ffb5c` | `0x020ffb5c` | data | 8 | string | 3 | `0x020ffb5c`–`0x020ffb64` |
| 248 | `data_020ffb64` | `0x020ffb64` | data | 12 | string | 1 | `0x020ffb64`–`0x020ffb70` |
| 249 | `data_020ffb70` | `0x020ffb70` | data | 12 | string | 2 | `0x020ffb70`–`0x020ffb7c` |
| 250 | `data_020ffb7c` | `0x020ffb7c` | data | 4 | string-ascii4 | 2 | `0x020ffb7c`–`0x020ffb80` |
| 251 | `data_020ffb80` | `0x020ffb80` | data | 12 | string | 8 | `0x020ffb80`–`0x020ffb8c` |
| 252 | `data_020ffb8c` | `0x020ffb8c` | data | 8 | string | 6 | `0x020ffb8c`–`0x020ffb94` |
| 253 | `data_020ffb94` | `0x020ffb94` | data | 8 | string | 1 | `0x020ffb94`–`0x020ffb9c` |
| 254 | `data_020ffb9c` | `0x020ffb9c` | data | 8 | string | 1 | `0x020ffb9c`–`0x020ffba4` |
| 255 | `data_020ffba4` | `0x020ffba4` | data | 12 | string | 1 | `0x020ffba4`–`0x020ffbb0` |
| 256 | `data_020ffbb0` | `0x020ffbb0` | data | 12 | string | 1 | `0x020ffbb0`–`0x020ffbbc` |
| 257 | `data_020ffbbc` | `0x020ffbbc` | data | 16 | string | 1 | `0x020ffbbc`–`0x020ffbcc` |
| 258 | `data_020ffbcc` | `0x020ffbcc` | data | 8 | string | 1 | `0x020ffbcc`–`0x020ffbd4` |
| 259 | `data_020ffbd8` | `0x020ffbd8` | data | 32 | string | 2 | `0x020ffbd8`–`0x020ffbf8` |
| 260 | `data_020ffbf8` | `0x020ffbf8` | data | 12 | string | 2 | `0x020ffbf8`–`0x020ffc04` |
| 261 | `data_020ffc04` | `0x020ffc04` | data | 12 | string | 1 | `0x020ffc04`–`0x020ffc10` |
| 262 | `data_020ffc10` | `0x020ffc10` | data | 48 | string | 8 | `0x020ffc10`–`0x020ffc40` |
| 263 | `data_020ffc40` | `0x020ffc40` | data | 12 | string | 2 | `0x020ffc40`–`0x020ffc4c` |
| 264 | `data_020ffc4c` | `0x020ffc4c` | data | 8 | string | 2 | `0x020ffc4c`–`0x020ffc54` |
| 265 | `data_020ffc54` | `0x020ffc54` | data | 16 | string | 3 | `0x020ffc54`–`0x020ffc64` |
| 266 | `data_020ffc64` | `0x020ffc64` | data | 20 | string | 1 | `0x020ffc64`–`0x020ffc78` |
| 267 | `data_020ffc78` | `0x020ffc78` | data | 24 | string | 1 | `0x020ffc78`–`0x020ffc90` |
| 268 | `data_020ffc90` | `0x020ffc90` | data | 24 | string | 1 | `0x020ffc90`–`0x020ffca8` |
| 269 | `data_020ffca8` | `0x020ffca8` | data | 12 | string | 1 | `0x020ffca8`–`0x020ffcb4` |
| 270 | `data_020ffcb4` | `0x020ffcb4` | data | 16 | string | 1 | `0x020ffcb4`–`0x020ffcc4` |
| 271 | `data_020ffcc4` | `0x020ffcc4` | data | 12 | string | 1 | `0x020ffcc4`–`0x020ffcd0` |
| 272 | `data_020ffcd0` | `0x020ffcd0` | data | 16 | string | 1 | `0x020ffcd0`–`0x020ffce0` |
| 273 | `data_020ffce0` | `0x020ffce0` | data | 16 | string | 1 | `0x020ffce0`–`0x020ffcf0` |
| 274 | `data_020ffcf0` | `0x020ffcf0` | data | 12 | string | 1 | `0x020ffcf0`–`0x020ffcfc` |
| 275 | `data_020ffcfc` | `0x020ffcfc` | data | 8 | string | 1 | `0x020ffcfc`–`0x020ffd04` |
| 276 | `data_020ffd04` | `0x020ffd04` | data | 16 | string | 1 | `0x020ffd04`–`0x020ffd14` |
| 277 | `data_020ffd14` | `0x020ffd14` | data | 12 | string | 1 | `0x020ffd14`–`0x020ffd20` |
| 278 | `data_020ffd20` | `0x020ffd20` | data | 16 | string | 1 | `0x020ffd20`–`0x020ffd30` |
| 279 | `data_020ffd30` | `0x020ffd30` | data | 12 | string | 1 | `0x020ffd30`–`0x020ffd3c` |
| 280 | `data_020ffd50` | `0x020ffd50` | data | 248 | string | 1 | `0x020ffd50`–`0x020ffe48` |
| 281 | `data_020ffe48` | `0x020ffe48` | data | 8 | string | 1 | `0x020ffe48`–`0x020ffe50` |
| 282 | `data_020ffe50` | `0x020ffe50` | data | 4 | string-ascii4 | 1 | `0x020ffe50`–`0x020ffe54` |
| 283 | `data_020ffe54` | `0x020ffe54` | data | 4 | string-ascii4 | 1 | `0x020ffe54`–`0x020ffe58` |
| 284 | `data_020ffe58` | `0x020ffe58` | data | 44 | string | 1 | `0x020ffe58`–`0x020ffe84` |
| 285 | `data_020ffe84` | `0x020ffe84` | data | 8 | string | 1 | `0x020ffe84`–`0x020ffe8c` |
| 286 | `data_020ffe8c` | `0x020ffe8c` | data | 12 | string | 1 | `0x020ffe8c`–`0x020ffe98` |
| 287 | `data_020ffe98` | `0x020ffe98` | data | 16 | string | 1 | `0x020ffe98`–`0x020ffea8` |
| 288 | `data_020ffea8` | `0x020ffea8` | data | 8 | string | 1 | `0x020ffea8`–`0x020ffeb0` |
| 289 | `data_020ffeb0` | `0x020ffeb0` | data | 40 | string | 1 | `0x020ffeb0`–`0x020ffed8` |
| 290 | `data_020ffed8` | `0x020ffed8` | data | 8 | string | 1 | `0x020ffed8`–`0x020ffee0` |
| 291 | `data_020ffee0` | `0x020ffee0` | data | 8 | string | 1 | `0x020ffee0`–`0x020ffee8` |
| 292 | `data_020ffee8` | `0x020ffee8` | data | 48 | string | 1 | `0x020ffee8`–`0x020fff18` |
| 293 | `data_020fff18` | `0x020fff18` | data | 40 | string | 1 | `0x020fff18`–`0x020fff40` |
| 294 | `data_020fff40` | `0x020fff40` | data | 36 | string | 1 | `0x020fff40`–`0x020fff64` |
| 295 | `data_020fff64` | `0x020fff64` | data | 20 | string | 2 | `0x020fff64`–`0x020fff78` |
| 296 | `data_020fff78` | `0x020fff78` | data | 12 | string | 1 | `0x020fff78`–`0x020fff84` |
| 297 | `data_020fff84` | `0x020fff84` | data | 12 | string | 3 | `0x020fff84`–`0x020fff90` |
| 298 | `data_020fff90` | `0x020fff90` | data | 16 | string | 1 | `0x020fff90`–`0x020fffa0` |
| 299 | `data_020fffa0` | `0x020fffa0` | data | 8 | string | 3 | `0x020fffa0`–`0x020fffa8` |
| 300 | `data_020fffa8` | `0x020fffa8` | data | 12 | string | 1 | `0x020fffa8`–`0x020fffb4` |
| 301 | `data_020fffb4` | `0x020fffb4` | data | 12 | string | 1 | `0x020fffb4`–`0x020fffc0` |
| 302 | `data_020fffc0` | `0x020fffc0` | data | 44 | string | 1 | `0x020fffc0`–`0x020fffec` |
| 303 | `data_020fffec` | `0x020fffec` | data | 8 | string | 2 | `0x020fffec`–`0x020ffff4` |
| 304 | `data_020ffff4` | `0x020ffff4` | data | 4 | string-ascii4 | 1 | `0x020ffff4`–`0x020ffff8` |
| 305 | `data_020ffff8` | `0x020ffff8` | data | 8 | string | 2 | `0x020ffff8`–`0x02100000` |
| 306 | `data_02100000` | `0x02100000` | data | 48 | string | 1 | `0x02100000`–`0x02100030` |
| 307 | `data_02100030` | `0x02100030` | data | 4 | string-ascii4 | 1 | `0x02100030`–`0x02100034` |
| 308 | `data_02100034` | `0x02100034` | data | 8 | string | 1 | `0x02100034`–`0x0210003c` |
| 309 | `data_0210003c` | `0x0210003c` | data | 16 | string | 1 | `0x0210003c`–`0x0210004c` |
| 310 | `data_0210004c` | `0x0210004c` | data | 12 | string | 1 | `0x0210004c`–`0x02100058` |
| 311 | `data_02100058` | `0x02100058` | data | 4 | string-ascii4 | 1 | `0x02100058`–`0x0210005c` |
| 312 | `data_0210005c` | `0x0210005c` | data | 8 | string | 1 | `0x0210005c`–`0x02100064` |
| 313 | `data_02100064` | `0x02100064` | data | 8 | string | 1 | `0x02100064`–`0x0210006c` |
| 314 | `data_0210006c` | `0x0210006c` | data | 8 | string | 1 | `0x0210006c`–`0x02100074` |
| 315 | `data_02100074` | `0x02100074` | data | 4 | string-ascii4 | 1 | `0x02100074`–`0x02100078` |
| 316 | `data_02100078` | `0x02100078` | data | 4 | string-ascii4 | 1 | `0x02100078`–`0x0210007c` |
| 317 | `data_0210007c` | `0x0210007c` | data | 4 | string-ascii4 | 1 | `0x0210007c`–`0x02100080` |
| 318 | `data_02100080` | `0x02100080` | data | 12 | string | 1 | `0x02100080`–`0x0210008c` |
| 319 | `data_0210008c` | `0x0210008c` | data | 16 | string | 1 | `0x0210008c`–`0x0210009c` |
| 320 | `data_0210009c` | `0x0210009c` | data | 8 | string | 1 | `0x0210009c`–`0x021000a4` |
| 321 | `data_021000a4` | `0x021000a4` | data | 8 | string | 1 | `0x021000a4`–`0x021000ac` |
| 322 | `data_021000ac` | `0x021000ac` | data | 4 | string-ascii4 | 1 | `0x021000ac`–`0x021000b0` |
| 323 | `data_021000b0` | `0x021000b0` | data | 8 | string | 1 | `0x021000b0`–`0x021000b8` |
| 324 | `data_021000b8` | `0x021000b8` | data | 24 | string | 3 | `0x021000b8`–`0x021000d0` |
| 325 | `data_021000d0` | `0x021000d0` | data | 12 | string | 6 | `0x021000d0`–`0x021000dc` |
| 326 | `data_021000dc` | `0x021000dc` | data | 12 | string | 1 | `0x021000dc`–`0x021000e8` |
| 327 | `data_021000e8` | `0x021000e8` | data | 12 | string | 1 | `0x021000e8`–`0x021000f4` |
| 328 | `data_021000f4` | `0x021000f4` | data | 12 | string | 1 | `0x021000f4`–`0x02100100` |
| 329 | `data_02100100` | `0x02100100` | data | 24 | string | 1 | `0x02100100`–`0x02100118` |
| 330 | `data_02100118` | `0x02100118` | data | 20 | string | 1 | `0x02100118`–`0x0210012c` |
| 331 | `data_0210012c` | `0x0210012c` | data | 20 | string | 1 | `0x0210012c`–`0x02100140` |
| 332 | `data_02100140` | `0x02100140` | data | 20 | string | 1 | `0x02100140`–`0x02100154` |
| 333 | `data_02100154` | `0x02100154` | data | 16 | string | 3 | `0x02100154`–`0x02100164` |
| 334 | `data_02100164` | `0x02100164` | data | 44 | string | 1 | `0x02100164`–`0x02100190` |
| 335 | `data_02100190` | `0x02100190` | data | 36 | string | 1 | `0x02100190`–`0x021001b4` |
| 336 | `data_021001b4` | `0x021001b4` | data | 20 | string | 1 | `0x021001b4`–`0x021001c8` |
| 337 | `data_021001c8` | `0x021001c8` | data | 4 | string-ascii4 | 1 | `0x021001c8`–`0x021001cc` |
| 338 | `data_021001cc` | `0x021001cc` | data | 36 | string | 2 | `0x021001cc`–`0x021001f0` |
| 339 | `data_021001f0` | `0x021001f0` | data | 4 | string-ascii4 | 2 | `0x021001f0`–`0x021001f4` |
| 340 | `data_021001f4` | `0x021001f4` | data | 40 | string | 1 | `0x021001f4`–`0x0210021c` |
| 341 | `data_0210021c` | `0x0210021c` | data | 36 | string | 1 | `0x0210021c`–`0x02100240` |
| 342 | `data_02100240` | `0x02100240` | data | 16 | string | 1 | `0x02100240`–`0x02100250` |
| 343 | `data_02100250` | `0x02100250` | data | 16 | string | 1 | `0x02100250`–`0x02100260` |
| 344 | `data_02100260` | `0x02100260` | data | 32 | string | 1 | `0x02100260`–`0x02100280` |
| 345 | `data_02100280` | `0x02100280` | data | 16 | string | 2 | `0x02100280`–`0x02100290` |
| 346 | `data_02100290` | `0x02100290` | data | 20 | string | 1 | `0x02100290`–`0x021002a4` |
| 347 | `data_021002a4` | `0x021002a4` | data | 16 | string | 1 | `0x021002a4`–`0x021002b4` |
| 348 | `data_021002b4` | `0x021002b4` | data | 20 | string | 1 | `0x021002b4`–`0x021002c8` |
| 349 | `data_021002c8` | `0x021002c8` | data | 24 | string | 1 | `0x021002c8`–`0x021002e0` |
| 350 | `data_021002e0` | `0x021002e0` | data | 48 | string | 1 | `0x021002e0`–`0x02100310` |
| 351 | `data_02100350` | `0x02100350` | data | 20 | string | 1 | `0x02100350`–`0x02100364` |
| 352 | `data_02100364` | `0x02100364` | data | 8 | string | 3 | `0x02100364`–`0x0210036c` |
| 353 | `data_0210036c` | `0x0210036c` | data | 4 | string-ascii4 | 1 | `0x0210036c`–`0x02100370` |
| 354 | `data_02100370` | `0x02100370` | data | 40 | string | 1 | `0x02100370`–`0x02100398` |
| 355 | `data_02100398` | `0x02100398` | data | 24 | string | 1 | `0x02100398`–`0x021003b0` |
| 356 | `data_021003b0` | `0x021003b0` | data | 16 | string | 2 | `0x021003b0`–`0x021003c0` |
| 357 | `data_021003c0` | `0x021003c0` | data | 8 | string | 1 | `0x021003c0`–`0x021003c8` |
| 358 | `data_021003c8` | `0x021003c8` | data | 8 | string | 1 | `0x021003c8`–`0x021003d0` |
| 359 | `data_021003d0` | `0x021003d0` | data | 8 | string | 1 | `0x021003d0`–`0x021003d8` |
| 360 | `data_021003d8` | `0x021003d8` | data | 48 | string | 1 | `0x021003d8`–`0x02100408` |
| 361 | `data_02100408` | `0x02100408` | data | 12 | string | 2 | `0x02100408`–`0x02100414` |
| 362 | `data_02100414` | `0x02100414` | data | 8 | string | 1 | `0x02100414`–`0x0210041c` |
| 363 | `data_0210041c` | `0x0210041c` | data | 12 | string | 2 | `0x0210041c`–`0x02100428` |
| 364 | `data_02100428` | `0x02100428` | data | 48 | string | 1 | `0x02100428`–`0x02100458` |
| 365 | `data_02100458` | `0x02100458` | data | 12 | string | 2 | `0x02100458`–`0x02100464` |
| 366 | `data_02100464` | `0x02100464` | data | 8 | string | 1 | `0x02100464`–`0x0210046c` |
| 367 | `data_0210046c` | `0x0210046c` | data | 12 | string | 1 | `0x0210046c`–`0x02100478` |
| 368 | `data_02100478` | `0x02100478` | data | 16 | string | 3 | `0x02100478`–`0x02100488` |
| 369 | `data_02100488` | `0x02100488` | data | 8 | string | 1 | `0x02100488`–`0x02100490` |
| 370 | `data_02100490` | `0x02100490` | data | 8 | string | 2 | `0x02100490`–`0x02100498` |
| 371 | `data_02100498` | `0x02100498` | data | 16 | string | 2 | `0x02100498`–`0x021004a8` |
| 372 | `data_021004a8` | `0x021004a8` | data | 52 | string | 2 | `0x021004a8`–`0x021004dc` |
| 373 | `data_021004dc` | `0x021004dc` | data | 8 | string | 1 | `0x021004dc`–`0x021004e4` |
| 374 | `data_021004e4` | `0x021004e4` | data | 32 | string | 1 | `0x021004e4`–`0x02100504` |
| 375 | `data_02100504` | `0x02100504` | data | 16 | string | 2 | `0x02100504`–`0x02100514` |
| 376 | `data_02100514` | `0x02100514` | data | 12 | string | 1 | `0x02100514`–`0x02100520` |
| 377 | `data_02100520` | `0x02100520` | data | 8 | string | 1 | `0x02100520`–`0x02100528` |
| 378 | `data_02100528` | `0x02100528` | data | 8 | string | 1 | `0x02100528`–`0x02100530` |
| 379 | `data_02100530` | `0x02100530` | data | 16 | string | 1 | `0x02100530`–`0x02100540` |
| 380 | `data_02100540` | `0x02100540` | data | 12 | string | 2 | `0x02100540`–`0x0210054c` |
| 381 | `data_0210054c` | `0x0210054c` | data | 12 | string | 2 | `0x0210054c`–`0x02100558` |
| 382 | `data_02100558` | `0x02100558` | data | 16 | string | 2 | `0x02100558`–`0x02100568` |
| 383 | `data_02100568` | `0x02100568` | data | 12 | string | 1 | `0x02100568`–`0x02100574` |
| 384 | `data_02100574` | `0x02100574` | data | 8 | string | 2 | `0x02100574`–`0x0210057c` |
| 385 | `data_0210057c` | `0x0210057c` | data | 8 | string | 1 | `0x0210057c`–`0x02100584` |
| 386 | `data_02100584` | `0x02100584` | data | 12 | string | 1 | `0x02100584`–`0x02100590` |
| 387 | `data_02100590` | `0x02100590` | data | 8 | string | 1 | `0x02100590`–`0x02100598` |
| 388 | `data_02100598` | `0x02100598` | data | 4 | string-ascii4 | 1 | `0x02100598`–`0x0210059c` |
| 389 | `data_0210059c` | `0x0210059c` | data | 12 | string | 1 | `0x0210059c`–`0x021005a8` |
| 390 | `data_021005a8` | `0x021005a8` | data | 12 | string | 1 | `0x021005a8`–`0x021005b4` |
| 391 | `data_021005b4` | `0x021005b4` | data | 8 | string | 1 | `0x021005b4`–`0x021005bc` |
| 392 | `data_021005bc` | `0x021005bc` | data | 20 | string | 1 | `0x021005bc`–`0x021005d0` |
| 393 | `data_021005d0` | `0x021005d0` | data | 20 | string | 1 | `0x021005d0`–`0x021005e4` |
| 394 | `data_021005e4` | `0x021005e4` | data | 40 | string | 1 | `0x021005e4`–`0x0210060c` |
| 395 | `data_0210060c` | `0x0210060c` | data | 52 | string | 1 | `0x0210060c`–`0x02100640` |
| 396 | `data_02100640` | `0x02100640` | data | 40 | string | 1 | `0x02100640`–`0x02100668` |
| 397 | `data_02100668` | `0x02100668` | data | 44 | string | 1 | `0x02100668`–`0x02100694` |
| 398 | `data_02100694` | `0x02100694` | data | 48 | string | 1 | `0x02100694`–`0x021006c4` |
| 399 | `data_021006c4` | `0x021006c4` | data | 52 | string | 1 | `0x021006c4`–`0x021006f8` |
| 400 | `data_021006f8` | `0x021006f8` | data | 32 | string | 1 | `0x021006f8`–`0x02100718` |
| 401 | `data_02100718` | `0x02100718` | data | 40 | string | 1 | `0x02100718`–`0x02100740` |
| 402 | `data_02100740` | `0x02100740` | data | 64 | string | 1 | `0x02100740`–`0x02100780` |
| 403 | `data_02100780` | `0x02100780` | data | 16 | string | 2 | `0x02100780`–`0x02100790` |
| 404 | `data_02100790` | `0x02100790` | data | 24 | string | 1 | `0x02100790`–`0x021007a8` |
| 405 | `data_021007a8` | `0x021007a8` | data | 12 | string | 2 | `0x021007a8`–`0x021007b4` |
| 406 | `data_021007b4` | `0x021007b4` | data | 8 | string | 1 | `0x021007b4`–`0x021007bc` |
| 407 | `data_021007bc` | `0x021007bc` | data | 8 | string | 2 | `0x021007bc`–`0x021007c4` |
| 408 | `data_021007c4` | `0x021007c4` | data | 4 | string-ascii4 | 1 | `0x021007c4`–`0x021007c8` |
| 409 | `data_021007c8` | `0x021007c8` | data | 16 | string | 2 | `0x021007c8`–`0x021007d8` |
| 410 | `data_021007d8` | `0x021007d8` | data | 12 | string | 1 | `0x021007d8`–`0x021007e4` |
| 411 | `data_021007e4` | `0x021007e4` | data | 16 | string | 1 | `0x021007e4`–`0x021007f4` |
| 412 | `data_021007f4` | `0x021007f4` | data | 8 | string | 2 | `0x021007f4`–`0x021007fc` |
| 413 | `data_021007fc` | `0x021007fc` | data | 16 | string | 2 | `0x021007fc`–`0x0210080c` |
| 414 | `data_0210080c` | `0x0210080c` | data | 8 | string | 2 | `0x0210080c`–`0x02100814` |
| 415 | `data_02100814` | `0x02100814` | data | 12 | string | 1 | `0x02100814`–`0x02100820` |
| 416 | `data_02100820` | `0x02100820` | data | 12 | string | 2 | `0x02100820`–`0x0210082c` |
| 417 | `data_0210082c` | `0x0210082c` | data | 12 | string | 2 | `0x0210082c`–`0x02100838` |
| 418 | `data_02100838` | `0x02100838` | data | 12 | string | 2 | `0x02100838`–`0x02100844` |
| 419 | `data_02100844` | `0x02100844` | data | 12 | string | 3 | `0x02100844`–`0x02100850` |
| 420 | `data_02100850` | `0x02100850` | data | 24 | string | 1 | `0x02100850`–`0x02100868` |
| 421 | `data_02100868` | `0x02100868` | data | 16 | string | 2 | `0x02100868`–`0x02100878` |
| 422 | `data_02100878` | `0x02100878` | data | 4 | string-ascii4 | 2 | `0x02100878`–`0x0210087c` |
| 423 | `data_0210087c` | `0x0210087c` | data | 4 | string-ascii4 | 2 | `0x0210087c`–`0x02100880` |
| 424 | `data_02100880` | `0x02100880` | data | 4 | string-ascii4 | 2 | `0x02100880`–`0x02100884` |
| 425 | `data_02100884` | `0x02100884` | data | 8 | string | 3 | `0x02100884`–`0x0210088c` |
| 426 | `data_0210088c` | `0x0210088c` | data | 12 | string | 3 | `0x0210088c`–`0x02100898` |
| 427 | `data_02100898` | `0x02100898` | data | 20 | string | 1 | `0x02100898`–`0x021008ac` |
| 428 | `data_021008ac` | `0x021008ac` | data | 20 | string | 1 | `0x021008ac`–`0x021008c0` |
| 429 | `data_021008c0` | `0x021008c0` | data | 12 | string | 1 | `0x021008c0`–`0x021008cc` |
| 430 | `data_021008cc` | `0x021008cc` | data | 8 | string | 2 | `0x021008cc`–`0x021008d4` |
| 431 | `data_021008d4` | `0x021008d4` | data | 8 | string | 3 | `0x021008d4`–`0x021008dc` |
| 432 | `data_021008dc` | `0x021008dc` | data | 8 | string | 3 | `0x021008dc`–`0x021008e4` |
| 433 | `data_021008e4` | `0x021008e4` | data | 8 | string | 3 | `0x021008e4`–`0x021008ec` |
| 434 | `data_021008ec` | `0x021008ec` | data | 8 | string | 3 | `0x021008ec`–`0x021008f4` |
| 435 | `data_021008f4` | `0x021008f4` | data | 8 | string | 3 | `0x021008f4`–`0x021008fc` |
| 436 | `data_021008fc` | `0x021008fc` | data | 8 | string | 3 | `0x021008fc`–`0x02100904` |
| 437 | `data_02100904` | `0x02100904` | data | 8 | string | 3 | `0x02100904`–`0x0210090c` |
| 438 | `data_0210090c` | `0x0210090c` | data | 20 | string | 1 | `0x0210090c`–`0x02100920` |
| 439 | `data_02100920` | `0x02100920` | data | 16 | string | 1 | `0x02100920`–`0x02100930` |
| 440 | `data_02100930` | `0x02100930` | data | 16 | string | 1 | `0x02100930`–`0x02100940` |
| 441 | `data_02100940` | `0x02100940` | data | 12 | string | 1 | `0x02100940`–`0x0210094c` |
| 442 | `data_0210094c` | `0x0210094c` | data | 12 | string | 1 | `0x0210094c`–`0x02100958` |
| 443 | `data_02100958` | `0x02100958` | data | 16 | string | 1 | `0x02100958`–`0x02100968` |
| 444 | `data_02100968` | `0x02100968` | data | 16 | string | 1 | `0x02100968`–`0x02100978` |
| 445 | `data_02100978` | `0x02100978` | data | 16 | string | 1 | `0x02100978`–`0x02100988` |
| 446 | `data_02100988` | `0x02100988` | data | 20 | string | 1 | `0x02100988`–`0x0210099c` |
| 447 | `data_0210099c` | `0x0210099c` | data | 16 | string | 1 | `0x0210099c`–`0x021009ac` |
| 448 | `data_021009ac` | `0x021009ac` | data | 24 | string | 1 | `0x021009ac`–`0x021009c4` |
| 449 | `data_021009c4` | `0x021009c4` | data | 20 | string | 1 | `0x021009c4`–`0x021009d8` |
| 450 | `data_021009d8` | `0x021009d8` | data | 8 | string | 1 | `0x021009d8`–`0x021009e0` |
| 451 | `data_021009e0` | `0x021009e0` | data | 48 | string | 1 | `0x021009e0`–`0x02100a10` |
| 452 | `data_02100a10` | `0x02100a10` | data | 16 | string | 1 | `0x02100a10`–`0x02100a20` |
| 453 | `data_02100a20` | `0x02100a20` | data | 12 | string | 2 | `0x02100a20`–`0x02100a2c` |
| 454 | `data_02100a2c` | `0x02100a2c` | data | 8 | string | 1 | `0x02100a2c`–`0x02100a34` |
| 455 | `data_02100a34` | `0x02100a34` | data | 8 | string | 1 | `0x02100a34`–`0x02100a3c` |
| 456 | `data_02100a3c` | `0x02100a3c` | data | 8 | string | 1 | `0x02100a3c`–`0x02100a44` |
| 457 | `data_02100a44` | `0x02100a44` | data | 8 | string | 1 | `0x02100a44`–`0x02100a4c` |
| 458 | `data_02100a4c` | `0x02100a4c` | data | 8 | string | 1 | `0x02100a4c`–`0x02100a54` |
| 459 | `data_02100a54` | `0x02100a54` | data | 8 | string | 1 | `0x02100a54`–`0x02100a5c` |
| 460 | `data_02100a5c` | `0x02100a5c` | data | 8 | string | 1 | `0x02100a5c`–`0x02100a64` |
| 461 | `data_02100a64` | `0x02100a64` | data | 24 | string | 1 | `0x02100a64`–`0x02100a7c` |
| 462 | `data_02100a7c` | `0x02100a7c` | data | 16 | string | 1 | `0x02100a7c`–`0x02100a8c` |
| 463 | `data_02100a8c` | `0x02100a8c` | data | 72 | string | 1 | `0x02100a8c`–`0x02100ad4` |
| 464 | `data_02100ad4` | `0x02100ad4` | data | 4 | string-ascii4 | 2 | `0x02100ad4`–`0x02100ad8` |
| 465 | `data_02100ad8` | `0x02100ad8` | data | 16 | string | 3 | `0x02100ad8`–`0x02100ae8` |
| 466 | `data_02100ae8` | `0x02100ae8` | data | 32 | string | 1 | `0x02100ae8`–`0x02100b08` |
| 467 | `data_02100b08` | `0x02100b08` | data | 16 | string | 2 | `0x02100b08`–`0x02100b18` |
| 468 | `data_02100b18` | `0x02100b18` | data | 20 | string | 1 | `0x02100b18`–`0x02100b2c` |
| 469 | `data_02100b2c` | `0x02100b2c` | data | 20 | string | 1 | `0x02100b2c`–`0x02100b40` |
| 470 | `data_02100b40` | `0x02100b40` | data | 20 | string | 1 | `0x02100b40`–`0x02100b54` |
| 471 | `data_02100b54` | `0x02100b54` | data | 16 | string | 3 | `0x02100b54`–`0x02100b64` |
| 472 | `data_02100b64` | `0x02100b64` | data | 12 | string | 7 | `0x02100b64`–`0x02100b70` |
| 473 | `data_02100b84` | `0x02100b84` | data | 12 | string | 1 | `0x02100b84`–`0x02100b90` |
| 474 | `data_02100b90` | `0x02100b90` | data | 20 | string | 1 | `0x02100b90`–`0x02100ba4` |
| 475 | `data_02100ba4` | `0x02100ba4` | data | 16 | string | 1 | `0x02100ba4`–`0x02100bb4` |
| 476 | `data_02100bb4` | `0x02100bb4` | data | 4 | string-ascii4 | 1 | `0x02100bb4`–`0x02100bb8` |
| 477 | `data_02100bb8` | `0x02100bb8` | data | 8 | string | 1 | `0x02100bb8`–`0x02100bc0` |
| 478 | `data_02100bc0` | `0x02100bc0` | data | 8 | string | 1 | `0x02100bc0`–`0x02100bc8` |
| 479 | `data_02100bc8` | `0x02100bc8` | data | 28 | string | 2 | `0x02100bc8`–`0x02100be4` |
| 480 | `data_02100be4` | `0x02100be4` | data | 40 | string | 1 | `0x02100be4`–`0x02100c0c` |
| 481 | `data_02100c0c` | `0x02100c0c` | data | 52 | string | 1 | `0x02100c0c`–`0x02100c40` |
| 482 | `data_02100c40` | `0x02100c40` | data | 40 | string | 1 | `0x02100c40`–`0x02100c68` |
| 483 | `data_02100c68` | `0x02100c68` | data | 4 | string-ascii4 | 2 | `0x02100c68`–`0x02100c6c` |
| 484 | `data_02100c6c` | `0x02100c6c` | data | 36 | string | 1 | `0x02100c6c`–`0x02100c90` |
| 485 | `data_02100c90` | `0x02100c90` | data | 40 | string | 1 | `0x02100c90`–`0x02100cb8` |
| 486 | `data_02100cb8` | `0x02100cb8` | data | 4 | string-ascii4 | 4 | `0x02100cb8`–`0x02100cbc` |
| 487 | `data_02100cbc` | `0x02100cbc` | data | 16 | string | 1 | `0x02100cbc`–`0x02100ccc` |
| 488 | `data_02100ccc` | `0x02100ccc` | data | 4 | string-ascii4 | 1 | `0x02100ccc`–`0x02100cd0` |
| 489 | `data_02100cd0` | `0x02100cd0` | data | 32 | string | 1 | `0x02100cd0`–`0x02100cf0` |
| 490 | `data_02100cf0` | `0x02100cf0` | data | 8 | string | 2 | `0x02100cf0`–`0x02100cf8` |
| 491 | `data_02100cf8` | `0x02100cf8` | data | 8 | string | 2 | `0x02100cf8`–`0x02100d00` |
| 492 | `data_02100d00` | `0x02100d00` | data | 8 | string | 2 | `0x02100d00`–`0x02100d08` |
| 493 | `data_02100d08` | `0x02100d08` | data | 8 | string | 2 | `0x02100d08`–`0x02100d10` |
| 494 | `data_02100d10` | `0x02100d10` | data | 8 | string | 2 | `0x02100d10`–`0x02100d18` |
| 495 | `data_02100d18` | `0x02100d18` | data | 8 | string | 1 | `0x02100d18`–`0x02100d20` |
| 496 | `data_02100d20` | `0x02100d20` | data | 8 | string | 2 | `0x02100d20`–`0x02100d28` |
| 497 | `data_02100d28` | `0x02100d28` | data | 8 | string | 2 | `0x02100d28`–`0x02100d30` |
| 498 | `data_02100d30` | `0x02100d30` | data | 36 | string | 1 | `0x02100d30`–`0x02100d54` |
| 499 | `data_02100d54` | `0x02100d54` | data | 32 | string | 1 | `0x02100d54`–`0x02100d74` |
| 500 | `data_02100d74` | `0x02100d74` | data | 8 | string | 1 | `0x02100d74`–`0x02100d7c` |
| 501 | `data_02100d7c` | `0x02100d7c` | data | 16 | string | 1 | `0x02100d7c`–`0x02100d8c` |
| 502 | `data_02100d8c` | `0x02100d8c` | data | 8 | string | 1 | `0x02100d8c`–`0x02100d94` |
| 503 | `data_02100d94` | `0x02100d94` | data | 48 | string | 1 | `0x02100d94`–`0x02100dc4` |
| 504 | `data_02100dc4` | `0x02100dc4` | data | 12 | string | 1 | `0x02100dc4`–`0x02100dd0` |
| 505 | `data_02100dd0` | `0x02100dd0` | data | 16 | string | 1 | `0x02100dd0`–`0x02100de0` |
| 506 | `data_02100e20` | `0x02100e20` | data | 16 | string | 4 | `0x02100e20`–`0x02100e30` |
| 507 | `data_02100e30` | `0x02100e30` | data | 32 | string | 1 | `0x02100e30`–`0x02100e50` |
| 508 | `data_02100e50` | `0x02100e50` | data | 12 | string | 3 | `0x02100e50`–`0x02100e5c` |
| 509 | `data_02100e5c` | `0x02100e5c` | data | 4 | string-ascii4 | 1 | `0x02100e5c`–`0x02100e60` |
| 510 | `data_02100e60` | `0x02100e60` | data | 44 | string | 1 | `0x02100e60`–`0x02100e8c` |
| 511 | `data_02100e8c` | `0x02100e8c` | data | 12 | string | 1 | `0x02100e8c`–`0x02100e98` |
| 512 | `data_02100e98` | `0x02100e98` | data | 12 | string | 1 | `0x02100e98`–`0x02100ea4` |
| 513 | `data_02100ea4` | `0x02100ea4` | data | 12 | string | 1 | `0x02100ea4`–`0x02100eb0` |
| 514 | `data_02100eb0` | `0x02100eb0` | data | 16 | string | 1 | `0x02100eb0`–`0x02100ec0` |
| 515 | `data_02100ec0` | `0x02100ec0` | data | 8 | string | 1 | `0x02100ec0`–`0x02100ec8` |
| 516 | `data_02100ec8` | `0x02100ec8` | data | 16 | string | 1 | `0x02100ec8`–`0x02100ed8` |
| 517 | `data_02100ed8` | `0x02100ed8` | data | 8 | string | 1 | `0x02100ed8`–`0x02100ee0` |
| 518 | `data_02100ee0` | `0x02100ee0` | data | 12 | string | 1 | `0x02100ee0`–`0x02100eec` |
| 519 | `data_02100eec` | `0x02100eec` | data | 12 | string | 1 | `0x02100eec`–`0x02100ef8` |
| 520 | `data_02100ef8` | `0x02100ef8` | data | 12 | string | 1 | `0x02100ef8`–`0x02100f04` |
| 521 | `data_02100f04` | `0x02100f04` | data | 8 | string | 1 | `0x02100f04`–`0x02100f0c` |
| 522 | `data_02100f0c` | `0x02100f0c` | data | 8 | string | 1 | `0x02100f0c`–`0x02100f14` |
| 523 | `data_02100f14` | `0x02100f14` | data | 8 | string | 1 | `0x02100f14`–`0x02100f1c` |
| 524 | `data_02100f1c` | `0x02100f1c` | data | 8 | string | 1 | `0x02100f1c`–`0x02100f24` |
| 525 | `data_02100f24` | `0x02100f24` | data | 12 | string | 1 | `0x02100f24`–`0x02100f30` |
| 526 | `data_02100f30` | `0x02100f30` | data | 12 | string | 1 | `0x02100f30`–`0x02100f3c` |
| 527 | `data_02100f3c` | `0x02100f3c` | data | 8 | string | 1 | `0x02100f3c`–`0x02100f44` |
| 528 | `data_02100f44` | `0x02100f44` | data | 12 | string | 1 | `0x02100f44`–`0x02100f50` |
| 529 | `data_02100f50` | `0x02100f50` | data | 12 | string | 1 | `0x02100f50`–`0x02100f5c` |
| 530 | `data_02100f5c` | `0x02100f5c` | data | 8 | string | 1 | `0x02100f5c`–`0x02100f64` |
| 531 | `data_02100f64` | `0x02100f64` | data | 12 | string | 1 | `0x02100f64`–`0x02100f70` |
| 532 | `data_02100f70` | `0x02100f70` | data | 16 | string | 1 | `0x02100f70`–`0x02100f80` |
| 533 | `data_02100f80` | `0x02100f80` | data | 16 | string | 1 | `0x02100f80`–`0x02100f90` |
| 534 | `data_02100f90` | `0x02100f90` | data | 4 | string-ascii4 | 1 | `0x02100f90`–`0x02100f94` |
| 535 | `data_02100f94` | `0x02100f94` | data | 12 | string | 1 | `0x02100f94`–`0x02100fa0` |
| 536 | `data_02100fa0` | `0x02100fa0` | data | 8 | string | 1 | `0x02100fa0`–`0x02100fa8` |
| 537 | `data_02100fa8` | `0x02100fa8` | data | 44 | string | 1 | `0x02100fa8`–`0x02100fd4` |
| 538 | `data_02100fd4` | `0x02100fd4` | data | 8 | string | 1 | `0x02100fd4`–`0x02100fdc` |
| 539 | `data_02100fdc` | `0x02100fdc` | data | 8 | string | 1 | `0x02100fdc`–`0x02100fe4` |
| 540 | `data_02100fe4` | `0x02100fe4` | data | 4 | string-ascii4 | 1 | `0x02100fe4`–`0x02100fe8` |
| 541 | `data_02100fe8` | `0x02100fe8` | data | 8 | string | 1 | `0x02100fe8`–`0x02100ff0` |
| 542 | `data_02100ff0` | `0x02100ff0` | data | 12 | string | 1 | `0x02100ff0`–`0x02100ffc` |
| 543 | `data_02100ffc` | `0x02100ffc` | data | 12 | string | 1 | `0x02100ffc`–`0x02101008` |
| 544 | `data_02101008` | `0x02101008` | data | 12 | string | 1 | `0x02101008`–`0x02101014` |
| 545 | `data_02101014` | `0x02101014` | data | 8 | string | 1 | `0x02101014`–`0x0210101c` |
| 546 | `data_0210101c` | `0x0210101c` | data | 40 | string | 1 | `0x0210101c`–`0x02101044` |
| 547 | `data_02101044` | `0x02101044` | data | 4 | string-ascii4 | 1 | `0x02101044`–`0x02101048` |
| 548 | `data_02101048` | `0x02101048` | data | 4 | string-ascii4 | 1 | `0x02101048`–`0x0210104c` |
| 549 | `data_0210104c` | `0x0210104c` | data | 8 | string | 1 | `0x0210104c`–`0x02101054` |
| 550 | `data_02101054` | `0x02101054` | data | 8 | string | 1 | `0x02101054`–`0x0210105c` |
| 551 | `data_0210105c` | `0x0210105c` | data | 4 | string-ascii4 | 1 | `0x0210105c`–`0x02101060` |
| 552 | `data_02101060` | `0x02101060` | data | 8 | string | 1 | `0x02101060`–`0x02101068` |
| 553 | `data_02101068` | `0x02101068` | data | 12 | string | 1 | `0x02101068`–`0x02101074` |
| 554 | `data_02101074` | `0x02101074` | data | 4 | string-ascii4 | 1 | `0x02101074`–`0x02101078` |
| 555 | `data_02101078` | `0x02101078` | data | 8 | string | 1 | `0x02101078`–`0x02101080` |
| 556 | `data_02101080` | `0x02101080` | data | 4 | string-ascii4 | 1 | `0x02101080`–`0x02101084` |
| 557 | `data_02101084` | `0x02101084` | data | 8 | string | 1 | `0x02101084`–`0x0210108c` |
| 558 | `data_0210108c` | `0x0210108c` | data | 8 | string | 1 | `0x0210108c`–`0x02101094` |
| 559 | `data_02101094` | `0x02101094` | data | 4 | string-ascii4 | 1 | `0x02101094`–`0x02101098` |
| 560 | `data_02101098` | `0x02101098` | data | 8 | string | 1 | `0x02101098`–`0x021010a0` |
| 561 | `data_021010a0` | `0x021010a0` | data | 8 | string | 1 | `0x021010a0`–`0x021010a8` |
| 562 | `data_021010a8` | `0x021010a8` | data | 4 | string-ascii4 | 1 | `0x021010a8`–`0x021010ac` |
| 563 | `data_021010ac` | `0x021010ac` | data | 8 | string | 1 | `0x021010ac`–`0x021010b4` |
| 564 | `data_021010b4` | `0x021010b4` | data | 32 | string | 1 | `0x021010b4`–`0x021010d4` |
| 565 | `data_021010d4` | `0x021010d4` | data | 20 | string | 1 | `0x021010d4`–`0x021010e8` |
| 566 | `data_021010e8` | `0x021010e8` | data | 40 | string | 1 | `0x021010e8`–`0x02101110` |
| 567 | `data_02101110` | `0x02101110` | data | 52 | string | 1 | `0x02101110`–`0x02101144` |
| 568 | `data_02101144` | `0x02101144` | data | 48 | string | 1 | `0x02101144`–`0x02101174` |
| 569 | `data_02101174` | `0x02101174` | data | 32 | string | 1 | `0x02101174`–`0x02101194` |
| 570 | `data_02101194` | `0x02101194` | data | 40 | string | 1 | `0x02101194`–`0x021011bc` |
| 571 | `data_021011bc` | `0x021011bc` | data | 8 | string | 1 | `0x021011bc`–`0x021011c4` |
| 572 | `data_021011c4` | `0x021011c4` | data | 12 | string | 1 | `0x021011c4`–`0x021011d0` |
| 573 | `data_021011ec` | `0x021011ec` | data | 8 | string | 1 | `0x021011ec`–`0x021011f4` |
| 574 | `data_021011f4` | `0x021011f4` | data | 48 | string | 1 | `0x021011f4`–`0x02101224` |
| 575 | `data_02101224` | `0x02101224` | data | 16 | string | 1 | `0x02101224`–`0x02101234` |
| 576 | `data_02101234` | `0x02101234` | data | 16 | string | 1 | `0x02101234`–`0x02101244` |
| 577 | `data_02101244` | `0x02101244` | data | 16 | string | 3 | `0x02101244`–`0x02101254` |
| 578 | `data_02101254` | `0x02101254` | data | 12 | string | 2 | `0x02101254`–`0x02101260` |
| 579 | `data_02101260` | `0x02101260` | data | 16 | string | 2 | `0x02101260`–`0x02101270` |
| 580 | `data_02101270` | `0x02101270` | data | 16 | string | 1 | `0x02101270`–`0x02101280` |
| 581 | `data_02101280` | `0x02101280` | data | 20 | string | 1 | `0x02101280`–`0x02101294` |
| 582 | `data_02101294` | `0x02101294` | data | 56 | string | 1 | `0x02101294`–`0x021012cc` |
| 583 | `data_021012cc` | `0x021012cc` | data | 24 | string | 1 | `0x021012cc`–`0x021012e4` |
| 584 | `data_021012e4` | `0x021012e4` | data | 24 | string | 1 | `0x021012e4`–`0x021012fc` |
| 585 | `data_021012fc` | `0x021012fc` | data | 16 | string | 1 | `0x021012fc`–`0x0210130c` |
| 586 | `data_0210130c` | `0x0210130c` | data | 8 | string | 1 | `0x0210130c`–`0x02101314` |
| 587 | `data_02101314` | `0x02101314` | data | 8 | string | 1 | `0x02101314`–`0x0210131c` |
| 588 | `data_0210131c` | `0x0210131c` | data | 8 | string | 1 | `0x0210131c`–`0x02101324` |
| 589 | `data_02101324` | `0x02101324` | data | 12 | string | 1 | `0x02101324`–`0x02101330` |
| 590 | `data_02101330` | `0x02101330` | data | 8 | string | 1 | `0x02101330`–`0x02101338` |
| 591 | `data_02101338` | `0x02101338` | data | 16 | string | 1 | `0x02101338`–`0x02101348` |
| 592 | `data_02101348` | `0x02101348` | data | 12 | string | 1 | `0x02101348`–`0x02101354` |
| 593 | `data_0210137c` | `0x0210137c` | data | 12 | string | 1 | `0x0210137c`–`0x02101388` |
| 594 | `data_02101388` | `0x02101388` | data | 12 | string | 1 | `0x02101388`–`0x02101394` |
| 595 | `data_02101394` | `0x02101394` | data | 12 | string | 1 | `0x02101394`–`0x021013a0` |
| 596 | `data_021013a0` | `0x021013a0` | data | 12 | string | 1 | `0x021013a0`–`0x021013ac` |
| 597 | `data_021013ac` | `0x021013ac` | data | 8 | string | 1 | `0x021013ac`–`0x021013b4` |
| 598 | `data_021013b4` | `0x021013b4` | data | 4 | string-ascii4 | 2 | `0x021013b4`–`0x021013b8` |
| 599 | `data_021013b8` | `0x021013b8` | data | 4 | string-ascii4 | 4 | `0x021013b8`–`0x021013bc` |
| 600 | `data_021013bc` | `0x021013bc` | data | 4 | string-ascii4 | 2 | `0x021013bc`–`0x021013c0` |
| 601 | `data_021013c0` | `0x021013c0` | data | 8 | string | 1 | `0x021013c0`–`0x021013c8` |
| 602 | `data_021013c8` | `0x021013c8` | data | 8 | string | 1 | `0x021013c8`–`0x021013d0` |
| 603 | `data_021013d0` | `0x021013d0` | data | 8 | string | 1 | `0x021013d0`–`0x021013d8` |
| 604 | `data_021013e4` | `0x021013e4` | data | 8 | string | 1 | `0x021013e4`–`0x021013ec` |
| 605 | `data_021013ec` | `0x021013ec` | data | 8 | string | 1 | `0x021013ec`–`0x021013f4` |
| 606 | `data_021013f4` | `0x021013f4` | data | 4 | string-ascii4 | 1 | `0x021013f4`–`0x021013f8` |
| 607 | `data_021013f8` | `0x021013f8` | data | 36 | string | 1 | `0x021013f8`–`0x0210141c` |
| 608 | `data_0210141c` | `0x0210141c` | data | 8 | string | 1 | `0x0210141c`–`0x02101424` |
| 609 | `data_02101424` | `0x02101424` | data | 12 | string | 1 | `0x02101424`–`0x02101430` |
| 610 | `data_02101430` | `0x02101430` | data | 24 | string | 1 | `0x02101430`–`0x02101448` |
| 611 | `data_02101448` | `0x02101448` | data | 12 | string | 4 | `0x02101448`–`0x02101454` |
| 612 | `data_02101454` | `0x02101454` | data | 36 | string | 1 | `0x02101454`–`0x02101478` |
| 613 | `data_02101478` | `0x02101478` | data | 36 | string | 1 | `0x02101478`–`0x0210149c` |
| 614 | `data_0210149c` | `0x0210149c` | data | 36 | string | 1 | `0x0210149c`–`0x021014c0` |
| 615 | `data_021014c0` | `0x021014c0` | data | 28 | string | 1 | `0x021014c0`–`0x021014dc` |
| 616 | `data_021014dc` | `0x021014dc` | data | 8 | string | 3 | `0x021014dc`–`0x021014e4` |
| 617 | `data_021014e4` | `0x021014e4` | data | 16 | string | 10 | `0x021014e4`–`0x021014f4` |
| 618 | `data_021014f4` | `0x021014f4` | data | 12 | string | 6 | `0x021014f4`–`0x02101500` |
| 619 | `data_02101500` | `0x02101500` | data | 24 | string | 1 | `0x02101500`–`0x02101518` |
| 620 | `data_02101518` | `0x02101518` | data | 12 | string | 2 | `0x02101518`–`0x02101524` |
| 621 | `data_02101524` | `0x02101524` | data | 12 | string | 2 | `0x02101524`–`0x02101530` |
| 622 | `data_02101534` | `0x02101534` | data | 8 | string | 1 | `0x02101534`–`0x0210153c` |
| 623 | `data_0210153c` | `0x0210153c` | data | 8 | string | 1 | `0x0210153c`–`0x02101544` |
| 624 | `data_02101544` | `0x02101544` | data | 16 | string | 1 | `0x02101544`–`0x02101554` |
| 625 | `data_02101578` | `0x02101578` | data | 16 | string | 1 | `0x02101578`–`0x02101588` |
| 626 | `data_02101588` | `0x02101588` | data | 8 | string | 1 | `0x02101588`–`0x02101590` |
| 627 | `data_02101590` | `0x02101590` | data | 4 | string-ascii4 | 1 | `0x02101590`–`0x02101594` |
| 628 | `data_021015a0` | `0x021015a0` | data | 28 | string | 1 | `0x021015a0`–`0x021015bc` |
| 629 | `data_021015bc` | `0x021015bc` | data | 28 | string | 1 | `0x021015bc`–`0x021015d8` |
| 630 | `data_021015d8` | `0x021015d8` | data | 8 | string | 1 | `0x021015d8`–`0x021015e0` |
| 631 | `data_021016f4` | `0x021016f4` | data | 12 | string | 1 | `0x021016f4`–`0x02101700` |
| 632 | `data_02101700` | `0x02101700` | data | 12 | string | 1 | `0x02101700`–`0x0210170c` |
| 633 | `data_0210170c` | `0x0210170c` | data | 8 | string | 1 | `0x0210170c`–`0x02101714` |
| 634 | `data_02101714` | `0x02101714` | data | 4 | string-ascii4 | 1 | `0x02101714`–`0x02101718` |
| 635 | `data_02101718` | `0x02101718` | data | 4 | string-ascii4 | 1 | `0x02101718`–`0x0210171c` |
| 636 | `data_0210171c` | `0x0210171c` | data | 16 | string | 1 | `0x0210171c`–`0x0210172c` |
| 637 | `data_0210172c` | `0x0210172c` | data | 12 | string | 1 | `0x0210172c`–`0x02101738` |
| 638 | `data_02101738` | `0x02101738` | data | 12 | string | 1 | `0x02101738`–`0x02101744` |
| 639 | `data_02101744` | `0x02101744` | data | 12 | string | 1 | `0x02101744`–`0x02101750` |
| 640 | `data_02101750` | `0x02101750` | data | 20 | string | 1 | `0x02101750`–`0x02101764` |
| 641 | `data_02101764` | `0x02101764` | data | 8 | string | 2 | `0x02101764`–`0x0210176c` |
| 642 | `data_02101778` | `0x02101778` | data | 12 | string | 1 | `0x02101778`–`0x02101784` |
| 643 | `data_02101784` | `0x02101784` | data | 16 | string | 1 | `0x02101784`–`0x02101794` |
| 644 | `data_02101794` | `0x02101794` | data | 4 | string-ascii4 | 1 | `0x02101794`–`0x02101798` |
| 645 | `data_02101798` | `0x02101798` | data | 56 | string | 1 | `0x02101798`–`0x021017d0` |
| 646 | `data_021017d0` | `0x021017d0` | data | 32 | string | 1 | `0x021017d0`–`0x021017f0` |
| 647 | `data_02101d20` | `0x02101d20` | data | 8 | string | 1 | `0x02101d20`–`0x02101d28` |
| 648 | `data_02101d28` | `0x02101d28` | data | 16 | string | 1 | `0x02101d28`–`0x02101d38` |
| 649 | `data_02101d38` | `0x02101d38` | data | 12 | string | 1 | `0x02101d38`–`0x02101d44` |
| 650 | `data_02101d54` | `0x02101d54` | data | 8 | string | 1 | `0x02101d54`–`0x02101d5c` |
| 651 | `data_02101d68` | `0x02101d68` | data | 8 | string | 1 | `0x02101d68`–`0x02101d70` |
| 652 | `data_02101d70` | `0x02101d70` | data | 12 | string | 1 | `0x02101d70`–`0x02101d7c` |
| 653 | `data_02101d7c` | `0x02101d7c` | data | 4 | string-ascii4 | 1 | `0x02101d7c`–`0x02101d80` |
| 654 | `data_02101d80` | `0x02101d80` | data | 4 | string-ascii4 | 1 | `0x02101d80`–`0x02101d84` |
| 655 | `data_02101d98` | `0x02101d98` | data | 24 | string | 1 | `0x02101d98`–`0x02101db0` |
| 656 | `data_02101db0` | `0x02101db0` | data | 16 | string | 6 | `0x02101db0`–`0x02101dc0` |
| 657 | `data_02101dc0` | `0x02101dc0` | data | 12 | string | 1 | `0x02101dc0`–`0x02101dcc` |
| 658 | `data_02101dd4` | `0x02101dd4` | data | 4 | string-ascii4 | 1 | `0x02101dd4`–`0x02101dd8` |
| 659 | `data_02101dd8` | `0x02101dd8` | data | 32 | string | 1 | `0x02101dd8`–`0x02101df8` |
| 660 | `data_02101e18` | `0x02101e18` | data | 16 | string | 1 | `0x02101e18`–`0x02101e28` |
| 661 | `data_02101e28` | `0x02101e28` | data | 20 | string | 1 | `0x02101e28`–`0x02101e3c` |
| 662 | `data_02101e3c` | `0x02101e3c` | data | 12 | string | 1 | `0x02101e3c`–`0x02101e48` |
| 663 | `data_02101e94` | `0x02101e94` | data | 12 | string | 1 | `0x02101e94`–`0x02101ea0` |
| 664 | `data_02101eac` | `0x02101eac` | data | 12 | string | 1 | `0x02101eac`–`0x02101eb8` |
| 665 | `data_02101f18` | `0x02101f18` | data | 8 | string | 2 | `0x02101f18`–`0x02101f20` |
| 666 | `data_02101f20` | `0x02101f20` | data | 8 | string | 2 | `0x02101f20`–`0x02101f28` |
| 667 | `data_02101f28` | `0x02101f28` | data | 4 | string-ascii4 | 1 | `0x02101f28`–`0x02101f2c` |
| 668 | `data_02101f2c` | `0x02101f2c` | data | 4 | string-ascii4 | 1 | `0x02101f2c`–`0x02101f30` |
| 669 | `data_021024b4` | `0x021024b4` | data | 4 | string-ascii4 | 1 | `0x021024b4`–`0x021024b8` |
| 670 | `data_021024b8` | `0x021024b8` | data | 4 | string-ascii4 | 1 | `0x021024b8`–`0x021024bc` |
| 671 | `data_021026f0` | `0x021026f0` | data | 4 | string-ascii4 | 3 | `0x021026f0`–`0x021026f4` |
| 672 | `data_021027fc` | `0x021027fc` | data | 56 | string | 1 | `0x021027fc`–`0x02102834` |
| 673 | `data_02102a60` | `0x02102a60` | data | 8 | string | 1 | `0x02102a60`–`0x02102a68` |
| 674 | `data_02102a68` | `0x02102a68` | data | 8 | string | 2 | `0x02102a68`–`0x02102a70` |
| 675 | `data_02102a70` | `0x02102a70` | data | 8 | string | 2 | `0x02102a70`–`0x02102a78` |
| 676 | `data_02102a78` | `0x02102a78` | data | 4 | string-ascii4 | 2 | `0x02102a78`–`0x02102a7c` |
| 677 | `data_02102a7c` | `0x02102a7c` | data | 4 | string-ascii4 | 2 | `0x02102a7c`–`0x02102a80` |
| 678 | `data_02102a80` | `0x02102a80` | data | 8 | string | 2 | `0x02102a80`–`0x02102a88` |
| 679 | `data_02102a88` | `0x02102a88` | data | 8 | string | 2 | `0x02102a88`–`0x02102a90` |
| 680 | `data_02102a90` | `0x02102a90` | data | 4 | string-ascii4 | 2 | `0x02102a90`–`0x02102a94` |
| 681 | `data_02102b48` | `0x02102b48` | data | 48 | string | 1 | `0x02102b48`–`0x02102b78` |
| 682 | `data_02102b78` | `0x02102b78` | data | 40 | string | 1 | `0x02102b78`–`0x02102ba0` |
| 683 | `data_02102ba0` | `0x02102ba0` | data | 24 | string | 1 | `0x02102ba0`–`0x02102bb8` |
| 684 | `data_02102bb8` | `0x02102bb8` | data | 16 | string | 1 | `0x02102bb8`–`0x02102bc8` |
| 685 | `data_02102bc8` | `0x02102bc8` | data | 8 | string | 1 | `0x02102bc8`–`0x02102bd0` |
| 686 | `data_02102bd0` | `0x02102bd0` | data | 8 | string | 1 | `0x02102bd0`–`0x02102bd8` |
| 687 | `data_02102bd8` | `0x02102bd8` | data | 8 | string | 1 | `0x02102bd8`–`0x02102be0` |
| 688 | `data_02102be0` | `0x02102be0` | data | 8 | string | 1 | `0x02102be0`–`0x02102be8` |
| 689 | `data_02102c1c` | `0x02102c1c` | data | 40 | string | 1 | `0x02102c1c`–`0x02102c44` |

### Supplementary: 5 more records, discovered by Part 2's investigation

Not part of the 689-symbol shape-filtered pool above (found via the
data-table-reader investigation, not the `--shape string,string-ascii4`
query) -- listed separately so the two provenances stay distinguishable:

| # | Symbol(s) | Addr span | Sec | Size (B) | Declarations | Reader |
|---:|---|---|---|---:|---:|---|
| 1 | `data_020c3ca8` | `0x020c3ca8`–`0x020c3cb0` | data | 8 | 1 | `data_020b46e0.s` (`.extern`, entry 12/18) |
| 2 | `data_020c3cb0` | `0x020c3cb0`–`0x020c3cb8` | data | 8 | 1 | `data_020b46e0.s` (`.extern`, entry 14/18) |
| 3 | `data_020c3cb8` | `0x020c3cb8`–`0x020c3cc0` | data | 8 | 1 | `data_020b46e0.s` (`.extern`, entry 16/18) |
| 4 | `data_020c3cc0` | `0x020c3cc0`–`0x020c3cc8` | data | 8 | 1 | `data_020b46e0.s` (`.extern`, entry 18/18) |
| 5 | `data_020c7260` (absorbs `_7277`/`_728e`/`_72a5`) | `0x020c7260`–`0x020c72c0` | data | 96 | 1 (absorbing) | relocs.txt table @ `0x020c72c0` (still uncarved) |

Rows 1-4 + row 5 total: 8 addresses matched, 5 top-level declarations,
32 + 96 = 128 B.

### What's left in this specific pool

Nothing — 689 of 689 candidates shipped. The one adjacent `scalar`-
shape symbol (4 B, 1 reader) noted above is technically reachable by
the same method but outside this wave's explicit `string`/
`string-ascii4` scope; left for whoever next touches cluster B/D
territory. The `unknown`-shape 715 need a size-deduction fix, not
another wave of this recipe (same gap `cm-restock-carve-8` already
flagged).

## Part 2 — bounded PoC: is the ~9,690-symbol zero-reader pool really reader-less?

### The PoC, as scoped

Picked a small contiguous run from the pool `cm-restock-carve-8`
sampled as "zero-reader, shape=string" — deliberately NOT the
1,588-string/35,424 B flagship run, per the kickoff's own "cheap to
throw away" framing. First candidate: `data_020c3ca8`/`_020c3cb0`/
`_020c3cb8`/`_020c3cc0` (4 symbols, 32 B, `main`, `.data`) — content
`"LC08\0\0\0\0" "LC10\0\0\0\0" "LC12\0\0\0\0" "LC16\0\0\0\0"`. (This
attempt failed at link time for a reason worth its own section below —
kept in the writeup rather than silently swapped out, because the
failure mode is itself the more instructive finding.)

### The finding that reframes the question: these are not actually reader-less

Before drafting anything, I re-checked "zero-reader" against
`relocs.txt` **directly** (raw `dest_addr` containment, not through
`data_worklist.py`'s call-graph) rather than trusting the label.
Result: **of the 3,901 symbols `data_worklist.py` reports as
`shape=string`, 0-reader, in `main` (84,341 B) — 3,901 of 3,901 (100%)
have at least one real relocation pointing at them.** Zero are
genuinely un-pointed-to.

Root cause: `analyze_symbols.build_call_graph` only attributes a
`load` relocation to `edges_load` (which is what `data_worklist.py`'s
reader count is built from) when the relocation's **source** address
resolves to a known **function** via `enclosing_function`. A
relocation sourced from inside another **data** symbol — e.g. a
still-uncarved pointer table — resolves `caller = None` and is
silently dropped into `graph.unresolved_loads`, never reaching
`edges_load`. The reader count reads 0 not because nothing points
there, but because the tool only follows function→data edges, never
data→data edges.

**Directly confirmed for the chosen candidate**: all four addresses
are pointer targets of an **18-entry, stride-4, fully consecutive
`char*` table at `0x020b46e0`–`0x020b4728`** (itself unmatched/
uncarved) — verified by listing every relocation whose `src_addr`
falls in that 72-byte span:

```
from:0x020b470c kind:load to:0x020c3ca8   (data_020c3ca8, "LC08")
from:0x020b4714 kind:load to:0x020c3cb0   (data_020c3cb0, "LC10")
from:0x020b471c kind:load to:0x020c3cb8   (data_020c3cb8, "LC12")
from:0x020b4724 kind:load to:0x020c3cc0   (data_020c3cc0, "LC16")
```

(14 more entries in the same table point at 14 more nearby strings,
`0x020c3cf4`–`0x020c3d90` — not traced further, out of this PoC's
bound.)

**Also confirmed at the scale of `cm-restock-carve-8`'s own flagship
sample**: the 1,588-string/35,424 B `main` span
(`0x020e65b0`–`0x020ef010`) has **exactly 1,588 relocations pointing
into it** — a 1:1 match with the string count, sourced from a
consecutive pointer array starting around `0x020f0de0`. This is not
"nothing holds a direct pointer to any individual string" (wave 8's
characterization) — it is "something holds a direct pointer to every
individual string, and that something is itself an uncarved data
symbol the reader-count tool can't see through."

**This does not contradict wave 8's byte-sampling** (the actual string
content, and the observation that the pool is real and structured) —
it corrects the *mechanism* wave 8 inferred for why the pool is
invisible. Not computed/indexed archive lookup; a plain, ordinary,
already-`relocs.txt`-visible pointer table that simply hasn't been
carved yet, one hop upstream.

### The mechanical question: does absorbing multiple addresses into one declaration work?

`P-50` (`codegen-walls.md`) and its evidence chain
(`alignment-wall-tu-composition-recipe.md`) proves composed TUs with
**n≥2 top-level named globals** reorder by size (n=2, differing size)
or unconditionally (n>2, any size) — a real wall for the "one named
global per string" reading of "a single C string table." This PoC
instead emits **one** top-level declaration whose *content* happens to
pack several logical strings — n=1, nothing for mwcc to reorder, P-50
does not apply by construction.

### Attempt 1 (`data_020c3ca8`, LC08/LC10/LC12/LC16): FAILED — not P-50, a different wall

Reasoning going in: the three absorbed placeholder names
(`data_020c3cb0`/`_cb8`/`_cc0`) keep their unchanged `symbols.txt`
entries but get no separate C declaration; nothing references them by
*symbol name* per their function-reader count (genuinely 0, by the
same check that found the table above), so — the reasoning went —
there's no link-time dependency on their having one, and the
still-uncarved reader table's raw copied-from-ROM bytes should already
encode the correct absolute addresses regardless of whether the
target has a name.

**This reasoning had a hole, and the linker found it immediately:**

```
mwldarm.exe: Undefined : "data_020c3cb0"
mwldarm.exe: Referenced from "data_020b46e0" in
mwldarm.exe: data_020b46e0.o
mwldarm.exe: Undefined : "data_020c3cb8"
mwldarm.exe: Referenced from "data_020b46e0" in
mwldarm.exe: data_020b46e0.o
mwldarm.exe: Undefined : "data_020c3cc0"
mwldarm.exe: Referenced from "data_020b46e0" in
mwldarm.exe: data_020b46e0.o
mwldarm.exe: alert: Link failed.
```

`data_020b46e0` — the 18-entry pointer table itself — is **not**
still-uncarved raw bytes. It was already carved, years before this
wave, by the earlier `cluster-c-recipe.md` "Pattern 3" generator
(`tools/cluster_c_pattern3_gen.py`, briefs 121–125): a real, shipped
`.s` file (`src/main/data/data_020b46e0.s`) with an explicit
`.extern data_020c3cb0` / `.extern data_020c3cb8` / `.extern
data_020c3cc0` (and 15 more) followed by `.word` references to each by
name. I checked `relocs.txt` (proves the pointer relationship) and
`data_worklist.py`'s reader count (proves the tool's blind spot), but
never checked whether an **already-shipped source file** references
the absorbed names directly — the exact same class of check
`cm-restock-carve-6`'s P-50 discovery required ("is this symbol
referenced by name from other already-shipped code"), just via a
different upstream mechanism (an old Pattern-3 chunk, not a
hand-written `extern`). One `.extern`'d name in the *absorbed* set is
enough to break the link — `data_020c3ca8` itself was fine (it's the
declaration I did provide), only the three I omitted failed.

**Fix applied**: reverted the single absorbing declaration; shipped
all four as ordinary individual `char name[8] = "…";` files instead —
exactly Part 1's method, now with an even better-evidenced reader than
most Part 1 candidates (the exact consuming table and its `.extern`
line, not just a relocs.txt address pair). See
`data_020c3ca8.c`/`_020c3cb0.c`/`_020c3cb8.c`/`_020c3cc0.c` in this
PR — 4 more symbols shipped, 32 B, discovered by this investigation
rather than Part 1's shape-filter query.

**How common is this failure mode?** Extracted every `.extern`'d name
from EUR `main`'s 52 Pattern-3-generated files (316 unique names) and
cross-referenced against the full zero-function-reader `shape=string`
pool in `main` (3,897 symbols): **61 overlap (1.6%)**. Not dominant,
but real and mechanically silent until link time — any future wave
using the absorption technique must grep the full `src/` tree for each
candidate name before drafting, not just check `relocs.txt`.

### Attempt 2 (`data_020c7260`, four `/credit/the_end.LZ*` archive paths): the properly-vetted retest

Same shape (4 symbols, contiguous, zero function-readers), this time
screened against the failure Attempt 1 found, before drafting:

- `grep -rn` for all four names across the entirety of `src/` and
  `config/eur/`: **zero hits** outside `symbols.txt`'s own placeholder
  line. No shipped `.c`/`.s` anywhere references any of them by name.
- The one real consumer (relocs.txt-proven, a 4-entry consecutive
  `char*` table immediately adjacent at `0x020c72c0`–`0x020c72d0`) has
  a `symbols.txt` placeholder entry but **no `delinks.txt` TU at all**
  — confirmed genuinely still-raw gap bytes this time, not a shipped
  file with baked-in `.extern` names.
- Zero outgoing relocations from inside the candidate's own span
  (plain text, not pointers).
- 96 B, 4-aligned both ends, `.data`, no existing TU conflict.

Emitted as one `char data_020c7260[96]` declaration (four string
literals concatenated with explicit `\0` separators, verified against
the real bytes by simulating the exact C string-concatenation +
array-zero-padding semantics in Python **before** writing the file —
not hand-counted).

**Verdict: YES — confirmed by a clean 3-region SHA1 PASS** (see Gate
section for the verbatim lines). A contiguous run of reader-less
(by the flawed count) strings matches byte-identically when emitted
as one absorbing declaration, **provided no already-shipped source
references any of the absorbed names by symbol** — the one precondition
Attempt 1 skipped and Attempt 2 verified explicitly.

### What this unlocks (scoping only, not this wave's to execute)

If the SHA1 gate confirms Attempt 2, the real headroom story changes:
the ~9,690-symbol/~227,820 B pool `cm-restock-carve-8` described as
needing "a different discovery method... not another wave of this
lane's recipe" is **reachable by the exact same reader-based method
this campaign already trusts**, provided (a)
`analyze_symbols.build_call_graph` (or a parallel tool) is extended to
also follow **data→data** load edges, and (b) any absorption-style
carve screens every candidate name against the full `src/` tree first,
not just `relocs.txt` — Attempt 1's failure mode, now documented, not
hypothetical. Neither is a new discovery paradigm; both are bounded
tooling/process fixes. That is future scope, not this wave's —
flagged here so the next wave doesn't have to re-derive either one.

## Gate

Full 3-region clean-tree gate (`python tools/gate3.py`), covering the
final state (Part 1's 689 + Part 2's 4-individual-fix + Part 2's
96 B absorbing retest — 694 files, one `delinks.txt`):

```
gx-spirit-caller_eur.nds: OK
[eur] SHA1 PASS

gx-spirit-caller_usa.nds: OK
[usa] SHA1 PASS

gx-spirit-caller_jpn.nds: OK
[jpn] SHA1 PASS
```

All three regions byte-identical. (The same `gate3.py` invocation's
`pytest` stage failed on one pre-existing-as-of-this-diff check,
`test_generate_state_table.py::TestCommittedTableIsCurrent` —
`docs/state-table.md` stale after 694 new matched symbols; regenerated
below, not a SHA1/build issue.) The standalone canary
(`data_02100350`, Part 1's first file, gated alone before any
batching per the kickoff's requirement) also passed clean 3-region
SHA1 on its own, before this combined run.

## Named-struct / Typed-array, before → after

Measured via `tools/progress.py`'s `summarize_data_readability`,
BEFORE isolated via `git stash push -u` / `pop` (not inferred from
memory of the pre-wave state):

| Metric | Before | After | Delta |
|---|---:|---:|---:|
| `typed_array_bytes` | 182,512 | 194,228 | **+11,716** |
| `named_struct_bytes` | 73,876 | 73,876 | **+0** |

Reconciled exactly: every file this wave declares a plain `char
name[N] = "…";` — a typed array, no named-struct typedef anywhere —
so 100% of the delta lands in `typed_array_bytes` and none in
`named_struct_bytes`. `11,716 = 11,588` (Part 1) `+ 32` (the 4
individual LC* fixes) `+ 96` (Part 2's absorbing retest), matching the
byte total shipped exactly.

## Cross-references

- [`cm-restock-carve-8-2026-08-14.md`](cm-restock-carve-8-2026-08-14.md) —
  prior wave, the honest re-census + the two corrections this wave
  carries forward.
- [`../cluster-c-recipe.md`](../cluster-c-recipe.md) — the `.rodata`/
  string carving precedent this wave's Pattern-1 approach follows.
- [`../codegen-walls.md`](../codegen-walls.md) — P-50, the
  composed-TU-declaration-order wall this wave's Part 2 single-
  declaration design avoids by construction.
- [`../alignment-wall-tu-composition-recipe.md`](../alignment-wall-tu-composition-recipe.md) —
  the n=2/n>2 composed-TU evidence chain.
