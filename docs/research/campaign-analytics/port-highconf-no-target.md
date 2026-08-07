# q-port-highconf-no-target worklist

Snapshot: 2026-08-06, generated from `python tools/port_census.py` and `build/port_backlog.json`.

## Verdict

The census finds **62 HIGH/no-target rows per region**, not the queue's stale 63: 124 rows total, with USA and JPN lists identical. **0 shippable in this item.** Every row has a function symbol in the target region but no per-function source/TU mapping in `source_function_addresses`; the target `delinks.txt` only carries an aggregate section range. A safe port needs the EUR-side/target-side per-function delink and target `.s` first, so forcing a C file would bypass the lane's activation invariant.

No row is misclassified as data: the census's target symbol for all 124 rows is `kind:function`. The blockers are delink/TU coverage, not sibling confidence or byte similarity.

## Canary: ov007 0x021b2180

The first end-to-end candidate was `func_ov007_021b2280.c` -> target `func_ov007_021b2180` at `0x021b2180`. In both USA and JPN, `symbols.txt` has that HIGH sibling, but `src/<region>/overlay007/` has no file/object for the address and `config/<region>/arm9/overlays/ov007/delinks.txt` has only the aggregate `.text start:0x021b2180 ...` range, with no per-function source header. It cannot be passed to `batch_port.py` safely until that missing per-function delink exists.

## Blocker histogram

| Class | USA | JPN | Mechanical blocker |
|---|---:|---:|---|
| main Entry/.text aggregate | 1 | 1 | create the per-function delink/TU before porting |
| main gap/.text aggregate | 1 | 1 | create the per-function delink/TU before porting |
| ov004 Thumb/.text aggregate | 10 | 10 | create the per-function delink/TU before porting |
| ov007/.text aggregate | 1 | 1 | create the per-function delink/TU before porting |
| sinit/.init aggregate | 49 | 49 | create the per-function delink/TU before porting |

## Per-module count

| Region | main | ov002 | ov003 | ov004 | ov005 | ov006 | ov007 | ov009 | ov010 | ov011 | ov014 | ov015 | ov016 | ov017 | ov019 | ov021 | Total |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| USA | 2 | 3 | 1 | 11 | 5 | 11 | 3 | 3 | 3 | 1 | 3 | 2 | 5 | 4 | 3 | 2 | 62 |
| JPN | 2 | 3 | 1 | 11 | 5 | 11 | 3 | 3 | 3 | 1 | 3 | 2 | 5 | 4 | 3 | 2 | 62 |

## Full worklist

Each row is emitted from the census JSON; USA and JPN rows remain separate for independent review.

