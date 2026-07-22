# Wall-marker census

Snapshot: **2026-07-22**, build-free, from the fresh `origin/main` branch.

This is a mechanical header census. It records explicit evidence only; it does
not decide whether a marked wall is real, convertible, or worth retrying.

## Scope and classification

- Scanned **20170 tracked `src/**/*.s` files** across EUR, USA, and JPN.
- The header is the leading comment preamble (blank/comment lines before the
  first assembler directive). A file is counted once in its first matching
  class; taxonomy counts are also tabulated by code.
- Taxonomy markers are explicit `C-NN`/`P-NN` tokens. The cohort marker is
  `GLOBAL_ASM` or an explicit Brief 294/302 citation. Free-form is wall
  evidence in prose without either a taxonomy token or cohort stamp. No marker
  means neither was present in the header.
- In this snapshot taxonomy and cohort classes do not overlap. Region ports
  carry the cohort stamp but no taxonomy codes in their headers.

## 1. Marker type totals by region

| Region | Total | C-8 | C-23 | C-31 | C-32 | C-34 | C-36 | P-11 | GLOBAL_ASM | Free-form | No marker |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| eur | 6261 | 1 | 1 | 4 | 17 | 118 | 1 | 1 | 5969 | 2 | 148 |
| usa | 6955 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 6879 | 2 | 74 |
| jpn | 6954 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 6880 | 2 | 72 |

Global file totals by marker type:

| Marker type | Files |
|---|---:|
| C-8 | 1 |
| C-23 | 1 |
| C-31 | 4 |
| C-32 | 17 |
| C-34 | 118 |
| C-36 | 1 |
| P-11 | 1 |
| GLOBAL_ASM / briefs 294+302 | 19728 |
| free-form prose, no code | 6 |
| NO MARKER | 294 |

Taxonomy totals are file counts; because a header can theoretically cite more
than one taxonomy code, code columns are not assumed to form a disjoint sum.
In this snapshot there are **1 C-8**, **1 C-23**,
**4 C-31**, **17 C-32**, **118 C-34**,
**1 C-36**, and **1 P-11** files.

## 2. Marker counts by module

The complete module-by-module table follows. The EUR rows include the large
`overlay002` population (**2,780 tracked .s; 2,773 live function .s in the
headroom tool**) and `main` (**2,530 tracked .s; the tool's **2,453 wall**
verdict among 2,496 live EUR .s**). USA/JPN rows are region-port modules.

