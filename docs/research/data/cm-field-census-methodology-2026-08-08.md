# Field-exposure census methodology recheck (2026-08-08)

This report is generated from the committed census outputs before and after the two methodology fixes. It is a snapshot, not a hand-compiled ledger.

Commands:

```text
python tools/field_exposure_census.py --version eur
```

The two captured outputs contain 255 baseline rows and 255 corrected rows. 232 rows changed site counts; 253 rows changed rank under the tool's (-total, doc, field) ordering.

## Rules applied

The census now follows the same anchoring shape as the landed `field_producer_finder.py` rule: only exact documented base symbols or documented getter declarations are anchors; member access and pointer arithmetic/index context are required; bare decimal literals are not field evidence. Assembly offset evidence additionally requires the documented base/getter token in the source. Local names such as `self`, `base`, `m`, and `p` are not promoted to global bases.

## Base-symbol recheck

Across `docs/research/types/` and `docs/research/constants/`, the scanner found 51 unique documented `data_*` base spellings and 1 documented getter declaration(s). Before the fix, 10 type docs had no `data_*` base token:

BgCfg.md; Box.md; BytecodeVMState.md; EntityStruct0x284.md; GameSingleton.md; HitRect.md; LinkedListNode.md; Matrix3x4.md; Rect.md; TaskList.md.

The mechanically recoverable missed anchor is:

| type doc | newly recognized anchor |
| --- | --- |
| GameSingleton.md | `func_020498f0` |

The other 9 no-`data_*` docs expose only local/parameter or consumer names, so they remain unanchored rather than being guessed. Before/after counts for every affected field are in the table below; the corrected counts are the post-fix tool output.

## Required canary

| check | read/write/total |
| --- | ---: |
| `DuelQueueState.f_5b4`, `+ 1460` | 1/0/1 |
| `DuelQueueState.f_5d4`, `f1492` | 0/1/1 |
| unrelated bare `1460` | 0/0/0 |
| unrelated bare `1492` | 0/0/0 |
| unanchored assembly offset | 0/0/0 |
| getter-anchored assembly offset | 1/0/1 |

The `+ 1460` canary is the decimal spelling of offset `0x5B4`; `f1492` is the decimal-derived member spelling of offset `0x5D4`. The negative checks contain the same bare numbers without member/pointer context and remain excluded.

## Per-field before/after counts and ranks

A `*` in the rank column means the field moved in the mechanically computed ordering. This includes unchanged-count rows displaced by other rows; no rank movement is omitted.

