# cm-data-inference-5: data wave 5 (2026-07-26)

Continuation of `cm-data-inference-4` (12/20 shipped, 60%). This wave
handled the 6 named priority leads from that wave's own deferred list,
plus the never-dispatched "batch 2" fold-in (ov010's 5 blobs, ov015's 3
blobs), plus a fresh sweep of the remaining main-module census.

## Baseline reconstruction (yet again)

`cm-data-inference-4` (PR #1364), `cm-data-inference-3` (PR #1355), and
both carve PRs (`cm-data-020b52d8-carve`/`cm-data-020c3198-carve`
predecessors folded into #1364's own sync) were all still unmerged when
this wave started. Merged `origin/claude/cm-data-inference-4`'s branch
tip directly (it already had wave 3 + both carves synced in, per its
own commit history) rather than reconstructing piecemeal. This produced
one real merge conflict: 3 follow-up items (`q-research-index-recursive-glob`,
`q-metric-extern-guard`, `q-metric-singleton-struct-gap`) had been
independently filed as `[TODO]` on wave 4's branch and independently
completed with full `[DONE]` Result blocks on this session's own prior
branch — resolved by keeping the completed versions and discarding the
stale duplicates.

A live census on the reconstructed tree
(`grep -rlE "^(static )?(const )?unsigned char data_[0-9a-zA-Z_]+\[[0-9]+\] = \{"`)
found **116** opaque blobs remaining (27 main, 89 overlay), not the
queued ~113 (28 main, 85 overlay) — close, but consistent with this
campaign's recurring pattern of queued counts drifting from reality.

## Method

Read-only `Explore` agents dispatched in 3 batches (concurrency-capped
at 20), one per blob or small cluster: the 6 named leads (13 individual
blob slots), all 19 never-before-investigated main-module blobs, and
the folded-in batch-2 overlay scope (ov010's 5, ov015's 3) — 42 distinct
blob investigations total. Every STRONG verdict implemented centrally
afterward by this session directly, not by further write-capable
agents, per the queue header's own agent-concurrency protocol note.

## A real, reproducible SHA1 regression found and fixed mid-wave

After implementing ~27 items, `ninja sha1` FAILED (confirmed
reproducible across a fresh build and a full `-t clean` rebuild, ruling
out stale-object masking). Bisected via `dsd check symbols`, which
showed a consistent address-offset creep starting exactly at
`data_020b4a6e` (found 2 bytes past its expected address). Root cause:
splitting `data_020b4a2c` (a 66-byte evidenced prefix, carved from a
combined `.s` file) into its own `.c` file, with the unevidenced
174-byte remainder in a separate shrunk `.s` file, put a **non-4-byte-
aligned boundary (66 bytes) between two separately-linked object
files** — mwld inserts an alignment gap between object-file section
boundaries that don't land on a 4-byte multiple, even though neither
object's own section declares any alignment requirement (confirmed via
`objdump -h`: both show `Algn 2**0`). The `data_020b46a0`/`data_020b46b8`
split earlier in this same wave didn't hit this, because its boundary
(24 bytes) is a multiple of 4.

Fixed by keeping both symbols in **one** translation unit
(`data_020b4a2c.c` declares both `data_020b4a2c[33]` and
`data_020b4a6e[174]`) instead of splitting across files — two globals
in the same TU lay out contiguously with no inter-object linker gap.
Re-verified via a full `-t clean` rebuild: `ninja sha1` OK, then the
real 3-region `gate3.py --scope all`: **GATE PASS** (`[eur]`/`[usa]`/
`[jpn] SHA1 PASS` individually grepped from the log, not assumed from
the summary banner; pytest 3062 passed / 15 skipped, 0 failed).

Lesson for future carves: **a multi-file split at a non-4-byte-aligned
boundary is not safe in this toolchain; keep such splits inside one TU
instead.** Promoted to a standing rule (not just this wave's own
incident report): see `docs/research/data-carve-tu-alignment.md` and
the queue header's own "DATA-CARVE TU ALIGNMENT" note. `ninja check` (dsd's module/symbol consistency check)
separately shows pre-existing, unrelated noise in modules this wave
never touched (e.g. overlay 4) — confirmed via `gate3.py`'s own source
that `ninja check`/`check_match_invariants.py` are explicitly
documented as advisory-only and never the real gate (`ninja sha1` is),
so this is out of scope, not a regression to chase.