| Module | Total | C-8 | C-23 | C-31 | C-32 | C-34 | C-36 | P-11 | GLOBAL_ASM | Free-form | No marker |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| eur/main | 2530 | 1 | 1 | 1 | 0 | 60 | 1 | 0 | 2390 | 2 | 75 |
| eur/overlay000 | 59 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 58 | 0 | 0 |
| eur/overlay001 | 3 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 1 | 0 | 1 |
| eur/overlay002 | 2780 | 0 | 0 | 0 | 0 | 33 | 0 | 0 | 2740 | 0 | 7 |
| eur/overlay003 | 19 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 18 | 0 | 1 |
| eur/overlay004 | 175 | 0 | 0 | 3 | 0 | 5 | 0 | 0 | 150 | 0 | 17 |
| eur/overlay005 | 33 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 32 | 0 | 1 |
| eur/overlay006 | 179 | 0 | 0 | 0 | 0 | 3 | 0 | 0 | 158 | 0 | 18 |
| eur/overlay007 | 12 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 10 | 0 | 2 |
| eur/overlay008 | 63 | 0 | 0 | 0 | 0 | 6 | 0 | 0 | 56 | 0 | 1 |
| eur/overlay009 | 18 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 17 | 0 | 1 |
| eur/overlay010 | 54 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 48 | 0 | 5 |
| eur/overlay011 | 91 | 0 | 0 | 0 | 15 | 1 | 0 | 1 | 70 | 0 | 4 |
| eur/overlay012 | 17 | 0 | 0 | 0 | 1 | 1 | 0 | 0 | 14 | 0 | 1 |
| eur/overlay013 | 10 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 8 | 0 | 1 |
| eur/overlay014 | 22 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 20 | 0 | 1 |
| eur/overlay015 | 29 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 26 | 0 | 3 |
| eur/overlay016 | 44 | 0 | 0 | 0 | 0 | 2 | 0 | 0 | 41 | 0 | 1 |
| eur/overlay017 | 31 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 29 | 0 | 1 |
| eur/overlay018 | 11 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 9 | 0 | 1 |
| eur/overlay019 | 26 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 25 | 0 | 1 |
| eur/overlay020 | 28 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 26 | 0 | 1 |
| eur/overlay021 | 11 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 9 | 0 | 2 |
| eur/overlay022 | 13 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 12 | 0 | 1 |
| eur/overlay023 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 1 |
| jpn/main | 2922 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2896 | 2 | 24 |
| jpn/overlay000 | 86 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 85 | 0 | 1 |
| jpn/overlay001 | 5 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 4 | 0 | 1 |
| jpn/overlay002 | 2854 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2846 | 0 | 8 |
| jpn/overlay003 | 22 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 21 | 0 | 1 |
| jpn/overlay004 | 166 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 165 | 0 | 1 |
| jpn/overlay005 | 64 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 63 | 0 | 1 |
| jpn/overlay006 | 254 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 238 | 0 | 16 |
| jpn/overlay007 | 21 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 19 | 0 | 2 |
| jpn/overlay008 | 72 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 71 | 0 | 1 |
| jpn/overlay009 | 25 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 24 | 0 | 1 |
| jpn/overlay010 | 62 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 61 | 0 | 1 |
| jpn/overlay011 | 102 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 101 | 0 | 1 |
| jpn/overlay012 | 17 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 16 | 0 | 1 |
| jpn/overlay013 | 10 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 9 | 0 | 1 |
| jpn/overlay014 | 29 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 28 | 0 | 1 |
| jpn/overlay015 | 40 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 39 | 0 | 1 |
| jpn/overlay016 | 57 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 56 | 0 | 1 |
| jpn/overlay017 | 40 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 39 | 0 | 1 |
| jpn/overlay018 | 10 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 9 | 0 | 1 |
| jpn/overlay019 | 33 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 32 | 0 | 1 |
| jpn/overlay020 | 28 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 27 | 0 | 1 |
| jpn/overlay021 | 20 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 18 | 0 | 2 |
| jpn/overlay022 | 13 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 12 | 0 | 1 |
| jpn/overlay023 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 1 |
| usa/main | 2923 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2895 | 2 | 26 |
| usa/overlay000 | 86 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 85 | 0 | 1 |
| usa/overlay001 | 5 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 4 | 0 | 1 |
| usa/overlay002 | 2854 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2846 | 0 | 8 |
| usa/overlay003 | 22 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 21 | 0 | 1 |
| usa/overlay004 | 166 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 165 | 0 | 1 |
| usa/overlay005 | 64 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 63 | 0 | 1 |
| usa/overlay006 | 254 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 238 | 0 | 16 |
| usa/overlay007 | 21 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 19 | 0 | 2 |
| usa/overlay008 | 72 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 71 | 0 | 1 |
| usa/overlay009 | 25 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 24 | 0 | 1 |
| usa/overlay010 | 62 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 61 | 0 | 1 |
| usa/overlay011 | 102 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 101 | 0 | 1 |
| usa/overlay012 | 17 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 16 | 0 | 1 |
| usa/overlay013 | 10 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 9 | 0 | 1 |
| usa/overlay014 | 29 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 28 | 0 | 1 |
| usa/overlay015 | 40 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 39 | 0 | 1 |
| usa/overlay016 | 57 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 56 | 0 | 1 |
| usa/overlay017 | 40 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 39 | 0 | 1 |
| usa/overlay018 | 10 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 9 | 0 | 1 |
| usa/overlay019 | 33 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 32 | 0 | 1 |
| usa/overlay020 | 28 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 27 | 0 | 1 |
| usa/overlay021 | 20 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 18 | 0 | 2 |
| usa/overlay022 | 13 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 12 | 0 | 1 |
| usa/overlay023 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 1 |

