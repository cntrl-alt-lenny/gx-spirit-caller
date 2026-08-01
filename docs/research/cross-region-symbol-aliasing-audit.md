# Cross-region `.bss`/`.data` symbol-address aliasing audit (2026-08-01)

Triggered by `cm-bss-convert-6` finding 2 EUR/JPN/USA symbol-name
collisions in overlay017 during unrelated `.bss`-carving work. This is
a standalone correctness audit, not part of the carve campaign proper
— filed separately so future porting work can find it without digging
through a data-carving wave doc.

## Bottom line

**Confined to raw `.bss`/`.data` layout. Zero already-ported files
currently mislabel an aliased symbol.** No fix is needed in any
currently-committed file. The risk is real but **latent, not live** —
see "Forward-looking risk" below for what to watch for.

## Method

**SHA1 gate confirmed directly, not via CI.** `.github/workflows/compile-check.yml`'s
compile-check job runs `configure.py --skip-sha1` and says so in its own
header comment — CI green does **not** prove byte-identity. Verified
directly instead:
```
python tools/configure.py eur && ninja sha1   ->  gx-spirit-caller_eur.nds: OK
python tools/configure.py usa && ninja sha1   ->  gx-spirit-caller_usa.nds: OK
python tools/configure.py jpn && ninja sha1   ->  gx-spirit-caller_jpn.nds: OK
```
All three regions are byte-identical to their baseroms as of this audit.

