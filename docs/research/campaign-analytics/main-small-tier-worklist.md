[//]: # (markdownlint-disable MD013 MD041)

# Main 0–256 B small-tier worklist

Snapshot: 2026-07-22. This is a build-free census of the current EUR-baseline live delinks tier. Brief 661 reported 1,645 files in this band; five have since left the current unknown pool, so this worklist contains the current 1,640 rows.

## Summary

| address range | owner lane | rows |
|---|---|---:|
| `0x02000000–0x0203ffff` | Scaffolder | 396 |
| `0x02040000+` | Decomper | 1,244 |
| **total** | | **1,640** |

| shape | rows | rank |
|---|---:|---|
| trivial stub | 0 | first |
| tail-call forwarder | 0 | second |
| guard chain | 515 | third |
| small dispatcher | 246 | fourth |
| loop | 480 | fifth |
| other (including source-level leaves) | 399 | last |

Every row has a local `S-` or `D-` rank within its address range. The two lane ranges are intentionally kept in the same table so an agent can filter by prefix.

## Mechanical criteria

- Candidate set: `tools/wall_aware_headroom.py` `main.unknown_files`, restricted to live `src/main` `.s` sources whose committed EUR delinks `.text` span is at most 256 B.
- Size: the `.text` span in `config/eur/arm9/delinks.txt`, not source-file length.
- Shape: instruction scan after removing `;` comments. A trivial stub is at most 8 B or at most two non-directive instructions with no call/branch; a tail-call forwarder is one unconditional branch with no call and at most six instructions; a loop has a branch to an earlier label; a small dispatcher has at least four branch instructions; a guard chain has one to three conditional branches; all remaining bodies are `other`.
- Header provenance: the leading header is recorded as `GLOBAL_ASM / brief 294+302` when that stamp is present; otherwise it is marked ambiguous. The stamp is provenance, not a wall verdict.
- Matched sibling: `yes` means a completed `.c`/`.cpp` TU in the EUR delinks has the same mechanical shape and a `.text` span within ±16 B. The listed path is one representative; `no` means no such sibling was found. This is a similarity signal, not proof of a match or a portability twin.
- Ranking follows brief 661's tractability order. No current row met the strict stub/forwarder definitions, so guard chains lead this snapshot.

## Worklist

| rank | address | size (B) | shape | header provenance | matched sibling of similar shape |
|---|---:|---:|---|---|---|
| S-0001 | 0x02000e70 | 88 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e29c.legacy.c (+0 B) |
| S-0002 | 0x02003a4c | 116 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/Task_PostLocked.c (+0 B) |
| S-0003 | 0x02003ac0 | 84 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201c64c.c (+0 B) |
| S-0004 | 0x02003e98 | 132 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200aa60.c (+0 B) |
| S-0005 | 0x02003f1c | 84 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201c64c.c (+0 B) |
| S-0006 | 0x02004ef4 | 100 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005bfc.c (+0 B) |
| S-0007 | 0x02006264 | 104 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02000c4c.c (+0 B) |
| S-0008 | 0x02006b4c | 192 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay008/func_ov008_021b1e20.c (+0 B) |
| S-0009 | 0x02006e28 | 200 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021c12fc.c (+0 B) |
| S-0010 | 0x02007f58 | 156 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/OSi_PostIrqEvent.legacy.c (+0 B) |
| S-0011 | 0x02008f24 | 148 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021ec110.c (+0 B) |
| S-0012 | 0x020091f4 | 88 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e29c.legacy.c (+0 B) |
| S-0013 | 0x02009278 | 80 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200c65c.c (+0 B) |
| S-0014 | 0x02009a68 | 72 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e254.legacy.c (+0 B) |
| S-0015 | 0x0200dd58 | 108 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02035ff4.c (+0 B) |
| S-0016 | 0x0200f01c | 40 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200bfa4.c (+0 B) |
| S-0017 | 0x02010eb8 | 204 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02059d90.c (+0 B) |
| S-0018 | 0x02011178 | 108 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02035ff4.c (+0 B) |
| S-0019 | 0x02017df0 | 184 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay016/func_ov016_021b509c.c (+0 B) |
| S-0020 | 0x02018ecc | 96 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0203874c.c (+0 B) |
| S-0021 | 0x02019820 | 56 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200bd20.c (+0 B) |
| S-0022 | 0x020198ec | 84 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201c64c.c (+0 B) |
| S-0023 | 0x02019a58 | 116 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/Task_PostLocked.c (+0 B) |
| S-0024 | 0x0201a3ec | 68 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/Task_InvokeLocked.c (+0 B) |
| S-0025 | 0x0201a498 | 68 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/Task_InvokeLocked.c (+0 B) |
| S-0026 | 0x0201a9d0 | 208 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_0223a87c.c (+0 B) |
| S-0027 | 0x0201bddc | 136 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200ade8.c (+0 B) |
| S-0028 | 0x0201be64 | 52 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020921a8.legacy.c (+0 B) |
| S-0029 | 0x0201c224 | 132 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200aa60.c (+0 B) |
| S-0030 | 0x0201cfa0 | 64 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005c60.c (+0 B) |
| S-0031 | 0x0201d47c | 56 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200bd20.c (+0 B) |
| S-0032 | 0x0201d5c0 | 40 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200bfa4.c (+0 B) |
| S-0033 | 0x0201ef90 | 256 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay016/func_ov016_021b8cd8.c (+16 B) |
| S-0034 | 0x0201f138 | 100 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005bfc.c (+0 B) |
| S-0035 | 0x0201f6c0 | 100 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005bfc.c (+0 B) |
| S-0036 | 0x0201f7f0 | 132 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200aa60.c (+0 B) |
| S-0037 | 0x0201fd24 | 160 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay011/func_ov011_021cc5c4.c (+0 B) |
| S-0038 | 0x02020130 | 88 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e29c.legacy.c (+0 B) |
| S-0039 | 0x020202ac | 172 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay012/Ov012_BeginIntroTransition.c (+4 B) |
| S-0040 | 0x02020398 | 108 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02035ff4.c (+0 B) |
| S-0041 | 0x02020490 | 192 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay008/func_ov008_021b1e20.c (+0 B) |
| S-0042 | 0x020206d8 | 96 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0203874c.c (+0 B) |
| S-0043 | 0x02022580 | 52 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020921a8.legacy.c (+0 B) |
| S-0044 | 0x02022af4 | 128 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0208f52c.legacy.c (+0 B) |
| S-0045 | 0x02025840 | 64 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005c60.c (+0 B) |
| S-0046 | 0x02025880 | 60 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020983b8.legacy.c (+0 B) |
| S-0047 | 0x02027e44 | 144 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_022862cc.c (+0 B) |
| S-0048 | 0x02029624 | 148 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021ec110.c (+0 B) |
| S-0049 | 0x0202b1a8 | 236 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/func_ov021_021aae68.c (+0 B) |
| S-0050 | 0x0202b9ec | 76 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005ee0.c (+0 B) |
| S-0051 | 0x0202ba38 | 92 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202c1ac.c (+0 B) |
| S-0052 | 0x0202ba94 | 80 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200c65c.c (+0 B) |
| S-0053 | 0x0202bc38 | 76 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005ee0.c (+0 B) |
| S-0054 | 0x0202d2dc | 232 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay017/func_ov017_021b73a8.c (+0 B) |
| S-0055 | 0x0202d3c4 | 228 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay016/func_ov016_021b894c.c (+0 B) |
| S-0056 | 0x0202d4a8 | 176 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay014/Ov014_HitTestPrimary.c (+0 B) |
| S-0057 | 0x0202d9a0 | 88 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e29c.legacy.c (+0 B) |
| S-0058 | 0x0203058c | 76 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005ee0.c (+0 B) |
| S-0059 | 0x0203194c | 84 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201c64c.c (+0 B) |
| S-0060 | 0x02031c1c | 112 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02038fb0.c (+0 B) |
| S-0061 | 0x02031d0c | 116 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/Task_PostLocked.c (+0 B) |
| S-0062 | 0x02032028 | 76 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005ee0.c (+0 B) |
| S-0063 | 0x020320f8 | 184 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay016/func_ov016_021b509c.c (+0 B) |
| S-0064 | 0x02032370 | 132 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200aa60.c (+0 B) |
| S-0065 | 0x02032644 | 56 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200bd20.c (+0 B) |
| S-0066 | 0x02032ac4 | 108 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02035ff4.c (+0 B) |
| S-0067 | 0x02032c78 | 80 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200c65c.c (+0 B) |
| S-0068 | 0x020330e4 | 204 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02059d90.c (+0 B) |
| S-0069 | 0x0203320c | 108 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02035ff4.c (+0 B) |
| S-0070 | 0x020334cc | 112 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02038fb0.c (+0 B) |
| S-0071 | 0x0203361c | 56 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200bd20.c (+0 B) |
| S-0072 | 0x02033864 | 68 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/Task_InvokeLocked.c (+0 B) |
| S-0073 | 0x02033ac0 | 160 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay011/func_ov011_021cc5c4.c (+0 B) |
| S-0074 | 0x02033b60 | 204 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02059d90.c (+0 B) |
| S-0075 | 0x02034270 | 128 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0208f52c.legacy.c (+0 B) |
| S-0076 | 0x0203444c | 252 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/func_ov021_021aae68.c (+16 B) |
| S-0077 | 0x02034888 | 192 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay008/func_ov008_021b1e20.c (+0 B) |
| S-0078 | 0x02034bd8 | 92 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202c1ac.c (+0 B) |
| S-0079 | 0x0203671c | 192 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay008/func_ov008_021b1e20.c (+0 B) |
| S-0080 | 0x020379f8 | 120 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200a68c.c (+0 B) |
| S-0081 | 0x02037a70 | 72 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e254.legacy.c (+0 B) |
| S-0082 | 0x02037b04 | 48 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_02092124.legacy.c (+0 B) |
| S-0083 | 0x02037be4 | 112 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02038fb0.c (+0 B) |
| S-0084 | 0x02037ca0 | 136 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200ade8.c (+0 B) |
| S-0085 | 0x02037d28 | 152 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021e2b3c.c (+0 B) |
| S-0086 | 0x020380dc | 140 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_0225764c.c (+0 B) |
| S-0087 | 0x0203a8dc | 116 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/Task_PostLocked.c (+0 B) |
| S-0088 | 0x0203ba24 | 124 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0205d9a0.c (+0 B) |
| S-0089 | 0x0203cb40 | 80 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200c65c.c (+0 B) |
| S-0090 | 0x0203cb90 | 48 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_02092124.legacy.c (+0 B) |
| S-0091 | 0x0203db24 | 76 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005ee0.c (+0 B) |
| S-0092 | 0x0203de2c | 84 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201c64c.c (+0 B) |
| S-0093 | 0x0203e198 | 108 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02035ff4.c (+0 B) |
| S-0094 | 0x0203e204 | 80 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200c65c.c (+0 B) |
| S-0095 | 0x0203e400 | 96 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0203874c.c (+0 B) |
| S-0096 | 0x0203e870 | 72 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e254.legacy.c (+0 B) |
| S-0097 | 0x0203e8b8 | 164 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay000/func_ov000_021ad49c.c (+0 B) |
| S-0098 | 0x0203e9ac | 252 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/func_ov021_021aae68.c (+16 B) |
| S-0099 | 0x0203ec1c | 136 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200ade8.c (+0 B) |
| S-0100 | 0x0203edd4 | 192 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay008/func_ov008_021b1e20.c (+0 B) |
| S-0101 | 0x0203ee94 | 76 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005ee0.c (+0 B) |
| S-0102 | 0x0203eefc | 108 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02035ff4.c (+0 B) |
| S-0103 | 0x0203efa0 | 144 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_022862cc.c (+0 B) |
| S-0104 | 0x02000ef8 | 140 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202ed04.c (+0 B) |
| S-0105 | 0x02001448 | 248 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02030b84.c (+0 B) |
| S-0106 | 0x020055b4 | 240 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020452c4.c (+0 B) |
| S-0107 | 0x02005b74 | 136 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202e864.c (+0 B) |
| S-0108 | 0x02005dac | 116 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200c284.c (+0 B) |
| S-0109 | 0x02007e8c | 172 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02013aa0.c (+0 B) |
| S-0110 | 0x02009968 | 256 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_02259f98.c (+0 B) |
| S-0111 | 0x0200c79c | 136 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202e864.c (+0 B) |
| S-0112 | 0x0200f044 | 248 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02030b84.c (+0 B) |
| S-0113 | 0x02017afc | 228 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02031684.c (+4 B) |
| S-0114 | 0x02017d18 | 216 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021d2550.c (+0 B) |
| S-0115 | 0x02018fbc | 120 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202c770.c (+0 B) |
| S-0116 | 0x0201934c | 224 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02031684.c (+0 B) |
| S-0117 | 0x0201942c | 104 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021aa818.c (+0 B) |
| S-0118 | 0x020196d8 | 212 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021daa48.c (+0 B) |
| S-0119 | 0x02019ea4 | 240 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020452c4.c (+0 B) |
| S-0120 | 0x0201a920 | 176 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202ed90.c (+0 B) |
| S-0121 | 0x0201bd30 | 172 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02013aa0.c (+0 B) |
| S-0122 | 0x0201ddac | 136 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202e864.c (+0 B) |
| S-0123 | 0x0201e4cc | 236 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021cec8c.c (+0 B) |
| S-0124 | 0x0201ee1c | 244 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201bc3c.c (+0 B) |
| S-0125 | 0x020205ec | 204 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02014b28.c (+0 B) |
| S-0126 | 0x02020a24 | 256 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_02259f98.c (+0 B) |
| S-0127 | 0x02020ba0 | 244 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201bc3c.c (+0 B) |
| S-0128 | 0x02022430 | 144 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201d530.c (+0 B) |
| S-0129 | 0x020224c0 | 76 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0203624c.c (+0 B) |
| S-0130 | 0x02023eb8 | 112 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_02093c20.legacy.c (+0 B) |
| S-0131 | 0x02025f00 | 208 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021cc2f0.c (+0 B) |
| S-0132 | 0x02026d50 | 232 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021aaaf0.c (+0 B) |
| S-0133 | 0x02026e38 | 160 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay012/func_ov012_021ca2a0.c (+0 B) |
| S-0134 | 0x0202813c | 252 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02030b84.c (+4 B) |
| S-0135 | 0x02029204 | 136 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202e864.c (+0 B) |
| S-0136 | 0x02029458 | 104 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021aa818.c (+0 B) |
| S-0137 | 0x02029c30 | 80 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0203b830.c (+0 B) |
| S-0138 | 0x02029c80 | 192 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202ef38.c (+4 B) |
| S-0139 | 0x0202a998 | 192 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202ef38.c (+4 B) |
| S-0140 | 0x0202e358 | 212 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021daa48.c (+0 B) |
| S-0141 | 0x0202e5ac | 96 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202f46c.c (+0 B) |
| S-0142 | 0x0202e60c | 232 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021aaaf0.c (+0 B) |
| S-0143 | 0x0202e79c | 200 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202ee40.c (+0 B) |
| S-0144 | 0x0202f164 | 116 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200c284.c (+0 B) |
| S-0145 | 0x0202f500 | 120 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202c770.c (+0 B) |
| S-0146 | 0x020312a0 | 184 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/func_ov021_021ab090.c (+0 B) |
| S-0147 | 0x020315e8 | 156 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021d3d2c.c (+0 B) |
| S-0148 | 0x02031ba0 | 124 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201d4b4.c (+0 B) |
| S-0149 | 0x02031ebc | 132 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200ef60.c (+4 B) |
| S-0150 | 0x02032b30 | 204 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02014b28.c (+0 B) |
| S-0151 | 0x02033554 | 100 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201a530.c (+0 B) |
| S-0152 | 0x02033718 | 88 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200bef4.c (+0 B) |
| S-0153 | 0x02033770 | 72 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0203624c.c (+4 B) |
| S-0154 | 0x020337b8 | 68 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0203dde8.c (+0 B) |
| S-0155 | 0x020338b8 | 64 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202c730.c (+0 B) |
| S-0156 | 0x02033f40 | 112 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_02093c20.legacy.c (+0 B) |
| S-0157 | 0x02033fb0 | 100 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201a530.c (+0 B) |
| S-0158 | 0x02034388 | 168 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202e6f4.c (+0 B) |
| S-0159 | 0x0203467c | 192 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202ef38.c (+4 B) |
| S-0160 | 0x02034a84 | 168 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202e6f4.c (+0 B) |
| S-0161 | 0x020358cc | 136 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202e864.c (+0 B) |
| S-0162 | 0x02037fe4 | 248 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02030b84.c (+0 B) |
| S-0163 | 0x020381bc | 144 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201d530.c (+0 B) |
| S-0164 | 0x020385f8 | 124 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201d4b4.c (+0 B) |
| S-0165 | 0x02038674 | 128 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200ef60.c (+0 B) |
| S-0166 | 0x02038ad4 | 192 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202ef38.c (+4 B) |
| S-0167 | 0x02038c98 | 148 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021e76b4.c (+0 B) |
| S-0168 | 0x02038e58 | 228 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02031684.c (+4 B) |
| S-0169 | 0x0203c900 | 104 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021aa818.c (+0 B) |
| S-0170 | 0x0203cc58 | 224 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02031684.c (+0 B) |
| S-0171 | 0x0203d2e8 | 180 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202ed90.c (+4 B) |
| S-0172 | 0x0203d5b0 | 248 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02030b84.c (+0 B) |
| S-0173 | 0x0203dae0 | 68 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0203dde8.c (+0 B) |
| S-0174 | 0x0203db70 | 160 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay012/func_ov012_021ca2a0.c (+0 B) |
| S-0175 | 0x0203dc10 | 132 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200ef60.c (+4 B) |
| S-0176 | 0x0203e0a0 | 248 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02030b84.c (+0 B) |
| S-0177 | 0x0203e254 | 156 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021d3d2c.c (+0 B) |
| S-0178 | 0x0203e2f0 | 228 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02031684.c (+4 B) |
| S-0179 | 0x0203e540 | 208 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021cc2f0.c (+0 B) |
| S-0180 | 0x0203eb48 | 212 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021daa48.c (+0 B) |
| S-0181 | 0x0203f30c | 112 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_02093c20.legacy.c (+0 B) |
| S-0182 | 0x02000d9c | 152 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0206a8c0.legacy_sp3.c (+0 B) |
| S-0183 | 0x020018d4 | 168 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200af24.c (+4 B) |
| S-0184 | 0x0200197c | 184 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020918d0.legacy.c (+4 B) |
| S-0185 | 0x02001a34 | 228 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+8 B) |
| S-0186 | 0x02001b18 | 140 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_022123fc.c (+0 B) |
| S-0187 | 0x02001bc8 | 208 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+12 B) |
| S-0188 | 0x020059b0 | 176 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/Scene_Update.c (+4 B) |
| S-0189 | 0x02005a60 | 216 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+4 B) |
| S-0190 | 0x02005ca0 | 108 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02068380.c (+0 B) |
| S-0191 | 0x02005e20 | 192 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020364c4.c (+0 B) |
| S-0192 | 0x02007104 | 160 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200af24.c (+4 B) |
| S-0193 | 0x02009dec | 176 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/Scene_Update.c (+4 B) |
| S-0194 | 0x02009e9c | 180 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020918d0.legacy.c (+8 B) |
| S-0195 | 0x02009f50 | 196 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020364c4.c (+4 B) |
| S-0196 | 0x0200a19c | 104 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200b2f4.c (+0 B) |
| S-0197 | 0x0200a204 | 104 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200b2f4.c (+0 B) |
| S-0198 | 0x0200a26c | 136 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021dc020.thumb.c (+2 B) |
| S-0199 | 0x0200a3b8 | 84 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201c560.c (+0 B) |
| S-0200 | 0x0200a40c | 72 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02046718.legacy_sp3.c (+0 B) |
| S-0201 | 0x0200a704 | 160 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200af24.c (+4 B) |
| S-0202 | 0x0200a928 | 108 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02068380.c (+0 B) |
| S-0203 | 0x0200abb0 | 116 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02038f3c.c (+0 B) |
| S-0204 | 0x0200b250 | 164 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200af24.c (+0 B) |
| S-0205 | 0x0200bff4 | 132 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02092388.legacy.c (+0 B) |
| S-0206 | 0x0200c23c | 72 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02046718.legacy_sp3.c (+0 B) |
| S-0207 | 0x0200c594 | 200 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020364c4.c (+8 B) |
| S-0208 | 0x0200edb8 | 240 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad1f4.c (+0 B) |
| S-0209 | 0x0200fa90 | 104 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200b2f4.c (+0 B) |
| S-0210 | 0x0200fb18 | 188 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020918d0.legacy.c (+0 B) |
| S-0211 | 0x0200fbd4 | 164 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200af24.c (+0 B) |
| S-0212 | 0x0200fc78 | 164 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200af24.c (+0 B) |
| S-0213 | 0x0200fd1c | 104 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200b2f4.c (+0 B) |
| S-0214 | 0x0200fdc0 | 60 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200fd84.c (+0 B) |
| S-0215 | 0x02010354 | 180 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020918d0.legacy.c (+8 B) |
| S-0216 | 0x020109a8 | 240 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad1f4.c (+0 B) |
| S-0217 | 0x02010a98 | 112 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008c14.c (+0 B) |
| S-0218 | 0x02011a94 | 88 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0207e7d8.legacy_sp3.c (+0 B) |
| S-0219 | 0x02011b9c | 208 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+12 B) |
| S-0220 | 0x020138b8 | 196 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020364c4.c (+4 B) |
| S-0221 | 0x02018be8 | 244 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad1f4.c (+4 B) |
| S-0222 | 0x02019494 | 148 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0206a8c0.legacy_sp3.c (+4 B) |
| S-0223 | 0x02019f94 | 176 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/Scene_Update.c (+4 B) |
| S-0224 | 0x0201a5c0 | 52 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200a454.c (+0 B) |
| S-0225 | 0x0201a778 | 172 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/Scene_Update.c (+0 B) |
| S-0226 | 0x0201a84c | 212 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+8 B) |
| S-0227 | 0x0201af80 | 92 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200b06c.c (+0 B) |
| S-0228 | 0x0201b504 | 204 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020364c4.c (+12 B) |
| S-0229 | 0x0201b648 | 72 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02046718.legacy_sp3.c (+0 B) |
| S-0230 | 0x0201c498 | 200 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020364c4.c (+8 B) |
| S-0231 | 0x0201c5b4 | 152 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0206a8c0.legacy_sp3.c (+0 B) |
| S-0232 | 0x0201c9b4 | 212 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+8 B) |
| S-0233 | 0x0201d620 | 148 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0206a8c0.legacy_sp3.c (+4 B) |
| S-0234 | 0x0201e5b8 | 180 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020918d0.legacy.c (+8 B) |
| S-0235 | 0x0201f874 | 224 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+4 B) |
| S-0236 | 0x02020550 | 156 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0206a8c0.legacy_sp3.c (+4 B) |
| S-0237 | 0x02020738 | 220 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+0 B) |
| S-0238 | 0x02020ff8 | 108 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02068380.c (+0 B) |
| S-0239 | 0x02021660 | 80 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008548.c (+0 B) |
| S-0240 | 0x02021a3c | 236 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad1f4.c (+4 B) |
| S-0241 | 0x02021bac | 96 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001e94.c (+0 B) |
| S-0242 | 0x02021c30 | 140 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_022123fc.c (+0 B) |
| S-0243 | 0x02022540 | 64 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02011a3c.c (+0 B) |
| S-0244 | 0x020225b4 | 84 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201c560.c (+0 B) |
| S-0245 | 0x02023188 | 140 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_022123fc.c (+0 B) |
| S-0246 | 0x02023d88 | 208 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+12 B) |
| S-0247 | 0x02023e58 | 96 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001e94.c (+0 B) |
| S-0248 | 0x020242d4 | 148 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0206a8c0.legacy_sp3.c (+4 B) |
| S-0249 | 0x02024368 | 200 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020364c4.c (+8 B) |
| S-0250 | 0x02025a10 | 112 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008c14.c (+0 B) |
| S-0251 | 0x020264f0 | 244 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad1f4.c (+4 B) |
| S-0252 | 0x020298f8 | 204 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020364c4.c (+12 B) |
| S-0253 | 0x020299c4 | 196 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020364c4.c (+4 B) |
| S-0254 | 0x02029a88 | 228 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+8 B) |
| S-0255 | 0x02029b6c | 196 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020364c4.c (+4 B) |
| S-0256 | 0x0202aa58 | 172 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/Scene_Update.c (+0 B) |
| S-0257 | 0x0202ab04 | 96 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001e94.c (+0 B) |
| S-0258 | 0x0202b12c | 124 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_02287774.c (+0 B) |
| S-0259 | 0x0202b6e4 | 104 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200b2f4.c (+0 B) |
| S-0260 | 0x0202b74c | 128 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02091a0c.legacy.c (+0 B) |
| S-0261 | 0x0202b9b0 | 60 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200fd84.c (+0 B) |
| S-0262 | 0x0202bb88 | 64 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02011a3c.c (+0 B) |
| S-0263 | 0x020319a0 | 208 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+12 B) |
| S-0264 | 0x02031ab0 | 76 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200b1bc.c (+0 B) |
| S-0265 | 0x02031d98 | 232 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad1f4.c (+8 B) |
| S-0266 | 0x02031f9c | 84 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201c560.c (+0 B) |
| S-0267 | 0x0203276c | 84 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201c560.c (+0 B) |
| S-0268 | 0x020327e4 | 128 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02091a0c.legacy.c (+0 B) |
| S-0269 | 0x020332a4 | 100 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201f090.c (+0 B) |
| S-0270 | 0x02033390 | 248 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad1f4.c (+8 B) |
| S-0271 | 0x02033944 | 144 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay011/func_ov011_021cf228.c (+0 B) |
| S-0272 | 0x020339d4 | 116 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02038f3c.c (+0 B) |
| S-0273 | 0x02033c74 | 180 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020918d0.legacy.c (+8 B) |
| S-0274 | 0x02033d78 | 112 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008c14.c (+0 B) |
| S-0275 | 0x020341b0 | 136 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021dc020.thumb.c (+2 B) |
| S-0276 | 0x02034948 | 164 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200af24.c (+0 B) |
| S-0277 | 0x02034b2c | 172 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/Scene_Update.c (+0 B) |
| S-0278 | 0x020353cc | 220 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+0 B) |
| S-0279 | 0x0203724c | 220 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+0 B) |
| S-0280 | 0x02037328 | 80 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008548.c (+0 B) |
| S-0281 | 0x020378c8 | 160 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200af24.c (+4 B) |
| S-0282 | 0x02037b58 | 140 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_022123fc.c (+0 B) |
| S-0283 | 0x020384e8 | 172 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/Scene_Update.c (+0 B) |
| S-0284 | 0x020387c0 | 80 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008548.c (+0 B) |
| S-0285 | 0x02038810 | 224 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+4 B) |
| S-0286 | 0x02038d2c | 68 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201ac1c.c (+0 B) |
| S-0287 | 0x02038d70 | 60 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200fd84.c (+0 B) |
| S-0288 | 0x02038dac | 48 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02031f40.c (+0 B) |
| S-0289 | 0x02038ddc | 124 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_02287774.c (+0 B) |
| S-0290 | 0x0203991c | 116 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02038f3c.c (+0 B) |
| S-0291 | 0x0203a5d4 | 192 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020364c4.c (+0 B) |
| S-0292 | 0x0203a780 | 204 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020364c4.c (+12 B) |
| S-0293 | 0x0203aae8 | 176 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/Scene_Update.c (+4 B) |
| S-0294 | 0x0203aeec | 88 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0207e7d8.legacy_sp3.c (+0 B) |
| S-0295 | 0x0203b2f4 | 196 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020364c4.c (+4 B) |
| S-0296 | 0x0203b6b4 | 192 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020364c4.c (+0 B) |
| S-0297 | 0x0203b774 | 188 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020918d0.legacy.c (+0 B) |
| S-0298 | 0x0203b880 | 124 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_02287774.c (+0 B) |
| S-0299 | 0x0203bad0 | 220 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+0 B) |
| S-0300 | 0x0203c3dc | 144 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay011/func_ov011_021cf228.c (+0 B) |
| S-0301 | 0x0203c730 | 160 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200af24.c (+4 B) |
| S-0302 | 0x0203cef8 | 256 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021aabd8.c (+12 B) |
| S-0303 | 0x0203d0e0 | 224 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+4 B) |
| S-0304 | 0x0203d1c0 | 152 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0206a8c0.legacy_sp3.c (+0 B) |
| S-0305 | 0x0203d258 | 144 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay011/func_ov011_021cf228.c (+0 B) |
| S-0306 | 0x0203deac | 68 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201ac1c.c (+0 B) |
| S-0307 | 0x0203def0 | 152 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0206a8c0.legacy_sp3.c (+0 B) |
| S-0308 | 0x0203e460 | 224 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+4 B) |
| S-0309 | 0x0203eaa8 | 108 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02068380.c (+0 B) |
| S-0310 | 0x0203f590 | 256 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021aabd8.c (+12 B) |
| S-0311 | 0x02000cc4 | 72 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020062cc.c (+0 B) |
| S-0312 | 0x02000d0c | 64 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b8e0.legacy.c (+0 B) |
| S-0313 | 0x02000d4c | 80 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008c84.c (+0 B) |
| S-0314 | 0x02001e5c | 40 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b2a4.legacy.c (+0 B) |
| S-0315 | 0x02004fe8 | 160 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021b2cbc.c (+0 B) |
| S-0316 | 0x02005088 | 256 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021c669c.c (+4 B) |
| S-0317 | 0x02005188 | 68 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a66a4.legacy.c (+0 B) |
| S-0318 | 0x020051cc | 68 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a66a4.legacy.c (+0 B) |
| S-0319 | 0x02005240 | 88 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200aa08.c (+0 B) |
| S-0320 | 0x020054a4 | 76 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02012560.c (+0 B) |
| S-0321 | 0x020054f0 | 100 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001ddc.c (+0 B) |
| S-0322 | 0x02005554 | 96 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0206e224.legacy.c (+0 B) |
| S-0323 | 0x02009758 | 76 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02012560.c (+0 B) |
| S-0324 | 0x0200a2f4 | 140 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021d3818.c (+0 B) |
| S-0325 | 0x0200efe0 | 60 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a60c0.legacy.c (+0 B) |
| S-0326 | 0x02011620 | 104 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201d398.c (+0 B) |
| S-0327 | 0x02011688 | 100 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001ddc.c (+0 B) |
| S-0328 | 0x020116ec | 96 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0206e224.legacy.c (+0 B) |
| S-0329 | 0x02011aec | 76 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02012560.c (+0 B) |
| S-0330 | 0x02012454 | 80 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008c84.c (+0 B) |
| S-0331 | 0x020124a4 | 80 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008c84.c (+0 B) |
| S-0332 | 0x020124f4 | 108 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay008/func_ov008_021aa4a0.c (+0 B) |
| S-0333 | 0x020125ac | 112 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay000/func_ov000_021aaa58.c (+0 B) |
| S-0334 | 0x020139fc | 60 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a60c0.legacy.c (+0 B) |
| S-0335 | 0x02017a98 | 100 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001ddc.c (+0 B) |
| S-0336 | 0x0201816c | 100 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001ddc.c (+0 B) |
| S-0337 | 0x02018a84 | 56 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001c98.c (+0 B) |
| S-0338 | 0x02018e88 | 68 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a66a4.legacy.c (+0 B) |
| S-0339 | 0x02019184 | 72 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020062cc.c (+0 B) |
| S-0340 | 0x02019538 | 92 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001d0c.c (+0 B) |
| S-0341 | 0x020197ac | 116 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202b360.c (+0 B) |
| S-0342 | 0x02019858 | 64 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b8e0.legacy.c (+0 B) |
| S-0343 | 0x0201a044 | 116 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202b360.c (+0 B) |
| S-0344 | 0x0201a0e0 | 48 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0209150c.legacy.c (+0 B) |
| S-0345 | 0x0201a134 | 60 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a60c0.legacy.c (+0 B) |
| S-0346 | 0x0201a824 | 40 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b2a4.legacy.c (+0 B) |
| S-0347 | 0x0201bf80 | 52 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b2cc.legacy.c (+0 B) |
| S-0348 | 0x0201c1bc | 36 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b16c.legacy.c (+0 B) |
| S-0349 | 0x0201c1e0 | 68 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a66a4.legacy.c (+0 B) |
| S-0350 | 0x0201ce94 | 192 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay012/func_ov012_021cbeb4.c (+0 B) |
| S-0351 | 0x0201e818 | 172 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/func_ov021_021aadbc.c (+0 B) |
| S-0352 | 0x0201f25c | 96 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0206e224.legacy.c (+0 B) |
| S-0353 | 0x0201f4d4 | 148 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e43c.legacy.c (+0 B) |
| S-0354 | 0x0201fc6c | 96 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0206e224.legacy.c (+0 B) |
| S-0355 | 0x0201ff2c | 108 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay008/func_ov008_021aa4a0.c (+0 B) |
| S-0356 | 0x02020814 | 76 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02012560.c (+0 B) |
| S-0357 | 0x02020d00 | 132 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200592c.c (+0 B) |
| S-0358 | 0x02022a80 | 116 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202b360.c (+0 B) |
| S-0359 | 0x0202b294 | 136 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021b3290.c (+0 B) |
| S-0360 | 0x0202b3d4 | 60 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a60c0.legacy.c (+0 B) |
| S-0361 | 0x0202be4c | 176 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay008/func_ov008_021ac2ac.c (+0 B) |
| S-0362 | 0x0202befc | 148 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e43c.legacy.c (+0 B) |
| S-0363 | 0x0202bf90 | 152 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021f0174.c (+0 B) |
| S-0364 | 0x0202c0c0 | 236 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay003/func_ov003_021ca10c.c (+4 B) |
| S-0365 | 0x0202c270 | 196 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0207f420.legacy_sp3.c (+4 B) |
| S-0366 | 0x0202c334 | 148 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e43c.legacy.c (+0 B) |
| S-0367 | 0x0202c6ac | 132 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200592c.c (+0 B) |
| S-0368 | 0x0202c948 | 88 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200aa08.c (+0 B) |
| S-0369 | 0x0202ce24 | 84 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/SysWork_GetPointDistance.c (+0 B) |
| S-0370 | 0x0202d194 | 68 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a66a4.legacy.c (+0 B) |
| S-0371 | 0x020326d4 | 80 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008c84.c (+0 B) |
| S-0372 | 0x02032724 | 36 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b16c.legacy.c (+0 B) |
| S-0373 | 0x02032998 | 68 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a66a4.legacy.c (+0 B) |
| S-0374 | 0x02032a34 | 144 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021eec48.c (+0 B) |
| S-0375 | 0x02032d70 | 200 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0207f420.legacy_sp3.c (+0 B) |
| S-0376 | 0x020336cc | 76 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02012560.c (+0 B) |
| S-0377 | 0x02033a48 | 56 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001c98.c (+0 B) |
| S-0378 | 0x020379c4 | 40 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b2a4.legacy.c (+0 B) |
| S-0379 | 0x02038908 | 80 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008c84.c (+0 B) |
| S-0380 | 0x02038b94 | 192 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay012/func_ov012_021cbeb4.c (+0 B) |
| S-0381 | 0x02039990 | 76 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02012560.c (+0 B) |
| S-0382 | 0x0203c7d0 | 68 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a66a4.legacy.c (+0 B) |
| S-0383 | 0x0203c89c | 100 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001ddc.c (+0 B) |
| S-0384 | 0x0203cb0c | 52 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b2cc.legacy.c (+0 B) |
| S-0385 | 0x0203cbc0 | 152 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021f0174.c (+0 B) |
| S-0386 | 0x0203e95c | 80 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008c84.c (+0 B) |
| S-0387 | 0x0203eb14 | 52 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b2cc.legacy.c (+0 B) |
| S-0388 | 0x0203eca4 | 136 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021b3290.c (+0 B) |
| S-0389 | 0x0203ed80 | 84 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/SysWork_GetPointDistance.c (+0 B) |
| S-0390 | 0x0203ef68 | 56 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001c98.c (+0 B) |
| S-0391 | 0x0203f030 | 100 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001ddc.c (+0 B) |
| S-0392 | 0x0203f544 | 76 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02012560.c (+0 B) |
| S-0393 | 0x0203f6cc | 76 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02012560.c (+0 B) |
| S-0394 | 0x0203f718 | 40 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b2a4.legacy.c (+0 B) |
| S-0395 | 0x0203f740 | 56 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001c98.c (+0 B) |
| S-0396 | 0x0203f778 | 72 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020062cc.c (+0 B) |
| D-0001 | 0x02040258 | 148 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021ec110.c (+0 B) |
| D-0002 | 0x0204037c | 88 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e29c.legacy.c (+0 B) |
| D-0003 | 0x020403d4 | 164 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay000/func_ov000_021ad49c.c (+0 B) |
| D-0004 | 0x02040478 | 180 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021c6d8c.c (+0 B) |
| D-0005 | 0x0204152c | 156 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/OSi_PostIrqEvent.legacy.c (+0 B) |
| D-0006 | 0x020416f8 | 240 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/func_ov021_021aae68.c (+4 B) |
| D-0007 | 0x020418ac | 204 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02059d90.c (+0 B) |
| D-0008 | 0x02041e18 | 136 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200ade8.c (+0 B) |
| D-0009 | 0x02041f04 | 204 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02059d90.c (+0 B) |
| D-0010 | 0x02041fd0 | 152 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021e2b3c.c (+0 B) |
| D-0011 | 0x02043168 | 140 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_0225764c.c (+0 B) |
| D-0012 | 0x02043250 | 128 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0208f52c.legacy.c (+0 B) |
| D-0013 | 0x020432d0 | 256 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay016/func_ov016_021b8cd8.c (+16 B) |
| D-0014 | 0x020447d8 | 256 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay016/func_ov016_021b8cd8.c (+16 B) |
| D-0015 | 0x02044c10 | 80 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200c65c.c (+0 B) |
| D-0016 | 0x0204550c | 88 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e29c.legacy.c (+0 B) |
| D-0017 | 0x02045678 | 204 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02059d90.c (+0 B) |
| D-0018 | 0x02045744 | 148 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021ec110.c (+0 B) |
| D-0019 | 0x02045828 | 176 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay014/Ov014_HitTestPrimary.c (+0 B) |
| D-0020 | 0x020458d8 | 100 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005bfc.c (+0 B) |
| D-0021 | 0x0204642c | 108 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02035ff4.c (+0 B) |
| D-0022 | 0x02046a5c | 104 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02000c4c.c (+0 B) |
| D-0023 | 0x02046ae0 | 92 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202c1ac.c (+0 B) |
| D-0024 | 0x02046e80 | 164 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay000/func_ov000_021ad49c.c (+0 B) |
| D-0025 | 0x02046f24 | 160 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay011/func_ov011_021cc5c4.c (+0 B) |
| D-0026 | 0x02046fc4 | 168 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay012/Ov012_BeginIntroTransition.c (+0 B) |
| D-0027 | 0x02048050 | 100 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005bfc.c (+0 B) |
| D-0028 | 0x020480b4 | 84 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201c64c.c (+0 B) |
| D-0029 | 0x02048f04 | 148 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021ec110.c (+0 B) |
| D-0030 | 0x02048fac | 140 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_0225764c.c (+0 B) |
| D-0031 | 0x02049038 | 164 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay000/func_ov000_021ad49c.c (+0 B) |
| D-0032 | 0x0204918c | 96 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0203874c.c (+0 B) |
| D-0033 | 0x0204931c | 96 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0203874c.c (+0 B) |
| D-0034 | 0x02049684 | 140 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_0225764c.c (+0 B) |
| D-0035 | 0x02049710 | 152 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021e2b3c.c (+0 B) |
| D-0036 | 0x02049910 | 128 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0208f52c.legacy.c (+0 B) |
| D-0037 | 0x0204b850 | 128 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0208f52c.legacy.c (+0 B) |
| D-0038 | 0x0204bdc4 | 124 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0205d9a0.c (+0 B) |
| D-0039 | 0x0204c04c | 212 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021c6a58.c (+0 B) |
| D-0040 | 0x0204c120 | 192 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay008/func_ov008_021b1e20.c (+0 B) |
| D-0041 | 0x0204d468 | 76 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005ee0.c (+0 B) |
| D-0042 | 0x0204e914 | 164 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay000/func_ov000_021ad49c.c (+0 B) |
| D-0043 | 0x0204f280 | 144 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_022862cc.c (+0 B) |
| D-0044 | 0x02051ab0 | 96 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0203874c.c (+0 B) |
| D-0045 | 0x02051e38 | 92 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202c1ac.c (+0 B) |
| D-0046 | 0x02051ec0 | 92 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202c1ac.c (+0 B) |
| D-0047 | 0x02051f48 | 80 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200c65c.c (+0 B) |
| D-0048 | 0x02052160 | 184 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay016/func_ov016_021b509c.c (+0 B) |
| D-0049 | 0x02052398 | 140 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_0225764c.c (+0 B) |
| D-0050 | 0x02052704 | 40 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200bfa4.c (+0 B) |
| D-0051 | 0x020528e4 | 144 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_022862cc.c (+0 B) |
| D-0052 | 0x02052bd4 | 100 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005bfc.c (+0 B) |
| D-0053 | 0x02052c58 | 132 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200aa60.c (+0 B) |
| D-0054 | 0x02052ecc | 56 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200bd20.c (+0 B) |
| D-0055 | 0x020531c0 | 112 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02038fb0.c (+0 B) |
| D-0056 | 0x02053600 | 44 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0209164c.legacy.c (+0 B) |
| D-0057 | 0x02053650 | 56 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200bd20.c (+0 B) |
| D-0058 | 0x0205396c | 248 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/func_ov021_021aae68.c (+12 B) |
| D-0059 | 0x02053ab4 | 132 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200aa60.c (+0 B) |
| D-0060 | 0x02053e58 | 92 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202c1ac.c (+0 B) |
| D-0061 | 0x02053eb4 | 148 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021ec110.c (+0 B) |
| D-0062 | 0x02053f48 | 124 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0205d9a0.c (+0 B) |
| D-0063 | 0x0205407c | 84 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201c64c.c (+0 B) |
| D-0064 | 0x0205442c | 156 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/OSi_PostIrqEvent.legacy.c (+0 B) |
| D-0065 | 0x020544c8 | 160 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay011/func_ov011_021cc5c4.c (+0 B) |
| D-0066 | 0x02054568 | 172 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay012/Ov012_BeginIntroTransition.c (+4 B) |
| D-0067 | 0x02054b44 | 88 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e29c.legacy.c (+0 B) |
| D-0068 | 0x02054b9c | 96 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0203874c.c (+0 B) |
| D-0069 | 0x02055250 | 72 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e254.legacy.c (+0 B) |
| D-0070 | 0x020552dc | 64 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005c60.c (+0 B) |
| D-0071 | 0x02055330 | 92 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202c1ac.c (+0 B) |
| D-0072 | 0x02055654 | 116 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/Task_PostLocked.c (+0 B) |
| D-0073 | 0x020556c8 | 112 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02038fb0.c (+0 B) |
| D-0074 | 0x020558fc | 60 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020983b8.legacy.c (+0 B) |
| D-0075 | 0x02055a18 | 108 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02035ff4.c (+0 B) |
| D-0076 | 0x02055c04 | 108 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02035ff4.c (+0 B) |
| D-0077 | 0x02055fec | 76 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005ee0.c (+0 B) |
| D-0078 | 0x020581a8 | 156 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/OSi_PostIrqEvent.legacy.c (+0 B) |
| D-0079 | 0x02058528 | 172 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay012/Ov012_BeginIntroTransition.c (+4 B) |
| D-0080 | 0x02058954 | 180 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021c6d8c.c (+0 B) |
| D-0081 | 0x0205aecc | 196 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021b2eac.c (+0 B) |
| D-0082 | 0x0205b9ac | 176 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay014/Ov014_HitTestPrimary.c (+0 B) |
| D-0083 | 0x0205bdb8 | 168 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay012/Ov012_BeginIntroTransition.c (+0 B) |
| D-0084 | 0x0205be60 | 184 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay016/func_ov016_021b509c.c (+0 B) |
| D-0085 | 0x0205c258 | 232 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay017/func_ov017_021b73a8.c (+0 B) |
| D-0086 | 0x0205c340 | 128 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0208f52c.legacy.c (+0 B) |
| D-0087 | 0x0205d614 | 96 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0203874c.c (+0 B) |
| D-0088 | 0x0205d6f8 | 236 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/func_ov021_021aae68.c (+0 B) |
| D-0089 | 0x0205fa30 | 148 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021ec110.c (+0 B) |
| D-0090 | 0x0205fac4 | 196 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021b2eac.c (+0 B) |
| D-0091 | 0x020603cc | 216 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021accc8.c (+0 B) |
| D-0092 | 0x020604b0 | 112 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02038fb0.c (+0 B) |
| D-0093 | 0x02060f50 | 140 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_0225764c.c (+0 B) |
| D-0094 | 0x0206133c | 156 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/OSi_PostIrqEvent.legacy.c (+0 B) |
| D-0095 | 0x020613d8 | 140 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_0225764c.c (+0 B) |
| D-0096 | 0x02061464 | 116 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/Task_PostLocked.c (+0 B) |
| D-0097 | 0x020614d8 | 88 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e29c.legacy.c (+0 B) |
| D-0098 | 0x020619b8 | 212 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021c6a58.c (+0 B) |
| D-0099 | 0x02061a8c | 212 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021c6a58.c (+0 B) |
| D-0100 | 0x02061e88 | 152 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021e2b3c.c (+0 B) |
| D-0101 | 0x02061fa4 | 104 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02000c4c.c (+0 B) |
| D-0102 | 0x0206200c | 80 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200c65c.c (+0 B) |
| D-0103 | 0x020620d8 | 64 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005c60.c (+0 B) |
| D-0104 | 0x02062118 | 76 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005ee0.c (+0 B) |
| D-0105 | 0x020622c8 | 88 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e29c.legacy.c (+0 B) |
| D-0106 | 0x0206238c | 172 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay012/Ov012_BeginIntroTransition.c (+4 B) |
| D-0107 | 0x020624cc | 60 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020983b8.legacy.c (+0 B) |
| D-0108 | 0x0206256c | 148 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021ec110.c (+0 B) |
| D-0109 | 0x0206292c | 140 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_0225764c.c (+0 B) |
| D-0110 | 0x02062a20 | 204 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02059d90.c (+0 B) |
| D-0111 | 0x02062e6c | 128 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0208f52c.legacy.c (+0 B) |
| D-0112 | 0x02062eec | 212 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021c6a58.c (+0 B) |
| D-0113 | 0x02063808 | 76 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005ee0.c (+0 B) |
| D-0114 | 0x02063e78 | 88 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e29c.legacy.c (+0 B) |
| D-0115 | 0x020640c0 | 152 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021e2b3c.c (+0 B) |
| D-0116 | 0x02064208 | 148 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021ec110.c (+0 B) |
| D-0117 | 0x020652b8 | 232 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay017/func_ov017_021b73a8.c (+0 B) |
| D-0118 | 0x020653a0 | 208 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_0223a87c.c (+0 B) |
| D-0119 | 0x02065788 | 56 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200bd20.c (+0 B) |
| D-0120 | 0x020657c0 | 204 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02059d90.c (+0 B) |
| D-0121 | 0x02065934 | 64 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005c60.c (+0 B) |
| D-0122 | 0x02065ee0 | 152 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021e2b3c.c (+0 B) |
| D-0123 | 0x020669c4 | 196 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021b2eac.c (+0 B) |
| D-0124 | 0x02066d44 | 188 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020345c0.c (+0 B) |
| D-0125 | 0x02067154 | 180 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021c6d8c.c (+0 B) |
| D-0126 | 0x02067328 | 44 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0209164c.legacy.c (+0 B) |
| D-0127 | 0x02067ba8 | 96 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0203874c.c (+0 B) |
| D-0128 | 0x0206811c | 120 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200a68c.c (+0 B) |
| D-0129 | 0x020683ec | 56 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200bd20.c (+0 B) |
| D-0130 | 0x020684c8 | 176 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay014/Ov014_HitTestPrimary.c (+0 B) |
| D-0131 | 0x020689e4 | 60 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020983b8.legacy.c (+0 B) |
| D-0132 | 0x02068ab4 | 104 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02000c4c.c (+0 B) |
| D-0133 | 0x02068c08 | 100 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005bfc.c (+0 B) |
| D-0134 | 0x02068f78 | 212 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021c6a58.c (+0 B) |
| D-0135 | 0x020698fc | 248 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/func_ov021_021aae68.c (+12 B) |
| D-0136 | 0x0206a724 | 140 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_0225764c.c (+0 B) |
| D-0137 | 0x0206aa68 | 100 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005bfc.c (+0 B) |
| D-0138 | 0x0206b258 | 196 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021b2eac.c (+0 B) |
| D-0139 | 0x0206b47c | 128 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0208f52c.legacy.c (+0 B) |
| D-0140 | 0x0206b6bc | 64 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005c60.c (+0 B) |
| D-0141 | 0x0206b96c | 224 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay016/func_ov016_021b8a30.c (+0 B) |
| D-0142 | 0x0206bcec | 68 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/Task_InvokeLocked.c (+0 B) |
| D-0143 | 0x0206bd30 | 68 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/Task_InvokeLocked.c (+0 B) |
| D-0144 | 0x0206be64 | 116 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/Task_PostLocked.c (+0 B) |
| D-0145 | 0x0206bf94 | 72 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e254.legacy.c (+0 B) |
| D-0146 | 0x0206c010 | 100 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005bfc.c (+0 B) |
| D-0147 | 0x0206c2f4 | 140 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_0225764c.c (+0 B) |
| D-0148 | 0x0206c380 | 116 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/Task_PostLocked.c (+0 B) |
| D-0149 | 0x0206c46c | 68 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/Task_InvokeLocked.c (+0 B) |
| D-0150 | 0x0206c7c0 | 140 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_0225764c.c (+0 B) |
| D-0151 | 0x0206c84c | 96 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0203874c.c (+0 B) |
| D-0152 | 0x0206cd0c | 88 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e29c.legacy.c (+0 B) |
| D-0153 | 0x0206cf10 | 144 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_022862cc.c (+0 B) |
| D-0154 | 0x0206d0b0 | 152 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021e2b3c.c (+0 B) |
| D-0155 | 0x0206d360 | 164 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay000/func_ov000_021ad49c.c (+0 B) |
| D-0156 | 0x0206da98 | 64 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005c60.c (+0 B) |
| D-0157 | 0x0206ddc0 | 168 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay012/Ov012_BeginIntroTransition.c (+0 B) |
| D-0158 | 0x0206df54 | 60 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020983b8.legacy.c (+0 B) |
| D-0159 | 0x0206e284 | 184 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay016/func_ov016_021b509c.c (+0 B) |
| D-0160 | 0x0206e4a4 | 72 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e254.legacy.c (+0 B) |
| D-0161 | 0x0206e690 | 144 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_022862cc.c (+0 B) |
| D-0162 | 0x0206e720 | 88 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e29c.legacy.c (+0 B) |
| D-0163 | 0x0206ea00 | 132 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200aa60.c (+0 B) |
| D-0164 | 0x0206eb4c | 156 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/OSi_PostIrqEvent.legacy.c (+0 B) |
| D-0165 | 0x0206ebe8 | 204 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02059d90.c (+0 B) |
| D-0166 | 0x0206eccc | 136 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200ade8.c (+0 B) |
| D-0167 | 0x0206ed7c | 156 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/OSi_PostIrqEvent.legacy.c (+0 B) |
| D-0168 | 0x0206eecc | 64 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005c60.c (+0 B) |
| D-0169 | 0x0206fb64 | 200 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021c12fc.c (+0 B) |
| D-0170 | 0x0207034c | 80 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200c65c.c (+0 B) |
| D-0171 | 0x02070430 | 184 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay016/func_ov016_021b509c.c (+0 B) |
| D-0172 | 0x020707f0 | 92 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202c1ac.c (+0 B) |
| D-0173 | 0x0207092c | 84 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201c64c.c (+0 B) |
| D-0174 | 0x02070a38 | 136 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200ade8.c (+0 B) |
| D-0175 | 0x02070c40 | 68 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/Task_InvokeLocked.c (+0 B) |
| D-0176 | 0x02070c84 | 92 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202c1ac.c (+0 B) |
| D-0177 | 0x02070ce0 | 84 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201c64c.c (+0 B) |
| D-0178 | 0x02070d34 | 92 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202c1ac.c (+0 B) |
| D-0179 | 0x02070f78 | 112 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02038fb0.c (+0 B) |
| D-0180 | 0x02072398 | 124 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0205d9a0.c (+0 B) |
| D-0181 | 0x02072924 | 240 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/func_ov021_021aae68.c (+4 B) |
| D-0182 | 0x02073a5c | 100 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005bfc.c (+0 B) |
| D-0183 | 0x02073d30 | 112 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02038fb0.c (+0 B) |
| D-0184 | 0x02073ed8 | 80 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200c65c.c (+0 B) |
| D-0185 | 0x02074134 | 96 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0203874c.c (+0 B) |
| D-0186 | 0x0207445c | 60 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020983b8.legacy.c (+0 B) |
| D-0187 | 0x0207475c | 132 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200aa60.c (+0 B) |
| D-0188 | 0x02074b38 | 88 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e29c.legacy.c (+0 B) |
| D-0189 | 0x02074c74 | 104 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02000c4c.c (+0 B) |
| D-0190 | 0x02074ef4 | 56 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200bd20.c (+0 B) |
| D-0191 | 0x02076284 | 200 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021c12fc.c (+0 B) |
| D-0192 | 0x0207634c | 232 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay017/func_ov017_021b73a8.c (+0 B) |
| D-0193 | 0x02076434 | 232 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay017/func_ov017_021b73a8.c (+0 B) |
| D-0194 | 0x02076ad0 | 164 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay000/func_ov000_021ad49c.c (+0 B) |
| D-0195 | 0x020778c4 | 144 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_022862cc.c (+0 B) |
| D-0196 | 0x02077ab4 | 56 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200bd20.c (+0 B) |
| D-0197 | 0x02077aec | 96 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0203874c.c (+0 B) |
| D-0198 | 0x02079ddc | 68 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/Task_InvokeLocked.c (+0 B) |
| D-0199 | 0x0207af28 | 120 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200a68c.c (+0 B) |
| D-0200 | 0x0207afbc | 124 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0205d9a0.c (+0 B) |
| D-0201 | 0x0207b038 | 168 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay012/Ov012_BeginIntroTransition.c (+0 B) |
| D-0202 | 0x0207b0e0 | 92 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202c1ac.c (+0 B) |
| D-0203 | 0x0207b548 | 176 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay014/Ov014_HitTestPrimary.c (+0 B) |
| D-0204 | 0x0207be90 | 56 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200bd20.c (+0 B) |
| D-0205 | 0x0207c8d8 | 92 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202c1ac.c (+0 B) |
| D-0206 | 0x0207c934 | 92 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202c1ac.c (+0 B) |
| D-0207 | 0x0207c990 | 76 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005ee0.c (+0 B) |
| D-0208 | 0x0207cbe0 | 112 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02038fb0.c (+0 B) |
| D-0209 | 0x0207cc50 | 88 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e29c.legacy.c (+0 B) |
| D-0210 | 0x0207cd34 | 72 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e254.legacy.c (+0 B) |
| D-0211 | 0x0207cd7c | 84 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201c64c.c (+0 B) |
| D-0212 | 0x0207cdd0 | 128 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0208f52c.legacy.c (+0 B) |
| D-0213 | 0x0207d05c | 116 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/Task_PostLocked.c (+0 B) |
| D-0214 | 0x0207d0d0 | 92 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202c1ac.c (+0 B) |
| D-0215 | 0x0207d12c | 96 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0203874c.c (+0 B) |
| D-0216 | 0x0207d1e8 | 140 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_0225764c.c (+0 B) |
| D-0217 | 0x0207d37c | 48 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_02092124.legacy.c (+0 B) |
| D-0218 | 0x0207d494 | 60 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020983b8.legacy.c (+0 B) |
| D-0219 | 0x0207d914 | 128 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0208f52c.legacy.c (+0 B) |
| D-0220 | 0x0207da48 | 52 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020921a8.legacy.c (+0 B) |
| D-0221 | 0x0207dab4 | 64 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005c60.c (+0 B) |
| D-0222 | 0x0207e124 | 160 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay011/func_ov011_021cc5c4.c (+0 B) |
| D-0223 | 0x0207e840 | 96 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0203874c.c (+0 B) |
| D-0224 | 0x0207ec28 | 64 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005c60.c (+0 B) |
| D-0225 | 0x0207ef90 | 204 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02059d90.c (+0 B) |
| D-0226 | 0x02081598 | 176 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay014/Ov014_HitTestPrimary.c (+0 B) |
| D-0227 | 0x02081648 | 172 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay012/Ov012_BeginIntroTransition.c (+4 B) |
| D-0228 | 0x02081ae0 | 104 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02000c4c.c (+0 B) |
| D-0229 | 0x02081ee4 | 100 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005bfc.c (+0 B) |
| D-0230 | 0x02081f5c | 212 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021c6a58.c (+0 B) |
| D-0231 | 0x02082198 | 76 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005ee0.c (+0 B) |
| D-0232 | 0x020822f0 | 60 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020983b8.legacy.c (+0 B) |
| D-0233 | 0x020827ec | 112 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02038fb0.c (+0 B) |
| D-0234 | 0x02082f64 | 104 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02000c4c.c (+0 B) |
| D-0235 | 0x02084218 | 116 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/Task_PostLocked.c (+0 B) |
| D-0236 | 0x02084ac4 | 40 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200bfa4.c (+0 B) |
| D-0237 | 0x02084efc | 192 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay008/func_ov008_021b1e20.c (+0 B) |
| D-0238 | 0x02084fe0 | 116 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/Task_PostLocked.c (+0 B) |
| D-0239 | 0x0208541c | 68 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/Task_InvokeLocked.c (+0 B) |
| D-0240 | 0x02085460 | 68 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/Task_InvokeLocked.c (+0 B) |
| D-0241 | 0x020854a4 | 64 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005c60.c (+0 B) |
| D-0242 | 0x02085664 | 60 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020983b8.legacy.c (+0 B) |
| D-0243 | 0x020874c4 | 100 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005bfc.c (+0 B) |
| D-0244 | 0x02087690 | 140 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_0225764c.c (+0 B) |
| D-0245 | 0x0208771c | 116 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/Task_PostLocked.c (+0 B) |
| D-0246 | 0x02087954 | 80 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200c65c.c (+0 B) |
| D-0247 | 0x020879a4 | 88 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e29c.legacy.c (+0 B) |
| D-0248 | 0x02087a08 | 172 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay012/Ov012_BeginIntroTransition.c (+4 B) |
| D-0249 | 0x020881b0 | 124 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0205d9a0.c (+0 B) |
| D-0250 | 0x020885a0 | 128 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0208f52c.legacy.c (+0 B) |
| D-0251 | 0x020886a0 | 256 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay016/func_ov016_021b8cd8.c (+16 B) |
| D-0252 | 0x02088cc0 | 156 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/OSi_PostIrqEvent.legacy.c (+0 B) |
| D-0253 | 0x02088f94 | 80 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200c65c.c (+0 B) |
| D-0254 | 0x020897fc | 104 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02000c4c.c (+0 B) |
| D-0255 | 0x02089938 | 136 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200ade8.c (+0 B) |
| D-0256 | 0x02089b64 | 80 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200c65c.c (+0 B) |
| D-0257 | 0x02089c74 | 100 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005bfc.c (+0 B) |
| D-0258 | 0x0208a1e4 | 156 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/OSi_PostIrqEvent.legacy.c (+0 B) |
| D-0259 | 0x0208a280 | 196 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021b2eac.c (+0 B) |
| D-0260 | 0x0208a344 | 252 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/func_ov021_021aae68.c (+16 B) |
| D-0261 | 0x0208a764 | 100 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005bfc.c (+0 B) |
| D-0262 | 0x0208a7c8 | 156 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/OSi_PostIrqEvent.legacy.c (+0 B) |
| D-0263 | 0x0208a864 | 88 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e29c.legacy.c (+0 B) |
| D-0264 | 0x0208a8bc | 60 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020983b8.legacy.c (+0 B) |
| D-0265 | 0x0208ae34 | 148 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021ec110.c (+0 B) |
| D-0266 | 0x0208b000 | 64 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005c60.c (+0 B) |
| D-0267 | 0x0208bca4 | 228 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay016/func_ov016_021b894c.c (+0 B) |
| D-0268 | 0x0208bf3c | 80 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200c65c.c (+0 B) |
| D-0269 | 0x0208c844 | 64 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005c60.c (+0 B) |
| D-0270 | 0x0208c940 | 76 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005ee0.c (+0 B) |
| D-0271 | 0x0208c98c | 72 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e254.legacy.c (+0 B) |
| D-0272 | 0x0208c9d4 | 48 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_02092124.legacy.c (+0 B) |
| D-0273 | 0x0208d0bc | 124 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0205d9a0.c (+0 B) |
| D-0274 | 0x0208dd9c | 80 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200c65c.c (+0 B) |
| D-0275 | 0x0208ddec | 96 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0203874c.c (+0 B) |
| D-0276 | 0x0208de4c | 72 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e254.legacy.c (+0 B) |
| D-0277 | 0x0208de94 | 88 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e29c.legacy.c (+0 B) |
| D-0278 | 0x0208e6ac | 84 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201c64c.c (+0 B) |
| D-0279 | 0x0208f1c4 | 76 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005ee0.c (+0 B) |
| D-0280 | 0x0208f2a8 | 76 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005ee0.c (+0 B) |
| D-0281 | 0x0208f38c | 88 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e29c.legacy.c (+0 B) |
| D-0282 | 0x0208f458 | 112 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02038fb0.c (+0 B) |
| D-0283 | 0x0208f4c8 | 100 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005bfc.c (+0 B) |
| D-0284 | 0x0208fd30 | 96 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0203874c.c (+0 B) |
| D-0285 | 0x0208fd90 | 96 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0203874c.c (+0 B) |
| D-0286 | 0x0208fe58 | 92 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202c1ac.c (+0 B) |
| D-0287 | 0x0208ffec | 92 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202c1ac.c (+0 B) |
| D-0288 | 0x02090048 | 88 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e29c.legacy.c (+0 B) |
| D-0289 | 0x020900a0 | 116 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/Task_PostLocked.c (+0 B) |
| D-0290 | 0x0209015c | 112 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02038fb0.c (+0 B) |
| D-0291 | 0x02090868 | 88 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e29c.legacy.c (+0 B) |
| D-0292 | 0x02091a8c | 84 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201c64c.c (+0 B) |
| D-0293 | 0x02091b5c | 136 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200ade8.c (+0 B) |
| D-0294 | 0x02091be4 | 96 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0203874c.c (+0 B) |
| D-0295 | 0x02091c44 | 68 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/Task_InvokeLocked.c (+0 B) |
| D-0296 | 0x02091c88 | 112 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02038fb0.c (+0 B) |
| D-0297 | 0x02092748 | 112 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02038fb0.c (+0 B) |
| D-0298 | 0x020929ac | 136 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200ade8.c (+0 B) |
| D-0299 | 0x02092ca0 | 128 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0208f52c.legacy.c (+0 B) |
| D-0300 | 0x02093014 | 112 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02038fb0.c (+0 B) |
| D-0301 | 0x020930b0 | 176 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay014/Ov014_HitTestPrimary.c (+0 B) |
| D-0302 | 0x02093160 | 136 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200ade8.c (+0 B) |
| D-0303 | 0x020931f8 | 156 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/OSi_PostIrqEvent.legacy.c (+0 B) |
| D-0304 | 0x020933bc | 152 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021e2b3c.c (+0 B) |
| D-0305 | 0x02093454 | 120 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200a68c.c (+0 B) |
| D-0306 | 0x0209362c | 88 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e29c.legacy.c (+0 B) |
| D-0307 | 0x02093684 | 156 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/OSi_PostIrqEvent.legacy.c (+0 B) |
| D-0308 | 0x02093720 | 112 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02038fb0.c (+0 B) |
| D-0309 | 0x02093848 | 128 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0208f52c.legacy.c (+0 B) |
| D-0310 | 0x020938f8 | 68 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/Task_InvokeLocked.c (+0 B) |
| D-0311 | 0x02093d44 | 132 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200aa60.c (+0 B) |
| D-0312 | 0x02093e38 | 168 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay012/Ov012_BeginIntroTransition.c (+0 B) |
| D-0313 | 0x02093ee0 | 216 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021accc8.c (+0 B) |
| D-0314 | 0x0209413c | 64 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005c60.c (+0 B) |
| D-0315 | 0x0209423c | 116 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/Task_PostLocked.c (+0 B) |
| D-0316 | 0x020942b0 | 200 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021c12fc.c (+0 B) |
| D-0317 | 0x02094c94 | 88 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e29c.legacy.c (+0 B) |
| D-0318 | 0x020952f8 | 76 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005ee0.c (+0 B) |
| D-0319 | 0x02095344 | 72 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e254.legacy.c (+0 B) |
| D-0320 | 0x02095b68 | 96 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0203874c.c (+0 B) |
| D-0321 | 0x02095d6c | 116 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/Task_PostLocked.c (+0 B) |
| D-0322 | 0x02095de0 | 72 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e254.legacy.c (+0 B) |
| D-0323 | 0x02096728 | 100 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005bfc.c (+0 B) |
| D-0324 | 0x020967bc | 140 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_0225764c.c (+0 B) |
| D-0325 | 0x02096f64 | 160 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay011/func_ov011_021cc5c4.c (+0 B) |
| D-0326 | 0x02097258 | 124 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0205d9a0.c (+0 B) |
| D-0327 | 0x02097668 | 152 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021e2b3c.c (+0 B) |
| D-0328 | 0x02097a04 | 72 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e254.legacy.c (+0 B) |
| D-0329 | 0x02097e18 | 68 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/Task_InvokeLocked.c (+0 B) |
| D-0330 | 0x02098038 | 80 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200c65c.c (+0 B) |
| D-0331 | 0x02098088 | 124 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0205d9a0.c (+0 B) |
| D-0332 | 0x020981a0 | 136 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200ade8.c (+0 B) |
| D-0333 | 0x02098414 | 84 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201c64c.c (+0 B) |
| D-0334 | 0x02098734 | 84 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201c64c.c (+0 B) |
| D-0335 | 0x020990e0 | 196 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021b2eac.c (+0 B) |
| D-0336 | 0x0209a000 | 164 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay000/func_ov000_021ad49c.c (+0 B) |
| D-0337 | 0x0209a1b8 | 88 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e29c.legacy.c (+0 B) |
| D-0338 | 0x0209a210 | 160 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay011/func_ov011_021cc5c4.c (+0 B) |
| D-0339 | 0x0209a968 | 80 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200c65c.c (+0 B) |
| D-0340 | 0x0209a9f4 | 84 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201c64c.c (+0 B) |
| D-0341 | 0x0209ade4 | 120 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200a68c.c (+0 B) |
| D-0342 | 0x0209b0f4 | 120 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200a68c.c (+0 B) |
| D-0343 | 0x0209b16c | 116 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/Task_PostLocked.c (+0 B) |
| D-0344 | 0x0209b448 | 84 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201c64c.c (+0 B) |
| D-0345 | 0x0209bb60 | 68 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/Task_InvokeLocked.c (+0 B) |
| D-0346 | 0x0209bba4 | 124 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0205d9a0.c (+0 B) |
| D-0347 | 0x0209bc20 | 68 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/Task_InvokeLocked.c (+0 B) |
| D-0348 | 0x0209bc64 | 120 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200a68c.c (+0 B) |
| D-0349 | 0x0209bea0 | 120 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200a68c.c (+0 B) |
| D-0350 | 0x0209c0dc | 256 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay016/func_ov016_021b8cd8.c (+16 B) |
| D-0351 | 0x0209cae4 | 132 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200aa60.c (+0 B) |
| D-0352 | 0x0209d1f0 | 152 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021e2b3c.c (+0 B) |
| D-0353 | 0x0209d438 | 80 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200c65c.c (+0 B) |
| D-0354 | 0x0209d4ec | 112 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02038fb0.c (+0 B) |
| D-0355 | 0x0209d69c | 84 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201c64c.c (+0 B) |
| D-0356 | 0x0209dc30 | 92 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202c1ac.c (+0 B) |
| D-0357 | 0x0209dcb8 | 120 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200a68c.c (+0 B) |
| D-0358 | 0x0209dde8 | 116 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/Task_PostLocked.c (+0 B) |
| D-0359 | 0x0209e124 | 120 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200a68c.c (+0 B) |
| D-0360 | 0x0209e710 | 120 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200a68c.c (+0 B) |
| D-0361 | 0x0209e788 | 104 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02000c4c.c (+0 B) |
| D-0362 | 0x0209e7f0 | 224 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay016/func_ov016_021b8a30.c (+0 B) |
| D-0363 | 0x0209ee20 | 112 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02038fb0.c (+0 B) |
| D-0364 | 0x0209f070 | 104 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02000c4c.c (+0 B) |
| D-0365 | 0x0209f1b0 | 108 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02035ff4.c (+0 B) |
| D-0366 | 0x0209f21c | 140 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_0225764c.c (+0 B) |
| D-0367 | 0x0209f698 | 136 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200ade8.c (+0 B) |
| D-0368 | 0x0209f720 | 220 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021cea48.c (+0 B) |
| D-0369 | 0x020a0328 | 84 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201c64c.c (+0 B) |
| D-0370 | 0x020a0630 | 128 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0208f52c.legacy.c (+0 B) |
| D-0371 | 0x020a06b0 | 108 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02035ff4.c (+0 B) |
| D-0372 | 0x020a071c | 112 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02038fb0.c (+0 B) |
| D-0373 | 0x020a078c | 200 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021c12fc.c (+0 B) |
| D-0374 | 0x020a0e9c | 156 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/OSi_PostIrqEvent.legacy.c (+0 B) |
| D-0375 | 0x020a1bbc | 60 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020983b8.legacy.c (+0 B) |
| D-0376 | 0x020a1bf8 | 80 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200c65c.c (+0 B) |
| D-0377 | 0x020a1d44 | 92 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202c1ac.c (+0 B) |
| D-0378 | 0x020a1da0 | 156 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/OSi_PostIrqEvent.legacy.c (+0 B) |
| D-0379 | 0x020a26f0 | 148 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021ec110.c (+0 B) |
| D-0380 | 0x020a2bf0 | 132 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200aa60.c (+0 B) |
| D-0381 | 0x020a2cbc | 60 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020983b8.legacy.c (+0 B) |
| D-0382 | 0x020a3144 | 76 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005ee0.c (+0 B) |
| D-0383 | 0x020a3190 | 172 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay012/Ov012_BeginIntroTransition.c (+4 B) |
| D-0384 | 0x020a342c | 180 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021c6d8c.c (+0 B) |
| D-0385 | 0x020a34e0 | 252 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/func_ov021_021aae68.c (+16 B) |
| D-0386 | 0x020a39ec | 64 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005c60.c (+0 B) |
| D-0387 | 0x020a3a2c | 136 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200ade8.c (+0 B) |
| D-0388 | 0x020a3e34 | 164 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay000/func_ov000_021ad49c.c (+0 B) |
| D-0389 | 0x020a5458 | 104 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02000c4c.c (+0 B) |
| D-0390 | 0x020a5668 | 84 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201c64c.c (+0 B) |
| D-0391 | 0x020a5894 | 136 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200ade8.c (+0 B) |
| D-0392 | 0x020a5a94 | 176 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay014/Ov014_HitTestPrimary.c (+0 B) |
| D-0393 | 0x020a5d08 | 76 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005ee0.c (+0 B) |
| D-0394 | 0x020a5db0 | 84 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201c64c.c (+0 B) |
| D-0395 | 0x020a5f10 | 52 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020921a8.legacy.c (+0 B) |
| D-0396 | 0x020a5f44 | 72 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e254.legacy.c (+0 B) |
| D-0397 | 0x020a61f0 | 60 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020983b8.legacy.c (+0 B) |
| D-0398 | 0x020a6614 | 144 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_022862cc.c (+0 B) |
| D-0399 | 0x020a6dc4 | 136 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200ade8.c (+0 B) |
| D-0400 | 0x020a7200 | 56 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200bd20.c (+0 B) |
| D-0401 | 0x020a9764 | 40 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200bfa4.c (+0 B) |
| D-0402 | 0x020a978c | 44 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0209164c.legacy.c (+0 B) |
| D-0403 | 0x020aac84 | 40 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200bfa4.c (+0 B) |
| D-0404 | 0x020acca0 | 152 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021e2b3c.c (+0 B) |
| D-0405 | 0x020aeda4 | 40 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200bfa4.c (+0 B) |
| D-0406 | 0x020aedcc | 112 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02038fb0.c (+0 B) |
| D-0407 | 0x020b0034 | 40 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200bfa4.c (+0 B) |
| D-0408 | 0x020b1854 | 112 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02038fb0.c (+0 B) |
| D-0409 | 0x020b1e0c | 64 | guard chain | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005c60.c (+0 B) |
| D-0410 | 0x020b1e4c | 60 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020983b8.legacy.c (+0 B) |
| D-0411 | 0x020b3168 | 52 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020921a8.legacy.c (+0 B) |
| D-0412 | 0x020b319c | 72 | guard chain | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e254.legacy.c (+0 B) |
| D-0413 | 0x02046498 | 164 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021c5a5c.c (+0 B) |
| D-0414 | 0x02046b3c | 108 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200c078.c (+0 B) |
| D-0415 | 0x02046ba8 | 184 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/func_ov021_021ab090.c (+0 B) |
| D-0416 | 0x02047fb8 | 116 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200c284.c (+0 B) |
| D-0417 | 0x02048880 | 116 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200c284.c (+0 B) |
| D-0418 | 0x020488f4 | 208 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021cc2f0.c (+0 B) |
| D-0419 | 0x02049e84 | 180 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202ed90.c (+4 B) |
| D-0420 | 0x0204a8bc | 164 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021c5a5c.c (+0 B) |
| D-0421 | 0x0204a960 | 80 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0203b830.c (+0 B) |
| D-0422 | 0x0204a9b0 | 92 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0203158c.c (+0 B) |
| D-0423 | 0x0204aa0c | 232 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021aaaf0.c (+0 B) |
| D-0424 | 0x0204aaf4 | 148 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021e76b4.c (+0 B) |
| D-0425 | 0x0204ab88 | 116 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200c284.c (+0 B) |
| D-0426 | 0x0204be40 | 192 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202ef38.c (+4 B) |
| D-0427 | 0x0204cb54 | 204 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02014b28.c (+0 B) |
| D-0428 | 0x0204ce90 | 236 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021cec8c.c (+0 B) |
| D-0429 | 0x02051168 | 180 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202ed90.c (+4 B) |
| D-0430 | 0x02051d84 | 180 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202ed90.c (+4 B) |
| D-0431 | 0x02051f98 | 256 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_02259f98.c (+0 B) |
| D-0432 | 0x02052098 | 200 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202ee40.c (+0 B) |
| D-0433 | 0x02052218 | 244 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201bc3c.c (+0 B) |
| D-0434 | 0x02052b34 | 144 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201d530.c (+0 B) |
| D-0435 | 0x02052cdc | 256 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_02259f98.c (+0 B) |
| D-0436 | 0x02052f04 | 132 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200ef60.c (+4 B) |
| D-0437 | 0x02053d10 | 204 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02014b28.c (+0 B) |
| D-0438 | 0x02053fc4 | 184 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/func_ov021_021ab090.c (+0 B) |
| D-0439 | 0x020540d0 | 112 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_02093c20.legacy.c (+0 B) |
| D-0440 | 0x020541b8 | 212 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021daa48.c (+0 B) |
| D-0441 | 0x02054ec0 | 132 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200ef60.c (+4 B) |
| D-0442 | 0x02055030 | 248 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02030b84.c (+0 B) |
| D-0443 | 0x0205538c | 148 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021e76b4.c (+0 B) |
| D-0444 | 0x02055738 | 128 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200ef60.c (+0 B) |
| D-0445 | 0x02055938 | 224 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02031684.c (+0 B) |
| D-0446 | 0x02055d58 | 208 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021cc2f0.c (+0 B) |
| D-0447 | 0x02055f84 | 104 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021aa818.c (+0 B) |
| D-0448 | 0x02056a58 | 224 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02031684.c (+0 B) |
| D-0449 | 0x02056b38 | 252 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02030b84.c (+4 B) |
| D-0450 | 0x020577d8 | 108 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200c078.c (+0 B) |
| D-0451 | 0x02057e60 | 220 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202de9c.c (+0 B) |
| D-0452 | 0x02057f3c | 252 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02030b84.c (+4 B) |
| D-0453 | 0x020585d4 | 244 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201bc3c.c (+0 B) |
| D-0454 | 0x0205888c | 200 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202ee40.c (+0 B) |
| D-0455 | 0x0205bc24 | 168 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202e6f4.c (+0 B) |
| D-0456 | 0x0205cb14 | 164 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021c5a5c.c (+0 B) |
| D-0457 | 0x0205d4c0 | 68 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0203dde8.c (+0 B) |
| D-0458 | 0x020601d0 | 244 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201bc3c.c (+0 B) |
| D-0459 | 0x02061578 | 248 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02030b84.c (+0 B) |
| D-0460 | 0x02061b60 | 252 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02030b84.c (+4 B) |
| D-0461 | 0x02061c5c | 256 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_02259f98.c (+0 B) |
| D-0462 | 0x02061f20 | 132 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200ef60.c (+4 B) |
| D-0463 | 0x020621dc | 164 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021c5a5c.c (+0 B) |
| D-0464 | 0x02063188 | 256 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_02259f98.c (+0 B) |
| D-0465 | 0x02063548 | 216 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021d2550.c (+0 B) |
| D-0466 | 0x02064158 | 176 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202ed90.c (+0 B) |
| D-0467 | 0x020643ec | 148 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021e76b4.c (+0 B) |
| D-0468 | 0x02064580 | 96 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202f46c.c (+0 B) |
| D-0469 | 0x02064f84 | 200 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202ee40.c (+0 B) |
| D-0470 | 0x0206588c | 168 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202e6f4.c (+0 B) |
| D-0471 | 0x020670f4 | 76 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0203624c.c (+0 B) |
| D-0472 | 0x02067354 | 136 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202e864.c (+0 B) |
| D-0473 | 0x0206803c | 144 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201d530.c (+0 B) |
| D-0474 | 0x02068a20 | 148 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021e76b4.c (+0 B) |
| D-0475 | 0x0206904c | 176 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202ed90.c (+0 B) |
| D-0476 | 0x02069634 | 236 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021cec8c.c (+0 B) |
| D-0477 | 0x0206b814 | 120 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202c770.c (+0 B) |
| D-0478 | 0x0206bef4 | 88 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200bef4.c (+0 B) |
| D-0479 | 0x0206c3f4 | 120 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202c770.c (+0 B) |
| D-0480 | 0x0206c52c | 240 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020452c4.c (+0 B) |
| D-0481 | 0x0206c728 | 152 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200ae70.c (+0 B) |
| D-0482 | 0x0206c9b0 | 156 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021d3d2c.c (+0 B) |
| D-0483 | 0x0206d148 | 168 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202e6f4.c (+0 B) |
| D-0484 | 0x0206d404 | 188 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021dd150.thumb.c (+0 B) |
| D-0485 | 0x0206dad8 | 228 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02031684.c (+4 B) |
| D-0486 | 0x0206de68 | 236 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021cec8c.c (+0 B) |
| D-0487 | 0x0206df90 | 128 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200ef60.c (+0 B) |
| D-0488 | 0x0206e174 | 116 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200c284.c (+0 B) |
| D-0489 | 0x0206e33c | 80 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0203b830.c (+0 B) |
| D-0490 | 0x0206e38c | 220 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202de9c.c (+0 B) |
| D-0491 | 0x0206e9b0 | 80 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0203b830.c (+0 B) |
| D-0492 | 0x0207039c | 148 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021e76b4.c (+0 B) |
| D-0493 | 0x020704e8 | 236 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021cec8c.c (+0 B) |
| D-0494 | 0x02070980 | 184 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/func_ov021_021ab090.c (+0 B) |
| D-0495 | 0x02071a74 | 256 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_02259f98.c (+0 B) |
| D-0496 | 0x020720b4 | 144 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201d530.c (+0 B) |
| D-0497 | 0x02072544 | 188 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021dd150.thumb.c (+0 B) |
| D-0498 | 0x020726e0 | 252 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02030b84.c (+4 B) |
| D-0499 | 0x02073450 | 220 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202de9c.c (+0 B) |
| D-0500 | 0x02073dcc | 136 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202e864.c (+0 B) |
| D-0501 | 0x02074938 | 156 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021d3d2c.c (+0 B) |
| D-0502 | 0x02074e58 | 156 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021d3d2c.c (+0 B) |
| D-0503 | 0x02076b74 | 216 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021d2550.c (+0 B) |
| D-0504 | 0x02076d14 | 200 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202ee40.c (+0 B) |
| D-0505 | 0x020770bc | 256 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_02259f98.c (+0 B) |
| D-0506 | 0x0207a458 | 236 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021cec8c.c (+0 B) |
| D-0507 | 0x0207a7d4 | 148 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021e76b4.c (+0 B) |
| D-0508 | 0x0207ae74 | 180 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202ed90.c (+4 B) |
| D-0509 | 0x0207bc20 | 184 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/func_ov021_021ab090.c (+0 B) |
| D-0510 | 0x0207c698 | 192 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202ef38.c (+4 B) |
| D-0511 | 0x0207cca8 | 140 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202ed04.c (+0 B) |
| D-0512 | 0x0207d4dc | 68 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0203dde8.c (+0 B) |
| D-0513 | 0x0207db00 | 68 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0203dde8.c (+0 B) |
| D-0514 | 0x0207f510 | 256 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_02259f98.c (+0 B) |
| D-0515 | 0x02082fcc | 224 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02031684.c (+0 B) |
| D-0516 | 0x0208428c | 212 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021daa48.c (+0 B) |
| D-0517 | 0x02084360 | 128 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200ef60.c (+0 B) |
| D-0518 | 0x02084840 | 212 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021daa48.c (+0 B) |
| D-0519 | 0x02084aec | 220 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202de9c.c (+0 B) |
| D-0520 | 0x02084e0c | 240 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020452c4.c (+0 B) |
| D-0521 | 0x020856a0 | 124 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201d4b4.c (+0 B) |
| D-0522 | 0x02085e74 | 212 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021daa48.c (+0 B) |
| D-0523 | 0x02089df8 | 120 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202c770.c (+0 B) |
| D-0524 | 0x02089e70 | 120 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202c770.c (+0 B) |
| D-0525 | 0x02089ee8 | 120 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202c770.c (+0 B) |
| D-0526 | 0x0208a000 | 156 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021d3d2c.c (+0 B) |
| D-0527 | 0x0208aec8 | 228 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02031684.c (+4 B) |
| D-0528 | 0x0208cfa4 | 140 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202ed04.c (+0 B) |
| D-0529 | 0x0208d030 | 140 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202ed04.c (+0 B) |
| D-0530 | 0x0208d138 | 172 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02013aa0.c (+0 B) |
| D-0531 | 0x0208d204 | 184 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/func_ov021_021ab090.c (+0 B) |
| D-0532 | 0x0208d3fc | 244 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201bc3c.c (+0 B) |
| D-0533 | 0x0208d6f4 | 184 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/func_ov021_021ab090.c (+0 B) |
| D-0534 | 0x0208df94 | 128 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200ef60.c (+0 B) |
| D-0535 | 0x0208e014 | 140 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202ed04.c (+0 B) |
| D-0536 | 0x0208e0a0 | 128 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200ef60.c (+0 B) |
| D-0537 | 0x0208e120 | 140 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202ed04.c (+0 B) |
| D-0538 | 0x020909d0 | 128 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200ef60.c (+0 B) |
| D-0539 | 0x02090a60 | 144 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201d530.c (+0 B) |
| D-0540 | 0x02091f88 | 236 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021cec8c.c (+0 B) |
| D-0541 | 0x02092a5c | 236 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021cec8c.c (+0 B) |
| D-0542 | 0x02096358 | 180 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202ed90.c (+4 B) |
| D-0543 | 0x020971b8 | 128 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200ef60.c (+0 B) |
| D-0544 | 0x02097364 | 152 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200ae70.c (+0 B) |
| D-0545 | 0x02097ea4 | 108 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200c078.c (+0 B) |
| D-0546 | 0x02098628 | 144 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201d530.c (+0 B) |
| D-0547 | 0x0209a3f8 | 172 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02013aa0.c (+0 B) |
| D-0548 | 0x0209aa84 | 240 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020452c4.c (+0 B) |
| D-0549 | 0x0209af84 | 144 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201d530.c (+0 B) |
| D-0550 | 0x0209b050 | 104 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021aa818.c (+0 B) |
| D-0551 | 0x0209b298 | 236 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021cec8c.c (+0 B) |
| D-0552 | 0x0209bf34 | 148 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021e76b4.c (+0 B) |
| D-0553 | 0x0209c1dc | 164 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021c5a5c.c (+0 B) |
| D-0554 | 0x0209cc90 | 172 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02013aa0.c (+0 B) |
| D-0555 | 0x0209d018 | 224 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02031684.c (+0 B) |
| D-0556 | 0x0209d5e4 | 128 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200ef60.c (+0 B) |
| D-0557 | 0x0209e450 | 168 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202e6f4.c (+0 B) |
| D-0558 | 0x0209e628 | 232 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021aaaf0.c (+0 B) |
| D-0559 | 0x0209ea24 | 220 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202de9c.c (+0 B) |
| D-0560 | 0x0209ecc8 | 256 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_02259f98.c (+0 B) |
| D-0561 | 0x0209ee90 | 80 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0203b830.c (+0 B) |
| D-0562 | 0x0209f7fc | 204 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02014b28.c (+0 B) |
| D-0563 | 0x0209f904 | 108 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200c078.c (+0 B) |
| D-0564 | 0x020a0854 | 160 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay012/func_ov012_021ca2a0.c (+0 B) |
| D-0565 | 0x020a08f4 | 132 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200ef60.c (+4 B) |
| D-0566 | 0x020a09c8 | 132 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200ef60.c (+4 B) |
| D-0567 | 0x020a1c48 | 252 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02030b84.c (+4 B) |
| D-0568 | 0x020a1f7c | 176 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202ed90.c (+0 B) |
| D-0569 | 0x020a3ed8 | 112 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_02093c20.legacy.c (+0 B) |
| D-0570 | 0x020a4a94 | 216 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021d2550.c (+0 B) |
| D-0571 | 0x020a5c80 | 136 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202e864.c (+0 B) |
| D-0572 | 0x020a6170 | 128 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200ef60.c (+0 B) |
| D-0573 | 0x020a6924 | 172 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02013aa0.c (+0 B) |
| D-0574 | 0x020a70fc | 232 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021aaaf0.c (+0 B) |
| D-0575 | 0x020aabac | 132 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200ef60.c (+4 B) |
| D-0576 | 0x020ac37c | 224 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02031684.c (+0 B) |
| D-0577 | 0x020acd38 | 200 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202ee40.c (+0 B) |
| D-0578 | 0x020ace14 | 116 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200c284.c (+0 B) |
| D-0579 | 0x020b007c | 188 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021dd150.thumb.c (+0 B) |
| D-0580 | 0x020b1d80 | 140 | small dispatcher | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202ed04.c (+0 B) |
| D-0581 | 0x02040cc0 | 148 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0206a8c0.legacy_sp3.c (+4 B) |
| D-0582 | 0x02040de8 | 84 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201c560.c (+0 B) |
| D-0583 | 0x02043b70 | 108 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02068380.c (+0 B) |
| D-0584 | 0x02043c28 | 124 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_02287774.c (+0 B) |
| D-0585 | 0x02043ca4 | 152 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0206a8c0.legacy_sp3.c (+0 B) |
| D-0586 | 0x020442f8 | 48 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02031f40.c (+0 B) |
| D-0587 | 0x02044328 | 68 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201ac1c.c (+0 B) |
| D-0588 | 0x02044384 | 160 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200af24.c (+4 B) |
| D-0589 | 0x02044424 | 140 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_022123fc.c (+0 B) |
| D-0590 | 0x02044528 | 232 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad1f4.c (+8 B) |
| D-0591 | 0x02044758 | 128 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02091a0c.legacy.c (+0 B) |
| D-0592 | 0x02045618 | 96 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001e94.c (+0 B) |
| D-0593 | 0x02046658 | 60 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200fd84.c (+0 B) |
| D-0594 | 0x02046694 | 96 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001e94.c (+0 B) |
| D-0595 | 0x02046770 | 116 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02038f3c.c (+0 B) |
| D-0596 | 0x02048b08 | 184 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020918d0.legacy.c (+4 B) |
| D-0597 | 0x02049120 | 108 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02068380.c (+0 B) |
| D-0598 | 0x02049f74 | 168 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200af24.c (+4 B) |
| D-0599 | 0x0204b0d0 | 100 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201f090.c (+0 B) |
| D-0600 | 0x0204b134 | 112 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008c14.c (+0 B) |
| D-0601 | 0x0204b280 | 128 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02091a0c.legacy.c (+0 B) |
| D-0602 | 0x0204b300 | 112 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008c14.c (+0 B) |
| D-0603 | 0x0204b370 | 96 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001e94.c (+0 B) |
| D-0604 | 0x0204b3d0 | 64 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02011a3c.c (+0 B) |
| D-0605 | 0x0204bb5c | 240 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad1f4.c (+0 B) |
| D-0606 | 0x0204c384 | 136 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021dc020.thumb.c (+2 B) |
| D-0607 | 0x0204ca70 | 228 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+8 B) |
| D-0608 | 0x0204e868 | 172 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/Scene_Update.c (+0 B) |
| D-0609 | 0x0204ec90 | 192 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020364c4.c (+0 B) |
| D-0610 | 0x0204f8f0 | 168 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200af24.c (+4 B) |
| D-0611 | 0x0204f9cc | 88 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0207e7d8.legacy_sp3.c (+0 B) |
| D-0612 | 0x0204fc38 | 100 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201f090.c (+0 B) |
| D-0613 | 0x02050140 | 140 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_022123fc.c (+0 B) |
| D-0614 | 0x02052870 | 116 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02038f3c.c (+0 B) |
| D-0615 | 0x02052974 | 116 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02038f3c.c (+0 B) |
| D-0616 | 0x02053230 | 196 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020364c4.c (+4 B) |
| D-0617 | 0x0205340c | 124 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_02287774.c (+0 B) |
| D-0618 | 0x02053b38 | 108 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02068380.c (+0 B) |
| D-0619 | 0x02053ba4 | 88 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0207e7d8.legacy_sp3.c (+0 B) |
| D-0620 | 0x02053bfc | 56 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02006918.c (+0 B) |
| D-0621 | 0x02053c34 | 116 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02038f3c.c (+0 B) |
| D-0622 | 0x02053ca8 | 104 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200b2f4.c (+0 B) |
| D-0623 | 0x02054148 | 112 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008c14.c (+0 B) |
| D-0624 | 0x02054338 | 128 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02091a0c.legacy.c (+0 B) |
| D-0625 | 0x020543b8 | 116 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02038f3c.c (+0 B) |
| D-0626 | 0x02054684 | 124 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_02287774.c (+0 B) |
| D-0627 | 0x020548b4 | 64 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02011a3c.c (+0 B) |
| D-0628 | 0x02054a30 | 160 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200af24.c (+4 B) |
| D-0629 | 0x02054ca8 | 80 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008548.c (+0 B) |
| D-0630 | 0x02054db8 | 68 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201ac1c.c (+0 B) |
| D-0631 | 0x02054dfc | 88 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0207e7d8.legacy_sp3.c (+0 B) |
| D-0632 | 0x02055298 | 68 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201ac1c.c (+0 B) |
| D-0633 | 0x02055c70 | 232 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad1f4.c (+8 B) |
| D-0634 | 0x02058244 | 240 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad1f4.c (+0 B) |
| D-0635 | 0x02059d1c | 116 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02038f3c.c (+0 B) |
| D-0636 | 0x02059e5c | 220 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+0 B) |
| D-0637 | 0x0205bccc | 64 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02011a3c.c (+0 B) |
| D-0638 | 0x0205bd58 | 96 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001e94.c (+0 B) |
| D-0639 | 0x0205c7f4 | 60 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200fd84.c (+0 B) |
| D-0640 | 0x0205c830 | 248 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad1f4.c (+8 B) |
| D-0641 | 0x0205ce40 | 208 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+12 B) |
| D-0642 | 0x02060520 | 228 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+8 B) |
| D-0643 | 0x02060728 | 136 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021dc020.thumb.c (+2 B) |
| D-0644 | 0x02060b84 | 140 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_022123fc.c (+0 B) |
| D-0645 | 0x02060c10 | 128 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02091a0c.legacy.c (+0 B) |
| D-0646 | 0x02060cbc | 208 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+12 B) |
| D-0647 | 0x02060fdc | 60 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200fd84.c (+0 B) |
| D-0648 | 0x02061290 | 172 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/Scene_Update.c (+0 B) |
| D-0649 | 0x02062164 | 120 | loop | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020921dc.legacy.c (+0 B) |
| D-0650 | 0x0206371c | 236 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad1f4.c (+4 B) |
| D-0651 | 0x020639c8 | 132 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02092388.legacy.c (+0 B) |
| D-0652 | 0x02063a4c | 148 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0206a8c0.legacy_sp3.c (+4 B) |
| D-0653 | 0x02064500 | 68 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201ac1c.c (+0 B) |
| D-0654 | 0x02064790 | 212 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+8 B) |
| D-0655 | 0x0206553c | 84 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201c560.c (+0 B) |
| D-0656 | 0x02065d4c | 116 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02038f3c.c (+0 B) |
| D-0657 | 0x02065fa8 | 104 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200b2f4.c (+0 B) |
| D-0658 | 0x020665e0 | 112 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008c14.c (+0 B) |
| D-0659 | 0x02067024 | 208 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+12 B) |
| D-0660 | 0x02067208 | 140 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_022123fc.c (+0 B) |
| D-0661 | 0x02067560 | 168 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200af24.c (+4 B) |
| D-0662 | 0x02067870 | 72 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02046718.legacy_sp3.c (+0 B) |
| D-0663 | 0x02067984 | 200 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020364c4.c (+8 B) |
| D-0664 | 0x02067a4c | 72 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02046718.legacy_sp3.c (+0 B) |
| D-0665 | 0x02067a94 | 192 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020364c4.c (+0 B) |
| D-0666 | 0x02067c08 | 80 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008548.c (+0 B) |
| D-0667 | 0x02067c58 | 144 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay011/func_ov011_021cf228.c (+0 B) |
| D-0668 | 0x02067f3c | 256 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021aabd8.c (+12 B) |
| D-0669 | 0x020685c8 | 96 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001e94.c (+0 B) |
| D-0670 | 0x0206880c | 132 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02092388.legacy.c (+0 B) |
| D-0671 | 0x02068890 | 108 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02068380.c (+0 B) |
| D-0672 | 0x020688fc | 96 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001e94.c (+0 B) |
| D-0673 | 0x02069de4 | 224 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+4 B) |
| D-0674 | 0x0206a984 | 172 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/Scene_Update.c (+0 B) |
| D-0675 | 0x0206adfc | 164 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200af24.c (+0 B) |
| D-0676 | 0x0206b1f8 | 96 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001e94.c (+0 B) |
| D-0677 | 0x0206b590 | 88 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0207e7d8.legacy_sp3.c (+0 B) |
| D-0678 | 0x0206b5e8 | 92 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200b06c.c (+0 B) |
| D-0679 | 0x0206b6fc | 124 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_02287774.c (+0 B) |
| D-0680 | 0x0206b778 | 96 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001e94.c (+0 B) |
| D-0681 | 0x0206bd74 | 168 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200af24.c (+4 B) |
| D-0682 | 0x0206c074 | 156 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0206a8c0.legacy_sp3.c (+4 B) |
| D-0683 | 0x0206d7c0 | 148 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0206a8c0.legacy_sp3.c (+4 B) |
| D-0684 | 0x0206dbbc | 72 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02046718.legacy_sp3.c (+0 B) |
| D-0685 | 0x0206dc04 | 176 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/Scene_Update.c (+4 B) |
| D-0686 | 0x0206e010 | 180 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020918d0.legacy.c (+8 B) |
| D-0687 | 0x0206e0c4 | 176 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/Scene_Update.c (+4 B) |
| D-0688 | 0x0206e504 | 44 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201a594.c (+0 B) |
| D-0689 | 0x0206e5a8 | 200 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020364c4.c (+8 B) |
| D-0690 | 0x0206f0c0 | 176 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/Scene_Update.c (+4 B) |
| D-0691 | 0x0206f170 | 52 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200a454.c (+0 B) |
| D-0692 | 0x0206f624 | 100 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201f090.c (+0 B) |
| D-0693 | 0x02070278 | 212 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+8 B) |
| D-0694 | 0x0207084c | 224 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+4 B) |
| D-0695 | 0x02070ac0 | 140 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_022123fc.c (+0 B) |
| D-0696 | 0x02070b4c | 96 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001e94.c (+0 B) |
| D-0697 | 0x02070bac | 148 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0206a8c0.legacy_sp3.c (+4 B) |
| D-0698 | 0x02070d90 | 196 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020364c4.c (+4 B) |
| D-0699 | 0x0207108c | 176 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/Scene_Update.c (+4 B) |
| D-0700 | 0x0207113c | 116 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02038f3c.c (+0 B) |
| D-0701 | 0x02072444 | 132 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02092388.legacy.c (+0 B) |
| D-0702 | 0x020724c8 | 124 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_02287774.c (+0 B) |
| D-0703 | 0x02072600 | 224 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+4 B) |
| D-0704 | 0x020736ac | 140 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_022123fc.c (+0 B) |
| D-0705 | 0x02073838 | 228 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+8 B) |
| D-0706 | 0x0207397c | 224 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+4 B) |
| D-0707 | 0x02073fc8 | 192 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020364c4.c (+0 B) |
| D-0708 | 0x020745fc | 240 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad1f4.c (+0 B) |
| D-0709 | 0x02074b90 | 228 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+8 B) |
| D-0710 | 0x02074cdc | 240 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad1f4.c (+0 B) |
| D-0711 | 0x02074dcc | 128 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02091a0c.legacy.c (+0 B) |
| D-0712 | 0x02075d74 | 128 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02091a0c.legacy.c (+0 B) |
| D-0713 | 0x02076c5c | 100 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201f090.c (+0 B) |
| D-0714 | 0x02077018 | 116 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02038f3c.c (+0 B) |
| D-0715 | 0x02077094 | 40 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/FindU16InArray.c (+0 B) |
| D-0716 | 0x02077954 | 132 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02092388.legacy.c (+0 B) |
| D-0717 | 0x020779d8 | 80 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008548.c (+0 B) |
| D-0718 | 0x02077a28 | 96 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001e94.c (+0 B) |
| D-0719 | 0x02077b98 | 112 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008c14.c (+0 B) |
| D-0720 | 0x02077c08 | 256 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021aabd8.c (+12 B) |
| D-0721 | 0x02077d08 | 168 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200af24.c (+4 B) |
| D-0722 | 0x02077db0 | 168 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200af24.c (+4 B) |
| D-0723 | 0x02077ecc | 192 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020364c4.c (+0 B) |
| D-0724 | 0x0207850c | 192 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020364c4.c (+0 B) |
| D-0725 | 0x02078ccc | 100 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201f090.c (+0 B) |
| D-0726 | 0x02078d30 | 88 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0207e7d8.legacy_sp3.c (+0 B) |
| D-0727 | 0x02078dcc | 112 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008c14.c (+0 B) |
| D-0728 | 0x02078e3c | 128 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02091a0c.legacy.c (+0 B) |
| D-0729 | 0x02078f08 | 72 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02046718.legacy_sp3.c (+0 B) |
| D-0730 | 0x02078f50 | 96 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001e94.c (+0 B) |
| D-0731 | 0x02079984 | 132 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02092388.legacy.c (+0 B) |
| D-0732 | 0x02079a08 | 188 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020918d0.legacy.c (+0 B) |
| D-0733 | 0x02079ac4 | 72 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02046718.legacy_sp3.c (+0 B) |
| D-0734 | 0x02079b0c | 60 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200fd84.c (+0 B) |
| D-0735 | 0x02079b48 | 116 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02038f3c.c (+0 B) |
| D-0736 | 0x02079bbc | 184 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020918d0.legacy.c (+4 B) |
| D-0737 | 0x02079c74 | 76 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200b1bc.c (+0 B) |
| D-0738 | 0x02079cc0 | 112 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008c14.c (+0 B) |
| D-0739 | 0x02079d30 | 172 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/Scene_Update.c (+0 B) |
| D-0740 | 0x02079e20 | 44 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201a594.c (+0 B) |
| D-0741 | 0x02079e4c | 36 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02076260.c (+0 B) |
| D-0742 | 0x0207b18c | 164 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200af24.c (+0 B) |
| D-0743 | 0x0207c3b0 | 212 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+8 B) |
| D-0744 | 0x0207c484 | 104 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200b2f4.c (+0 B) |
| D-0745 | 0x0207c4ec | 132 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02092388.legacy.c (+0 B) |
| D-0746 | 0x0207c5b4 | 228 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+8 B) |
| D-0747 | 0x0207ce90 | 152 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0206a8c0.legacy_sp3.c (+0 B) |
| D-0748 | 0x0207d3ac | 132 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02092388.legacy.c (+0 B) |
| D-0749 | 0x0207d520 | 240 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad1f4.c (+0 B) |
| D-0750 | 0x0207d610 | 188 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020918d0.legacy.c (+0 B) |
| D-0751 | 0x0207d6cc | 192 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020364c4.c (+0 B) |
| D-0752 | 0x0207db44 | 48 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02031f40.c (+0 B) |
| D-0753 | 0x0207e0a8 | 124 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_02287774.c (+0 B) |
| D-0754 | 0x0207e594 | 164 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200af24.c (+0 B) |
| D-0755 | 0x0207e790 | 72 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02046718.legacy_sp3.c (+0 B) |
| D-0756 | 0x0207f05c | 220 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+0 B) |
| D-0757 | 0x0207feec | 152 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0206a8c0.legacy_sp3.c (+0 B) |
| D-0758 | 0x0207ff84 | 116 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02038f3c.c (+0 B) |
| D-0759 | 0x0207fff8 | 192 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020364c4.c (+0 B) |
| D-0760 | 0x020800b8 | 92 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200b06c.c (+0 B) |
| D-0761 | 0x02080114 | 88 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0207e7d8.legacy_sp3.c (+0 B) |
| D-0762 | 0x020801ac | 212 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+8 B) |
| D-0763 | 0x0208060c | 100 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201f090.c (+0 B) |
| D-0764 | 0x02080670 | 184 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020918d0.legacy.c (+4 B) |
| D-0765 | 0x02081498 | 256 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021aabd8.c (+12 B) |
| D-0766 | 0x020816f4 | 252 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad1f4.c (+12 B) |
| D-0767 | 0x020817f0 | 168 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200af24.c (+4 B) |
| D-0768 | 0x02081898 | 240 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad1f4.c (+0 B) |
| D-0769 | 0x02081b5c | 124 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_02287774.c (+0 B) |
| D-0770 | 0x02081bd8 | 172 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/Scene_Update.c (+0 B) |
| D-0771 | 0x02081c84 | 148 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0206a8c0.legacy_sp3.c (+4 B) |
| D-0772 | 0x02081d18 | 180 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020918d0.legacy.c (+8 B) |
| D-0773 | 0x02082494 | 112 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008c14.c (+0 B) |
| D-0774 | 0x02084bc8 | 112 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008c14.c (+0 B) |
| D-0775 | 0x02084dc0 | 76 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200b1bc.c (+0 B) |
| D-0776 | 0x020852fc | 160 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200af24.c (+4 B) |
| D-0777 | 0x02087348 | 68 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201ac1c.c (+0 B) |
| D-0778 | 0x02087444 | 128 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02091a0c.legacy.c (+0 B) |
| D-0779 | 0x020877c8 | 92 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200b06c.c (+0 B) |
| D-0780 | 0x02087824 | 88 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0207e7d8.legacy_sp3.c (+0 B) |
| D-0781 | 0x02087c34 | 180 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020918d0.legacy.c (+8 B) |
| D-0782 | 0x02087ee4 | 64 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02011a3c.c (+0 B) |
| D-0783 | 0x020880bc | 180 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020918d0.legacy.c (+8 B) |
| D-0784 | 0x02088268 | 108 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02068380.c (+0 B) |
| D-0785 | 0x02088540 | 96 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001e94.c (+0 B) |
| D-0786 | 0x02088620 | 128 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02091a0c.legacy.c (+0 B) |
| D-0787 | 0x02088874 | 244 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad1f4.c (+4 B) |
| D-0788 | 0x02089418 | 200 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020364c4.c (+8 B) |
| D-0789 | 0x02089864 | 188 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020918d0.legacy.c (+0 B) |
| D-0790 | 0x020899c0 | 196 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020364c4.c (+4 B) |
| D-0791 | 0x0208a5e4 | 160 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200af24.c (+4 B) |
| D-0792 | 0x0208a6b8 | 112 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008c14.c (+0 B) |
| D-0793 | 0x0208aa0c | 68 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201ac1c.c (+0 B) |
| D-0794 | 0x0208aa50 | 72 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02046718.legacy_sp3.c (+0 B) |
| D-0795 | 0x0208be70 | 44 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201a594.c (+0 B) |
| D-0796 | 0x0208bed8 | 60 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200fd84.c (+0 B) |
| D-0797 | 0x0208bf14 | 40 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/FindU16InArray.c (+0 B) |
| D-0798 | 0x0208bfc4 | 136 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021dc020.thumb.c (+2 B) |
| D-0799 | 0x0208c2e0 | 104 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200b2f4.c (+0 B) |
| D-0800 | 0x0208e544 | 168 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200af24.c (+4 B) |
| D-0801 | 0x0208e700 | 172 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/Scene_Update.c (+0 B) |
| D-0802 | 0x0208e7ac | 176 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/Scene_Update.c (+4 B) |
| D-0803 | 0x0208e85c | 52 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200a454.c (+0 B) |
| D-0804 | 0x0208e890 | 136 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021dc020.thumb.c (+2 B) |
| D-0805 | 0x020903d4 | 128 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02091a0c.legacy.c (+0 B) |
| D-0806 | 0x02090728 | 140 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_022123fc.c (+0 B) |
| D-0807 | 0x020907b4 | 144 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay011/func_ov011_021cf228.c (+0 B) |
| D-0808 | 0x02090b00 | 84 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201c560.c (+0 B) |
| D-0809 | 0x02090b54 | 240 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad1f4.c (+0 B) |
| D-0810 | 0x02091584 | 96 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001e94.c (+0 B) |
| D-0811 | 0x020915e4 | 104 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200b2f4.c (+0 B) |
| D-0812 | 0x02091768 | 172 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/Scene_Update.c (+0 B) |
| D-0813 | 0x0209181c | 180 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020918d0.legacy.c (+8 B) |
| D-0814 | 0x020919ac | 44 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201a594.c (+0 B) |
| D-0815 | 0x02092074 | 72 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02046718.legacy_sp3.c (+0 B) |
| D-0816 | 0x0209240c | 180 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020918d0.legacy.c (+8 B) |
| D-0817 | 0x020924c0 | 172 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/Scene_Update.c (+0 B) |
| D-0818 | 0x0209256c | 168 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200af24.c (+4 B) |
| D-0819 | 0x02092700 | 72 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02046718.legacy_sp3.c (+0 B) |
| D-0820 | 0x020927b8 | 140 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_022123fc.c (+0 B) |
| D-0821 | 0x020938c8 | 48 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02031f40.c (+0 B) |
| D-0822 | 0x0209393c | 104 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200b2f4.c (+0 B) |
| D-0823 | 0x02093a44 | 136 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021dc020.thumb.c (+2 B) |
| D-0824 | 0x02093acc | 52 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200a454.c (+0 B) |
| D-0825 | 0x02093c90 | 180 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020918d0.legacy.c (+8 B) |
| D-0826 | 0x02093fb8 | 120 | loop | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020921dc.legacy.c (+0 B) |
| D-0827 | 0x02094030 | 124 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_02287774.c (+0 B) |
| D-0828 | 0x020940ac | 144 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay011/func_ov011_021cf228.c (+0 B) |
| D-0829 | 0x0209417c | 192 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020364c4.c (+0 B) |
| D-0830 | 0x02094504 | 76 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200b1bc.c (+0 B) |
| D-0831 | 0x02094550 | 56 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02006918.c (+0 B) |
| D-0832 | 0x020945f4 | 148 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0206a8c0.legacy_sp3.c (+4 B) |
| D-0833 | 0x020947d0 | 148 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0206a8c0.legacy_sp3.c (+4 B) |
| D-0834 | 0x02094864 | 140 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_022123fc.c (+0 B) |
| D-0835 | 0x020948f0 | 256 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021aabd8.c (+12 B) |
| D-0836 | 0x02095030 | 112 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008c14.c (+0 B) |
| D-0837 | 0x020953e4 | 52 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200a454.c (+0 B) |
| D-0838 | 0x02095418 | 108 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02068380.c (+0 B) |
| D-0839 | 0x020955e8 | 144 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay011/func_ov011_021cf228.c (+0 B) |
| D-0840 | 0x02095880 | 156 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0206a8c0.legacy_sp3.c (+4 B) |
| D-0841 | 0x02095c18 | 48 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02031f40.c (+0 B) |
| D-0842 | 0x02095c48 | 128 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02091a0c.legacy.c (+0 B) |
| D-0843 | 0x02096060 | 76 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200b1bc.c (+0 B) |
| D-0844 | 0x020960ac | 160 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200af24.c (+4 B) |
| D-0845 | 0x0209614c | 220 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+0 B) |
| D-0846 | 0x020970a8 | 172 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/Scene_Update.c (+0 B) |
| D-0847 | 0x02097154 | 100 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201f090.c (+0 B) |
| D-0848 | 0x020972d4 | 144 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay011/func_ov011_021cf228.c (+0 B) |
| D-0849 | 0x02097528 | 200 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020364c4.c (+8 B) |
| D-0850 | 0x02097700 | 192 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020364c4.c (+0 B) |
| D-0851 | 0x020977c0 | 80 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008548.c (+0 B) |
| D-0852 | 0x02097a4c | 164 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200af24.c (+0 B) |
| D-0853 | 0x02097d60 | 100 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201f090.c (+0 B) |
| D-0854 | 0x02097f20 | 208 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+12 B) |
| D-0855 | 0x020989a8 | 164 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200af24.c (+0 B) |
| D-0856 | 0x020991a4 | 244 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad1f4.c (+4 B) |
| D-0857 | 0x0209a4a4 | 144 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay011/func_ov011_021cf228.c (+0 B) |
| D-0858 | 0x0209a884 | 76 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200b1bc.c (+0 B) |
| D-0859 | 0x0209a8d0 | 72 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02046718.legacy_sp3.c (+0 B) |
| D-0860 | 0x0209adb4 | 48 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02031f40.c (+0 B) |
| D-0861 | 0x0209ae98 | 176 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/Scene_Update.c (+4 B) |
| D-0862 | 0x0209b1e0 | 184 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020918d0.legacy.c (+4 B) |
| D-0863 | 0x0209b384 | 196 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020364c4.c (+4 B) |
| D-0864 | 0x0209b4a4 | 64 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02011a3c.c (+0 B) |
| D-0865 | 0x0209b55c | 132 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02092388.legacy.c (+0 B) |
| D-0866 | 0x0209bcdc | 136 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021dc020.thumb.c (+2 B) |
| D-0867 | 0x0209c034 | 92 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200b06c.c (+0 B) |
| D-0868 | 0x0209c280 | 156 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0206a8c0.legacy_sp3.c (+4 B) |
| D-0869 | 0x0209c7dc | 244 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad1f4.c (+4 B) |
| D-0870 | 0x0209cd3c | 104 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200b2f4.c (+0 B) |
| D-0871 | 0x0209cda4 | 256 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021aabd8.c (+12 B) |
| D-0872 | 0x0209d150 | 160 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200af24.c (+4 B) |
| D-0873 | 0x0209d3dc | 92 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200b06c.c (+0 B) |
| D-0874 | 0x0209d488 | 100 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201f090.c (+0 B) |
| D-0875 | 0x0209d55c | 120 | loop | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020921dc.legacy.c (+0 B) |
| D-0876 | 0x0209db88 | 168 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200af24.c (+4 B) |
| D-0877 | 0x0209dd30 | 184 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020918d0.legacy.c (+4 B) |
| D-0878 | 0x0209e308 | 164 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200af24.c (+0 B) |
| D-0879 | 0x0209e3ac | 164 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200af24.c (+0 B) |
| D-0880 | 0x020a112c | 184 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020918d0.legacy.c (+4 B) |
| D-0881 | 0x020a202c | 212 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+8 B) |
| D-0882 | 0x020a2100 | 220 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+0 B) |
| D-0883 | 0x020a2394 | 132 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02092388.legacy.c (+0 B) |
| D-0884 | 0x020a2c74 | 72 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02046718.legacy_sp3.c (+0 B) |
| D-0885 | 0x020a323c | 168 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200af24.c (+4 B) |
| D-0886 | 0x020a33a8 | 132 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02092388.legacy.c (+0 B) |
| D-0887 | 0x020a3d34 | 256 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021aabd8.c (+12 B) |
| D-0888 | 0x020a4180 | 120 | loop | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020921dc.legacy.c (+0 B) |
| D-0889 | 0x020a54c0 | 124 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_02287774.c (+0 B) |
| D-0890 | 0x020a553c | 164 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200af24.c (+0 B) |
| D-0891 | 0x020a55e0 | 116 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02038f3c.c (+0 B) |
| D-0892 | 0x020a5a34 | 96 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001e94.c (+0 B) |
| D-0893 | 0x020a5e04 | 100 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201f090.c (+0 B) |
| D-0894 | 0x020a5e90 | 128 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02091a0c.legacy.c (+0 B) |
| D-0895 | 0x020a6444 | 208 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+12 B) |
| D-0896 | 0x020a6514 | 236 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad1f4.c (+4 B) |
| D-0897 | 0x020a6788 | 68 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201ac1c.c (+0 B) |
| D-0898 | 0x020a67cc | 68 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201ac1c.c (+0 B) |
| D-0899 | 0x020a6810 | 72 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02046718.legacy_sp3.c (+0 B) |
| D-0900 | 0x020a6858 | 72 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02046718.legacy_sp3.c (+0 B) |
| D-0901 | 0x020a68a0 | 64 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02011a3c.c (+0 B) |
| D-0902 | 0x020a68e0 | 68 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201ac1c.c (+0 B) |
| D-0903 | 0x020a6a28 | 108 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02068380.c (+0 B) |
| D-0904 | 0x020a6a94 | 104 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200b2f4.c (+0 B) |
| D-0905 | 0x020a6afc | 52 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200a454.c (+0 B) |
| D-0906 | 0x020a6ce0 | 104 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200b2f4.c (+0 B) |
| D-0907 | 0x020a7268 | 136 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021dc020.thumb.c (+2 B) |
| D-0908 | 0x020a72f0 | 120 | loop | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020921dc.legacy.c (+0 B) |
| D-0909 | 0x020a7388 | 76 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200b1bc.c (+0 B) |
| D-0910 | 0x020a73e8 | 44 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201a594.c (+0 B) |
| D-0911 | 0x020a7414 | 44 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201a594.c (+0 B) |
| D-0912 | 0x020a7440 | 64 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02011a3c.c (+0 B) |
| D-0913 | 0x020a7480 | 176 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/Scene_Update.c (+4 B) |
| D-0914 | 0x020aadf8 | 200 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020364c4.c (+8 B) |
| D-0915 | 0x020aaec0 | 80 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008548.c (+0 B) |
| D-0916 | 0x020aaf10 | 48 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02031f40.c (+0 B) |
| D-0917 | 0x020ab054 | 52 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200a454.c (+0 B) |
| D-0918 | 0x020ab0c4 | 108 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02068380.c (+0 B) |
| D-0919 | 0x020aee78 | 52 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200a454.c (+0 B) |
| D-0920 | 0x020b0390 | 108 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02068380.c (+0 B) |
| D-0921 | 0x020b03fc | 76 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200b1bc.c (+0 B) |
| D-0922 | 0x020b048c | 204 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020364c4.c (+12 B) |
| D-0923 | 0x020b06dc | 156 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0206a8c0.legacy_sp3.c (+4 B) |
| D-0924 | 0x020b0afc | 224 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+4 B) |
| D-0925 | 0x020b0bdc | 224 | loop | GLOBAL_ASM / brief 294+302 | yes: src/overlay018/func_ov018_021ad118.c (+4 B) |
| D-0926 | 0x020b10e0 | 168 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200af24.c (+4 B) |
| D-0927 | 0x020b18f0 | 104 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200b2f4.c (+0 B) |
| D-0928 | 0x020b30e4 | 132 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02092388.legacy.c (+0 B) |
| D-0929 | 0x020b41f8 | 80 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008548.c (+0 B) |
| D-0930 | 0x020b4248 | 52 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200a454.c (+0 B) |
| D-0931 | 0x020b4284 | 44 | loop | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201a594.c (+0 B) |
| D-0932 | 0x020402ec | 80 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008c84.c (+0 B) |
| D-0933 | 0x0204033c | 64 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b8e0.legacy.c (+0 B) |
| D-0934 | 0x02040c98 | 40 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b2a4.legacy.c (+0 B) |
| D-0935 | 0x02040d94 | 84 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/SysWork_GetPointDistance.c (+0 B) |
| D-0936 | 0x020413b0 | 192 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay012/func_ov012_021cbeb4.c (+0 B) |
| D-0937 | 0x020414b0 | 112 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay000/func_ov000_021aaa58.c (+0 B) |
| D-0938 | 0x020417e8 | 196 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0207f420.legacy_sp3.c (+4 B) |
| D-0939 | 0x02041ca8 | 256 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021c669c.c (+4 B) |
| D-0940 | 0x02041dbc | 92 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001d0c.c (+0 B) |
| D-0941 | 0x02041ea0 | 100 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001ddc.c (+0 B) |
| D-0942 | 0x02042190 | 72 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020062cc.c (+0 B) |
| D-0943 | 0x0204320c | 68 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a66a4.legacy.c (+0 B) |
| D-0944 | 0x02043a78 | 192 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay012/func_ov012_021cbeb4.c (+0 B) |
| D-0945 | 0x02044254 | 124 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021ec094.c (+0 B) |
| D-0946 | 0x02044610 | 224 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005298.c (+4 B) |
| D-0947 | 0x02044724 | 52 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b2cc.legacy.c (+0 B) |
| D-0948 | 0x02044c60 | 88 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200aa08.c (+0 B) |
| D-0949 | 0x02044e58 | 80 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008c84.c (+0 B) |
| D-0950 | 0x02044ea8 | 68 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a66a4.legacy.c (+0 B) |
| D-0951 | 0x0204559c | 124 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021ec094.c (+0 B) |
| D-0952 | 0x020457d8 | 80 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008c84.c (+0 B) |
| D-0953 | 0x02045954 | 96 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0206e224.legacy.c (+0 B) |
| D-0954 | 0x02045c34 | 72 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020062cc.c (+0 B) |
| D-0955 | 0x02045c7c | 60 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a60c0.legacy.c (+0 B) |
| D-0956 | 0x02045cb8 | 72 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020062cc.c (+0 B) |
| D-0957 | 0x020468ec | 200 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0207f420.legacy_sp3.c (+0 B) |
| D-0958 | 0x020469d0 | 76 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02012560.c (+0 B) |
| D-0959 | 0x02047de8 | 160 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021b2cbc.c (+0 B) |
| D-0960 | 0x020489c4 | 52 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b2cc.legacy.c (+0 B) |
| D-0961 | 0x02048bc0 | 104 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201d398.c (+0 B) |
| D-0962 | 0x020490dc | 68 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a66a4.legacy.c (+0 B) |
| D-0963 | 0x020491ec | 132 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200592c.c (+0 B) |
| D-0964 | 0x02049270 | 96 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0206e224.legacy.c (+0 B) |
| D-0965 | 0x020492d0 | 76 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02012560.c (+0 B) |
| D-0966 | 0x0204937c | 180 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e334.legacy.c (+0 B) |
| D-0967 | 0x02049554 | 224 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005298.c (+4 B) |
| D-0968 | 0x0204965c | 40 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b2a4.legacy.c (+0 B) |
| D-0969 | 0x0204b034 | 116 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202b360.c (+0 B) |
| D-0970 | 0x0204bd8c | 56 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001c98.c (+0 B) |
| D-0971 | 0x0204bf00 | 68 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a66a4.legacy.c (+0 B) |
| D-0972 | 0x0204ce3c | 84 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/SysWork_GetPointDistance.c (+0 B) |
| D-0973 | 0x0204f040 | 104 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201d398.c (+0 B) |
| D-0974 | 0x0204f310 | 176 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay008/func_ov008_021ac2ac.c (+0 B) |
| D-0975 | 0x0204f820 | 208 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay001/func_ov001_021ca074.c (+0 B) |
| D-0976 | 0x0205000c | 72 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020062cc.c (+0 B) |
| D-0977 | 0x02050054 | 196 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0207f420.legacy_sp3.c (+4 B) |
| D-0978 | 0x02051384 | 168 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021bf454.c (+0 B) |
| D-0979 | 0x020525dc | 64 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b8e0.legacy.c (+0 B) |
| D-0980 | 0x02052674 | 68 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a66a4.legacy.c (+0 B) |
| D-0981 | 0x0205272c | 60 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a60c0.legacy.c (+0 B) |
| D-0982 | 0x02052e30 | 96 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0206e224.legacy.c (+0 B) |
| D-0983 | 0x02053114 | 68 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a66a4.legacy.c (+0 B) |
| D-0984 | 0x020532f4 | 136 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021b3290.c (+0 B) |
| D-0985 | 0x0205337c | 144 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021eec48.c (+0 B) |
| D-0986 | 0x020534b4 | 32 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/Vram_GetBankBaseCD.c (+0 B) |
| D-0987 | 0x020534d4 | 112 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay000/func_ov000_021aaa58.c (+0 B) |
| D-0988 | 0x020536d0 | 52 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b2cc.legacy.c (+0 B) |
| D-0989 | 0x020538b0 | 188 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay012/func_ov012_021cbeb4.c (+4 B) |
| D-0990 | 0x02053a64 | 80 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008c84.c (+0 B) |
| D-0991 | 0x020542b8 | 92 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001d0c.c (+0 B) |
| D-0992 | 0x02054840 | 40 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b2a4.legacy.c (+0 B) |
| D-0993 | 0x02054ad0 | 48 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0209150c.legacy.c (+0 B) |
| D-0994 | 0x02054c0c | 36 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b16c.legacy.c (+0 B) |
| D-0995 | 0x02054c30 | 52 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b2cc.legacy.c (+0 B) |
| D-0996 | 0x02054c78 | 48 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0209150c.legacy.c (+0 B) |
| D-0997 | 0x02054d14 | 56 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001c98.c (+0 B) |
| D-0998 | 0x02054d68 | 52 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b2cc.legacy.c (+0 B) |
| D-0999 | 0x02054f44 | 140 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021d3818.c (+0 B) |
| D-1000 | 0x02055128 | 72 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020062cc.c (+0 B) |
| D-1001 | 0x02055170 | 72 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020062cc.c (+0 B) |
| D-1002 | 0x020551b8 | 76 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02012560.c (+0 B) |
| D-1003 | 0x02055204 | 76 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02012560.c (+0 B) |
| D-1004 | 0x02055e28 | 56 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001c98.c (+0 B) |
| D-1005 | 0x02056068 | 64 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b8e0.legacy.c (+0 B) |
| D-1006 | 0x020566f4 | 72 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020062cc.c (+0 B) |
| D-1007 | 0x02056c34 | 232 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/func_ov021_021abbc8.c (+4 B) |
| D-1008 | 0x02057730 | 168 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021bf454.c (+0 B) |
| D-1009 | 0x0205a0ec | 160 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021b2cbc.c (+0 B) |
| D-1010 | 0x0205c6e4 | 100 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001ddc.c (+0 B) |
| D-1011 | 0x0205c748 | 144 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021eec48.c (+0 B) |
| D-1012 | 0x0205d560 | 64 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b8e0.legacy.c (+0 B) |
| D-1013 | 0x0205d5c8 | 76 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02012560.c (+0 B) |
| D-1014 | 0x0205d688 | 52 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b2cc.legacy.c (+0 B) |
| D-1015 | 0x0205d6bc | 60 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a60c0.legacy.c (+0 B) |
| D-1016 | 0x0205d944 | 92 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001d0c.c (+0 B) |
| D-1017 | 0x0205fd94 | 132 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200592c.c (+0 B) |
| D-1018 | 0x0205fe18 | 164 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021b2324.c (+0 B) |
| D-1019 | 0x020608b4 | 164 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021b2324.c (+0 B) |
| D-1020 | 0x02060958 | 228 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/func_ov021_021abbc8.c (+0 B) |
| D-1021 | 0x02060a3c | 152 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021f0174.c (+0 B) |
| D-1022 | 0x02060ad4 | 176 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay008/func_ov008_021ac2ac.c (+0 B) |
| D-1023 | 0x02061540 | 56 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001c98.c (+0 B) |
| D-1024 | 0x0206205c | 124 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021ec094.c (+0 B) |
| D-1025 | 0x02062280 | 72 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020062cc.c (+0 B) |
| D-1026 | 0x02062320 | 108 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay008/func_ov008_021aa4a0.c (+0 B) |
| D-1027 | 0x02062834 | 124 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021ec094.c (+0 B) |
| D-1028 | 0x020628b0 | 76 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02012560.c (+0 B) |
| D-1029 | 0x020629b8 | 104 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201d398.c (+0 B) |
| D-1030 | 0x02062aec | 92 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001d0c.c (+0 B) |
| D-1031 | 0x02062b48 | 92 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001d0c.c (+0 B) |
| D-1032 | 0x02062ba4 | 116 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202b360.c (+0 B) |
| D-1033 | 0x02062c18 | 92 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001d0c.c (+0 B) |
| D-1034 | 0x02062c74 | 136 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021b3290.c (+0 B) |
| D-1035 | 0x02062cfc | 140 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay004/func_ov004_021d3818.c (+0 B) |
| D-1036 | 0x02062d88 | 112 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay000/func_ov000_021aaa58.c (+0 B) |
| D-1037 | 0x02062df8 | 116 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202b360.c (+0 B) |
| D-1038 | 0x02062fc0 | 116 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202b360.c (+0 B) |
| D-1039 | 0x02063620 | 68 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a66a4.legacy.c (+0 B) |
| D-1040 | 0x02063664 | 172 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/func_ov021_021aadbc.c (+0 B) |
| D-1041 | 0x02063dc8 | 68 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a66a4.legacy.c (+0 B) |
| D-1042 | 0x020644c4 | 60 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a60c0.legacy.c (+0 B) |
| D-1043 | 0x02064544 | 60 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a60c0.legacy.c (+0 B) |
| D-1044 | 0x02064d10 | 56 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001c98.c (+0 B) |
| D-1045 | 0x02064d88 | 40 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b2a4.legacy.c (+0 B) |
| D-1046 | 0x02064db0 | 76 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02012560.c (+0 B) |
| D-1047 | 0x02065470 | 204 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0207f420.legacy_sp3.c (+4 B) |
| D-1048 | 0x02065974 | 56 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001c98.c (+0 B) |
| D-1049 | 0x02065d18 | 52 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b2cc.legacy.c (+0 B) |
| D-1050 | 0x02065dc0 | 84 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/SysWork_GetPointDistance.c (+0 B) |
| D-1051 | 0x02065e40 | 56 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001c98.c (+0 B) |
| D-1052 | 0x02066224 | 88 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200aa08.c (+0 B) |
| D-1053 | 0x0206677c | 108 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay008/func_ov008_021aa4a0.c (+0 B) |
| D-1054 | 0x02066a88 | 96 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0206e224.legacy.c (+0 B) |
| D-1055 | 0x02066e00 | 160 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021b2cbc.c (+0 B) |
| D-1056 | 0x02066ea0 | 64 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b8e0.legacy.c (+0 B) |
| D-1057 | 0x02067294 | 96 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0206e224.legacy.c (+0 B) |
| D-1058 | 0x020678b8 | 204 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0207f420.legacy_sp3.c (+4 B) |
| D-1059 | 0x02067b54 | 56 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001c98.c (+0 B) |
| D-1060 | 0x02067e94 | 168 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021bf454.c (+0 B) |
| D-1061 | 0x02068b54 | 64 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b8e0.legacy.c (+0 B) |
| D-1062 | 0x02068bb8 | 80 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008c84.c (+0 B) |
| D-1063 | 0x02068d24 | 44 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b920.legacy.c (+0 B) |
| D-1064 | 0x02068d50 | 72 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020062cc.c (+0 B) |
| D-1065 | 0x02068d98 | 88 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200aa08.c (+0 B) |
| D-1066 | 0x02069454 | 184 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e334.legacy.c (+4 B) |
| D-1067 | 0x020699f4 | 144 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021eec48.c (+0 B) |
| D-1068 | 0x0206afec | 92 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001d0c.c (+0 B) |
| D-1069 | 0x0206b4fc | 108 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay008/func_ov008_021aa4a0.c (+0 B) |
| D-1070 | 0x0206b670 | 76 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02012560.c (+0 B) |
| D-1071 | 0x0206b7d8 | 60 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a60c0.legacy.c (+0 B) |
| D-1072 | 0x0206b88c | 112 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay000/func_ov000_021aaa58.c (+0 B) |
| D-1073 | 0x0206b8fc | 112 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay000/func_ov000_021aaa58.c (+0 B) |
| D-1074 | 0x0206ba4c | 100 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001ddc.c (+0 B) |
| D-1075 | 0x0206baec | 124 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021ec094.c (+0 B) |
| D-1076 | 0x0206c110 | 120 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0205c928.c (+0 B) |
| D-1077 | 0x0206c4b0 | 124 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021ec094.c (+0 B) |
| D-1078 | 0x0206ceb8 | 88 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200aa08.c (+0 B) |
| D-1079 | 0x0206e1e8 | 60 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a60c0.legacy.c (+0 B) |
| D-1080 | 0x0206e778 | 56 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001c98.c (+0 B) |
| D-1081 | 0x0206ea90 | 120 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0205c928.c (+0 B) |
| D-1082 | 0x0206eb08 | 68 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a66a4.legacy.c (+0 B) |
| D-1083 | 0x0206ee40 | 96 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0206e224.legacy.c (+0 B) |
| D-1084 | 0x0206f48c | 112 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay000/func_ov000_021aaa58.c (+0 B) |
| D-1085 | 0x0207103c | 80 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008c84.c (+0 B) |
| D-1086 | 0x02072144 | 240 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay003/func_ov003_021ca10c.c (+0 B) |
| D-1087 | 0x02072bcc | 172 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/func_ov021_021aadbc.c (+0 B) |
| D-1088 | 0x02073040 | 188 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay012/func_ov012_021cbeb4.c (+4 B) |
| D-1089 | 0x02073738 | 256 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021c669c.c (+4 B) |
| D-1090 | 0x02073f28 | 92 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001d0c.c (+0 B) |
| D-1091 | 0x02074088 | 60 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a60c0.legacy.c (+0 B) |
| D-1092 | 0x020740c4 | 96 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0206e224.legacy.c (+0 B) |
| D-1093 | 0x0207576c | 116 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202b360.c (+0 B) |
| D-1094 | 0x0207651c | 64 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b8e0.legacy.c (+0 B) |
| D-1095 | 0x02076764 | 100 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001ddc.c (+0 B) |
| D-1096 | 0x020767c8 | 168 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021bf454.c (+0 B) |
| D-1097 | 0x02077b5c | 60 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a60c0.legacy.c (+0 B) |
| D-1098 | 0x02077e58 | 116 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202b360.c (+0 B) |
| D-1099 | 0x0207845c | 60 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a60c0.legacy.c (+0 B) |
| D-1100 | 0x02078498 | 116 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202b360.c (+0 B) |
| D-1101 | 0x02078d88 | 68 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a66a4.legacy.c (+0 B) |
| D-1102 | 0x0207b13c | 80 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008c84.c (+0 B) |
| D-1103 | 0x0207cff4 | 104 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201d398.c (+0 B) |
| D-1104 | 0x0207d458 | 60 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a60c0.legacy.c (+0 B) |
| D-1105 | 0x0207da1c | 44 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b920.legacy.c (+0 B) |
| D-1106 | 0x0207dc5c | 76 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02012560.c (+0 B) |
| D-1107 | 0x0207e1c4 | 80 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008c84.c (+0 B) |
| D-1108 | 0x0207e54c | 72 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020062cc.c (+0 B) |
| D-1109 | 0x0207e664 | 72 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020062cc.c (+0 B) |
| D-1110 | 0x0207e6bc | 36 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b16c.legacy.c (+0 B) |
| D-1111 | 0x0207e6f0 | 72 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020062cc.c (+0 B) |
| D-1112 | 0x0207e748 | 72 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020062cc.c (+0 B) |
| D-1113 | 0x0207eae4 | 36 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b16c.legacy.c (+0 B) |
| D-1114 | 0x0207fd60 | 68 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a66a4.legacy.c (+0 B) |
| D-1115 | 0x020805b0 | 92 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001d0c.c (+0 B) |
| D-1116 | 0x02080728 | 144 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021eec48.c (+0 B) |
| D-1117 | 0x020807fc | 188 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay012/func_ov012_021cbeb4.c (+4 B) |
| D-1118 | 0x02080cdc | 92 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001d0c.c (+0 B) |
| D-1119 | 0x02082138 | 96 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0206e224.legacy.c (+0 B) |
| D-1120 | 0x0208226c | 52 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b2cc.legacy.c (+0 B) |
| D-1121 | 0x02085888 | 68 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a66a4.legacy.c (+0 B) |
| D-1122 | 0x020858cc | 192 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay012/func_ov012_021cbeb4.c (+0 B) |
| D-1123 | 0x0208598c | 232 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/func_ov021_021abbc8.c (+4 B) |
| D-1124 | 0x02085a74 | 72 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020062cc.c (+0 B) |
| D-1125 | 0x02085abc | 124 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021ec094.c (+0 B) |
| D-1126 | 0x02085b38 | 216 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005298.c (+4 B) |
| D-1127 | 0x020865d0 | 80 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008c84.c (+0 B) |
| D-1128 | 0x02086620 | 224 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005298.c (+4 B) |
| D-1129 | 0x02086700 | 256 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021c669c.c (+4 B) |
| D-1130 | 0x02086848 | 132 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200592c.c (+0 B) |
| D-1131 | 0x020868cc | 244 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay007/func_ov007_021b299c.c (+0 B) |
| D-1132 | 0x02086cc4 | 172 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/func_ov021_021aadbc.c (+0 B) |
| D-1133 | 0x02086d70 | 212 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay001/func_ov001_021ca074.c (+4 B) |
| D-1134 | 0x02086e44 | 92 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001d0c.c (+0 B) |
| D-1135 | 0x02086ea0 | 132 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200592c.c (+0 B) |
| D-1136 | 0x02086f24 | 232 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/func_ov021_021abbc8.c (+4 B) |
| D-1137 | 0x0208725c | 160 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021b2cbc.c (+0 B) |
| D-1138 | 0x020873fc | 72 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020062cc.c (+0 B) |
| D-1139 | 0x02087640 | 80 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008c84.c (+0 B) |
| D-1140 | 0x0208787c | 72 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020062cc.c (+0 B) |
| D-1141 | 0x020878c4 | 84 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/SysWork_GetPointDistance.c (+0 B) |
| D-1142 | 0x02087918 | 60 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a60c0.legacy.c (+0 B) |
| D-1143 | 0x02087df4 | 56 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001c98.c (+0 B) |
| D-1144 | 0x02087e54 | 60 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a60c0.legacy.c (+0 B) |
| D-1145 | 0x02087f34 | 148 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e43c.legacy.c (+0 B) |
| D-1146 | 0x02088070 | 76 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02012560.c (+0 B) |
| D-1147 | 0x0208822c | 60 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a60c0.legacy.c (+0 B) |
| D-1148 | 0x020882fc | 84 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/SysWork_GetPointDistance.c (+0 B) |
| D-1149 | 0x020887a0 | 124 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021ec094.c (+0 B) |
| D-1150 | 0x0208881c | 88 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200aa08.c (+0 B) |
| D-1151 | 0x02088d8c | 76 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02012560.c (+0 B) |
| D-1152 | 0x02088dd8 | 148 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e43c.legacy.c (+0 B) |
| D-1153 | 0x02088ee4 | 176 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay008/func_ov008_021ac2ac.c (+0 B) |
| D-1154 | 0x0208906c | 120 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0205c928.c (+0 B) |
| D-1155 | 0x020896cc | 124 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021ec094.c (+0 B) |
| D-1156 | 0x02089768 | 72 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020062cc.c (+0 B) |
| D-1157 | 0x020897b0 | 60 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a60c0.legacy.c (+0 B) |
| D-1158 | 0x02089a84 | 224 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005298.c (+4 B) |
| D-1159 | 0x02089f60 | 160 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021b2cbc.c (+0 B) |
| D-1160 | 0x0208a440 | 172 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/func_ov021_021aadbc.c (+0 B) |
| D-1161 | 0x0208a4ec | 136 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021b3290.c (+0 B) |
| D-1162 | 0x0208a574 | 112 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay000/func_ov000_021aaa58.c (+0 B) |
| D-1163 | 0x0208a728 | 60 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a60c0.legacy.c (+0 B) |
| D-1164 | 0x0208afac | 84 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/SysWork_GetPointDistance.c (+0 B) |
| D-1165 | 0x0208b070 | 52 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b2cc.legacy.c (+0 B) |
| D-1166 | 0x0208b1e0 | 196 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0207f420.legacy_sp3.c (+4 B) |
| D-1167 | 0x0208b300 | 44 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b920.legacy.c (+0 B) |
| D-1168 | 0x0208be9c | 60 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a60c0.legacy.c (+0 B) |
| D-1169 | 0x0208c348 | 156 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021f0174.c (+4 B) |
| D-1170 | 0x0208c3e4 | 68 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a66a4.legacy.c (+0 B) |
| D-1171 | 0x0208c8cc | 116 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202b360.c (+0 B) |
| D-1172 | 0x0208cb88 | 128 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021b26e0.c (+0 B) |
| D-1173 | 0x0208cd64 | 228 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay021/func_ov021_021abbc8.c (+0 B) |
| D-1174 | 0x0208cf6c | 56 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001c98.c (+0 B) |
| D-1175 | 0x0208dce4 | 184 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e334.legacy.c (+4 B) |
| D-1176 | 0x0208df0c | 52 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b2cc.legacy.c (+0 B) |
| D-1177 | 0x0208df60 | 52 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b2cc.legacy.c (+0 B) |
| D-1178 | 0x0208e1cc | 52 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b2cc.legacy.c (+0 B) |
| D-1179 | 0x0208e220 | 52 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b2cc.legacy.c (+0 B) |
| D-1180 | 0x0208e5ec | 48 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0209150c.legacy.c (+0 B) |
| D-1181 | 0x0208ea74 | 204 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0207f420.legacy_sp3.c (+4 B) |
| D-1182 | 0x02090114 | 72 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020062cc.c (+0 B) |
| D-1183 | 0x02090330 | 128 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021b26e0.c (+0 B) |
| D-1184 | 0x02090574 | 52 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b2cc.legacy.c (+0 B) |
| D-1185 | 0x020905a8 | 52 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b2cc.legacy.c (+0 B) |
| D-1186 | 0x020905dc | 72 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020062cc.c (+0 B) |
| D-1187 | 0x02090624 | 56 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001c98.c (+0 B) |
| D-1188 | 0x0209065c | 52 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b2cc.legacy.c (+0 B) |
| D-1189 | 0x02090690 | 76 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02012560.c (+0 B) |
| D-1190 | 0x020906dc | 76 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02012560.c (+0 B) |
| D-1191 | 0x020908c0 | 48 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0209150c.legacy.c (+0 B) |
| D-1192 | 0x0209226c | 108 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay008/func_ov008_021aa4a0.c (+0 B) |
| D-1193 | 0x0209295c | 80 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008c84.c (+0 B) |
| D-1194 | 0x020939a4 | 124 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021ec094.c (+0 B) |
| D-1195 | 0x02093b00 | 240 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay003/func_ov003_021ca10c.c (+0 B) |
| D-1196 | 0x020949f0 | 48 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0209150c.legacy.c (+0 B) |
| D-1197 | 0x02094e90 | 88 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200aa08.c (+0 B) |
| D-1198 | 0x02094fe4 | 76 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02012560.c (+0 B) |
| D-1199 | 0x02095e28 | 56 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001c98.c (+0 B) |
| D-1200 | 0x0209640c | 40 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b2a4.legacy.c (+0 B) |
| D-1201 | 0x02097004 | 56 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001c98.c (+0 B) |
| D-1202 | 0x0209703c | 56 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001c98.c (+0 B) |
| D-1203 | 0x02097074 | 52 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b2cc.legacy.c (+0 B) |
| D-1204 | 0x020975f0 | 120 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0205c928.c (+0 B) |
| D-1205 | 0x02097dc4 | 84 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/SysWork_GetPointDistance.c (+0 B) |
| D-1206 | 0x02097e5c | 72 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020062cc.c (+0 B) |
| D-1207 | 0x0209815c | 68 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a66a4.legacy.c (+0 B) |
| D-1208 | 0x02098388 | 48 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0209150c.legacy.c (+0 B) |
| D-1209 | 0x020986c0 | 76 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02012560.c (+0 B) |
| D-1210 | 0x02098c70 | 40 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b2a4.legacy.c (+0 B) |
| D-1211 | 0x02098c98 | 68 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a66a4.legacy.c (+0 B) |
| D-1212 | 0x020992d8 | 152 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay002/func_ov002_021f0174.c (+0 B) |
| D-1213 | 0x020996c8 | 80 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008c84.c (+0 B) |
| D-1214 | 0x02099ba8 | 64 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b8e0.legacy.c (+0 B) |
| D-1215 | 0x02099be8 | 60 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a60c0.legacy.c (+0 B) |
| D-1216 | 0x0209bdc8 | 216 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02005298.c (+4 B) |
| D-1217 | 0x0209c31c | 72 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_020062cc.c (+0 B) |
| D-1218 | 0x0209d0f8 | 88 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0200aa08.c (+0 B) |
| D-1219 | 0x0209d664 | 56 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001c98.c (+0 B) |
| D-1220 | 0x0209e0f0 | 52 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b2cc.legacy.c (+0 B) |
| D-1221 | 0x0209f404 | 108 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay008/func_ov008_021aa4a0.c (+0 B) |
| D-1222 | 0x0209f470 | 164 | other | GLOBAL_ASM / brief 294+302 | yes: src/overlay006/func_ov006_021b2324.c (+0 B) |
| D-1223 | 0x0209f8c8 | 60 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a60c0.legacy.c (+0 B) |
| D-1224 | 0x020a10e8 | 68 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a66a4.legacy.c (+0 B) |
| D-1225 | 0x020a2f9c | 48 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0209150c.legacy.c (+0 B) |
| D-1226 | 0x020a3308 | 52 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b2cc.legacy.c (+0 B) |
| D-1227 | 0x020a3654 | 96 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0206e224.legacy.c (+0 B) |
| D-1228 | 0x020a37e0 | 80 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02008c84.c (+0 B) |
| D-1229 | 0x020a3ac0 | 60 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a60c0.legacy.c (+0 B) |
| D-1230 | 0x020a3afc | 36 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b16c.legacy.c (+0 B) |
| D-1231 | 0x020a53e4 | 116 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0202b360.c (+0 B) |
| D-1232 | 0x020a5d74 | 60 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a60c0.legacy.c (+0 B) |
| D-1233 | 0x020a60fc | 64 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b8e0.legacy.c (+0 B) |
| D-1234 | 0x020a66e8 | 56 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_02001c98.c (+0 B) |
| D-1235 | 0x020a6720 | 52 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b2cc.legacy.c (+0 B) |
| D-1236 | 0x020a6754 | 52 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b2cc.legacy.c (+0 B) |
| D-1237 | 0x020a6d54 | 60 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a60c0.legacy.c (+0 B) |
| D-1238 | 0x020a95a0 | 68 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_020a66a4.legacy.c (+0 B) |
| D-1239 | 0x020a96fc | 104 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/func_0201d398.c (+0 B) |
| D-1240 | 0x020aac30 | 84 | other | GLOBAL_ASM / brief 294+302 | yes: src/main/SysWork_GetPointDistance.c (+0 B) |
| D-1241 | 0x020aed64 | 64 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b8e0.legacy.c (+0 B) |
| D-1242 | 0x020b044c | 64 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b8e0.legacy.c (+0 B) |
| D-1243 | 0x020b17ac | 148 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208e43c.legacy.c (+0 B) |
| D-1244 | 0x020b18c4 | 44 | other | GLOBAL_ASM / brief 294+302 | yes: libs/nitro/func_0208b920.legacy.c (+0 B) |

## Gate

Doc-only gate: the source set, headers, delinks spans, and sibling census were read without a build. The worklist is a snapshot; any ship changes both the row count and the sibling pool.
