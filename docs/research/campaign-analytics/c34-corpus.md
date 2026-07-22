# C-34 corpus — coercible candidate reference

**Queue item:** `q-c34-corpus`  
**Date:** 2026-07-22  
**Source:** `python tools/wall_aware_headroom.py --coercible` plus committed EUR `symbols.txt` and the candidate `.s` files.

## Census

The corrected classifier returns **116 C-34 files**, out of 138 coercible candidates. C-34 is the dominant documented lever in this pool. The module distribution is recorded below; `overlay002` is listed first because it is the largest active lane, followed by main and the remaining overlays.

C-34's exact documented discriminator is: two PC-relative loads resolve to the same symbol while the original has distinct literal-pool slots. The `.s` recipe preserves those slots with explicit `.word` directives. The table's source-shape signature is a mechanical summary of each tracked source: C-34 header family, ISA mode, instruction count, pool-word count, and opcode-family counts for loads, stores, calls, and branches. It is a triage signature, not a claim that the functions are interchangeable.

The `Matched C sibling` column says `none found` for every row: a text search of matched `.c` files found no exact C-34 dual-slot sibling. The nearest already-matched duplicate-pool C references are `src/main/func_02093dc8.legacy.c` (matched C-23 extension with a duplicate MMIO pool load) and `src/overlay011/sinit_ov011_021d3620.c` (matched C with a duplicate symbolic load; it uses a numeric literal to prevent inline-asm pool dedup). They are reference examples, not exact C-34 matches.

## Corpus

