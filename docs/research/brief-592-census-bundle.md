# Brief 592: census bundle redo

All measurements are read-only. No ninja sha1, ninja rom, Wine, or real carve
was run.

## Task 1: size census

Each region's complete size_census output is preserved below verbatim.

### EUR

```text
Unmatched functions by size bucket (brief 277 knee):

module           <0x100      0x100-0x200           >0x200          total
------------------------------------------------------------------------
itcm         9 / 0x000508     2 / 0x00028c     0 / 0x000000    11 / 0x000794
ov004        9 / 0x0004fe     5 / 0x000702     1 / 0x000aec    15 / 0x0016ec
ov007        1 / 0x000058     0 / 0x000000     0 / 0x000000     1 / 0x000058
ov015        1 / 0x0000b4     0 / 0x000000     0 / 0x000000     1 / 0x0000b4
main         0 / 0x000000     0 / 0x000000     0 / 0x000000     0 / 0x000000
dtcm         0 / 0x000000     0 / 0x000000     0 / 0x000000     0 / 0x000000
ov000        0 / 0x000000     0 / 0x000000     0 / 0x000000     0 / 0x000000
ov001        0 / 0x000000     1 / 0x0001c4     0 / 0x000000     1 / 0x0001c4
ov002        0 / 0x000000     0 / 0x000000     0 / 0x000000     0 / 0x000000
ov003        0 / 0x000000     0 / 0x000000     1 / 0x000368     1 / 0x000368
ov005        0 / 0x000000     0 / 0x000000     0 / 0x000000     0 / 0x000000
ov006        0 / 0x000000     0 / 0x000000     0 / 0x000000     0 / 0x000000
ov008        0 / 0x000000     0 / 0x000000     0 / 0x000000     0 / 0x000000
ov009        0 / 0x000000     0 / 0x000000     0 / 0x000000     0 / 0x000000
ov010        0 / 0x000000     0 / 0x000000     0 / 0x000000     0 / 0x000000
ov011        0 / 0x000000     0 / 0x000000     0 / 0x000000     0 / 0x000000
ov012        0 / 0x000000     0 / 0x000000     0 / 0x000000     0 / 0x000000
ov013        0 / 0x000000     0 / 0x000000     0 / 0x000000     0 / 0x000000
ov014        0 / 0x000000     0 / 0x000000     1 / 0x000330     1 / 0x000330
ov016        0 / 0x000000     0 / 0x000000     0 / 0x000000     0 / 0x000000
ov017        0 / 0x000000     0 / 0x000000     0 / 0x000000     0 / 0x000000
ov018        0 / 0x000000     0 / 0x000000     0 / 0x000000     0 / 0x000000
ov019        0 / 0x000000     0 / 0x000000     1 / 0x000390     1 / 0x000390
ov020        0 / 0x000000     0 / 0x000000     0 / 0x000000     0 / 0x000000
ov021        0 / 0x000000     0 / 0x000000     0 / 0x000000     0 / 0x000000
ov022        0 / 0x000000     0 / 0x000000     0 / 0x000000     0 / 0x000000
ov023        0 / 0x000000     0 / 0x000000     0 / 0x000000     0 / 0x000000
------------------------------------------------------------------------
TOTAL       20 / 0x000b12     8 / 0x000b52     4 / 0x001514

Hand-matchable runway (<0x100): 20 funcs, 0xb12 bytes. Drain order (richest <0x100 vein first): itcm, ov004, ov007, ov015, main, dtcm, ov000, ov001
```

### USA