| Region | Module | Target address | EUR candidate | Target symbol | Blocker |
|---|---|---|---|---|---|
| USA | main | 0x02000800 | Entry.c | Entry | aggregate main entry .text range; no per-function delink/TU |
| USA | main | 0x02091454 | func_0209153c.c | func_0209153c | main gap between delinked functions; no per-function delink/TU |
| USA | ov002 | 0x022ca6d8 | sinit_ov002_022ca7e8.c | __sinit_ov002_022ca6d8 | aggregate .init range; no per-function delink/TU |
| USA | ov002 | 0x022ca6f8 | sinit_ov002_022ca808.c | __sinit_ov002_022ca6f8 | aggregate .init range; no per-function delink/TU |
| USA | ov002 | 0x022ca724 | sinit_ov002_022ca834.c | __sinit_ov002_022ca724 | aggregate .init range; no per-function delink/TU |
| USA | ov003 | 0x021cefd8 | sinit_ov003_021cf114.c | __sinit_ov003_021cefd8 | aggregate .init range; no per-function delink/TU |
| USA | ov004 | 0x021dbc48 | func_ov004_021dbe5c.thumb.c | func_ov004_021dbc48 | aggregate ov004 .text range; no per-function delink/TU |
| USA | ov004 | 0x021dbc54 | func_ov004_021dbe68.thumb.c | func_ov004_021dbc54 | aggregate ov004 .text range; no per-function delink/TU |
| USA | ov004 | 0x021dbd1c | func_ov004_021dbf30.thumb.c | func_ov004_021dbd1c | aggregate ov004 .text range; no per-function delink/TU |
| USA | ov004 | 0x021dc450 | func_ov004_021dc664.thumb.c | func_ov004_021dc450 | aggregate ov004 .text range; no per-function delink/TU |
| USA | ov004 | 0x021dcb08 | func_ov004_021dcd1c.thumb.c | func_ov004_021dcb08 | aggregate ov004 .text range; no per-function delink/TU |
| USA | ov004 | 0x021dd370 | func_ov004_021dd584.thumb.c | func_ov004_021dd370 | aggregate ov004 .text range; no per-function delink/TU |
| USA | ov004 | 0x021dd37c | func_ov004_021dd590.thumb.c | func_ov004_021dd37c | aggregate ov004 .text range; no per-function delink/TU |
| USA | ov004 | 0x021de028 | func_ov004_021de23c.thumb.c | func_ov004_021de028 | aggregate ov004 .text range; no per-function delink/TU |
| USA | ov004 | 0x021de03c | func_ov004_021de250.thumb.c | func_ov004_021de03c | aggregate ov004 .text range; no per-function delink/TU |
| USA | ov004 | 0x021de050 | func_ov004_021de264.thumb.c | func_ov004_021de050 | aggregate ov004 .text range; no per-function delink/TU |
| USA | ov004 | 0x022097fc | sinit_ov004_02209a5c.c | __sinit_ov004_022097fc | aggregate .init range; no per-function delink/TU |
| USA | ov005 | 0x021b15dc | sinit_ov005_021b16e4.c | __sinit_ov005_021b15dc | aggregate .init range; no per-function delink/TU |
| USA | ov005 | 0x021b1608 | sinit_ov005_021b1710.c | __sinit_ov005_021b1608 | aggregate .init range; no per-function delink/TU |
| USA | ov005 | 0x021b1634 | sinit_ov005_021b173c.c | __sinit_ov005_021b1634 | aggregate .init range; no per-function delink/TU |
| USA | ov005 | 0x021b1660 | sinit_ov005_021b1768.c | __sinit_ov005_021b1660 | aggregate .init range; no per-function delink/TU |
| USA | ov005 | 0x021b168c | sinit_ov005_021b1794.c | __sinit_ov005_021b168c | aggregate .init range; no per-function delink/TU |
| USA | ov006 | 0x021cb78c | sinit_ov006_021cb898.c | __sinit_ov006_021cb78c | aggregate .init range; no per-function delink/TU |
| USA | ov006 | 0x021cb7b8 | sinit_ov006_021cb8c4.c | __sinit_ov006_021cb7b8 | aggregate .init range; no per-function delink/TU |
| USA | ov006 | 0x021cb7e4 | sinit_ov006_021cb8f0.c | __sinit_ov006_021cb7e4 | aggregate .init range; no per-function delink/TU |
| USA | ov006 | 0x021cb810 | sinit_ov006_021cb91c.c | __sinit_ov006_021cb810 | aggregate .init range; no per-function delink/TU |
| USA | ov006 | 0x021cb83c | sinit_ov006_021cb948.c | __sinit_ov006_021cb83c | aggregate .init range; no per-function delink/TU |
| USA | ov006 | 0x021cb868 | sinit_ov006_021cb974.c | __sinit_ov006_021cb868 | aggregate .init range; no per-function delink/TU |
| USA | ov006 | 0x021cb894 | sinit_ov006_021cb9a0.c | __sinit_ov006_021cb894 | aggregate .init range; no per-function delink/TU |
| USA | ov006 | 0x021cb8c0 | sinit_ov006_021cb9cc.c | __sinit_ov006_021cb8c0 | aggregate .init range; no per-function delink/TU |
| USA | ov006 | 0x021cb8ec | sinit_ov006_021cb9f8.c | __sinit_ov006_021cb8ec | aggregate .init range; no per-function delink/TU |
| USA | ov006 | 0x021cb918 | sinit_ov006_021cba24.c | __sinit_ov006_021cb918 | aggregate .init range; no per-function delink/TU |
| USA | ov006 | 0x021cb944 | sinit_ov006_021cba50.c | __sinit_ov006_021cb944 | aggregate .init range; no per-function delink/TU |
| USA | ov007 | 0x021b2180 | func_ov007_021b2280.c | func_ov007_021b2180 | aggregate overlay .text range; no per-function delink/TU |
| USA | ov007 | 0x021b2e38 | sinit_ov007_021b2f38.c | __sinit_ov007_021b2e38 | aggregate .init range; no per-function delink/TU |
| USA | ov007 | 0x021b2e64 | sinit_ov007_021b2f64.c | __sinit_ov007_021b2e64 | aggregate .init range; no per-function delink/TU |
| USA | ov009 | 0x021ad788 | sinit_ov009_021ad868.c | __sinit_ov009_021ad788 | aggregate .init range; no per-function delink/TU |
| USA | ov009 | 0x021ad7b4 | sinit_ov009_021ad894.c | __sinit_ov009_021ad7b4 | aggregate .init range; no per-function delink/TU |
| USA | ov009 | 0x021ad7e0 | sinit_ov009_021ad8c0.c | __sinit_ov009_021ad7e0 | aggregate .init range; no per-function delink/TU |
| USA | ov010 | 0x021b887c | sinit_ov010_021b897c.c | __sinit_ov010_021b887c | aggregate .init range; no per-function delink/TU |
| USA | ov010 | 0x021b88a8 | sinit_ov010_021b89a8.c | __sinit_ov010_021b88a8 | aggregate .init range; no per-function delink/TU |
| USA | ov010 | 0x021b88f0 | sinit_ov010_021b89f0.c | __sinit_ov010_021b88f0 | aggregate .init range; no per-function delink/TU |
| USA | ov011 | 0x021d3530 | sinit_ov011_021d3620.c | __sinit_ov011_021d3530 | aggregate .init range; no per-function delink/TU |
| USA | ov014 | 0x021b4b18 | sinit_ov014_021b4c18.c | __sinit_ov014_021b4b18 | aggregate .init range; no per-function delink/TU |
| USA | ov014 | 0x021b4b44 | sinit_ov014_021b4c44.c | __sinit_ov014_021b4b44 | aggregate .init range; no per-function delink/TU |
| USA | ov014 | 0x021b4b70 | sinit_ov014_021b4c70.c | __sinit_ov014_021b4b70 | aggregate .init range; no per-function delink/TU |
| USA | ov015 | 0x021b59fc | sinit_ov015_021b5b14.c | __sinit_ov015_021b59fc | aggregate .init range; no per-function delink/TU |
| USA | ov015 | 0x021b5a28 | sinit_ov015_021b5b40.c | __sinit_ov015_021b5a28 | aggregate .init range; no per-function delink/TU |
| USA | ov016 | 0x021b8d10 | sinit_ov016_021b8e7c.c | __sinit_ov016_021b8d10 | aggregate .init range; no per-function delink/TU |
| USA | ov016 | 0x021b8d3c | sinit_ov016_021b8ea8.c | __sinit_ov016_021b8d3c | aggregate .init range; no per-function delink/TU |
| USA | ov016 | 0x021b8d68 | sinit_ov016_021b8ed4.c | __sinit_ov016_021b8d68 | aggregate .init range; no per-function delink/TU |
| USA | ov016 | 0x021b8d94 | sinit_ov016_021b8f00.c | __sinit_ov016_021b8d94 | aggregate .init range; no per-function delink/TU |
| USA | ov016 | 0x021b8dc0 | sinit_ov016_021b8f2c.c | __sinit_ov016_021b8dc0 | aggregate .init range; no per-function delink/TU |
| USA | ov017 | 0x021b7e5c | sinit_ov017_021b7f5c.c | __sinit_ov017_021b7e5c | aggregate .init range; no per-function delink/TU |
| USA | ov017 | 0x021b7e88 | sinit_ov017_021b7f88.c | __sinit_ov017_021b7e88 | aggregate .init range; no per-function delink/TU |
| USA | ov017 | 0x021b7eb4 | sinit_ov017_021b7fb4.c | __sinit_ov017_021b7eb4 | aggregate .init range; no per-function delink/TU |
| USA | ov017 | 0x021b7ee0 | sinit_ov017_021b7fe0.c | __sinit_ov017_021b7ee0 | aggregate .init range; no per-function delink/TU |
| USA | ov019 | 0x021b5974 | sinit_ov019_021b5a88.c | __sinit_ov019_021b5974 | aggregate .init range; no per-function delink/TU |
| USA | ov019 | 0x021b59a0 | sinit_ov019_021b5ab4.c | __sinit_ov019_021b59a0 | aggregate .init range; no per-function delink/TU |
| USA | ov019 | 0x021b59cc | sinit_ov019_021b5ae0.c | __sinit_ov019_021b59cc | aggregate .init range; no per-function delink/TU |
| USA | ov021 | 0x021abd50 | sinit_ov021_021abe30.c | __sinit_ov021_021abd50 | aggregate .init range; no per-function delink/TU |
| USA | ov021 | 0x021abd7c | sinit_ov021_021abe5c.c | __sinit_ov021_021abd7c | aggregate .init range; no per-function delink/TU |
| JPN | main | 0x02000800 | Entry.c | Entry | aggregate main entry .text range; no per-function delink/TU |
| JPN | main | 0x02091454 | func_0209153c.c | func_0209153c | main gap between delinked functions; no per-function delink/TU |
| JPN | ov002 | 0x022ca6d8 | sinit_ov002_022ca7e8.c | __sinit_ov002_022ca6d8 | aggregate .init range; no per-function delink/TU |
| JPN | ov002 | 0x022ca6f8 | sinit_ov002_022ca808.c | __sinit_ov002_022ca6f8 | aggregate .init range; no per-function delink/TU |
| JPN | ov002 | 0x022ca724 | sinit_ov002_022ca834.c | __sinit_ov002_022ca724 | aggregate .init range; no per-function delink/TU |
| JPN | ov003 | 0x021cefd8 | sinit_ov003_021cf114.c | __sinit_ov003_021cefd8 | aggregate .init range; no per-function delink/TU |
| JPN | ov004 | 0x021dbc48 | func_ov004_021dbe5c.thumb.c | func_ov004_021dbc48 | aggregate ov004 .text range; no per-function delink/TU |
| JPN | ov004 | 0x021dbc54 | func_ov004_021dbe68.thumb.c | func_ov004_021dbc54 | aggregate ov004 .text range; no per-function delink/TU |
| JPN | ov004 | 0x021dbd1c | func_ov004_021dbf30.thumb.c | func_ov004_021dbd1c | aggregate ov004 .text range; no per-function delink/TU |
| JPN | ov004 | 0x021dc450 | func_ov004_021dc664.thumb.c | func_ov004_021dc450 | aggregate ov004 .text range; no per-function delink/TU |
| JPN | ov004 | 0x021dcb08 | func_ov004_021dcd1c.thumb.c | func_ov004_021dcb08 | aggregate ov004 .text range; no per-function delink/TU |
| JPN | ov004 | 0x021dd370 | func_ov004_021dd584.thumb.c | func_ov004_021dd370 | aggregate ov004 .text range; no per-function delink/TU |
| JPN | ov004 | 0x021dd37c | func_ov004_021dd590.thumb.c | func_ov004_021dd37c | aggregate ov004 .text range; no per-function delink/TU |
| JPN | ov004 | 0x021de028 | func_ov004_021de23c.thumb.c | func_ov004_021de028 | aggregate ov004 .text range; no per-function delink/TU |
| JPN | ov004 | 0x021de03c | func_ov004_021de250.thumb.c | func_ov004_021de03c | aggregate ov004 .text range; no per-function delink/TU |
| JPN | ov004 | 0x021de050 | func_ov004_021de264.thumb.c | func_ov004_021de050 | aggregate ov004 .text range; no per-function delink/TU |
| JPN | ov004 | 0x022097fc | sinit_ov004_02209a5c.c | __sinit_ov004_022097fc | aggregate .init range; no per-function delink/TU |
| JPN | ov005 | 0x021b15dc | sinit_ov005_021b16e4.c | __sinit_ov005_021b15dc | aggregate .init range; no per-function delink/TU |
| JPN | ov005 | 0x021b1608 | sinit_ov005_021b1710.c | __sinit_ov005_021b1608 | aggregate .init range; no per-function delink/TU |
| JPN | ov005 | 0x021b1634 | sinit_ov005_021b173c.c | __sinit_ov005_021b1634 | aggregate .init range; no per-function delink/TU |
| JPN | ov005 | 0x021b1660 | sinit_ov005_021b1768.c | __sinit_ov005_021b1660 | aggregate .init range; no per-function delink/TU |
| JPN | ov005 | 0x021b168c | sinit_ov005_021b1794.c | __sinit_ov005_021b168c | aggregate .init range; no per-function delink/TU |
| JPN | ov006 | 0x021cb78c | sinit_ov006_021cb898.c | __sinit_ov006_021cb78c | aggregate .init range; no per-function delink/TU |
| JPN | ov006 | 0x021cb7b8 | sinit_ov006_021cb8c4.c | __sinit_ov006_021cb7b8 | aggregate .init range; no per-function delink/TU |
| JPN | ov006 | 0x021cb7e4 | sinit_ov006_021cb8f0.c | __sinit_ov006_021cb7e4 | aggregate .init range; no per-function delink/TU |
| JPN | ov006 | 0x021cb810 | sinit_ov006_021cb91c.c | __sinit_ov006_021cb810 | aggregate .init range; no per-function delink/TU |
| JPN | ov006 | 0x021cb83c | sinit_ov006_021cb948.c | __sinit_ov006_021cb83c | aggregate .init range; no per-function delink/TU |
| JPN | ov006 | 0x021cb868 | sinit_ov006_021cb974.c | __sinit_ov006_021cb868 | aggregate .init range; no per-function delink/TU |
| JPN | ov006 | 0x021cb894 | sinit_ov006_021cb9a0.c | __sinit_ov006_021cb894 | aggregate .init range; no per-function delink/TU |
| JPN | ov006 | 0x021cb8c0 | sinit_ov006_021cb9cc.c | __sinit_ov006_021cb8c0 | aggregate .init range; no per-function delink/TU |
| JPN | ov006 | 0x021cb8ec | sinit_ov006_021cb9f8.c | __sinit_ov006_021cb8ec | aggregate .init range; no per-function delink/TU |
| JPN | ov006 | 0x021cb918 | sinit_ov006_021cba24.c | __sinit_ov006_021cb918 | aggregate .init range; no per-function delink/TU |
| JPN | ov006 | 0x021cb944 | sinit_ov006_021cba50.c | __sinit_ov006_021cb944 | aggregate .init range; no per-function delink/TU |
| JPN | ov007 | 0x021b2180 | func_ov007_021b2280.c | func_ov007_021b2180 | aggregate overlay .text range; no per-function delink/TU |
| JPN | ov007 | 0x021b2e38 | sinit_ov007_021b2f38.c | __sinit_ov007_021b2e38 | aggregate .init range; no per-function delink/TU |
| JPN | ov007 | 0x021b2e64 | sinit_ov007_021b2f64.c | __sinit_ov007_021b2e64 | aggregate .init range; no per-function delink/TU |
| JPN | ov009 | 0x021ad788 | sinit_ov009_021ad868.c | __sinit_ov009_021ad788 | aggregate .init range; no per-function delink/TU |
| JPN | ov009 | 0x021ad7b4 | sinit_ov009_021ad894.c | __sinit_ov009_021ad7b4 | aggregate .init range; no per-function delink/TU |
| JPN | ov009 | 0x021ad7e0 | sinit_ov009_021ad8c0.c | __sinit_ov009_021ad7e0 | aggregate .init range; no per-function delink/TU |
| JPN | ov010 | 0x021b887c | sinit_ov010_021b897c.c | __sinit_ov010_021b887c | aggregate .init range; no per-function delink/TU |
| JPN | ov010 | 0x021b88a8 | sinit_ov010_021b89a8.c | __sinit_ov010_021b88a8 | aggregate .init range; no per-function delink/TU |
| JPN | ov010 | 0x021b88f0 | sinit_ov010_021b89f0.c | __sinit_ov010_021b88f0 | aggregate .init range; no per-function delink/TU |
| JPN | ov011 | 0x021d3530 | sinit_ov011_021d3620.c | __sinit_ov011_021d3530 | aggregate .init range; no per-function delink/TU |
| JPN | ov014 | 0x021b4b18 | sinit_ov014_021b4c18.c | __sinit_ov014_021b4b18 | aggregate .init range; no per-function delink/TU |
| JPN | ov014 | 0x021b4b44 | sinit_ov014_021b4c44.c | __sinit_ov014_021b4b44 | aggregate .init range; no per-function delink/TU |
| JPN | ov014 | 0x021b4b70 | sinit_ov014_021b4c70.c | __sinit_ov014_021b4b70 | aggregate .init range; no per-function delink/TU |
| JPN | ov015 | 0x021b59fc | sinit_ov015_021b5b14.c | __sinit_ov015_021b59fc | aggregate .init range; no per-function delink/TU |
| JPN | ov015 | 0x021b5a28 | sinit_ov015_021b5b40.c | __sinit_ov015_021b5a28 | aggregate .init range; no per-function delink/TU |
| JPN | ov016 | 0x021b8d10 | sinit_ov016_021b8e7c.c | __sinit_ov016_021b8d10 | aggregate .init range; no per-function delink/TU |
| JPN | ov016 | 0x021b8d3c | sinit_ov016_021b8ea8.c | __sinit_ov016_021b8d3c | aggregate .init range; no per-function delink/TU |
| JPN | ov016 | 0x021b8d68 | sinit_ov016_021b8ed4.c | __sinit_ov016_021b8d68 | aggregate .init range; no per-function delink/TU |
| JPN | ov016 | 0x021b8d94 | sinit_ov016_021b8f00.c | __sinit_ov016_021b8d94 | aggregate .init range; no per-function delink/TU |
| JPN | ov016 | 0x021b8dc0 | sinit_ov016_021b8f2c.c | __sinit_ov016_021b8dc0 | aggregate .init range; no per-function delink/TU |
| JPN | ov017 | 0x021b7e5c | sinit_ov017_021b7f5c.c | __sinit_ov017_021b7e5c | aggregate .init range; no per-function delink/TU |
| JPN | ov017 | 0x021b7e88 | sinit_ov017_021b7f88.c | __sinit_ov017_021b7e88 | aggregate .init range; no per-function delink/TU |
| JPN | ov017 | 0x021b7eb4 | sinit_ov017_021b7fb4.c | __sinit_ov017_021b7eb4 | aggregate .init range; no per-function delink/TU |
| JPN | ov017 | 0x021b7ee0 | sinit_ov017_021b7fe0.c | __sinit_ov017_021b7ee0 | aggregate .init range; no per-function delink/TU |
| JPN | ov019 | 0x021b5974 | sinit_ov019_021b5a88.c | __sinit_ov019_021b5974 | aggregate .init range; no per-function delink/TU |
| JPN | ov019 | 0x021b59a0 | sinit_ov019_021b5ab4.c | __sinit_ov019_021b59a0 | aggregate .init range; no per-function delink/TU |
| JPN | ov019 | 0x021b59cc | sinit_ov019_021b5ae0.c | __sinit_ov019_021b59cc | aggregate .init range; no per-function delink/TU |
| JPN | ov021 | 0x021abd50 | sinit_ov021_021abe30.c | __sinit_ov021_021abd50 | aggregate .init range; no per-function delink/TU |
| JPN | ov021 | 0x021abd7c | sinit_ov021_021abe5c.c | __sinit_ov021_021abd7c | aggregate .init range; no per-function delink/TU |

## Next prerequisite

The scaffolder/EUR lane should add individual delinks for these addresses, then rerun the census. Only after a target `.s` and a per-function `delinks.txt` header exist should the port lane attempt a C conversion.