| doc | field | offset | before R/W/T | after R/W/T | rank before | rank after |
| --- | --- | --- | ---: | ---: | ---: | ---: |
| BgCfg.md | f0 | 0x0 | 214/87/261 | 164/44/204 | 73 | 25* |
| BgCfg.md | f10 | 0x10 | 679/650/1028 | 8/19/26 | 32 | 93* |
| BgCfg.md | f14 | 0x14 | 719/560/983 | 21/29/46 | 39 | 62* |
| BgCfg.md | f18 | 0x18 | 553/425/715 | 18/22/35 | 45 | 75* |
| BgCfg.md | fc | 0xC | 938/836/1296 | 18/30/43 | 28 | 67* |
| BgCfg.md | gap12 | 0x12 | 55/43/80 | 15/24/36 | 122 | 72* |
| BgCfg.md | gap16 | 0x16 | 88/57/111 | 2/4/5 | 95 | 158* |
| Box.md | f0 | 0x0 | 214/87/261 | 164/44/204 | 74 | 26* |
| Box.md | f2 | 0x2 | 1584/275/1677 | 259/10/268 | 17 | 8* |
| Box.md | f4 | 0x4 | 1683/1426/2259 | 63/39/92 | 1 | 47* |
| Box.md | f6 | 0x6 | 359/162/434 | 9/7/16 | 60 | 113* |
| Box.md | f8 | 0x8 | 1086/1146/1577 | 33/39/65 | 19 | 53* |
| Box.md | fa | 0xA | 181/135/242 | 10/18/27 | 79 | 89* |
| BytecodeVMState.md | f10 | 0x10 | 679/650/1028 | 8/19/26 | 33 | 94* |
| BytecodeVMState.md | f11 | 0x11 | 13/9/20 | 0/2/2 | 163 | 211* |
| BytecodeVMState.md | f12 | 0x12 | 61/52/93 | 15/24/36 | 110 | 73* |
| BytecodeVMState.md | f13 | 0x13 | 8/5/12 | 2/0/2 | 183 | 212* |
| BytecodeVMState.md | f14 | 0x14 | 719/560/983 | 21/29/46 | 40 | 63* |
| BytecodeVMState.md | f16a | 0x16A | 0/0/0 | 0/0/0 | 252 | 245* |
| BytecodeVMState.md | f16c | 0x16C | 10/8/12 | 1/1/1 | 184 | 238* |
| BytecodeVMState.md | f170 | 0x170 | 6/5/7 | 0/0/0 | 213 | 246* |
| BytecodeVMState.md | f18 | 0x18 | 553/425/715 | 18/22/35 | 46 | 76* |
| BytecodeVMState.md | f187 | 0x187 | 3/2/3 | 0/0/0 | 240 | 247* |
| BytecodeVMState.md | f18c | 0x18C | 4/9/9 | 0/0/0 | 200 | 248* |
| BytecodeVMState.md | f18e | 0x18E | 0/0/0 | 0/0/0 | 253 | 249* |
| BytecodeVMState.md | f190 | 0x190 | 4/8/9 | 0/0/0 | 201 | 250* |
| BytecodeVMState.md | f19a | 0x19A | 0/0/0 | 0/0/0 | 254 | 251* |
| BytecodeVMState.md | f4 | 0x4 | 1683/1426/2259 | 63/39/92 | 2 | 48* |
| BytecodeVMState.md | f68 | 0x68 | 145/86/173 | 5/1/6 | 83 | 150* |
| BytecodeVMState.md | f6c | 0x6C | 78/61/106 | 3/1/4 | 101 | 170* |
| BytecodeVMState.md | f70 | 0x70 | 87/85/111 | 1/1/2 | 96 | 213* |
| BytecodeVMState.md | f74 | 0x74 | 90/72/127 | 1/2/3 | 88 | 188* |
| BytecodeVMState.md | f7c | 0x7C | 79/67/109 | 1/3/4 | 99 | 171* |
| BytecodeVMState.md | f8 | 0x8 | 1086/1146/1577 | 33/39/65 | 20 | 54* |
| BytecodeVMState.md | f80 | 0x80 | 73/75/114 | 2/3/4 | 92 | 172* |
| BytecodeVMState.md | f88 | 0x88 | 68/61/99 | 1/1/2 | 106 | 214* |
| BytecodeVMState.md | f8c | 0x8C | 56/55/85 | 1/1/2 | 120 | 215* |
| BytecodeVMState.md | f94 | 0x94 | 46/41/66 | 1/3/4 | 130 | 173* |
| BytecodeVMState.md | fa4 | 0xA4 | 78/42/92 | 2/0/2 | 111 | 216* |
| BytecodeVMState.md | fc | 0xC | 938/836/1296 | 18/30/43 | 29 | 68* |
| BytecodeVMState.md | pc | 0x0 | 50/43/57 | 164/44/204 | 138 | 27* |
| Cell.md | attr | 0x0 | 51/44/58 | 165/45/205 | 135 | 23* |
| Cell.md | flags | 0x4 | 1645/1413/2201 | 88/65/126 | 8 | 31* |
| Cell.md | pad | 0x6 | 350/155/418 | 9/7/16 | 67 | 114* |
| DuelQueueState.md | f_48c | 0x48C | 14/8/22 | 16/8/24 | 159 | 97* |
| DuelQueueState.md | f_5a8 | 0x5A8 | 268/12/274 | 272/12/278 | 72 | 7* |
| DuelQueueState.md | f_5ac | 0x5AC | 108/108/112 | 108/107/111 | 94 | 36* |
| DuelQueueState.md | f_5b4 | 0x5B4 | 54/57/58 | 53/54/55 | 136 | 56* |
| DuelQueueState.md | f_5c0 | 0x5C0 | 6/11/16 | 2/9/11 | 172 | 128* |
| DuelQueueState.md | f_5c8 | 0x5C8 | 2/4/5 | 1/2/3 | 227 | 189* |
| DuelQueueState.md | f_5cc | 0x5CC | 3/2/4 | 5/3/5 | 234 | 159* |
| DuelQueueState.md | f_5d0 | 0x5D0 | 4/3/4 | 3/4/4 | 235 | 174* |
| DuelQueueState.md | f_5d4 | 0x5D4 | 31/7/36 | 31/9/38 | 145 | 70* |
| DuelQueueState.md | f_5d8 | 0x5D8 | 2/3/5 | 4/3/7 | 228 | 145* |
| DuelQueueState.md | f_688 | 0x688 | 1/6/7 | 1/7/8 | 214 | 139* |
| DuelStateSingleton.md | f_ce4 | 0xCE4 | 5/6/10 | 4/7/11 | 192 | 129* |
| DuelStateSingleton.md | f_cec | 0xCEC | 199/8/204 | 218/9/224 | 82 | 11* |
| DuelStateSingleton.md | f_cf8 | 0xCF8 | 76/12/86 | 93/11/102 | 119 | 41* |
| DuelStateSingleton.md | f_d0c | 0xD0C | 30/5/33 | 19/4/23 | 149 | 99* |
| DuelStateSingleton.md | f_d1c | 0xD1C | 3/5/6 | 2/3/4 | 221 | 175* |
| DuelStateSingleton.md | f_d20 | 0xD20 | 8/12/12 | 7/11/11 | 185 | 130* |
| DuelStateSingleton.md | f_d24 | 0xD24 | 4/3/5 | 3/2/3 | 229 | 190* |
| DuelStateSingleton.md | f_d28 | 0xD28 | 34/34/35 | 33/32/33 | 147 | 79* |
| DuelStateSingleton.md | f_d2c | 0xD2C | 6/19/23 | 4/19/21 | 156 | 104* |
| DuelStateSingleton.md | f_d30 | 0xD30 | 13/22/23 | 12/21/21 | 157 | 105* |
| DuelStateSingleton.md | f_d34 | 0xD34 | 6/6/10 | 3/4/6 | 193 | 151* |
| DuelStateSingleton.md | f_d38 | 0xD38 | 3/4/5 | 1/2/2 | 230 | 217* |
| DuelStateSingleton.md | f_d44 | 0xD44 | 114/96/123 | 117/95/124 | 90 | 32* |
| DuelStateSingleton.md | f_d48 | 0xD48 | 5/6/10 | 5/9/13 | 194 | 125* |
| DuelStateSingleton.md | f_d4c | 0xD4C | 2/1/3 | 2/1/3 | 241 | 191* |
| DuelStateSingleton.md | f_d50 | 0xD50 | 14/16/24 | 11/18/25 | 155 | 96* |
| DuelStateSingleton.md | f_d54 | 0xD54 | 3/16/17 | 1/19/19 | 169 | 108* |
| DuelStateSingleton.md | f_d64 | 0xD64 | 13/5/17 | 12/5/16 | 170 | 115* |
| DuelStateSingleton.md | f_d94 | 0xD94 | 13/1/14 | 15/1/16 | 178 | 116* |
| DuelStateSingleton.md | f_d9c | 0xD9C | 19/19/19 | 19/19/19 | 166 | 109* |
| EntityStruct0x284.md | f18 | 0x18 | 553/425/715 | 18/22/35 | 47 | 77* |
| EntityStruct0x284.md | f1c | 0x1C | 507/375/645 | 17/13/27 | 50 | 90* |
| EntityStruct0x284.md | f274 | 0x274 | 20/10/20 | 1/0/1 | 164 | 239* |
| EntityStruct0x284.md | f278 | 0x278 | 6/3/8 | 0/0/0 | 209 | 252* |
| EntityStruct0x284.md | f27c | 0x27C | 10/1/11 | 0/0/0 | 189 | 253* |
| EntityStruct0x284.md | f280 | 0x280 | 13/8/13 | 1/0/1 | 181 | 240* |
| EntityStruct0x284.md | f60 | 0x60 | 121/93/161 | 0/3/3 | 85 | 192* |
| EntityStruct0x284.md | f64 | 0x64 | 108/77/140 | 1/4/5 | 86 | 160* |
| EntityStruct0x284.md | f66 | 0x66 | 11/5/14 | 0/0/0 | 179 | 254* |
| EntityStruct0x284.md | f68 | 0x68 | 145/86/173 | 5/1/6 | 84 | 152* |
| EntityStruct0x284.md | f6a | 0x6A | 38/20/47 | 2/0/2 | 141 | 218* |
| EntityStruct0x284.md | f70 | 0x70 | 87/85/111 | 1/1/2 | 97 | 219* |
| EntityStruct0x284.md | f74 | 0x74 | 90/72/127 | 1/2/3 | 89 | 193* |
| EntityStruct0x284.md | f78 | 0x78 | 72/48/99 | 1/3/4 | 107 | 176* |
| EntityStruct0x284.md | f7c | 0x7C | 79/67/109 | 1/3/4 | 100 | 177* |
| EntityStruct0x284.md | f80 | 0x80 | 73/75/114 | 2/3/4 | 93 | 178* |
| EntityStruct0x284.md | f80_ptr | 0x80 | 71/72/110 | 2/3/4 | 98 | 179* |
| EntityStruct0x284.md | f84 | 0x84 | 56/66/92 | 0/2/2 | 112 | 220* |
| EntityStruct0x284.md | f88 | 0x88 | 68/61/99 | 1/1/2 | 108 | 221* |
| EntityStruct0x284.md | f8c | 0x8C | 56/55/85 | 1/1/2 | 121 | 222* |
| EntityStruct0x284.md | f90 | 0x90 | 82/54/105 | 2/2/3 | 102 | 194* |
| EntityStruct0x284.md | f94 | 0x94 | 46/41/66 | 1/3/4 | 131 | 180* |
| EntityStruct0x284.md | f98 | 0x98 | 68/48/89 | 1/1/2 | 117 | 223* |
| EntityStruct0x284.md | fa0 | 0xA0 | 57/51/90 | 1/2/3 | 115 | 195* |
| EntityStruct0x284.md | fa4 | 0xA4 | 78/42/92 | 2/0/2 | 113 | 224* |
| EntityStruct0x284.md | fa8 | 0xA8 | 64/29/79 | 2/1/3 | 123 | 196* |
| EntityStruct0x284.md | fdc | 0xDC | 26/22/36 | 0/1/1 | 146 | 241* |
| EntityStruct0x284.md | state | 0x0 | 56/47/65 | 170/48/212 | 132 | 17* |
| EntityStruct0x284.md | subArray | 0x0 | 50/43/57 | 164/44/204 | 139 | 28* |
| GameSingleton.md | f10 | 0x10 | 679/650/1028 | 23/28/44 | 34 | 64* |
| GameSingleton.md | f14 | 0x14 | 719/560/983 | 32/37/63 | 41 | 55* |
| GameSingleton.md | f15 | 0x15 | 34/11/44 | 27/1/28 | 143 | 85* |
| GameSingleton.md | f16 | 0x16 | 89/61/115 | 9/7/15 | 91 | 119* |
| GameSingleton.md | f17 | 0x17 | 9/14/19 | 5/8/10 | 167 | 133* |
| GameSingleton.md | f184 | 0x184 | 5/9/10 | 1/2/3 | 195 | 197* |
| GameSingleton.md | f188 | 0x188 | 9/10/15 | 1/2/3 | 175 | 198* |
| GameSingleton.md | f18c | 0x18C | 4/9/9 | 1/5/5 | 202 | 161* |
| GameSingleton.md | f190 | 0x190 | 4/8/9 | 1/5/5 | 203 | 162* |
| GameSingleton.md | f194 | 0x194 | 8/7/12 | 1/2/3 | 186 | 199* |
| GameSingleton.md | f19c | 0x19C | 15/15/21 | 5/6/6 | 161 | 153* |
| GameSingleton.md | f1a0 | 0x1A0 | 26/7/29 | 21/0/21 | 153 | 106* |
| GameSingleton.md | f1a4 | 0x1A4 | 5/7/9 | 2/3/3 | 204 | 200* |
| GameSingleton.md | f1a6 | 0x1A6 | 3/0/3 | 4/0/4 | 242 | 181* |
| GameSingleton.md | f1a7 | 0x1A7 | 1/2/2 | 1/2/2 | 246 | 225* |
| GameSingleton.md | f1a8 | 0x1A8 | 5/9/11 | 1/4/4 | 190 | 182* |
| GameSingleton.md | f1aa | 0x1AA | 1/1/1 | 1/1/1 | 250 | 242* |
| GameSingleton.md | f1ad | 0x1AD | 2/3/3 | 2/4/4 | 243 | 183* |
| GameSingleton.md | f1ae | 0x1AE | 1/1/1 | 1/1/1 | 251 | 243* |
| GameSingleton.md | f1b8 | 0x1B8 | 6/5/10 | 1/2/3 | 196 | 201* |
| GameSingleton.md | f1bc | 0x1BC | 5/5/9 | 1/4/5 | 205 | 163* |
| GameSingleton.md | f1c0 | 0x1C0 | 5/4/8 | 1/2/3 | 210 | 202* |
| GameSingleton.md | f1c4 | 0x1C4 | 5/3/7 | 1/2/3 | 215 | 203* |
| GameSingleton.md | f1c8 | 0x1C8 | 4/7/9 | 1/5/5 | 206 | 164* |
| GameSingleton.md | f1cc | 0x1CC | 5/10/12 | 1/4/5 | 187 | 165* |
| GameSingleton.md | f1d0 | 0x1D0 | 4/7/9 | 1/4/5 | 207 | 166* |
| GameSingleton.md | f1dc | 0x1DC | 10/11/16 | 2/2/3 | 173 | 204* |
| GameSingleton.md | f1f0 | 0x1F0 | 5/10/14 | 1/1/2 | 180 | 226* |
| GameSingleton.md | f1f4 | 0x1F4 | 6/8/10 | 1/1/2 | 197 | 227* |
| GameSingleton.md | f1f8 | 0x1F8 | 6/7/10 | 1/2/2 | 198 | 228* |
| GameSingleton.md | f1fc | 0x1FC | 8/9/12 | 1/2/2 | 188 | 229* |
| GameSingleton.md | f20 | 0x20 | 390/282/493 | 14/14/24 | 54 | 98* |
| GameSingleton.md | f200 | 0x200 | 25/11/31 | 16/3/18 | 152 | 111* |
| GameSingleton.md | f204 | 0x204 | 14/12/22 | 6/7/12 | 160 | 127* |
| GameSingleton.md | f208 | 0x208 | 9/9/16 | 6/3/8 | 174 | 140* |
| GameSingleton.md | f20c | 0x20C | 12/12/20 | 5/5/9 | 165 | 137* |
| GameSingleton.md | f24 | 0x24 | 340/266/432 | 22/13/26 | 61 | 95* |
| GameSingleton.md | f2d0 | 0x2D0 | 15/5/17 | 16/5/18 | 171 | 112* |
| GameSingleton.md | f348 | 0x348 | 3/2/4 | 2/1/3 | 236 | 205* |
| GameSingleton.md | f3cc | 0x3CC | 4/7/9 | 2/5/7 | 208 | 146* |
| GameSingleton.md | f3cd | 0x3CD | 1/3/3 | 1/4/4 | 244 | 184* |
| GameSingleton.md | f3ce | 0x3CE | 0/0/0 | 0/0/0 | 255 | 255 |
| GameSingleton.md | f3d0 | 0x3D0 | 1/1/2 | 1/1/2 | 247 | 230* |
| GameSingleton.md | f4 | 0x4 | 1683/1426/2259 | 79/69/124 | 3 | 33* |
| GameSingleton.md | f454 | 0x454 | 5/3/8 | 1/1/2 | 211 | 231* |
| GameSingleton.md | f458 | 0x458 | 3/5/7 | 1/1/2 | 216 | 232* |
| GameSingleton.md | f45c | 0x45C | 2/4/6 | 1/1/2 | 222 | 233* |
| GameSingleton.md | f460 | 0x460 | 3/4/6 | 1/1/2 | 223 | 234* |
| GameSingleton.md | f468 | 0x468 | 4/1/5 | 4/1/5 | 231 | 167* |
| GameSingleton.md | f46c | 0x46C | 4/3/7 | 1/2/3 | 217 | 206* |
| GameSingleton.md | f470 | 0x470 | 4/3/7 | 1/2/3 | 218 | 207* |
| GameSingleton.md | f47c | 0x47C | 2/2/4 | 1/1/2 | 237 | 235* |
| GameSingleton.md | f480 | 0x480 | 13/9/15 | 2/2/3 | 176 | 208* |
| GameSingleton.md | fa4 | 0xA4 | 78/42/92 | 13/4/13 | 114 | 126* |
| GameSingleton.md | fd | 0xD | 39/16/46 | 27/4/28 | 142 | 86* |
| GameSingleton.md | fe4 | 0xE4 | 29/17/33 | 13/5/14 | 150 | 121* |
| GameSingleton.md | fe8 | 0xE8 | 19/17/29 | 1/6/6 | 154 | 154 |
| GameSingleton.md | fec | 0xEC | 18/18/32 | 1/5/6 | 151 | 155* |
| GameSingleton.md | ff0 | 0xF0 | 11/16/21 | 1/5/6 | 162 | 156* |
| GameSingleton.md | ff4 | 0xF4 | 31/16/35 | 25/9/27 | 148 | 91* |
| GameSingleton.md | ff8 | 0xF8 | 35/12/40 | 1/0/1 | 144 | 244* |
| GlobalAudioState.md | f0 | 0x0 | 214/87/261 | 169/50/210 | 75 | 19* |
| GlobalAudioState.md | f3c | 0x3C | 215/182/304 | 29/38/52 | 71 | 58* |
| GlobalAudioState.md | f4 | 0x4 | 1683/1426/2259 | 164/124/218 | 4 | 13* |
| GlobalAudioState.md | f54 | 0x54 | 177/112/216 | 85/35/103 | 81 | 40* |
| GlobalAudioState.md | fb64 | 0xB64 | 4/5/6 | 4/6/7 | 224 | 147* |
| GlobalAudioState.md | fb6c | 0xB6C | 14/15/15 | 14/15/15 | 177 | 120* |
| GlobalAudioState.md | fb70 | 0xB70 | 1/3/3 | 1/3/3 | 245 | 209* |
| GlobalAudioState.md | fb74 | 0xB74 | 1/2/2 | 1/2/2 | 248 | 236* |
| GlobalAudioState.md | fb78 | 0xB78 | 1/2/2 | 1/2/2 | 249 | 237* |
| GlobalAudioState.md | fb84 | 0xB84 | 4/5/8 | 4/5/8 | 212 | 141* |
| GlobalAudioState.md | fb88 | 0xB88 | 14/7/19 | 14/7/19 | 168 | 110* |
| GlobalAudioState.md | fb8c | 0xB8C | 4/1/4 | 4/1/4 | 238 | 185* |
| GlobalAudioState.md | fba0 | 0xBA0 | 5/7/11 | 1/7/7 | 191 | 148* |
| GlobalAudioState.md | fba4 | 0xBA4 | 3/3/6 | 3/3/6 | 225 | 157* |
| GlobalAudioState.md | fbb0 | 0xBB0 | 3/5/7 | 4/5/8 | 219 | 142* |
| GlobalAudioState.md | fbb4 | 0xBB4 | 5/7/10 | 5/7/10 | 199 | 134* |
| GlobalAudioState.md | fbbc | 0xBBC | 3/5/7 | 3/5/7 | 220 | 149* |
| GlobalAudioState.md | fbc4 | 0xBC4 | 2/4/5 | 2/4/5 | 232 | 168* |
| GlobalAudioState.md | fbc8 | 0xBC8 | 0/4/4 | 0/4/4 | 239 | 186* |
| GlobalAudioState.md | fc3c | 0xC3C | 16/9/23 | 12/8/20 | 158 | 107* |
| GlobalAudioState.md | fc40 | 0xC40 | 2/5/5 | 1/4/4 | 233 | 187* |
| GlobalAudioState.md | fc44 | 0xC44 | 1/6/6 | 0/5/5 | 226 | 169* |
| GlobalAudioState.md | fc48 | 0xC48 | 4/10/13 | 3/6/8 | 182 | 143* |
| GlobalData02102c7c.md | _b24_lo | 0x24 | 330/259/419 | 29/20/33 | 63 | 80* |
| GlobalData02102c7c.md | _b24_top | 0x24 | 330/259/419 | 29/20/33 | 64 | 81* |
| GlobalData02102c7c.md | _b38_lo | 0x38 | 397/183/462 | 12/16/22 | 56 | 100* |
| GlobalData02102c7c.md | _b38_top | 0x38 | 397/183/462 | 12/16/22 | 57 | 101* |
| GlobalData02102c7c.md | f24_mhi4 | 0x24 | 330/259/419 | 29/20/33 | 65 | 82* |
| GlobalData02102c7c.md | f24_uhi4 | 0x24 | 330/259/419 | 29/20/33 | 66 | 83* |
| GlobalData02102c7c.md | f38_mhi4 | 0x38 | 397/183/462 | 12/16/22 | 58 | 102* |
| GlobalData02102c7c.md | f38_uhi4 | 0x38 | 397/183/462 | 12/16/22 | 59 | 103* |
| GlobalData02102c7c.md | f4 | 0x4 | 1683/1426/2259 | 106/117/174 | 5 | 29* |
| GlobalData02102c7c.md | f8 | 0x8 | 1086/1146/1577 | 75/88/123 | 21 | 34* |
| GlobalData02102c7c.md | f88 | 0x88 | 68/61/99 | 8/3/11 | 109 | 131* |
| GlobalData02102c7c.md | f90 | 0x90 | 82/54/105 | 9/2/10 | 103 | 135* |
| GlobalData02102c7c.md | f98 | 0x98 | 68/48/89 | 9/2/10 | 118 | 136* |
| GlobalData02102c7c.md | fa0 | 0xA0 | 57/51/90 | 7/4/11 | 116 | 132* |
| GlobalData02102c7c.md | fa8 | 0xA8 | 64/29/79 | 7/2/9 | 124 | 138* |
| GlobalData02102c7c.md | fb4 | 0xB4 | 45/42/59 | 2/3/3 | 134 | 210* |
| GlobalData02104bac.md | flags | 0x54 | 201/137/248 | 97/45/115 | 78 | 35* |
| GlobalData02104e6c.md | chan | 0x4 | 1637/1390/2185 | 80/42/110 | 9 | 37* |
| GlobalData02104e6c.md | w0 | 0x0 | 57/44/64 | 171/45/211 | 133 | 18* |
| GlobalData02104f1c.md | f0 | 0x0 | 214/87/261 | 169/49/209 | 76 | 22* |
| GlobalData02104f1c.md | f10 | 0x10 | 679/650/1028 | 10/22/29 | 35 | 84* |
| GlobalData02104f1c.md | f14 | 0x14 | 719/560/983 | 23/30/48 | 42 | 59* |
| GlobalData02104f1c.md | f18 | 0x18 | 553/425/715 | 20/23/37 | 48 | 71* |
| GlobalData02104f1c.md | f1c | 0x1C | 507/375/645 | 30/13/40 | 51 | 69* |
| GlobalData02104f1c.md | f4 | 0x4 | 1683/1426/2259 | 72/45/102 | 6 | 42* |
| HitRect.md | attr | 0xA | 181/134/240 | 11/19/28 | 80 | 87* |
| HitRect.md | h | 0x5 | 51/35/74 | 15/1/16 | 125 | 117* |
| HitRect.md | w | 0x4 | 1631/1389/2180 | 74/41/105 | 10 | 38* |
| HitRect.md | x | 0x0 | 59/47/70 | 173/48/217 | 127 | 14* |
| HitRect.md | y | 0x2 | 1334/269/1422 | 268/14/281 | 26 | 4* |
| LinkedListNode.md | arg | 0x14 | 706/536/948 | 23/29/48 | 43 | 60* |
| LinkedListNode.md | dtor | 0xC | 927/817/1269 | 18/31/44 | 30 | 65* |
| LinkedListNode.md | fn | 0x8 | 1076/1114/1536 | 55/46/88 | 22 | 50* |
| LinkedListNode.md | key | 0x10 | 676/639/1014 | 12/23/34 | 36 | 78* |
| LinkedListNode.md | key | 0x8 | 1057/1111/1520 | 37/43/73 | 23 | 51* |
| LinkedListNode.md | next | 0x0 | 93/58/104 | 204/59/246 | 104 | 9* |
| LinkedListNode.md | obj | 0x4 | 1621/1388/2169 | 64/40/94 | 13 | 44* |
| LinkedListNode.md | pad | 0x4 | 1620/1387/2167 | 63/39/92 | 16 | 49* |
| LinkedListNode.md | prev | 0x4 | 1626/1396/2176 | 69/48/101 | 12 | 43* |
| Matrix3x4.md | m00 | 0x0 | 50/44/58 | 164/45/205 | 137 | 24* |
| Matrix3x4.md | m01 | 0x4 | 1620/1388/2168 | 63/40/93 | 14 | 45* |
| Matrix3x4.md | m02 | 0x8 | 1053/1108/1513 | 33/40/66 | 24 | 52* |
| Matrix3x4.md | m03 | 0xC | 927/817/1269 | 18/31/44 | 31 | 66* |
| Matrix3x4.md | m10 | 0x10 | 672/636/1007 | 8/20/27 | 37 | 92* |
| Matrix3x4.md | m11 | 0x14 | 704/537/947 | 21/30/47 | 44 | 61* |
| Matrix3x4.md | m12 | 0x18 | 544/411/693 | 18/23/36 | 49 | 74* |
| Matrix3x4.md | m13 | 0x1C | 495/367/628 | 17/14/28 | 52 | 88* |
| Matrix3x4.md | m20 | 0x20 | 384/276/482 | 7/8/14 | 55 | 122* |
| Matrix3x4.md | m21 | 0x24 | 330/260/420 | 10/9/14 | 62 | 123* |
| Matrix3x4.md | m22 | 0x28 | 280/233/365 | 9/6/14 | 68 | 124* |
| Matrix3x4.md | m23 | 0x2C | 262/183/336 | 5/4/8 | 69 | 144* |
| OamCtl.md | b0 | 0x0 | 306/61/323 | 378/62/425 | 70 | 3* |
| Ov002SelfContext.md | b0 | 0x2 | 1581/283/1675 | 1298/70/1320 | 18 | 1* |
| Ov002SelfContext.md | f0 | 0x0 | 214/87/261 | 170/49/210 | 77 | 20* |
| PerPlayerRowTable.md | base | 0x0 | 58/47/68 | 178/53/221 | 129 | 12* |
| PerPlayerRowTable.md | f4 | 0x4 | 1683/1426/2259 | 470/228/532 | 7 | 2* |
| PerPlayerRowTable.md | f_010 | 0x10 | 672/635/1006 | 173/104/215 | 38 | 16* |
| PerPlayerRowTable.md | f_01c | 0x1C | 495/366/627 | 122/63/135 | 53 | 30* |
| PerPlayerRowTable.md | f_0e | 0xE | 92/82/140 | 25/36/53 | 87 | 57* |
| PerPlayerRowTable.md | id_lo13 | 0x8 | 1053/1107/1512 | 204/196/280 | 25 | 6* |
| PerPlayerRowTable.md | zone_count | 0x0 | 50/43/57 | 170/49/210 | 140 | 21* |
| Rect.md | h | 0x5 | 51/35/74 | 15/1/16 | 126 | 118* |
| Rect.md | w | 0x4 | 1631/1389/2180 | 74/41/105 | 11 | 39* |
| Rect.md | x | 0x0 | 59/47/70 | 173/48/217 | 128 | 15* |
| Rect.md | y | 0x2 | 1334/269/1422 | 268/14/281 | 27 | 5* |
| TaskList.md | count | 0x0 | 91/56/100 | 205/56/246 | 105 | 10* |
| TaskList.md | tasks | 0x4 | 1621/1387/2168 | 64/39/93 | 15 | 46* |

The two requested decimal-offset rows are `DuelQueueState / f_5b4 / 0x5B4` and `DuelQueueState / f_5d4 / 0x5D4`; their corrected totals are 55 and 38, respectively. The full table above is the reproducible rank-change callout.