```text
Unmatched functions by size bucket (brief 277 knee):

module           <0x100      0x100-0x200           >0x200          total
------------------------------------------------------------------------
main        56 / 0x00059a     1 / 0x00013c     1 / 0x000280    58 / 0x000956
ov004       37 / 0x000858     6 / 0x00085a     1 / 0x000aec    44 / 0x001b9e
itcm        12 / 0x0005e0     2 / 0x00028c     0 / 0x000000    14 / 0x00086c
ov006       11 / 0x0001e4     0 / 0x000000     0 / 0x000000    11 / 0x0001e4
ov002        6 / 0x000130     0 / 0x000000     0 / 0x000000     6 / 0x000130
ov005        6 / 0x0000e0     0 / 0x000000     0 / 0x000000     6 / 0x0000e0
ov016        5 / 0x0000dc     0 / 0x000000     0 / 0x000000     5 / 0x0000dc
ov017        5 / 0x00011c     0 / 0x000000     0 / 0x000000     5 / 0x00011c
ov009        4 / 0x000088     0 / 0x000000     0 / 0x000000     4 / 0x000088
ov010        4 / 0x000170     0 / 0x000000     0 / 0x000000     4 / 0x000170
ov007        3 / 0x0000b0     0 / 0x000000     0 / 0x000000     3 / 0x0000b0
ov014        3 / 0x000084     0 / 0x000000     1 / 0x000330     4 / 0x0003b4
ov015        3 / 0x00011c     0 / 0x000000     0 / 0x000000     3 / 0x00011c
ov019        3 / 0x000084     0 / 0x000000     1 / 0x000390     4 / 0x000414
ov021        2 / 0x000058     0 / 0x000000     0 / 0x000000     2 / 0x000058
ov003        1 / 0x00002c     0 / 0x000000     1 / 0x000368     2 / 0x000394
ov008        1 / 0x00006c     0 / 0x000000     0 / 0x000000     1 / 0x00006c
ov011        1 / 0x000034     0 / 0x000000     0 / 0x000000     1 / 0x000034
ov013        1 / 0x000014     0 / 0x000000     0 / 0x000000     1 / 0x000014
ov022        1 / 0x0000a0     0 / 0x000000     0 / 0x000000     1 / 0x0000a0
ov023        1 / 0x000064     0 / 0x000000     0 / 0x000000     1 / 0x000064
dtcm         0 / 0x000000     0 / 0x000000     0 / 0x000000     0 / 0x000000
ov000        0 / 0x000000     0 / 0x000000     0 / 0x000000     0 / 0x000000
ov001        0 / 0x000000     1 / 0x0001c4     0 / 0x000000     1 / 0x0001c4
ov012        0 / 0x000000     0 / 0x000000     0 / 0x000000     0 / 0x000000
ov018        0 / 0x000000     1 / 0x00015c     0 / 0x000000     1 / 0x00015c
ov020        0 / 0x000000     1 / 0x0001dc     0 / 0x000000     1 / 0x0001dc
------------------------------------------------------------------------
TOTAL      166 / 0x0020c6    12 / 0x00111e     5 / 0x001794

Hand-matchable runway (<0x100): 166 funcs, 0x20c6 bytes. Drain order (richest <0x100 vein first): main, ov004, itcm, ov006, ov002, ov005, ov016, ov017
```

### JPN

```text
Unmatched functions by size bucket (brief 277 knee):

module           <0x100      0x100-0x200           >0x200          total
------------------------------------------------------------------------
main        55 / 0x000526     1 / 0x00013c     1 / 0x000280    57 / 0x0008e2
ov004       37 / 0x000858     6 / 0x00085a     1 / 0x000aec    44 / 0x001b9e
itcm        12 / 0x0005e0     2 / 0x00028c     0 / 0x000000    14 / 0x00086c
ov006       11 / 0x0001e4     0 / 0x000000     0 / 0x000000    11 / 0x0001e4
ov002        6 / 0x000130     0 / 0x000000     0 / 0x000000     6 / 0x000130
ov005        6 / 0x0000e0     0 / 0x000000     0 / 0x000000     6 / 0x0000e0
ov016        5 / 0x0000dc     0 / 0x000000     0 / 0x000000     5 / 0x0000dc
ov017        5 / 0x00011c     0 / 0x000000     0 / 0x000000     5 / 0x00011c
ov009        4 / 0x000088     0 / 0x000000     0 / 0x000000     4 / 0x000088
ov010        4 / 0x000170     0 / 0x000000     0 / 0x000000     4 / 0x000170
ov007        3 / 0x0000b0     0 / 0x000000     0 / 0x000000     3 / 0x0000b0
ov014        3 / 0x000084     0 / 0x000000     1 / 0x000330     4 / 0x0003b4
ov015        3 / 0x00011c     0 / 0x000000     0 / 0x000000     3 / 0x00011c
ov019        3 / 0x000084     0 / 0x000000     1 / 0x000390     4 / 0x000414
ov021        2 / 0x000058     0 / 0x000000     0 / 0x000000     2 / 0x000058
ov003        1 / 0x00002c     0 / 0x000000     1 / 0x000368     2 / 0x000394
ov008        1 / 0x00006c     0 / 0x000000     0 / 0x000000     1 / 0x00006c
ov011        1 / 0x000034     0 / 0x000000     0 / 0x000000     1 / 0x000034
ov013        1 / 0x000014     0 / 0x000000     0 / 0x000000     1 / 0x000014
ov022        1 / 0x0000a0     0 / 0x000000     0 / 0x000000     1 / 0x0000a0
ov023        1 / 0x000064     0 / 0x000000     0 / 0x000000     1 / 0x000064
dtcm         0 / 0x000000     0 / 0x000000     0 / 0x000000     0 / 0x000000
ov000        0 / 0x000000     0 / 0x000000     0 / 0x000000     0 / 0x000000
ov001        0 / 0x000000     1 / 0x0001c4     0 / 0x000000     1 / 0x0001c4
ov012        0 / 0x000000     0 / 0x000000     0 / 0x000000     0 / 0x000000
ov018        0 / 0x000000     1 / 0x00015c     0 / 0x000000     1 / 0x00015c
ov020        0 / 0x000000     1 / 0x0001dc     0 / 0x000000     1 / 0x0001dc
------------------------------------------------------------------------
TOTAL      165 / 0x002052    12 / 0x00111e     5 / 0x001794

Hand-matchable runway (<0x100): 165 funcs, 0x2052 bytes. Drain order (richest <0x100 vein first): main, ov004, itcm, ov006, ov002, ov005, ov016, ov017
```