Exit code: 0
Wall time: 3.3 seconds
Output:
| # | Module | Address | Size | File | Exact source-shape signature | Matched C sibling |
|---:|---|---|---:|---|---|---|
| 1 | `main` | `0x02000f84` | `0x44` | `src/main/func_02000f84.s` | C-34 explicit-pool family (brief 202/207); arm; insn=15; .word=2; ldr=4; str=6; bl=1; branch=0 | none found |
| 2 | `main` | `0x020037d0` | `0xf0` | `src/main/func_020037d0.s` | C-34 explicit-pool family (brief 202/207); arm; insn=59; .word=1; ldr=14; str=3; bl=1; branch=15 | none found |
| 3 | `main` | `0x02003d98` | `0x100` | `src/main/func_02003d98.s` | C-34 explicit-pool family (brief 202/207); arm; insn=63; .word=1; ldr=16; str=4; bl=1; branch=14 | none found |
| 4 | `main` | `0x020061bc` | `0x6c` | `src/main/func_020061bc.s` | C-34 explicit-pool family (brief 202/207); arm; insn=23; .word=4; ldr=4; str=0; bl=0; branch=0 | none found |
| 5 | `main` | `0x02006524` | `0x84` | `src/main/func_02006524.s` | C-34 explicit-pool family (brief 202/207); arm; insn=31; .word=2; ldr=12; str=3; bl=4; branch=3 | none found |
| 6 | `main` | `0x02006950` | `0xa4` | `src/main/func_02006950.s` | C-34 duplicate-pool family (brief 205); arm; insn=39; .word=2; ldr=3; str=3; bl=9; branch=2 | none found |
| 7 | `main` | `0x02006a38` | `0xd8` | `src/main/func_02006a38.s` | C-34 duplicate-pool family (brief 205); arm; insn=51; .word=3; ldr=10; str=4; bl=6; branch=5 | none found |
| 8 | `main` | `0x020071c4` | `0x54` | `src/main/func_020071c4.s` | C-34 duplicate-pool family (brief 205); arm; insn=19; .word=2; ldr=5; str=2; bl=3; branch=2 | none found |
| 9 | `main` | `0x02007f38` | `0x20` | `src/main/func_02007f38.s` | C-34 explicit-pool family (brief 202/207); arm; insn=7; .word=1; ldr=1; str=1; bl=0; branch=0 | none found |
| 10 | `main` | `0x0200ac60` | `0xac` | `src/main/func_0200ac60.s` | C-34 duplicate-pool family (brief 205); arm; insn=40; .word=2; ldr=11; str=3; bl=8; branch=1 | none found |
| 11 | `main` | `0x0200b2f4` | `0x68` | `src/main/func_0200b2f4.s` | C-34 explicit-pool family (brief 202/207); arm; insn=26; .word=0; ldr=2; str=1; bl=2; branch=1 | none found |
| 12 | `main` | `0x0200ed48` | `0x70` | `src/main/func_0200ed48.s` | C-34 explicit-pool family (brief 202/207); arm; insn=27; .word=1; ldr=6; str=0; bl=3; branch=1 | none found |
| 13 | `main` | `0x0201904c` | `0x3c` | `src/main/func_0201904c.s` | C-34 explicit-pool family (brief 202/207); arm; insn=14; .word=1; ldr=2; str=1; bl=1; branch=0 | none found |
| 14 | `main` | `0x0201a32c` | `0x5c` | `src/main/func_0201a32c.s` | C-34 explicit-pool family (brief 202/207); arm; insn=23; .word=0; ldr=2; str=2; bl=1; branch=3 | none found |
| 15 | `main` | `0x0201fbe0` | `0x8c` | `src/main/func_0201fbe0.s` | C-34 explicit-pool family (brief 202/207); arm; insn=33; .word=2; ldr=7; str=0; bl=7; branch=3 | none found |
| 16 | `main` | `0x0202111c` | `0x3c` | `src/main/func_0202111c.s` | C-34 explicit-pool family (brief 202/207); arm; insn=13; .word=2; ldr=3; str=0; bl=1; branch=3 | none found |
| 17 | `main` | `0x02021158` | `0x38` | `src/main/func_02021158.s` | C-34 explicit-pool family (brief 202/207); arm; insn=12; .word=2; ldr=3; str=0; bl=1; branch=2 | none found |
| 18 | `main` | `0x020212cc` | `0x160` | `src/main/func_020212cc.s` | C-34 explicit-pool family (brief 202/207); arm; insn=85; .word=3; ldr=18; str=2; bl=20; branch=18 | none found |
| 19 | `main` | `0x0202142c` | `0x50` | `src/main/func_0202142c.s` | C-34 duplicate-pool family (brief 205); arm; insn=18; .word=2; ldr=5; str=2; bl=0; branch=3 | none found |
| 20 | `main` | `0x02021b38` | `0x74` | `src/main/func_02021b38.s` | C-34 explicit-pool family (brief 202/207); arm; insn=0; .word=5; ldr=0; str=0; bl=0; branch=0 | none found |
| 21 | `main` | `0x02023274` | `0x204` | `src/main/func_02023274.s` | C-34 explicit-pool family (brief 202/207); arm; insn=117; .word=12; ldr=24; str=13; bl=17; branch=5 | none found |
| 22 | `main` | `0x020234f8` | `0x7c` | `src/main/func_020234f8.s` | C-34 duplicate-pool family (brief 205); arm; insn=29; .word=2; ldr=6; str=1; bl=4; branch=1 | none found |
| 23 | `main` | `0x02023fec` | `0x38` | `src/main/func_02023fec.s` | C-34 explicit-pool family (brief 202/207); arm; insn=12; .word=2; ldr=4; str=1; bl=1; branch=1 | none found |
| 24 | `main` | `0x02024024` | `0x7c` | `src/main/func_02024024.s` | C-34 duplicate-pool family (brief 205); arm; insn=29; .word=2; ldr=6; str=1; bl=4; branch=1 | none found |
| 25 | `main` | `0x02024430` | `0xb8` | `src/main/func_02024430.s` | C-34 duplicate-pool family (brief 205); arm; insn=42; .word=4; ldr=6; str=6; bl=4; branch=1 | none found |
| 26 | `main` | `0x020244e8` | `0x74` | `src/main/func_020244e8.s` | C-34 duplicate-pool family (brief 205); arm; insn=27; .word=2; ldr=7; str=1; bl=4; branch=2 | none found |
| 27 | `main` | `0x02024574` | `0x74` | `src/main/func_02024574.s` | C-34 duplicate-pool family (brief 205); arm; insn=27; .word=2; ldr=6; str=1; bl=3; branch=1 | none found |
| 28 | `main` | `0x02026fd8` | `0x70` | `src/main/func_02026fd8.s` | C-34 explicit-pool family (brief 202/207); arm; insn=0; .word=2; ldr=0; str=0; bl=0; branch=0 | none found |
| 29 | `main` | `0x02027048` | `0x88` | `src/main/func_02027048.s` | C-34 duplicate-pool family (brief 205); arm; insn=32; .word=2; ldr=7; str=3; bl=4; branch=2 | none found |
| 30 | `main` | `0x020270d0` | `0x74` | `src/main/func_020270d0.s` | C-34 duplicate-pool family (brief 205); arm; insn=0; .word=2; ldr=0; str=0; bl=0; branch=0 | none found |
| 31 | `main` | `0x020285bc` | `0xe4` | `src/main/func_020285bc.s` | C-34 duplicate-pool family (brief 205); arm; insn=54; .word=2; ldr=7; str=4; bl=9; branch=2 | none found |
| 32 | `main` | `0x020286a0` | `0xb4` | `src/main/func_020286a0.s` | C-34 duplicate-pool family (brief 205); arm; insn=43; .word=2; ldr=7; str=1; bl=11; branch=3 | none found |
| 33 | `main` | `0x02028790` | `0x74` | `src/main/func_02028790.s` | C-34 duplicate-pool family (brief 205); arm; insn=27; .word=2; ldr=6; str=1; bl=3; branch=1 | none found |
| 34 | `main` | `0x0202a240` | `0x3c` | `src/main/func_0202a240.s` | C-34 explicit-pool family (brief 202/207); arm; insn=13; .word=2; ldr=4; str=1; bl=2; branch=1 | none found |
| 35 | `main` | `0x0202a27c` | `0x7c` | `src/main/func_0202a27c.s` | C-34 duplicate-pool family (brief 205); arm; insn=29; .word=2; ldr=6; str=1; bl=4; branch=1 | none found |
| 36 | `main` | `0x020318b8` | `0x74` | `src/main/func_020318b8.s` | C-34 duplicate-pool family (brief 205); arm; insn=23; .word=5; ldr=7; str=2; bl=5; branch=0 | none found |
| 37 | `main` | `0x020323f4` | `0x58` | `src/main/func_020323f4.s` | C-34 explicit-pool family (brief 202/207); arm; insn=21; .word=1; ldr=3; str=1; bl=6; branch=2 | none found |
| 38 | `main` | `0x0203244c` | `0x74` | `src/main/func_0203244c.s` | C-34 explicit-pool family (brief 202/207); arm; insn=29; .word=0; ldr=7; str=2; bl=2; branch=3 | none found |
| 39 | `main` | `0x02034094` | `0x24` | `src/main/func_02034094.s` | C-34 explicit-pool family (brief 202/207); arm; insn=8; .word=1; ldr=1; str=0; bl=1; branch=1 | none found |
| 40 | `main` | `0x0203c70c` | `0x24` | `src/main/func_0203c70c.s` | C-34 explicit-pool family (brief 202/207); arm; insn=9; .word=0; ldr=1; str=0; bl=0; branch=2 | none found |
| 41 | `main` | `0x0203cff8` | `0x80` | `src/main/func_0203cff8.s` | C-34 explicit-pool family (brief 202/207); arm; insn=31; .word=1; ldr=4; str=2; bl=2; branch=1 | none found |
| 42 | `main` | `0x0203d078` | `0x68` | `src/main/func_0203d078.s` | C-34 explicit-pool family (brief 202/207); arm; insn=25; .word=1; ldr=3; str=3; bl=1; branch=1 | none found |
| 43 | `main` | `0x020644a4` | `0x20` | `src/main/func_020644a4.s` | C-34 explicit-pool family (brief 202/207); arm; insn=8; .word=0; ldr=2; str=0; bl=0; branch=0 | none found |
| 44 | `main` | `0x02067850` | `0x20` | `src/main/func_02067850.s` | C-34 explicit-pool family (brief 202/207); arm; insn=7; .word=1; ldr=1; str=1; bl=0; branch=2 | none found |
| 45 | `main` | `0x0206d79c` | `0x24` | `src/main/func_0206d79c.s` | C-34 explicit-pool family (brief 202/207); arm; insn=9; .word=0; ldr=4; str=0; bl=0; branch=0 | none found |
| 46 | `main` | `0x0207391c` | `0x60` | `src/main/func_0207391c.s` | C-34 explicit-pool family (brief 202/207); arm; insn=21; .word=3; ldr=9; str=2; bl=2; branch=0 | none found |
| 47 | `main` | `0x0207c20c` | `0x74` | `src/main/func_0207c20c.s` | C-34 explicit-pool family (brief 202/207); arm; insn=28; .word=1; ldr=3; str=1; bl=4; branch=2 | none found |
| 48 | `main` | `0x0207db8c` | `0x6c` | `src/main/func_0207db8c.s` | C-34 explicit-pool family (brief 202/207); arm; insn=27; .word=0; ldr=3; str=1; bl=1; branch=1 | none found |
| 49 | `main` | `0x0207dbf8` | `0x64` | `src/main/func_0207dbf8.s` | C-34 explicit-pool family (brief 202/207); arm; insn=25; .word=0; ldr=3; str=1; bl=1; branch=1 | none found |
| 50 | `main` | `0x0207f8d8` | `0x20` | `src/main/func_0207f8d8.s` | C-34 explicit-pool family (brief 202/207); arm; insn=8; .word=0; ldr=2; str=3; bl=0; branch=0 | none found |
| 51 | `main` | `0x0207f914` | `0x20` | `src/main/func_0207f914.s` | C-34 explicit-pool family (brief 202/207); arm; insn=8; .word=0; ldr=2; str=3; bl=0; branch=0 | none found |
| 52 | `main` | `0x0208b0d0` | `0x20` | `src/main/func_0208b0d0.s` | C-34 explicit-pool family (brief 202/207); arm; insn=8; .word=0; ldr=2; str=4; bl=0; branch=0 | none found |
| 53 | `main` | `0x02097238` | `0x20` | `src/main/func_02097238.s` | C-34 explicit-pool family (brief 202/207); arm; insn=8; .word=0; ldr=0; str=2; bl=0; branch=1 | none found |
| 54 | `main` | `0x020988a8` | `0x100` | `src/main/func_020988a8.s` | C-34 duplicate-pool family (brief 205); arm; insn=60; .word=2; ldr=16; str=0; bl=8; branch=7 | none found |
| 55 | `main` | `0x0209aa48` | `0x1c` | `src/main/func_0209aa48.s` | C-34 explicit-pool family (brief 202/207); arm; insn=6; .word=1; ldr=2; str=0; bl=0; branch=0 | none found |
| 56 | `main` | `0x0209bf18` | `0x1c` | `src/main/func_0209bf18.s` | C-34 explicit-pool family (brief 202/207); arm; insn=7; .word=0; ldr=3; str=0; bl=0; branch=0 | none found |
| 57 | `main` | `0x0209d788` | `0x1c` | `src/main/func_0209d788.s` | C-34 explicit-pool family (brief 202/207); arm; insn=6; .word=1; ldr=2; str=1; bl=0; branch=1 | none found |
| 58 | `main` | `0x020a32e4` | `0x24` | `src/main/func_020a32e4.s` | C-34 explicit-pool family (brief 202/207); arm; insn=8; .word=1; ldr=1; str=5; bl=0; branch=0 | none found |
| 59 | `main` | `0x020a7368` | `0x20` | `src/main/func_020a7368.s` | C-34 explicit-pool family (brief 202/207); arm; insn=8; .word=0; ldr=1; str=1; bl=0; branch=2 | none found |
| 60 | `main` | `0x020aee58` | `0x20` | `src/main/func_020aee58.s` | C-34 explicit-pool family (brief 202/207); arm; insn=8; .word=0; ldr=2; str=1; bl=0; branch=1 | none found |
| 61 | `ov000` | `0x021ac890` | `0x20` | `src/overlay000/func_ov000_021ac890.s` | C-34 explicit-pool family (brief 202/207); arm; insn=8; .word=0; ldr=1; str=0; bl=0; branch=0 | none found |
| 62 | `ov001` | `0x021ca144` | `0x194` | `src/overlay001/func_ov001_021ca144.s` | C-34 explicit-pool family (brief 202/207); arm; insn=98; .word=3; ldr=8; str=2; bl=16; branch=11 | none found |
| 63 | `ov002` | `0x021aba60` | `0x2990` | `src/overlay002/func_ov002_021aba60.s` | C-34 explicit-pool family (brief 202/207); arm; insn=2586; .word=74; ldr=595; str=172; bl=185; branch=470 | none found |
| 64 | `ov002` | `0x021c4c9c` | `0x32ac` | `src/overlay002/func_ov002_021c4c9c.s` | C-34 explicit-pool family (brief 202/207); arm; insn=3172; .word=71; ldr=451; str=186; bl=139; branch=824 | none found |
| 65 | `ov002` | `0x021d9828` | `0x2520` | `src/overlay002/func_ov002_021d9828.s` | C-34 explicit-pool family (brief 202/207); arm; insn=2321; .word=55; ldr=417; str=82; bl=90; branch=504 | none found |
| 66 | `ov002` | `0x021e2e18` | `0x20` | `src/overlay002/func_ov002_021e2e18.s` | C-34 explicit-pool family (brief 202/207); arm; insn=7; .word=1; ldr=1; str=0; bl=0; branch=1 | none found |
| 67 | `ov002` | `0x021e4ba8` | `0x25fc` | `src/overlay002/func_ov002_021e4ba8.s` | C-34 explicit-pool family (brief 202/207); arm; insn=2391; .word=40; ldr=461; str=138; bl=164; branch=248 | none found |
| 68 | `ov002` | `0x021ec110` | `0x94` | `src/overlay002/func_ov002_021ec110.s` | C-34 explicit-pool family (brief 202/207); arm; insn=35; .word=2; ldr=4; str=0; bl=2; branch=0 | none found |
| 69 | `ov002` | `0x021ef7b4` | `0x90` | `src/overlay002/func_ov002_021ef7b4.s` | C-34 explicit-pool family (brief 202/207); arm; insn=36; .word=0; ldr=3; str=0; bl=3; branch=1 | none found |
| 70 | `ov002` | `0x021ef92c` | `0x98` | `src/overlay002/func_ov002_021ef92c.s` | C-34 explicit-pool family (brief 202/207); arm; insn=38; .word=0; ldr=3; str=0; bl=4; branch=1 | none found |
| 71 | `ov002` | `0x021efa38` | `0x90` | `src/overlay002/func_ov002_021efa38.s` | C-34 explicit-pool family (brief 202/207); arm; insn=34; .word=2; ldr=4; str=0; bl=2; branch=0 | none found |
| 72 | `ov002` | `0x021efac8` | `0x70` | `src/overlay002/func_ov002_021efac8.s` | C-34 explicit-pool family (brief 202/207); arm; insn=26; .word=2; ldr=4; str=0; bl=1; branch=0 | none found |
| 73 | `ov002` | `0x021f2ca8` | `0x90` | `src/overlay002/func_ov002_021f2ca8.s` | C-34 explicit-pool family (brief 202/207); arm; insn=34; .word=2; ldr=5; str=0; bl=1; branch=0 | none found |
| 74 | `ov002` | `0x021f639c` | `0x44` | `src/overlay002/func_ov002_021f639c.s` | C-34 explicit-pool family (brief 202/207); arm; insn=17; .word=0; ldr=2; str=1; bl=2; branch=0 | none found |
| 75 | `ov002` | `0x021f677c` | `0x54` | `src/overlay002/func_ov002_021f677c.s` | C-34 explicit-pool family (brief 202/207); arm; insn=19; .word=2; ldr=4; str=1; bl=2; branch=0 | none found |
| 76 | `ov002` | `0x021f67d0` | `0x44` | `src/overlay002/func_ov002_021f67d0.s` | C-34 explicit-pool family (brief 202/207); arm; insn=17; .word=0; ldr=2; str=1; bl=3; branch=0 | none found |
| 77 | `ov002` | `0x021f754c` | `0x4c` | `src/overlay002/func_ov002_021f754c.s` | C-34 explicit-pool family (brief 202/207); arm; insn=19; .word=0; ldr=2; str=0; bl=3; branch=1 | none found |
| 78 | `ov002` | `0x021f81cc` | `0x48` | `src/overlay002/func_ov002_021f81cc.s` | C-34 explicit-pool family (brief 202/207); arm; insn=18; .word=0; ldr=2; str=1; bl=2; branch=0 | none found |
| 79 | `ov002` | `0x021f8244` | `0x4c` | `src/overlay002/func_ov002_021f8244.s` | C-34 explicit-pool family (brief 202/207); arm; insn=19; .word=0; ldr=1; str=0; bl=2; branch=2 | none found |
| 80 | `ov002` | `0x021f9910` | `0x44` | `src/overlay002/func_ov002_021f9910.s` | C-34 explicit-pool family (brief 202/207); arm; insn=17; .word=0; ldr=2; str=1; bl=2; branch=0 | none found |
| 81 | `ov002` | `0x021faa6c` | `0x48` | `src/overlay002/func_ov002_021faa6c.s` | C-34 explicit-pool family (brief 202/207); arm; insn=18; .word=0; ldr=4; str=1; bl=2; branch=0 | none found |
| 82 | `ov002` | `0x021fbbc4` | `0x44` | `src/overlay002/func_ov002_021fbbc4.s` | C-34 explicit-pool family (brief 202/207); arm; insn=17; .word=0; ldr=2; str=1; bl=2; branch=0 | none found |
| 83 | `ov002` | `0x021ff2c8` | `0x58` | `src/overlay002/func_ov002_021ff2c8.s` | C-34 explicit-pool family (brief 202/207); arm; insn=20; .word=2; ldr=5; str=0; bl=1; branch=0 | none found |
| 84 | `ov002` | `0x021ff3bc` | `0x44` | `src/overlay002/func_ov002_021ff3bc.s` | C-34 explicit-pool family (brief 202/207); arm; insn=17; .word=0; ldr=1; str=0; bl=2; branch=0 | none found |
| 85 | `ov002` | `0x021ff400` | `0x6c` | `src/overlay002/func_ov002_021ff400.s` | C-34 explicit-pool family (brief 202/207); arm; insn=27; .word=0; ldr=2; str=0; bl=4; branch=0 | none found |
| 86 | `ov002` | `0x021ff500` | `0x40` | `src/overlay002/func_ov002_021ff500.s` | C-34 explicit-pool family (brief 202/207); arm; insn=16; .word=0; ldr=2; str=0; bl=2; branch=0 | none found |
| 87 | `ov002` | `0x021ff6d0` | `0x40` | `src/overlay002/func_ov002_021ff6d0.s` | C-34 explicit-pool family (brief 202/207); arm; insn=16; .word=0; ldr=1; str=0; bl=1; branch=0 | none found |
| 88 | `ov002` | `0x02200630` | `0x20` | `src/overlay002/func_ov002_02200630.s` | C-34 explicit-pool family (brief 202/207); arm; insn=8; .word=0; ldr=1; str=0; bl=0; branch=0 | none found |
| 89 | `ov002` | `0x0220eb00` | `0x1604` | `src/overlay002/func_ov002_0220eb00.s` | C-34 explicit-pool family (brief 202/207); arm; insn=1380; .word=29; ldr=109; str=119; bl=33; branch=236 | none found |
| 90 | `ov002` | `0x022476e8` | `0xb8` | `src/overlay002/func_ov002_022476e8.s` | C-34 explicit-pool family (brief 202/207); arm; insn=41; .word=5; ldr=12; str=0; bl=1; branch=4 | none found |
| 91 | `ov002` | `0x02247ad8` | `0x94` | `src/overlay002/func_ov002_02247ad8.s` | C-34 explicit-pool family (brief 202/207); arm; insn=34; .word=3; ldr=6; str=0; bl=3; branch=2 | none found |
| 92 | `ov002` | `0x02247b6c` | `0x764` | `src/overlay002/func_ov002_02247b6c.s` | C-34 explicit-pool family (brief 202/207); arm; insn=457; .word=16; ldr=115; str=19; bl=30; branch=39 | none found |
| 93 | `ov002` | `0x022a1870` | `0x20` | `src/overlay002/func_ov002_022a1870.s` | C-34 explicit-pool family (brief 202/207); arm; insn=8; .word=0; ldr=2; str=0; bl=0; branch=1 | none found |
| 94 | `ov002` | `0x022b595c` | `0x273c` | `src/overlay002/func_ov002_022b595c.s` | C-34 explicit-pool family (brief 202/207); arm; insn=2492; .word=19; ldr=475; str=181; bl=202; branch=360 | none found |
| 95 | `ov004` | `0x021ca198` | `0x360` | `src/overlay004/func_ov004_021ca198.s` | C-34 explicit-pool family (brief 202/207); arm; insn=210; .word=6; ldr=28; str=17; bl=17; branch=6 | none found |
| 96 | `ov004` | `0x021ca4f8` | `0x64c` | `src/overlay004/func_ov004_021ca4f8.s` | C-34 explicit-pool family (brief 202/207); arm; insn=378; .word=25; ldr=71; str=70; bl=64; branch=21 | none found |
| 97 | `ov004` | `0x021cab44` | `0x398` | `src/overlay004/func_ov004_021cab44.s` | C-34 explicit-pool family (brief 202/207); arm; insn=211; .word=19; ldr=49; str=15; bl=43; branch=12 | none found |
| 98 | `ov004` | `0x021cb060` | `0x218` | `src/overlay004/func_ov004_021cb060.s` | C-34 explicit-pool family (brief 202/207); arm; insn=129; .word=5; ldr=14; str=7; bl=21; branch=36 | none found |
| 99 | `ov004` | `0x021cb290` | `0x288` | `src/overlay004/func_ov004_021cb290.s` | C-34 explicit-pool family (brief 202/207); arm; insn=148; .word=14; ldr=27; str=16; bl=25; branch=15 | none found |
| 100 | `ov006` | `0x021b6d00` | `0x1c` | `src/overlay006/func_ov006_021b6d00.s` | C-34 explicit-pool family (brief 202/207); arm; insn=7; .word=0; ldr=2; str=0; bl=0; branch=0 | none found |
| 101 | `ov006` | `0x021b8f88` | `0x20` | `src/overlay006/func_ov006_021b8f88.s` | C-34 explicit-pool family (brief 202/207); arm; insn=8; .word=0; ldr=3; str=0; bl=0; branch=0 | none found |
| 102 | `ov006` | `0x021be948` | `0x520` | `src/overlay006/func_ov006_021be948.s` | C-34 explicit-pool family (brief 202/207); arm; insn=313; .word=15; ldr=61; str=20; bl=22; branch=52 | none found |
| 103 | `ov008` | `0x021aa94c` | `0x168` | `src/overlay008/func_ov008_021aa94c.s` | C-34 explicit-pool family (brief 202/207); arm; insn=84; .word=6; ldr=23; str=3; bl=21; branch=3 | none found |
| 104 | `ov008` | `0x021adaa8` | `0x114` | `src/overlay008/func_ov008_021adaa8.s` | C-34 explicit-pool family (brief 202/207); arm; insn=61; .word=8; ldr=18; str=6; bl=1; branch=4 | none found |
| 105 | `ov008` | `0x021adc44` | `0x75c` | `src/overlay008/func_ov008_021adc44.s` | C-34 explicit-pool family (brief 202/207); arm; insn=462; .word=9; ldr=77; str=39; bl=40; branch=37 | none found |
| 106 | `ov008` | `0x021ae3a0` | `0x2d4` | `src/overlay008/func_ov008_021ae3a0.s` | C-34 explicit-pool family (brief 202/207); arm; insn=176; .word=5; ldr=20; str=11; bl=9; branch=9 | none found |
| 107 | `ov008` | `0x021ae70c` | `0x6f0` | `src/overlay008/func_ov008_021ae70c.s` | C-34 explicit-pool family (brief 202/207); arm; insn=431; .word=13; ldr=72; str=25; bl=36; branch=46 | none found |
| 108 | `ov008` | `0x021b01d8` | `0x1e0` | `src/overlay008/func_ov008_021b01d8.s` | C-34 explicit-pool family (brief 202/207); arm; insn=110; .word=10; ldr=29; str=15; bl=12; branch=7 | none found |
| 109 | `ov010` | `0x021b3a1c` | `0x21c` | `src/overlay010/func_ov010_021b3a1c.s` | C-34 explicit-pool family (brief 202/207); arm; insn=121; .word=14; ldr=27; str=14; bl=24; branch=7 | none found |
| 110 | `ov012` | `0x021c9f48` | `0x244` | `src/overlay012/func_ov012_021c9f48.s` | C-34 explicit-pool family (brief 202/207); arm; insn=132; .word=13; ldr=22; str=13; bl=33; branch=4 | none found |
| 111 | `ov014` | `0x021b2908` | `0x5e4` | `src/overlay014/func_ov014_021b2908.s` | C-34 explicit-pool family (brief 202/207); arm; insn=366; .word=11; ldr=75; str=73; bl=24; branch=17 | none found |
| 112 | `ov016` | `0x021b2d4c` | `0x220` | `src/overlay016/func_ov016_021b2d4c.s` | C-34 explicit-pool family (brief 202/207); arm; insn=129; .word=7; ldr=18; str=9; bl=16; branch=13 | none found |
| 113 | `ov016` | `0x021b8774` | `0x1d8` | `src/overlay016/func_ov016_021b8774.s` | C-34 explicit-pool family (brief 202/207); arm; insn=110; .word=8; ldr=32; str=16; bl=15; branch=3 | none found |
| 114 | `ov017` | `0x021b680c` | `0x734` | `src/overlay017/func_ov017_021b680c.s` | C-34 explicit-pool family (brief 202/207); arm; insn=434; .word=27; ldr=83; str=57; bl=69; branch=14 | none found |
| 115 | `ov018` | `0x021ab1c4` | `0x2c8` | `src/overlay018/func_ov018_021ab1c4.s` | C-34 explicit-pool family (brief 202/207); arm; insn=155; .word=23; ldr=38; str=18; bl=26; branch=8 | none found |
| 116 | `ov020` | `0x021abbe8` | `0x7ac` | `src/overlay020/func_ov020_021abbe8.s` | C-34 explicit-pool family (brief 202/207); arm; insn=461; .word=30; ldr=94; str=50; bl=61; branch=21 | none found |

**Rows:** 116. **By module:** `main` 60, `ov000` 1, `ov001` 1, `ov002` 32, `ov004` 5, `ov006` 3, `ov008` 6, `ov010` 1, `ov012` 1, `ov014` 1, `ov016` 2, `ov017` 1, `ov018` 1, `ov020` 1


## Operator notes

- Read the candidate's header and pool tail before drafting. The C-34 citation is a documented lever-shaped classification, not proof that every large or composite member is a clean C target.
- The `brief 204` composite worked-example rows should be reviewed separately; the codegen-walls note distinguishes C-34 from C-23/C-27 and from composite C-35.
- Known duplicate-pool-slot wall addresses `02024574`, `020270d0`, and `02028790` remain excluded from active C-match work by the campaign's parked/wall ledger even though the classifier reports their C-34 citation. Do not treat their presence here as a recommendation to retry them.
- No build, source, config, or tool file was changed for this corpus.