## Results: 42 investigated

### Shipped (STRONG, retyped or carved) — 29 symbols across ~26 blob investigations

| Blob | Module | Shape |
|---|---|---|
| `data_020beefc` | main | `const int[4][4]`, row/col bounds cross-corroborated by an already-shipped sibling's proven `{0,1,2,3}` index range |
| `data_020b4a2c` + `data_020b4a6e` | main | Carved from combined `.s`; `unsigned short[33]` (evidenced) + opaque `unsigned char[174]` (declined to force a shape), one TU (see SHA1 fix above) |
| `data_020fe480` | main | 2-field sentinel struct (`s16 state`, `s32 param_4`), carved from an unclaimed gap — found a 2nd field the original lead missed |
| `data_020fe488` / `data_020fe49c` / `data_020fe4b0` | main | 3 SDAT filename string literals, carved from an unclaimed gap; content confirmed via raw ROM extraction AND cross-matched against real files already in `extract/eur/files/sound/` |
| `data_020be794` | main | 35-entry function-pointer table, carved from an unclaimed gap; every entry individually reloc-verified, identical loop confirmed in all 3 regions |
| `data_020b46a0` + `data_020b46b8` | main | Partial split: `unsigned short[12]` (evidenced via USA/JPN cross-region call sites) + new opaque 40-byte tail (declined to force a shape) |
| `data_020b4908` | main | Signedness fix only: `unsigned char[256]` → `signed char[256]` (uniform `ldrsb` across all 3 consumer sites) |
| `data_020c3630` | main | `const int[3] = {2, 0, 1}`, loop-bound-proven (`cmp r9,#0x3`) |
| `data_020c3854` | main | Singleton `FormatSpec` struct (40 bytes: 4 flag bytes + int width + 32-byte scanset bitmap) — a real-world case of the bracket-less-instance shape `q-metric-singleton-struct-gap` was fixed for |
| `data_020c68cc` | main | `unsigned int[8]` power-of-two shift table (8→1024) |
| `data_020bef3c` | main | `const unsigned int[8]` bitmask-merge table, mod-8-masked computed index |
| `data_02101f34` | main | MD5 canonical message-schedule "g" table, `unsigned char[4][16]` (byte-identical layout, just documents the real 4-round structure); independently corroborated by an existing dossier that already knew the caller was MD5 |
| `data_ov006_021cb6d8/718/738/758/798/778` | ov006 | 6 × `const unsigned short[16]` RGB555 palette ramps, same idiom as the already-shipped `data_020b4728` |
| `data_ov006_021cb6f8` + `data_ov006_021cb700` | ov006 | 7th palette ramp, carved from an unclaimed gap; split into 2 symbols (not left as one 16-entry array) because a dsd-tagged `ambiguous` sub-symbol needed to stay a real, separately linker-visible definition — an unrelated mechanically-generated chunk (`data_020c4204.s`) carries a genuine `.word data_ov006_021cb700` linker reference that a naive single-array carve left undefined (confirmed via a real `mwldarm` "Undefined" error) |
| `data_ov010_021b889c` | ov010 | `unsigned short[6][3]`, computed-stride + loop-bound-proven column count |
| `data_ov010_021b88c0` | ov010 | `unsigned short[16][2]`, hard 16-iteration copy loop proves element count |
| `data_ov010_021b8940` | ov010 | `unsigned short[6][5]`, same idiom as `021b889c` |
| `data_ov015_021b5a8c` | ov015 | Singleton 30-field struct (60 bytes), 3 independent consumers with 100% byte coverage — same "exhaustive multi-consumer" bar as the already-shipped `data_021015e4`/`data_020bec8c` |
| `data_ov015_021b5ac8` | ov015 | `unsigned short[8][2]`, loop-bound-proven (8 iterations) |
| `data_ov015_021b5ae8` | ov015 | `struct{u16,u16,u16}[6]` language table, computed-stride with a runtime-variable index |

### Confirmed already correct (STRONG evidence, no shape change) — 3

- `data_020c32f8` (main) — reconfirms `cm-data-inference-2`'s independent finding: stride=1, already exactly `unsigned char[724]`.
- `data_020c3654` (main) — a 128-entry ASCII `tolower()` table, already exactly `unsigned char[128]`.
- `data_020c36d4` (main) — a 128-entry ASCII `toupper()` table, already exactly `unsigned char[128]`.

