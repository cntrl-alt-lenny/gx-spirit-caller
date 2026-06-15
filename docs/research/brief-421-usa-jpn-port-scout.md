# Brief 421 - main residue drain + USA/JPN port scout

**Brief:** 421 (decomper)
**Branch:** `decomper/main-residue-and-region-scout`
**Date:** 2026-06-15

Brief 421 had two deliverables: close the arm9 main residue left by
brief 419, then quantify whether EUR's matched functions can seed a
USA/JPN source-match endgame. The short version: main has 10 more
byte-identical ships, and the region scout finds a large clean port lane
but also confirms that the divergent residue is concentrated exactly
where expected.

## Part 1 - arm9 main residue

The brief 419 residue was 74 functions: 53 `kind:data` candidates, 6
intermediate-pool failures, and 15 other asm-fail/edge candidates.
Every function was re-run through:

```
python3.13 tools/asm_escape.py <func> --classify-data --version eur
python3.13 tools/asm_escape.py <func> --whole-function --version eur
```

Results:

| Bucket | Count | Outcome |
|--------|------:|---------|
| `kind:data` REFUSE | 53 | Parked; all REFUSEs were C-absorbed data refs, per brief 406 |
| Whole-function `.s` ships | 10 | Byte-identical and delinked into EUR arm9 main |
| Reloc/text verify mismatch | 7 | Parked; assembler output linked but differed at `.text` reloc slots |
| Embedded data/table asm-fail | 4 | Parked; mwasmarm still sees table bytes as text/opcodes |

Ships:

| Function | Range | Size | Notes |
|----------|-------|-----:|-------|
| `func_0200c874` | `0x0200c874-0x0200cb50` | `0x2dc` | Whole-function `.s` |
| `func_0200cb50` | `0x0200cb50-0x0200ce5c` | `0x30c` | Whole-function `.s` |
| `func_0201cd1c` | `0x0201cd1c-0x0201ce94` | `0x178` | Whole-function `.s` |
| `func_02024630` | `0x02024630-0x02025678` | `0x1048` | Brief 418 intermediate-pool tooling unblocked this one |
| `func_0205dba4` | `0x0205dba4-0x0205f844` | `0x1ca0` | Brief 418 intermediate-pool tooling unblocked this one |
| `func_02077398` | `0x02077398-0x020778c4` | `0x52c` | Whole-function `.s` |
| `func_0207d29c` | `0x0207d29c-0x0207d304` | `0x68` | Whole-function `.s` |
| `func_02080280` | `0x02080280-0x020805b0` | `0x330` | Whole-function `.s` |
| `func_02081ae0` | `0x02081ae0-0x02081b48` | `0x68` | Whole-function `.s` |
| `func_0209d288` | `0x0209d288-0x0209d3dc` | `0x154` | Whole-function `.s` |

The 6 intermediate-pool-blocked functions from brief 419 split 2 shipped
/ 4 still tooling-blocked:

| Function | Result | Shape |
|----------|--------|-------|
| `func_02024630` | Shipped | Intermediate pool now emitted correctly |
| `func_0205dba4` | Shipped | Intermediate pool now emitted correctly |
| `func_02099718` | Parked | Does not assemble; embedded pool/data bytes still emitted as text |
| `func_020b21ec` | Parked | Does not assemble; embedded data/table word emitted as bare opcode |
| `func_020b2d2c` | Parked | Does not assemble; data table decoded as coprocessor/SVC instructions |
| `func_020b3c78` | Parked | Does not assemble; same table-as-instruction shape |

The 7 text-reloc mismatch parks are:

| Function | Range | Size | Failure |
|----------|-------|-----:|---------|
| `func_02031d0c` | `0x02031d0c-0x02031d80` | `0x74` | Byte verify mismatch at reloc `.text` slot 28 |
| `func_02047830` | `0x02047830-0x020479ec` | `0x1bc` | Byte verify mismatch at reloc `.text` slot 107 |
| `func_0207a868` | `0x0207a868-0x0207ab68` | `0x300` | Byte verify mismatch at reloc `.text` slot 187 |
| `func_0207ab68` | `0x0207ab68-0x0207ae74` | `0x30c` | Byte verify mismatch at reloc `.text` slot 185 |
| `func_02093160` | `0x02093160-0x020931e8` | `0x88` | Byte verify mismatch at reloc `.text` slot 33 |
| `func_020a41f8` | `0x020a41f8-0x020a4a94` | `0x89c` | A/B data refs OK, then byte verify mismatch at reloc `.text` slot 546 |
| `func_020a4b6c` | `0x020a4b6c-0x020a53e4` | `0x878` | A/B data refs OK, then byte verify mismatch at reloc `.text` slot 538 |

## Part 2 - USA/JPN port scout

The scout scanned 7,264 EUR matched functions with region siblings found
by `tools/find_region_siblings.py`. Two signals were kept separate:

- Raw exact identity: the function bytes are identical without masking.
- Port-clean identity: reloc-aware byte similarity is at least 0.99,
  which is the useful signal for "EUR source should port cleanly after
  region symbol rewriting".

Topline:

| Region | EUR matched scanned | Raw exact | Port-clean >=0.99 | Divergent residue | No sibling | HIGH | MEDIUM | LOW |
|--------|--------------------:|----------:|------------------:|------------------:|-----------:|-----:|-------:|----:|
| USA | 7,264 | 2,188 | 5,971 | 1,293 | 13 | 6,075 | 10 | 1,162 |
| JPN | 7,264 | 2,190 | 5,971 | 1,293 | 13 | 6,075 | 10 | 1,162 |

The clean lane is large: 82.2% of EUR's currently matched functions are
port-clean to each region under the reloc-aware scan.

## Divergence concentration