## 3. Flagged files

### No marker at all

**294 files** have no taxonomy code, cohort stamp, or free-form
wall evidence in the header. They are flagged as unmarked, not judged safe or
unsafe. Complete path list:

<details>
<summary>294 unmarked paths</summary>

```text
src/jpn/main/CpuSet.s
src/jpn/main/Halt.s
src/jpn/main/HuffUnCompReadByCallback.s
src/jpn/main/LZ77UnCompReadNormalWrite8bit.s
src/jpn/main/WaitByLoop.s
src/jpn/main/bss/data_main_bss.s
src/jpn/main/data/data_020c4124.s
src/jpn/main/data/data_020c7a64.s
src/jpn/main/data/data_020c8da4.s
src/jpn/main/data/data_020c95b4.s
src/jpn/main/data/data_020f8b80.s
src/jpn/main/data/data_020f8f14.s
src/jpn/main/data/data_020fb8a0.s
src/jpn/main/data/data_020fb9fc.s
src/jpn/main/data/data_020fc080.s
src/jpn/main/data/data_020fc504.s
src/jpn/main/data/data_020fdca0.s
src/jpn/main/data/data_020fddec.s
src/jpn/main/data/data_020fe050.s
src/jpn/main/data/data_02101ed4.s
src/jpn/main/data/data_02102024.s
src/jpn/main/data/data_021024a8.s
src/jpn/main/data/data_021025ac.s
src/jpn/main/data/data_02102624.s
src/jpn/overlay000/bss/data_ov000_bss.s
src/jpn/overlay001/bss/data_ov001_bss.s
src/jpn/overlay002/bss/data_ov002_bss.s
src/jpn/overlay002/data/data_ov002_022ca8bc.s
src/jpn/overlay002/data/data_ov002_022cabc0.s
src/jpn/overlay002/data/data_ov002_022cac38.s
src/jpn/overlay002/data/data_ov002_022ccb68.s
src/jpn/overlay002/data/data_ov002_022ccc30.s
src/jpn/overlay002/data/data_ov002_022ccee4.s
src/jpn/overlay002/data/data_ov002_022ccf9c.s
src/jpn/overlay003/bss/data_ov003_bss.s
src/jpn/overlay004/bss/data_ov004_bss.s
src/jpn/overlay005/bss/data_ov005_bss.s
src/jpn/overlay006/bss/data_ov006_bss.s
src/jpn/overlay006/data/data_ov006_021cc5ac.s
src/jpn/overlay006/data/data_ov006_021cc804.s
src/jpn/overlay006/data/data_ov006_021cc930.s
src/jpn/overlay006/data/data_ov006_021cca68.s
src/jpn/overlay006/data/data_ov006_021ccf68.s
src/jpn/overlay006/data/data_ov006_021cd1e8.s
src/jpn/overlay006/data/data_ov006_021cd468.s
src/jpn/overlay006/data/data_ov006_021cd6e8.s
src/jpn/overlay006/data/data_ov006_021cd968.s
src/jpn/overlay006/data/data_ov006_021cdbe8.s
src/jpn/overlay006/data/data_ov006_021cdd0c.s
src/jpn/overlay006/data/data_ov006_021ce530.s
src/jpn/overlay006/data/data_ov006_021ce9e4.s
src/jpn/overlay006/data/data_ov006_021cea2c.s
src/jpn/overlay006/data/data_ov006_021ceae4.s
src/jpn/overlay007/bss/data_ov007_bss.s
src/jpn/overlay007/data/data_ov007_021b2fc0.s
src/jpn/overlay008/bss/data_ov008_bss.s
src/jpn/overlay009/bss/data_ov009_bss.s
src/jpn/overlay010/bss/data_ov010_bss.s
src/jpn/overlay011/bss/data_ov011_bss.s
src/jpn/overlay012/bss/data_ov012_bss.s
src/jpn/overlay013/bss/data_ov013_bss.s
src/jpn/overlay014/bss/data_ov014_bss.s
src/jpn/overlay015/bss/data_ov015_bss.s
src/jpn/overlay016/bss/data_ov016_bss.s
src/jpn/overlay017/bss/data_ov017_bss.s
src/jpn/overlay018/bss/data_ov018_bss.s
src/jpn/overlay019/bss/data_ov019_bss.s
src/jpn/overlay020/bss/data_ov020_bss.s
src/jpn/overlay021/bss/data_ov021_bss.s
src/jpn/overlay021/data/data_ov021_021aca40.s
src/jpn/overlay022/bss/data_ov022_bss.s
src/jpn/overlay023/bss/data_ov023_bss.s
src/main/BitUnPack.s
src/main/Div.s
src/main/GetCRC16.s
src/main/IsDebugger.s
src/main/LZ77UnCompReadByCallbackWrite16bit.s
src/main/Mod.s
src/main/RLUnCompReadByCallbackWrite16bit.s
src/main/RLUnCompReadNormalWrite8bit.s
src/main/SoftReset.s
src/main/VBlankIntrWait.s
src/main/bss/data_main_bss.s
src/main/bss/data_main_bss_pre.s
src/main/data/data_020b4320.s
src/main/data/data_020b46e0.s
src/main/data/data_020b476c.s
src/main/data/data_020b4a2c.s
src/main/data/data_020b59e0.s
src/main/data/data_020b5ab8.s
src/main/data/data_020b6ec4.s
src/main/data/data_020be71c.s
src/main/data/data_020be820.s
src/main/data/data_020beb58.s
src/main/data/data_020bec3c.s
src/main/data/data_020bece4.s
src/main/data/data_020bee6c.s
src/main/data/data_020bef5c.s
src/main/data/data_020c3188.s
src/main/data/data_020c387c.s
src/main/data/data_020c3b8c.s
src/main/data/data_020c4204.s
src/main/data/data_020c7b44.s
src/main/data/data_020c8e84.s
src/main/data/data_020e0e70.s
src/main/data/data_020f8c60.s
src/main/data/data_020fb980.s
src/main/data/data_020fc160.s
src/main/data/data_020fdd80.s
src/main/data/data_020fe130.s
src/main/data/data_021017f0.s
src/main/data/data_02101928.s
src/main/data/data_02101fb4.s
src/main/data/data_02102588.s
src/main/data_020b52d4.s
src/main/data_02102be8.s
src/main/func_0201aabc.s
src/main/func_0201aaf4.s
src/main/func_02023f7c.s
src/main/func_0203ab98.s
src/main/func_0203d6c4.s
src/main/func_02067b8c.s
src/main/func_0206be1c.s
src/main/func_02074e4c.s
src/main/func_0207708c.s
src/main/func_02078eec.s
src/main/func_0207deb0.s
src/main/func_0207e214.s
src/main/func_0207f8f8.s
src/main/func_0208b190.s
src/main/func_0208b1ac.s
src/main/func_0208b1c8.s
src/main/func_020928e8.s
src/main/func_02092940.s
src/main/func_020947b8.s
src/main/func_02096040.s
src/main/func_02098cdc.s
src/main/func_020a71e4.s
src/main/func_020a724c.s
src/main/func_020a9914.s
src/main/func_020b005c.s
src/main/func_020b3648.s
src/main/func_020b3808.s
src/main/func_020b3814.s
src/main/func_020b3850.s
src/main/itcm/func_01ff8400.s
src/main/itcm/func_01ff86fc.s
src/overlay001/bss/data_ov001_bss.s
src/overlay002/data/data_ov002_022ca9bc.s
src/overlay002/data/data_ov002_022cad38.s
src/overlay002/data/data_ov002_022ccc5c.s
src/overlay002/data/data_ov002_022cccc0.s
src/overlay002/data/data_ov002_022ccd24.s
src/overlay002/data/data_ov002_022cce28.s
src/overlay002/data/data_ov002_022cd090.s
src/overlay003/bss/data_ov003_bss.s
src/overlay004/bss/data_ov004_bss.s
src/overlay004/data/data_ov004_02200dbc.s
src/overlay004/data/data_ov004_02200df4.s
src/overlay004/data/data_ov004_02200e00.s
src/overlay004/data/data_ov004_02200f18.s
src/overlay004/func_ov004_021dbdbc.s
src/overlay004/func_ov004_021dbe68.s
src/overlay004/func_ov004_021de264.s
src/overlay004/ov004_021c9eec.s
src/overlay004/ov004_021d3c88.s
src/overlay004/ov004_021d4ad4.s
src/overlay004/ov004_021d4ad8.s
src/overlay004/ov004_021d4adc.s
src/overlay004/ov004_021d4ae0.s
src/overlay004/ov004_021d4e08.s
src/overlay004/ov004_021d8640.s
src/overlay004/ov004_021d8644.s
src/overlay005/bss/data_ov005_bss.s
src/overlay006/bss/data_ov006_bss.s
src/overlay006/data/data_ov006_021cc6cc.s
src/overlay006/data/data_ov006_021cc7f8.s
src/overlay006/data/data_ov006_021cc924.s
src/overlay006/data/data_ov006_021cca50.s
src/overlay006/data/data_ov006_021ccb88.s
src/overlay006/data/data_ov006_021cce08.s
src/overlay006/data/data_ov006_021cd088.s
src/overlay006/data/data_ov006_021cd308.s
src/overlay006/data/data_ov006_021cd588.s
src/overlay006/data/data_ov006_021cd808.s
src/overlay006/data/data_ov006_021cda88.s
src/overlay006/data/data_ov006_021cde2c.s
src/overlay006/data/data_ov006_021ce1e8.s
src/overlay006/data/data_ov006_021ce650.s
src/overlay006/data/data_ov006_021ce8a8.s
src/overlay006/data/data_ov006_021ceb4c.s
src/overlay006/data/data_ov006_021cec04.s
src/overlay007/bss/data_ov007_bss.s
src/overlay007/data/data_ov007_021b30c0.s
src/overlay008/bss/data_ov008_bss.s
src/overlay009/bss/data_ov009_bss.s
src/overlay010/bss/data_ov010_bss.s
src/overlay010/ov010_021b285c.s
src/overlay010/ov010_021b2860.s
src/overlay010/ov010_021b365c.s
src/overlay010/ov010_021b3660.s
src/overlay011/bss/data_ov011_bss.s
src/overlay011/func_ov011_021d2c64.s
src/overlay011/ov011_021d12bc.s
src/overlay011/ov011_021d18b0.s
src/overlay012/bss/data_ov012_bss.s
src/overlay013/bss/data_ov013_bss.s
src/overlay014/bss/data_ov014_bss.s
src/overlay015/bss/data_ov015_bss.s
src/overlay015/ov015_021b3168.s
src/overlay015/ov015_021b316c.s
src/overlay016/bss/data_ov016_bss.s
src/overlay017/bss/data_ov017_bss.s
src/overlay018/bss/data_ov018_bss.s
src/overlay019/bss/data_ov019_bss.s
src/overlay020/bss/data_ov020_bss.s
src/overlay021/bss/data_ov021_bss.s
src/overlay021/data/data_ov021_021acb20.s
src/overlay022/bss/data_ov022_bss.s
src/overlay023/bss/data_ov023_bss.s
src/usa/main/CpuFastSet.s
src/usa/main/Halt.s
src/usa/main/HuffUnCompReadByCallback.s
src/usa/main/IntrWait.s
src/usa/main/LZ77UnCompReadNormalWrite8bit.s
src/usa/main/WaitByLoop.s
src/usa/main/bss/data_main_bss.s
src/usa/main/data/data_020b425c.s
src/usa/main/data/data_020c4124.s
src/usa/main/data/data_020c7a64.s
src/usa/main/data/data_020c8da4.s
src/usa/main/data/data_020c95b4.s
src/usa/main/data/data_020f8b80.s
src/usa/main/data/data_020f8f14.s
src/usa/main/data/data_020fb8a0.s
src/usa/main/data/data_020fb9fc.s
src/usa/main/data/data_020fc080.s
src/usa/main/data/data_020fc504.s
src/usa/main/data/data_020fdca0.s
src/usa/main/data/data_020fddec.s
src/usa/main/data/data_020fe050.s
src/usa/main/data/data_02101ed4.s
src/usa/main/data/data_02102024.s
src/usa/main/data/data_021024a8.s
src/usa/main/data/data_021025ac.s
src/usa/main/data/data_02102624.s
src/usa/overlay000/bss/data_ov000_bss.s
src/usa/overlay001/bss/data_ov001_bss.s
src/usa/overlay002/bss/data_ov002_bss.s
src/usa/overlay002/data/data_ov002_022ca8bc.s
src/usa/overlay002/data/data_ov002_022cabc0.s
src/usa/overlay002/data/data_ov002_022cac38.s
src/usa/overlay002/data/data_ov002_022ccb68.s
src/usa/overlay002/data/data_ov002_022ccc30.s
src/usa/overlay002/data/data_ov002_022ccee4.s
src/usa/overlay002/data/data_ov002_022ccf9c.s
src/usa/overlay003/bss/data_ov003_bss.s
src/usa/overlay004/bss/data_ov004_bss.s
src/usa/overlay005/bss/data_ov005_bss.s
src/usa/overlay006/bss/data_ov006_bss.s
src/usa/overlay006/data/data_ov006_021cc5ac.s
src/usa/overlay006/data/data_ov006_021cc804.s
src/usa/overlay006/data/data_ov006_021cc930.s
src/usa/overlay006/data/data_ov006_021cca68.s
src/usa/overlay006/data/data_ov006_021ccf68.s
src/usa/overlay006/data/data_ov006_021cd1e8.s
src/usa/overlay006/data/data_ov006_021cd468.s
src/usa/overlay006/data/data_ov006_021cd6e8.s
src/usa/overlay006/data/data_ov006_021cd968.s
src/usa/overlay006/data/data_ov006_021cdbe8.s
src/usa/overlay006/data/data_ov006_021cdd0c.s
src/usa/overlay006/data/data_ov006_021ce530.s
src/usa/overlay006/data/data_ov006_021ce9e4.s
src/usa/overlay006/data/data_ov006_021cea2c.s
src/usa/overlay006/data/data_ov006_021ceae4.s
src/usa/overlay007/bss/data_ov007_bss.s
src/usa/overlay007/data/data_ov007_021b2fc0.s
src/usa/overlay008/bss/data_ov008_bss.s
src/usa/overlay009/bss/data_ov009_bss.s
src/usa/overlay010/bss/data_ov010_bss.s
src/usa/overlay011/bss/data_ov011_bss.s
src/usa/overlay012/bss/data_ov012_bss.s
src/usa/overlay013/bss/data_ov013_bss.s
src/usa/overlay014/bss/data_ov014_bss.s
src/usa/overlay015/bss/data_ov015_bss.s
src/usa/overlay016/bss/data_ov016_bss.s
src/usa/overlay017/bss/data_ov017_bss.s
src/usa/overlay018/bss/data_ov018_bss.s
src/usa/overlay019/bss/data_ov019_bss.s
src/usa/overlay020/bss/data_ov020_bss.s
src/usa/overlay021/bss/data_ov021_bss.s
src/usa/overlay021/data/data_ov021_021aca40.s
src/usa/overlay022/bss/data_ov022_bss.s
src/usa/overlay023/bss/data_ov023_bss.s
```