### Declined (WEAK or CONTRADICTION) — 11

- `data_020bff80`, `data_020c1f80` (main) — WEAK, a matched pair: one real consumer reads only the first 4 of each 4096/3328-byte blob at 2 fixed offsets; no loop, no computed index.
- `data_020bf280` (main) — WEAK; a previously-flagged "pointer anomaly" mid-blob reconfirmed as a coincidental numeric-ramp false positive (3rd independent confirmation).
- `data_020b4b1c` (main) — WEAK; genuinely variable-length length-prefixed record chain, no uniform stride possible (reconfirms `cm-data-inference-3`'s finding).
- `data_020fe55c` (main) — WEAK; 4 of 7 fields evidenced by 3 real consumers, 3 fields silent — declined rather than guess the rest.
- `data_021023c0` (main) — WEAK; only 8 of 24 bytes evidenced (fixed-offset only); a same-address, unrelated symbol in USA/JPN (`OSi_PostIrqEvent`'s own IRQ table) correctly identified as a coincidental address-space reuse, not the same object.
- `data_02102120` (main) — CONTRADICTION at the cross-region level: EUR alone is STRONG (`Entry[5]`, loop-bound-proven), but USA/JPN hold genuinely different byte content and an unrelated function-pointer table at the same address, with no per-region override file to reconcile the two — retyping the shared stub would silently apply an EUR-only-correct shape to USA/JPN too.
- `data_02101e64` (main) — STRONG per its own investigation (11 fixed-offset accesses tiling all 24 bytes with zero gaps, cross-validated by an independent writer, mirrored on a sibling symbol), but no bulk-copy or function-pointer-typed field the way this campaign's other singleton-struct ships have had. Filed as a strong lead for a dedicated future item rather than shipped in this broad sweep, per this session's own standing bias toward declining on borderline evidence.
- `data_ov006_021cb7b8` (ov006) — CONTRADICTION; a different idiom entirely (signed 16-bit coordinate/keyframe records, 5×4 fields), not part of the palette family the other 7 addresses in this run belong to.
- `data_ov010_021b8870` (ov010) — WEAK; well-attested (20 of 22 halfwords) but entirely fixed-offset, no computed index.
- `data_ov010_021b8908` (ov010) — CONTRADICTION; genuine consumer evidence proves the true object is ≥56 bytes and overlaps the separate `data_ov010_021b8928` symbol (not one of this wave's targets) — filed as a follow-up needing both symbols merged, not typed alone.

## Named-struct metric

Real `progress.py --version eur` run: **Named-struct 39,224 / 4,776,528
(0.82%)**, Typed-array 82,192 / 4,776,528 (1.72%) — up from wave 4's
last-measured 38,652 / 80,748 (this branch also carries the
`q-metric-extern-guard` and `q-metric-singleton-struct-gap` fixes, so
this run reflects the corrected metric, not the pre-fix one).

## Verification

- **Every "already-correct" and declined verdict independently re-derived
  from scratch** by each investigating agent (not trusted from any
  cited prior-wave doc), with several explicitly reconfirming an
  earlier wave's finding after re-reading the real `.s`/`relocs.txt`
  evidence directly.
- **Every carved byte sequence extracted or cross-checked via script**,
  not hand-transcribed and trusted: `data_ov006_021cb6f8`'s bytes
  independently re-extracted from `extract/eur/arm9_overlays/ov006.bin`
  and compared byte-for-byte against the investigating agent's report
  (exact match); the 3 SDAT strings' content verified against real
  files already present in `extract/eur/files/sound/`.
- **Every touched object file's compiled bytes/relocations directly
  inspected via `objdump`** before trusting the build, not just the
  final SHA1 banner — this is what surfaced the `data_020b4a2c` linker-
  alignment bug in the first place (every individual object was
  byte/relocation-correct; the bug was in the gap *between* two
  objects, only visible via the ROM header's ARM9-size field and
  `dsd check symbols`' address-shift report).
- **Full 3-region gate**: `python tools/gate3.py --scope all` →
  `[eur]`/`[usa]`/`[jpn] SHA1 PASS` (each individually grepped from the
  log), pytest 3062 passed / 15 skipped, 0 failed.