The dirty residue is not evenly distributed. For both USA and JPN:

| Module | Total scanned | Port-clean | Dirty | No sibling |
|--------|--------------:|-----------:|------:|-----------:|
| `main` | 4,064 | 3,183 | 881 | 1 |
| `ov006` | 389 | 297 | 92 | 0 |
| `ov002` | 1,375 | 1,299 | 76 | 1 |
| `ov000` | 143 | 107 | 36 | 2 |
| `ov005` | 85 | 50 | 35 | 1 |
| `ov004` | 276 | 243 | 33 | 2 |
| `ov011` | 193 | 171 | 22 | 2 |
| `ov015` | 71 | 55 | 16 | 0 |
| `ov016` | 78 | 62 | 16 | 2 |
| `ov010` | 104 | 90 | 14 | 0 |

`main` alone is 881 / 1,293 dirty functions, or 68.1% of the divergent
residue. The expected overlay-swap group `{ov000, ov002, ov005, ov008}`
accounts for another 151 dirty functions, or 11.7%. Together, `main`
plus that swap group account for 1,032 / 1,293 dirty functions, or 79.8%.

The shift histogram also matches the known region-layout story:

| Region | Module | Dominant shifts |
|--------|--------|-----------------|
| USA | `main` | `-232` x976, `-116` x868, `-244` x617, `-84` x552, `-80` x410 |
| JPN | `main` | `-232` x976, `-116` x868, `-244` x617, `-84` x552, `-80` x410 |
| USA/JPN | `ov002` | `-240` x654, `-232` x234, `-272` x234, `-224` x220 |
| USA/JPN | `ov000` | `-224` x105, `-236` x23, `-268` x13 |
| USA/JPN | `ov005` | `-264` x45, `-224` x39 |
| USA/JPN | `ov008` | `-292` x50, `-224` x39 |

The `main` `-244` band is the already-known 0xf4 drift behind the old
2-byte displacement gotcha. The overlay group has the expected swap-lane
address bands and should be handled after the straight clean-port lane.

## USA pilot

`tools/port_to_region.py` currently ports C sources, not whole-function
`.s` files. The pilot therefore filtered for C-source functions whose
USA sibling was HIGH confidence, reloc-similarity 1.000, and whose
rewritten source did not introduce unresolved USA names. Ten USA ports
were then committed and gated:

| EUR source | USA source | USA range | Size |
|------------|------------|-----------|-----:|
| `src/main/func_02007ff4.c` | `src/usa/main/func_02007fd8.c` | `0x02007fd8-0x02008008` | `0x30` |
| `src/main/func_0200b06c.c` | `src/usa/main/func_0200b050.c` | `0x0200b050-0x0200b0ac` | `0x5c` |
| `src/main/func_020190fc.c` | `src/usa/main/func_020190c8.c` | `0x020190c8-0x020190f0` | `0x28` |
| `src/main/func_0201ab80.c` | `src/usa/main/func_0201ab40.c` | `0x0201ab40-0x0201ab70` | `0x30` |
| `src/main/func_0201bf4c.c` | `src/usa/main/func_0201bf0c.c` | `0x0201bf0c-0x0201bf40` | `0x34` |
| `src/main/func_0201cf54.c` | `src/usa/main/func_0201cf00.c` | `0x0201cf00-0x0201cf34` | `0x34` |
| `src/main/func_0201d400.c` | `src/usa/main/func_0201d3ac.c` | `0x0201d3ac-0x0201d3d4` | `0x28` |
| `src/main/func_0201ed3c.c` | `src/usa/main/func_0201ece8.c` | `0x0201ece8-0x0201ed20` | `0x38` |
| `src/main/func_0201ed74.c` | `src/usa/main/func_0201ed20.c` | `0x0201ed20-0x0201ed58` | `0x38` |
| `src/main/func_0201edac.c` | `src/usa/main/func_0201ed58.c` | `0x0201ed58-0x0201ed90` | `0x38` |

USA `ninja sha1` passed after these ten C ports:

```
gx-spirit-caller_usa.nds: OK
```

## Recommended next brief

1. Add or extend tooling for region `.s` ports. `tools/port_to_region.py`
   is C-source-oriented today, while most recent EUR progress is matched
   by whole-function `.s` files. A mechanical `.s` sibling copier/relabeler
   would open the largest part of the region-identical lane.
2. Teach the port tooling to reject unresolved region aliases before
   writing files. The pilot surfaced missing USA names such as `Fill32`
   and `OS_RestoreIrq`; these should be mapped or filtered automatically.
3. Drain a reviewable batch of HIGH, byte-similarity-1.000 C ports first,
   then extend to `.s`. Main has the biggest clean pool but also the
   biggest dirty residue; keep exact sibling/confidence evidence in each
   PR body.
4. Defer LOW/no-match and the overlay-swap group to a separate
   region-divergence brief. They are not the first volume lane.

## Gate evidence

Delinks were sorted and audited after adding the EUR main ships and USA
pilot ports:

```
config/eur/arm9/delinks.txt: text blocks 4074, duplicates 0, overlaps 0
config/usa/arm9/delinks.txt: text blocks 513, duplicates 0, overlaps 0
```

Three-region gate:

```
EUR: gx-spirit-caller_eur.nds: OK
USA: gx-spirit-caller_usa.nds: OK
JPN: gx-spirit-caller_jpn.nds: OK
```

Direct binary compare was also clean for all touched arm9 regions:

```
cmp build/eur/build/arm9.bin extract/eur/arm9/arm9.bin: identical
cmp build/usa/build/arm9.bin extract/usa/arm9/arm9.bin: identical
cmp build/jpn/build/arm9.bin extract/jpn/arm9/arm9.bin: identical
```