</details>

### Blanket cohort only

**19728 files** carry only the blanket GLOBAL_ASM / Brief
294/302 cohort stamp, with no per-function taxonomy reason. This is a flag about
the evidence shape, not a judgment about wall validity. The module table gives
the complete count for every module; representative paths include:

- `src/jpn/main/Copy32.s`, `src/jpn/main/FS_LoadOverlayInfo.s`, `src/main/func_0200093c.s`, `src/main/func_02000950.s`, `src/main/func_02000a78.s`

### Free-form prose, no code

**6 files** carry prose wall evidence but no C-NN/P-NN
code and no blanket cohort stamp:

- `src/jpn/main/func_020b2c38.s`
- `src/jpn/main/func_020b3b84.s`
- `src/main/func_020b2d2c.s`
- `src/main/func_020b3c78.s`
- `src/usa/main/func_020b2c38.s`
- `src/usa/main/func_020b3b84.s`

These are the Brief 572 whole-function-as-data / verify-fail headers; the census
records the prose class without deciding whether the wall is permanent.

## 4. Tool cross-check sample (~20)

The requested command was attempted verbatim first:

```text
python3.13 tools/wall_aware_headroom.py
```

`python3.13` is not installed on this Windows host. The same script was
then run build-free as `python tools/wall_aware_headroom.py`; it reported
**6,158 live EUR .s**, including `main` 2,496 total / 2,453 wall / 43
convertible and `overlay002` 2,773 total / 2,773 wall / 0 convertible.
The full tool output's total was **47 genuinely-convertible live EUR .s**.