## Comparison

${rows}

## Task 2: signature census summary

```text
Sampled: 40  (sig_new failures: 2)
Elapsed: 24.3s

Internal clone census (boolean signal only — see tool docstring):
  applied_noop     33
  multiple         4
  not_found        1
  -> 4 NOT in any known-family catalogue (candidate new families), 0 already catalogued

Region-twin map:
  eur:
    applied_noop         33
    multiple             4
    not_found            1
  usa:
    applied_rename       33
    multiple              4
    not_found             1
  jpn:
    applied_rename       33
    multiple              4
    not_found             1
wrote docs/research/sig-census-results.json
```

## Task 3: ITCM

The per-function table is appended to endgame-ledger.md under Appendix: ITCM
detail. size_census reports EUR 11 / 0x794 bytes, USA 14 / 0x86c bytes, and
JPN 14 / 0x86c bytes.

| Name | Address | Size | Region |
|---|---|---:|---|
| func_01ff8000 | 0x01ff8000 | 0x98 | EUR |
| func_01ff8098 | 0x01ff8098 | 0xe8 | EUR |
| func_01ff8180 | 0x01ff8180 | 0x58 | EUR |
| func_01ff81d8 | 0x01ff81d8 | 0x15c | EUR |
| func_01ff8334 | 0x01ff8334 | 0xcc | EUR |
| func_01ff8414 | 0x01ff8414 | 0x130 | EUR |
| func_01ff8544 | 0x01ff8544 | 0xe0 | EUR |
| func_01ff8624 | 0x01ff8624 | 0x40 | EUR |
| func_01ff8664 | 0x01ff8664 | 0x60 | EUR |
| func_01ff86c4 | 0x01ff86c4 | 0x38 | EUR |
| func_01ff87c0 | 0x01ff87c0 | 0xac | EUR |
| func_01ff8000 | 0x01ff8000 | 0x98 | USA |
| func_01ff8098 | 0x01ff8098 | 0xe8 | USA |
| func_01ff8180 | 0x01ff8180 | 0x58 | USA |
| func_01ff81d8 | 0x01ff81d8 | 0x15c | USA |
| func_01ff8334 | 0x01ff8334 | 0xcc | USA |
| func_01ff8400 | 0x01ff8400 | 0x14 | USA |
| func_01ff8414 | 0x01ff8414 | 0x130 | USA |
| func_01ff8544 | 0x01ff8544 | 0xe0 | USA |
| func_01ff8624 | 0x01ff8624 | 0x40 | USA |
| func_01ff8664 | 0x01ff8664 | 0x60 | USA |
| func_01ff86c4 | 0x01ff86c4 | 0x38 | USA |
| func_01ff86fc | 0x01ff86fc | 0x74 | USA |
| func_01ff8770 | 0x01ff8770 | 0x50 | USA |
| func_01ff87c0 | 0x01ff87c0 | 0xac | USA |
| func_01ff8000 | 0x01ff8000 | 0x98 | JPN |
| func_01ff8098 | 0x01ff8098 | 0xe8 | JPN |
| func_01ff8180 | 0x01ff8180 | 0x58 | JPN |
| func_01ff81d8 | 0x01ff81d8 | 0x15c | JPN |
| func_01ff8334 | 0x01ff8334 | 0xcc | JPN |
| func_01ff8400 | 0x01ff8400 | 0x14 | JPN |
| func_01ff8414 | 0x01ff8414 | 0x130 | JPN |
| func_01ff8544 | 0x01ff8544 | 0xe0 | JPN |
| func_01ff8624 | 0x01ff8624 | 0x40 | JPN |
| func_01ff8664 | 0x01ff8664 | 0x60 | JPN |
| func_01ff86c4 | 0x01ff86c4 | 0x38 | JPN |
| func_01ff86fc | 0x01ff86fc | 0x74 | JPN |
| func_01ff8770 | 0x01ff8770 | 0x50 | JPN |
| func_01ff87c0 | 0x01ff87c0 | 0xac | JPN |

## Tests

```text
2591 passed, 3 skipped, 13 subtests passed in 12.66s
```