**Scan**: parsed every region's `symbols.txt` + `delinks.txt` for `main`
plus all 24 overlay directories on disk (`ov000`–`ov023` — one more
than CLAUDE.md's "23 arm9 overlays" figure; the extra directory exists
but wasn't previously counted for this purpose). Found every `.bss`/
`.data` symbol whose absolute address is independently named in both
EUR's and a target region's `symbols.txt`. Size = distance to the
nearest other *named* symbol in that region (a lower bound, not
necessarily the true object size — several consumers reach past their
symbol's neighbor-gap; this doesn't affect the aliasing finding itself,
since name+address match is exact, not inferred).

## Why this happens

EUR's module base address is **never** exactly equal to USA/JPN's, in
`main` or in any overlay — confirmed with no exceptions. USA and JPN,
by contrast, always agree with each other exactly. The EUR↔target
shift is not a single per-module constant either: it starts around
0xE0–0x100 at `.text`-start and drifts further by `.bss`-start as
`.rodata`/`.data` content-size differences accumulate through the
module. Because that shift varies continuously across a module's
address range, it crosses back through zero at scattered individual
addresses — that's why coincidental identical-absolute-address
collisions happen despite no module ever truly sharing a base.

## Scope: 105 confirmed collisions (not 2)

Spread across `main` and 21 of 24 overlays (`ov001`, `ov019`, `ov023`
have zero). Per-module counts:

| module | count | module | count | module | count |
|---|---:|---|---:|---|---:|
| main | 29 | ov008 | 1 | ov016 | 1 |
| ov000 | 1 | ov009 | 7 | ov017 | 4 |
| ov002 | 10 | ov010 | 3 | ov018 | 1 |
| ov003 | 1 | ov011 | 4 | ov020 | 3 |
| ov004 | 8 | ov012 | 2 | ov021 | 7 |
| ov005 | 3 | ov013 | 1 | ov022 | 2 |
| ov006 | 6 | ov014 | 4 | | |
| ov007 | 5 | ov015 | 2 | | |

`LIVE` marks the 26 addresses referenced by at least one already-committed
`src/usa/**` or `src/jpn/**` file (USA and JPN always agree on which).

| Module | Addr | Symbol | EUR kind/size | Target kind/size | Live? |
|---|---|---|---|---|:---:|
| main | 0x02102c64 | data_02102c64 | bss 24B | bss 8B | |
| main | 0x02104003 | data_02104003 | bss 169B | bss 2753B | |
| main | 0x02181906 | data_02181906 | bss 20818B | bss 20594B | |
| main | 0x02186ae8 | data_02186ae8 | bss 6B | bss 6144B | |
| main | 0x0219190b | data_0219190b | bss 1301B | bss 1077B | |
| main | 0x02191f40 | data_02191f40 | bss 96B | bss 704B | |
| main | 0x0219a834 | data_0219a834 | bss 120B | bss 16B | LIVE |
| main | 0x0219b2d4 | data_0219b2d4 | bss 4B | bss 28B | |
| main | 0x0219b2fc | data_0219b2fc | bss 4B | bss 36B | |
| main | 0x0219c408 | data_0219c408 | bss 120B | bss 2852B | |
| main | 0x0219d068 | data_0219d068 | bss 4B | bss 576B | |
| main | 0x0219d9a8 | data_0219d9a8 | bss 16B | bss 24B | |
| main | 0x0219d9c0 | data_0219d9c0 | bss 4B | bss 32B | |
| main | 0x0219d9f4 | data_0219d9f4 | bss 4B | bss 24B | |
| main | 0x0219e3f4 | data_0219e3f4 | bss 64B | bss 16B | |
| main | 0x0219e434 | data_0219e434 | bss 64B | bss 4B | |
| main | 0x0219ecdc | data_0219ecdc | bss 4B | bss 260B | |
| main | 0x0219ef10 | data_0219ef10 | bss 4B | bss 100B | |
| main | 0x021a18b8 | data_021a18b8 | bss 8B | bss 12B | LIVE |
| main | 0x021a1938 | data_021a1938 | bss 40B | bss 260B | LIVE |
| main | 0x021a6300 | data_021a6300 | bss 4B | bss 192B | |
| main | 0x021a63c0 | data_021a63c0 | bss 4B | bss 392B | |
| main | 0x021a6630 | data_021a6630 | bss 4B | bss 32B | LIVE |
| main | 0x021a66c0 | data_021a66c0 | bss 4B | bss 640B | |
| main | 0x021a832c | data_021a832c | bss 8B | bss 4B | |
| main | 0x021a83e0 | data_021a83e0 | bss 4B | bss 1568B | LIVE |
| main | 0x021a9848 | data_021a9848 | bss 4B | bss 12B | LIVE |
| main | 0x021a9880 | data_021a9880 | bss 8B | bss 4B | |
| main | 0x021a9940 | data_021a9940 | bss 4B | bss 232B | |
| ov000 | 0x021c752c | data_ov000_021c752c | bss 4B | bss 48B | LIVE |
| ov002 | 0x022cd310 | data_ov002_022cd310 | bss 8B | bss 4B | LIVE |
| ov002 | 0x022cd444 | data_ov002_022cd444 | bss 8B | bss 20B | LIVE |
| ov002 | 0x022cf18c | data_ov002_022cf18c | bss 8B | bss 4B | LIVE |
| ov002 | 0x022cf194 | data_ov002_022cf194 | bss 4B | bss 14B | |
| ov002 | 0x022cf1a2 | data_ov002_022cf1a2 | bss 2B | bss 6B | |
| ov002 | 0x022cf1ac | data_ov002_022cf1ac | bss 192B | bss 320B | |
| ov002 | 0x022d0f2c | data_ov002_022d0f2c | bss 16B | bss 8B | |
| ov002 | 0x022d0fda | data_ov002_022d0fda | bss 10B | bss 258B | |
| ov002 | 0x022d197f | data_ov002_022d197f | bss 201B | bss 61B | |
| ov002 | 0x022d1a9c | data_ov002_022d1a9c | bss 72B | bss 3444B | |
| ov003 | 0x021cf588 | data_ov003_021cf588 | data 24B | bss 88B | |
| ov004 | 0x02210fdc | data_ov004_02210fdc | bss 1020B | bss 412B | |
| ov004 | 0x022901f7 | data_ov004_022901f7 | bss 5029B | bss 4421B | |
| ov004 | 0x02291956 | data_ov004_02291956 | bss 986B | bss 378B | |
| ov004 | 0x02291d38 | data_ov004_02291d38 | bss 304B | bss 112B | LIVE |
| ov004 | 0x022923dc | data_ov004_022923dc | bss 4B | bss 16B | |
| ov004 | 0x02292550 | data_ov004_02292550 | bss 4B | bss 128B | |
| ov004 | 0x022925d0 | data_ov004_022925d0 | bss 4B | bss 64B | |
| ov004 | 0x02292610 | data_ov004_02292610 | bss 4B | bss 256B | |
| ov005 | 0x021b1cb4 | data_ov005_021b1cb4 | data 20B | bss 28B | LIVE |
| ov005 | 0x021b1cdc | data_ov005_021b1cdc | data 20B | bss 112B | |
| ov005 | 0x021b1d4c | data_ov005_021b1d4c | bss 92B | bss 20B | LIVE |
| ov006 | 0x021d01fd | data_ov006_021d01fd | bss 2303B | bss 2107B | |
| ov006 | 0x021d1919 | data_ov006_021d1919 | bss 21943B | bss 21707B | |
| ov006 | 0x0224194f | data_ov006_0224194f | bss 55393B | bss 55105B | |
| ov006 | 0x0224f2e8 | data_ov006_0224f2e8 | bss 12B | bss 2B | |
| ov006 | 0x02251950 | data_ov006_02251950 | bss 15096B | bss 14808B | |
| ov006 | 0x0225df3c | data_ov006_0225df3c | bss 288B | bss 12B | |
| ov007 | 0x021b4002 | data_ov007_021b4002 | bss 18B | bss 2226B | |
| ov007 | 0x021c1918 | data_ov007_021c1918 | bss 23244B | bss 23020B | |
| ov007 | 0x021d01fd | data_ov007_021d01fd | bss 2303B | bss 2107B | |
| ov007 | 0x021d1919 | data_ov007_021d1919 | bss 21943B | bss 21707B | |
| ov007 | 0x0223194e | data_ov007_0223194e | bss 7030B | bss 6774B | |
| ov008 | 0x021b2680 | data_ov008_021b2680 | data 24B | bss 4B | LIVE |
| ov009 | 0x021b0fdc | data_ov009_021b0fdc | bss 2220B | bss 1984B | |
| ov009 | 0x021b1917 | data_ov009_021b1917 | bss 1077B | bss 821B | |
| ov009 | 0x021b4002 | data_ov009_021b4002 | bss 18B | bss 2226B | |
| ov009 | 0x021c1918 | data_ov009_021c1918 | bss 23244B | bss 23020B | |
| ov009 | 0x021d01fd | data_ov009_021d01fd | bss 2303B | bss 2107B | |
| ov009 | 0x021d1919 | data_ov009_021d1919 | bss 21943B | bss 21707B | |
| ov009 | 0x0223194e | data_ov009_0223194e | bss 50066B | bss 49842B | |
| ov010 | 0x021b8b2c | data_ov010_021b8b2c | data 24B | bss 164B | LIVE |
| ov010 | 0x021b92b8 | data_ov010_021b92b8 | bss 252B | bss 4B | |
| ov010 | 0x021b98f0 | data_ov010_021b98f0 | bss 252B | bss 4B | |
| ov011 | 0x021d3f20 | data_ov011_021d3f20 | data 28B | bss 60B | LIVE |
| ov011 | 0x021d3fcc | data_ov011_021d3fcc | data 52B | bss 16B | |
| ov011 | 0x021d4000 | data_ov011_021d4000 | bss 60B | bss 8B | |
| ov011 | 0x021d40c0 | data_ov011_021d40c0 | bss 4B | bss 120B | LIVE |
| ov012 | 0x021cc6a0 | data_ov012_021cc6a0 | bss 60B | bss 8B | LIVE |
| ov012 | 0x021cc78c | data_ov012_021cc78c | bss 4B | bss 200B | LIVE |
| ov013 | 0x021cbb20 | data_ov013_021cbb20 | data 32B | bss 60B | LIVE |
| ov014 | 0x021c1918 | data_ov014_021c1918 | bss 23244B | bss 23020B | |
| ov014 | 0x021d01fd | data_ov014_021d01fd | bss 2303B | bss 2107B | |
| ov014 | 0x021d1919 | data_ov014_021d1919 | bss 21943B | bss 21707B | |
| ov014 | 0x0223194e | data_ov014_0223194e | bss 14138B | bss 13882B | |
| ov015 | 0x021b5ce4 | data_ov015_021b5ce4 | data 24B | bss 36B | LIVE |
| ov015 | 0x021b5d14 | data_ov015_021b5d14 | data 28B | bss 16B | |
| ov016 | 0x021bab44 | data_ov016_021bab44 | bss 156B | bss 1280B | |
| ov017 | 0x021b8470 | data_ov017_021b8470 | data 24B | bss 148B | LIVE |
| ov017 | 0x021b867c | data_ov017_021b867c | bss 256B | bss 12B | LIVE |
| ov017 | 0x021b8794 | data_ov017_021b8794 | bss 64B | bss 256B | LIVE |
| ov017 | 0x021b8894 | data_ov017_021b8894 | bss 256B | bss 252B | |
| ov018 | 0x021ad7a4 | data_ov018_021ad7a4 | data 48B | bss 36B | LIVE |
| ov020 | 0x021adf80 | data_ov020_021adf80 | data 28B | bss 16B | LIVE |
| ov020 | 0x021adfa4 | data_ov020_021adfa4 | data 4B | bss 36B | |
| ov020 | 0x021ae948 | data_ov020_021ae948 | bss 44B | bss 216B | |
| ov021 | 0x021b0fdc | data_ov021_021b0fdc | bss 2220B | bss 1984B | |
| ov021 | 0x021b1917 | data_ov021_021b1917 | bss 1077B | bss 821B | |
| ov021 | 0x021b4002 | data_ov021_021b4002 | bss 18B | bss 2226B | |
| ov021 | 0x021c1918 | data_ov021_021c1918 | bss 23244B | bss 23020B | |
| ov021 | 0x021d01fd | data_ov021_021d01fd | bss 2303B | bss 2107B | |
| ov021 | 0x021d1919 | data_ov021_021d1919 | bss 21943B | bss 21707B | |
| ov021 | 0x0222194d | data_ov021_0222194d | bss 46459B | bss 46235B | |
| ov022 | 0x021aba18 | data_ov022_021aba18 | data 32B | bss 1052B | |
| ov022 | 0x021ac7f4 | data_ov022_021ac7f4 | bss 376B | bss 152B | |

A cluster of identical large-size collisions (`021d01fd`, `021d1919`,
`0223194e`/`0222194d`, `021c1918`, `021b4002`, `021b0fdc`, `021b1917`)
recurs across ov006/007/009/014/021 — consistent with a shared
overlay-swap RAM window rather than distinct small-object collisions;
none of these are `LIVE`.

## Cross-reference against already-ported code

`git grep`'d all 105 names against `src/usa/**` and `src/jpn/**`
(`.c`/`.h`). 26 of 105 (25%) have at least one live consumer — USA and
JPN always agree on which. Every one was individually checked; a
blanket `sizeof`/`memcpy`/`memset` sweep across all 26 found zero
whole-object-size dependencies anywhere.

**16 of 26 — safe by construction.** Referenced only via unsized/opaque
externs (`char foo[]`, `unsigned int foo[]`), always consumed via
explicit hard-coded byte offsets or passed opaquely to helpers. No size
is asserted in the C type, so a size mismatch cannot mislead:
`data_ov000_021c752c`, `data_ov002_022cd310`/`022cf18c`,
`data_ov004_02291d38`, `data_ov005_021b1cb4`, `data_ov008_021b2680`,
`data_ov010_021b8b2c`, `data_ov011_021d40c0`, `data_ov012_021cc6a0`/
`021cc78c`, `data_ov015_021b5ce4`, `data_ov017_021b867c`,
`data_ov017_021b8794`, `data_ov018_021ad7a4`, `data_0219a834`.

**10 of 26 — sized scalar/struct externs, individually verified
correct.** For each, the struct body was read and either an EUR-lineage
file was traced or confirmed not to exist:

| Symbol | Consumer(s) | Type used | EUR lineage? | Verdict |
|---|---|---|---|---|
| `data_021a18b8` (main) | `func_020821e0.c` | `triple_020822c8_t` (12B) | No — independently matched vs. target asm | sizeof exactly matches target's real 12B slot |
| `data_021a1938` (main) | `func_02081fd0.legacy_sp3.c` | `state_021a18b8_t` (256B) | No | Matches target's real ~260B slot |
| `data_021a6630` (main) | `func_02094048.legacy.c` | `T_0209413c` (24B) | No | Fits within target's real 32B gap |
| `data_021a9848` (main) | `func_020a5c80.legacy.c` | `T_020a5d74` (12B) | No | Exact match to target's real 12B slot |
| `data_ov002_022cd444` | 6 files, mixed `int`/`int[]`/`char[]` | scalar+array mixed | No — self-labeled draft | Already self-documented as verified byte-exact |
| `data_ov005_021b1d4c` | 2 files | `Ov005DispatchState`/`ov005_1e4c_t` (16B) | Not traced | Both region-authored structs agree on 16B/4-field layout |
| `data_ov011_021d3f20` | 8+ files | e.g. `struct View021ca600` | **Yes** — EUR uses the same struct against `data_ov011_021d4000` (different EUR address) | Safely reloc-paired |
| `data_ov013_021cbb20` | 3 files | `data_ov013_021cbc00_t` | **Yes** — EUR uses the same struct against `data_ov013_021cbc00` (different EUR address) | Safely reloc-paired |
| `data_ov020_021adf80` | 3 files | `Ov020Globals` | **Yes** — EUR uses the same struct against `data_ov020_021ae060` (different EUR address) | Safely reloc-paired |
| `data_021a83e0` (main) | 2 files, incompatible typing | `char *` vs `char[]` | No EUR lineage for either | Real inconsistency, but **not** cross-region — see below |

**The mechanism, concretely** (fully explains the original ov017 finding):
EUR's `func_ov017_021b73a8.c` writes via `*(int *)data_ov017_021b877c`
— **EUR's own address is `0x021b877c`, not `0x021b867c`**.
`port_to_region.py`'s safe parallel-relocation method (`derive_data_address_mapping`,
priority-1 in `resolve_symbol`) correctly re-paired this to the target's
`data_ov017_021b867c` — a *numerically different* address — by matching
relocation offsets within the fingerprint-identical sibling function,
never consulting either side's raw address or name text. The target's
own dsd-assigned name for that address merely happens to collide, in
text only, with EUR's own, unrelated 256-byte object that also happens
to live at EUR's own `0x021b867c`. The same pattern repeats for every
other traced case above. **In every currently-live instance, the risky
fallback tiers (exact-address match, D3 shift-consensus) were not the
path actually used** — the safe reloc-pairing path was, which is
structurally immune to this class of coincidence.

**Secondary, out-of-scope finding**: `data_021a83e0` is declared as a
pointer variable (`char *data_021a83e0`) in `func_0209c6d4.c` and as
the buffer itself (`char data_021a83e0[]`) in `func_0209c9f0.legacy.c`
— genuinely different semantics. Neither file has any EUR counterpart
(both independently matched against target assembly), so this is a
pre-existing same-region internal-typing question, **not** EUR-inherited
cross-region aliasing. Noted for the record, not filed as an action item
— it's a one-line observation, not a scoped fix.

## Forward-looking risk (why this isn't fully closed)

The 79 non-`LIVE` addresses sit waiting in **still-raw EUR functions**
that reference the *other, colliding* meaning of each address — e.g.
`src/overlay017/func_ov017_021b6264.s` (EUR's own consumer of its
string-buffer `data_ov017_021b867c`) is still raw assembly. The moment
such a function gets matched and ported, **if** the porter's fallback
tier (not the safe reloc-pairing tier) resolves its data reference, it
could silently bind to the target's unrelated same-numbered object.
This is a process risk for future porting work on these 105 addresses,
not a defect in anything on disk today. See
[`q-cross-region-alias-guard`](queue/codex-scaffolder.md) for the
concrete mitigation filed against this.