For this deterministic 20-file sample, “actual header” means the census class
and “tool verdict” means `wall_aware_headroom.py`'s regex verdict:

| File | Header marker class | Tool verdict | Header interpretation | Result |
|---|---|---|---|---|
| src/main/FS_LoadOverlayInfo.s | GLOBAL_ASM / briefs 294+302 | wall | wall-marker | AGREE |
| src/main/FS_UnloadOverlay.s | GLOBAL_ASM / briefs 294+302 | wall | wall-marker | AGREE |
| src/main/func_02000950.s | GLOBAL_ASM / briefs 294+302 | wall | wall-marker | AGREE |
| src/main/func_020009fc.s | GLOBAL_ASM / briefs 294+302 | wall | wall-marker | AGREE |
| src/main/func_02000a78.s | GLOBAL_ASM / briefs 294+302 | wall | wall-marker | AGREE |
| src/main/func_02000cc4.s | GLOBAL_ASM / briefs 294+302 | wall | wall-marker | AGREE |
| src/main/func_02000d0c.s | GLOBAL_ASM / briefs 294+302 | wall | wall-marker | AGREE |
| src/main/func_02000d4c.s | GLOBAL_ASM / briefs 294+302 | wall | wall-marker | AGREE |
| src/main/func_02000f84.s | TAX:C-34 | wall | wall-marker | AGREE |
| src/main/func_020037d0.s | TAX:C-34 | wall | wall-marker | AGREE |
| src/main/func_02003d98.s | TAX:C-34 | wall | wall-marker | AGREE |
| src/main/func_020061bc.s | TAX:C-34 | wall | wall-marker | AGREE |
| src/main/func_02006524.s | TAX:C-34 | wall | wall-marker | AGREE |
| src/main/BitUnPack.s | NO MARKER | convertible | no-marker | AGREE |
| src/main/Div.s | NO MARKER | convertible | no-marker | AGREE |
| src/main/GetCRC16.s | NO MARKER | convertible | no-marker | AGREE |
| src/main/IsDebugger.s | NO MARKER | convertible | no-marker | AGREE |
| src/main/LZ77UnCompReadByCallbackWrite16bit.s | NO MARKER | convertible | no-marker | AGREE |
| src/main/func_020b2d2c.s | free-form prose, no code | convertible | wall-marker | DISAGREE |
| src/main/func_020b3c78.s | free-form prose, no code | convertible | wall-marker | DISAGREE |

**Disagreements: 2/20**, both EUR data-blob files. Their headers say
whole-function-as-data / verify-fail in free-form prose, while the tool's
narrow regex returns convertible. The other 18 samples agree. This is recorded
as a tool/header disagreement only; no wall judgment is made here.

## Reproduction notes

The census used `git ls-files 'src/**/*.s'`, read only each file's leading
header preamble, and did not invoke a build, compiler, linker, or ROM gate.

