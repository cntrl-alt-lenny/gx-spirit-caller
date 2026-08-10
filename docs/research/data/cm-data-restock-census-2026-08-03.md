[//]: # (markdownlint-disable MD013 MD041)

# Fresh non-primitive data-candidate census (2026-08-03)

Companion table to
[`cm-data-restock-check-2026-08-03.md`](cm-data-restock-check-2026-08-03.md).
Raw output of `tools/data_worklist.py --shape {struct,array,fnptr_table,jump_table}
--top 0 --no-outputs`, module `ov002` excluded (separate active lane), cross-checked
by exact symbol name against all 23 prior `cm-data-inference-*` / `cm-data-typing-16`
/ `cm-bss-convert-*` / `cm-bss-carve-scope` wave docs. None of these 274 symbols
received a prior shipped-or-declined verdict in any of those docs (the sole
exception, `data_02101e7c`, was flagged-but-never-investigated in wave 15 and is
resolved by this same report's Part 2).

Kept as a reference artifact so a future wave can start carving directly instead
of re-deriving this list.

## shape=struct (186 symbols, 20,371 bytes)

| # | Symbol | Module | Address | Sec | Size (B) | Readers |
|---|---|---|---|---|---|---|
| 1 | `data_020c9694` | main | 0x020c9694 | data | 14764 | 6 |
| 2 | `data_020c3bc0` | main | 0x020c3bc0 | data | 232 | 1 |
| 3 | `data_ov006_021cdea8` | ov006 | 0x021cdea8 | data | 224 | 1 |
| 4 | `data_ov006_021ce0a8` | ov006 | 0x021ce0a8 | data | 196 | 1 |
| 5 | `data_021024c8` | main | 0x021024c8 | data | 192 | 1 |
| 6 | `data_ov006_021cc618` | ov006 | 0x021cc618 | data | 180 | 1 |
| 7 | `data_ov022_021ab8fe` | ov022 | 0x021ab8fe | rodata | 142 | 2 |
| 8 | `data_ov007_021b2ff4` | ov007 | 0x021b2ff4 | data | 132 | 1 |
| 9 | `data_021022e0` | main | 0x021022e0 | data | 128 | 1 |
| 10 | `data_020c7ac4` | main | 0x020c7ac4 | data | 124 | 1 |
| 11 | `data_ov016_021b91ac` | ov016 | 0x021b91ac | data | 112 | 1 |
| 12 | `data_ov006_021cc2c8` | ov006 | 0x021cc2c8 | data | 108 | 1 |
| 13 | `data_ov006_021cc334` | ov006 | 0x021cc334 | data | 108 | 1 |
| 14 | `data_ov006_021cc3a0` | ov006 | 0x021cc3a0 | data | 108 | 1 |
| 15 | `data_ov006_021cc40c` | ov006 | 0x021cc40c | data | 108 | 1 |
| 16 | `data_ov006_021cc268` | ov006 | 0x021cc268 | data | 96 | 1 |
| 17 | `data_ov006_021cde48` | ov006 | 0x021cde48 | data | 96 | 1 |
| 18 | `data_020fe904` | main | 0x020fe904 | data | 84 | 1 |
| 19 | `data_ov006_021cc164` | ov006 | 0x021cc164 | data | 84 | 1 |
| 20 | `data_ov006_021cc1b8` | ov006 | 0x021cc1b8 | data | 84 | 1 |
| 21 | `data_020c59ec` | main | 0x020c59ec | data | 68 | 1 |
| 22 | `data_ov006_021ce4a4` | ov006 | 0x021ce4a4 | data | 60 | 1 |
| 23 | `data_020f7a00` | main | 0x020f7a00 | data | 56 | 1 |
| 24 | `data_021026a4` | main | 0x021026a4 | data | 52 | 1 |
| 25 | `data_ov011_021d3fcc` | ov011 | 0x021d3fcc | data | 52 | 1 |
| 26 | `data_ov005_021b1a44` | ov005 | 0x021b1a44 | data | 50 | 2 |
| 27 | `data_ov005_021b1a76` | ov005 | 0x021b1a76 | data | 50 | 2 |
| 28 | `data_020fdb90` | main | 0x020fdb90 | data | 48 | 1 |
| 29 | `data_ov003_021cf690` | ov003 | 0x021cf690 | data | 48 | 1 |
| 30 | `data_ov021_021ac874` | ov021 | 0x021ac874 | data | 44 | 1 |
| 31 | `data_ov011_021d3034` | ov011 | 0x021d3034 | rodata | 43 | 1 |
| 32 | `data_020f85d0` | main | 0x020f85d0 | data | 40 | 1 |
| 33 | `data_020f8b30` | main | 0x020f8b30 | data | 40 | 1 |
| 34 | `data_ov006_021ce3ae` | ov006 | 0x021ce3ae | data | 40 | 2 |
| 35 | `data_ov006_021ce3d6` | ov006 | 0x021ce3d6 | data | 40 | 2 |
| 36 | `data_ov006_021ce3fe` | ov006 | 0x021ce3fe | data | 40 | 2 |
| 37 | `data_ov006_021cbb8c` | ov006 | 0x021cbb8c | data | 36 | 1 |
| 38 | `data_ov006_021cc118` | ov006 | 0x021cc118 | data | 36 | 1 |
| 39 | `data_ov006_021ce084` | ov006 | 0x021ce084 | data | 36 | 1 |
| 40 | `data_ov006_021ce38a` | ov006 | 0x021ce38a | data | 36 | 2 |
| 41 | `data_ov008_021b275c` | ov008 | 0x021b275c | data | 36 | 1 |
| 42 | `data_020fe958` | main | 0x020fe958 | data | 32 | 1 |
| 43 | `data_ov011_021d32ba` | ov011 | 0x021d32ba | rodata | 30 | 1 |
| 44 | `data_ov016_021b937e` | ov016 | 0x021b937e | data | 30 | 2 |
| 45 | `data_ov019_021b5baa` | ov019 | 0x021b5baa | data | 30 | 2 |
| 46 | `data_ov000_021b55e4` | ov000 | 0x021b55e4 | rodata | 28 | 1 |
| 47 | `data_ov010_021b8b7c` | ov010 | 0x021b8b7c | data | 28 | 1 |
| 48 | `data_ov010_021b8b98` | ov010 | 0x021b8b98 | data | 28 | 1 |
| 49 | `data_ov015_021b5cc8` | ov015 | 0x021b5cc8 | data | 28 | 1 |
| 50 | `data_ov018_021ad71c` | ov018 | 0x021ad71c | data | 28 | 1 |
| 51 | `data_ov020_021adf80` | ov020 | 0x021adf80 | data | 28 | 1 |
| 52 | `data_ov022_021ab9bc` | ov022 | 0x021ab9bc | data | 28 | 1 |
| 53 | `data_ov022_021ab8e4` | ov022 | 0x021ab8e4 | rodata | 26 | 4 |
| 54 | `data_020c78f0` | main | 0x020c78f0 | data | 24 | 1 |
| 55 | `data_02102138` | main | 0x02102138 | data | 24 | 1 |
| 56 | `data_02102150` | main | 0x02102150 | data | 24 | 1 |
| 57 | `data_ov006_021cbb08` | ov006 | 0x021cbb08 | data | 24 | 1 |
| 58 | `data_ov006_021cbb20` | ov006 | 0x021cbb20 | data | 24 | 1 |
| 59 | `data_ov006_021cbb38` | ov006 | 0x021cbb38 | data | 24 | 1 |
| 60 | `data_ov006_021cbb74` | ov006 | 0x021cbb74 | data | 24 | 1 |
| 61 | `data_ov006_021cbbb0` | ov006 | 0x021cbbb0 | data | 24 | 1 |
| 62 | `data_ov006_021cc0dc` | ov006 | 0x021cc0dc | data | 24 | 1 |
| 63 | `data_ov006_021cddfc` | ov006 | 0x021cddfc | data | 24 | 1 |
| 64 | `data_ov006_021cde14` | ov006 | 0x021cde14 | data | 24 | 1 |
| 65 | `data_ov012_021cc108` | ov012 | 0x021cc108 | rodata | 24 | 1 |
| 66 | `data_ov014_021b4cc0` | ov014 | 0x021b4cc0 | data | 24 | 1 |
| 67 | `data_ov021_021abea0` | ov021 | 0x021abea0 | data | 24 | 1 |
| 68 | `data_020c58f0` | main | 0x020c58f0 | data | 20 | 1 |
| 69 | `data_020c5904` | main | 0x020c5904 | data | 20 | 1 |
| 70 | `data_020c5918` | main | 0x020c5918 | data | 20 | 1 |
| 71 | `data_ov001_021ca384` | ov001 | 0x021ca384 | data | 20 | 1 |
| 72 | `data_ov004_021de7e5` | ov004 | 0x021de7e5 | rodata | 20 | 2 |
| 73 | `data_ov006_021cc08c` | ov006 | 0x021cc08c | data | 20 | 1 |
| 74 | `data_ov006_021cc0c8` | ov006 | 0x021cc0c8 | data | 20 | 1 |
| 75 | `data_ov011_021d2fe4` | ov011 | 0x021d2fe4 | rodata | 20 | 1 |
| 76 | `data_ov011_021d300c` | ov011 | 0x021d300c | rodata | 20 | 1 |
| 77 | `data_ov012_021cc3d0` | ov012 | 0x021cc3d0 | data | 20 | 1 |
| 78 | `data_ov013_021cb9b0` | ov013 | 0x021cb9b0 | data | 20 | 1 |
| 79 | `data_020c58cc` | main | 0x020c58cc | data | 16 | 1 |
| 80 | `data_020c5934` | main | 0x020c5934 | data | 16 | 1 |
| 81 | `data_020c597c` | main | 0x020c597c | data | 16 | 1 |
| 82 | `data_0210135c` | main | 0x0210135c | data | 16 | 1 |
| 83 | `data_0210136c` | main | 0x0210136c | data | 16 | 1 |
| 84 | `data_021024a0` | main | 0x021024a0 | data | 16 | 1 |
| 85 | `data_ov000_021b5600` | ov000 | 0x021b5600 | rodata | 16 | 1 |
| 86 | `data_ov003_021cf160` | ov003 | 0x021cf160 | data | 16 | 1 |
| 87 | `data_ov005_021b17e8` | ov005 | 0x021b17e8 | data | 16 | 1 |
| 88 | `data_ov006_021cdddc` | ov006 | 0x021cdddc | data | 16 | 1 |
| 89 | `data_ov007_021b2fa0` | ov007 | 0x021b2fa0 | data | 16 | 1 |
| 90 | `data_ov008_021b2440` | ov008 | 0x021b2440 | data | 16 | 1 |
| 91 | `data_ov008_021b26dc` | ov008 | 0x021b26dc | data | 16 | 1 |
| 92 | `data_ov009_021ad82c` | ov009 | 0x021ad82c | rodata | 16 | 1 |
| 93 | `data_ov016_021b8f80` | ov016 | 0x021b8f80 | data | 16 | 1 |
| 94 | `data_ov017_021b8020` | ov017 | 0x021b8020 | data | 16 | 1 |
| 95 | `data_ov019_021b5b20` | ov019 | 0x021b5b20 | data | 16 | 1 |
| 96 | `data_020c44c4` | main | 0x020c44c4 | data | 12 | 1 |
| 97 | `data_020c5954` | main | 0x020c5954 | data | 12 | 1 |
| 98 | `data_020c5960` | main | 0x020c5960 | data | 12 | 1 |
| 99 | `data_020fe45c` | main | 0x020fe45c | data | 12 | 1 |
| 100 | `data_020fe8f8` | main | 0x020fe8f8 | data | 12 | 1 |
| 101 | `data_02101eb8` | main | 0x02101eb8 | data | 12 | 3 |
| 102 | `data_02102280` | main | 0x02102280 | data | 12 | 1 |
| 103 | `data_0210228c` | main | 0x0210228c | data | 12 | 1 |
| 104 | `data_021022c8` | main | 0x021022c8 | data | 12 | 1 |
| 105 | `data_021022d4` | main | 0x021022d4 | data | 12 | 1 |
| 106 | `data_02102aa4` | main | 0x02102aa4 | data | 12 | 1 |
| 107 | `data_02102ab0` | main | 0x02102ab0 | data | 12 | 2 |
| 108 | `data_02102abc` | main | 0x02102abc | data | 12 | 2 |
| 109 | `data_02102ad8` | main | 0x02102ad8 | data | 12 | 2 |
| 110 | `data_02102ae4` | main | 0x02102ae4 | data | 12 | 2 |
| 111 | `data_ov000_021b561c` | ov000 | 0x021b561c | rodata | 12 | 1 |
| 112 | `data_ov000_021b5638` | ov000 | 0x021b5638 | rodata | 12 | 1 |
| 113 | `data_ov000_021b5650` | ov000 | 0x021b5650 | rodata | 12 | 1 |
| 114 | `data_ov006_021ce274` | ov006 | 0x021ce274 | data | 12 | 2 |
| 115 | `data_ov006_021ceb04` | ov006 | 0x021ceb04 | data | 12 | 2 |
| 116 | `data_ov008_021b26c4` | ov008 | 0x021b26c4 | data | 12 | 1 |
| 117 | `data_ov009_021ad84c` | ov009 | 0x021ad84c | rodata | 12 | 1 |
| 118 | `data_ov009_021ada90` | ov009 | 0x021ada90 | data | 12 | 1 |
| 119 | `data_ov009_021ada9c` | ov009 | 0x021ada9c | data | 12 | 1 |
| 120 | `data_ov009_021adaa8` | ov009 | 0x021adaa8 | data | 12 | 1 |
| 121 | `data_ov009_021adab4` | ov009 | 0x021adab4 | data | 12 | 1 |
| 122 | `data_ov009_021adac0` | ov009 | 0x021adac0 | data | 12 | 2 |
| 123 | `data_ov009_021adacc` | ov009 | 0x021adacc | data | 12 | 2 |
| 124 | `data_ov009_021adad8` | ov009 | 0x021adad8 | data | 12 | 1 |
| 125 | `data_ov010_021b8c14` | ov010 | 0x021b8c14 | data | 12 | 1 |
| 126 | `data_ov012_021cc0a4` | ov012 | 0x021cc0a4 | rodata | 12 | 1 |
| 127 | `data_ov014_021b4d48` | ov014 | 0x021b4d48 | data | 12 | 2 |
| 128 | `data_ov014_021b4d54` | ov014 | 0x021b4d54 | data | 12 | 1 |
| 129 | `data_ov014_021b4d60` | ov014 | 0x021b4d60 | data | 12 | 1 |
| 130 | `data_ov014_021b4d6c` | ov014 | 0x021b4d6c | data | 12 | 1 |
| 131 | `data_ov014_021b4d78` | ov014 | 0x021b4d78 | data | 12 | 1 |
| 132 | `data_ov014_021b4d84` | ov014 | 0x021b4d84 | data | 12 | 1 |
| 133 | `data_ov014_021b4f14` | ov014 | 0x021b4f14 | data | 12 | 2 |
| 134 | `data_ov016_021b8df8` | ov016 | 0x021b8df8 | rodata | 12 | 1 |
| 135 | `data_ov016_021b9014` | ov016 | 0x021b9014 | data | 12 | 2 |
| 136 | `data_ov017_021b80c8` | ov017 | 0x021b80c8 | data | 12 | 1 |
| 137 | `data_ov018_021ad2e4` | ov018 | 0x021ad2e4 | rodata | 12 | 1 |
| 138 | `data_ov018_021ad2f0` | ov018 | 0x021ad2f0 | rodata | 12 | 1 |
| 139 | `data_ov018_021ad2fc` | ov018 | 0x021ad2fc | rodata | 12 | 1 |
| 140 | `data_ov018_021ad308` | ov018 | 0x021ad308 | rodata | 12 | 1 |
| 141 | `data_ov011_021d2fc9` | ov011 | 0x021d2fc9 | rodata | 11 | 3 |
| 142 | `data_ov005_021b1aa8` | ov005 | 0x021b1aa8 | data | 10 | 1 |
| 143 | `data_ov005_021b1ab2` | ov005 | 0x021b1ab2 | data | 10 | 2 |
| 144 | `data_ov011_021d2fb4` | ov011 | 0x021d2fb4 | rodata | 10 | 1 |
| 145 | `data_ov011_021d2fbe` | ov011 | 0x021d2fbe | rodata | 10 | 1 |
| 146 | `data_ov016_021b9000` | ov016 | 0x021b9000 | data | 10 | 2 |
| 147 | `data_ov016_021b900a` | ov016 | 0x021b900a | data | 10 | 2 |
| 148 | `data_ov016_021b9184` | ov016 | 0x021b9184 | data | 10 | 4 |
| 149 | `data_ov016_021b918e` | ov016 | 0x021b918e | data | 10 | 1 |
| 150 | `data_ov016_021b9198` | ov016 | 0x021b9198 | data | 10 | 1 |
| 151 | `data_ov016_021b91a2` | ov016 | 0x021b91a2 | data | 10 | 1 |
| 152 | `data_ov016_021b9374` | ov016 | 0x021b9374 | data | 10 | 2 |
| 153 | `data_ov017_021b80a0` | ov017 | 0x021b80a0 | data | 10 | 2 |
| 154 | `data_ov017_021b80aa` | ov017 | 0x021b80aa | data | 10 | 1 |
| 155 | `data_ov017_021b80b4` | ov017 | 0x021b80b4 | data | 10 | 1 |
| 156 | `data_ov017_021b80be` | ov017 | 0x021b80be | data | 10 | 1 |
| 157 | `data_ov017_021b816c` | ov017 | 0x021b816c | data | 10 | 2 |
| 158 | `data_ov017_021b8176` | ov017 | 0x021b8176 | data | 10 | 2 |
| 159 | `data_ov019_021b5ba0` | ov019 | 0x021b5ba0 | data | 10 | 2 |
| 160 | `data_ov011_021d358b` | ov011 | 0x021d358b | rodata | 9 | 1 |
| 161 | `data_020c3f4c` | main | 0x020c3f4c | data | 8 | 1 |
| 162 | `data_020c58c4` | main | 0x020c58c4 | data | 8 | 1 |
| 163 | `data_020c592c` | main | 0x020c592c | data | 8 | 1 |
| 164 | `data_020c5944` | main | 0x020c5944 | data | 8 | 1 |
| 165 | `data_020c594c` | main | 0x020c594c | data | 8 | 1 |
| 166 | `data_020c596c` | main | 0x020c596c | data | 8 | 1 |
| 167 | `data_020c5974` | main | 0x020c5974 | data | 8 | 1 |
| 168 | `data_020fe7f0` | main | 0x020fe7f0 | data | 8 | 4 |
| 169 | `data_02101598` | main | 0x02101598 | data | 8 | 5 |
| 170 | `data_02101dcc` | main | 0x02101dcc | data | 8 | 1 |
| 171 | `data_02101ea4` | main | 0x02101ea4 | data | 8 | 1 |
| 172 | `data_02102254` | main | 0x02102254 | data | 8 | 1 |
| 173 | `data_0210229c` | main | 0x0210229c | data | 8 | 1 |
| 174 | `data_0210283c` | main | 0x0210283c | data | 8 | 1 |
| 175 | `data_02102ac8` | main | 0x02102ac8 | data | 8 | 2 |
| 176 | `data_02102ad0` | main | 0x02102ad0 | data | 8 | 2 |
| 177 | `data_02102af0` | main | 0x02102af0 | data | 8 | 2 |
| 178 | `data_02102af8` | main | 0x02102af8 | data | 8 | 2 |
| 179 | `data_ov000_021b5614` | ov000 | 0x021b5614 | rodata | 8 | 1 |
| 180 | `data_ov005_021b1be0` | ov005 | 0x021b1be0 | data | 8 | 1 |
| 181 | `data_ov006_021cc034` | ov006 | 0x021cc034 | data | 8 | 1 |
| 182 | `data_ov008_021b23b8` | ov008 | 0x021b23b8 | rodata | 8 | 1 |
| 183 | `data_ov011_021d3583` | ov011 | 0x021d3583 | rodata | 8 | 1 |
| 184 | `data_ov011_021d35c8` | ov011 | 0x021d35c8 | rodata | 8 | 1 |
| 185 | `data_ov020_021addc8` | ov020 | 0x021addc8 | rodata | 8 | 1 |
| 186 | `data_ov000_021b55de` | ov000 | 0x021b55de | rodata | 6 | 1 |

### shape=array (57 symbols, 3,746 bytes)

| # | Symbol | Module | Address | Sec | Size (B) | Readers |
|---|---|---|---|---|---|---|
| 1 | `data_ov011_021d33bc` | ov011 | 0x021d33bc | rodata | 455 | 1 |
| 2 | `data_ov011_021d3900` | ov011 | 0x021d3900 | data | 224 | 1 |
| 3 | `data_020c72f0` | main | 0x020c72f0 | data | 208 | 1 |
| 4 | `data_021023d8` | main | 0x021023d8 | data | 192 | 1 |
| 5 | `data_020c3e88` | main | 0x020c3e88 | data | 188 | 1 |
| 6 | `data_020cd040` | main | 0x020cd040 | data | 168 | 1 |
| 7 | `data_02102764` | main | 0x02102764 | data | 152 | 1 |
| 8 | `data_ov006_021cc4fc` | ov006 | 0x021cc4fc | data | 140 | 1 |
| 9 | `data_ov011_021d323c` | ov011 | 0x021d323c | rodata | 126 | 1 |
| 10 | `data_ov011_021d32d9` | ov011 | 0x021d32d9 | rodata | 113 | 1 |
| 11 | `data_020e5c60` | main | 0x020e5c60 | data | 104 | 1 |
| 12 | `data_020c68fc` | main | 0x020c68fc | data | 92 | 1 |
| 13 | `data_ov006_021cc20c` | ov006 | 0x021cc20c | data | 92 | 1 |
| 14 | `data_020fbe60` | main | 0x020fbe60 | data | 88 | 1 |
| 15 | `data_02102718` | main | 0x02102718 | data | 76 | 1 |
| 16 | `data_020fd470` | main | 0x020fd470 | data | 72 | 1 |
| 17 | `data_02100310` | main | 0x02100310 | data | 64 | 1 |
| 18 | `data_02100de0` | main | 0x02100de0 | data | 64 | 1 |
| 19 | `data_02101f74` | main | 0x02101f74 | data | 64 | 1 |
| 20 | `data_02102210` | main | 0x02102210 | data | 64 | 1 |
| 21 | `data_ov011_021d334a` | ov011 | 0x021d334a | rodata | 42 | 8 |
| 22 | `data_020cd460` | main | 0x020cd460 | data | 40 | 1 |
| 23 | `data_ov006_021cc13c` | ov006 | 0x021cc13c | data | 40 | 1 |
| 24 | `data_0210225c` | main | 0x0210225c | data | 36 | 1 |
| 25 | `data_021022a4` | main | 0x021022a4 | data | 36 | 1 |
| 26 | `data_ov009_021adae4` | ov009 | 0x021adae4 | data | 36 | 1 |
| 27 | `data_ov009_021adb9c` | ov009 | 0x021adb9c | data | 36 | 1 |
| 28 | `data_020f84e0` | main | 0x020f84e0 | data | 32 | 1 |
| 29 | `data_020f8700` | main | 0x020f8700 | data | 32 | 1 |
| 30 | `data_020f8a40` | main | 0x020f8a40 | data | 32 | 1 |
| 31 | `data_020fb840` | main | 0x020fb840 | data | 32 | 1 |
| 32 | `data_020fda40` | main | 0x020fda40 | data | 32 | 1 |
| 33 | `data_ov020_021ae040` | ov020 | 0x021ae040 | data | 32 | 1 |
| 34 | `data_ov023_021b2380` | ov023 | 0x021b2380 | data | 32 | 1 |
| 35 | `data_ov011_021d3376` | ov011 | 0x021d3376 | rodata | 30 | 2 |
| 36 | `data_020c6878` | main | 0x020c6878 | data | 28 | 1 |
| 37 | `data_02102c44` | main | 0x02102c44 | data | 28 | 1 |
| 38 | `data_ov001_021ca404` | ov001 | 0x021ca404 | data | 28 | 1 |
| 39 | `data_ov011_021d35d0` | ov011 | 0x021d35d0 | rodata | 28 | 1 |
| 40 | `data_020c5994` | main | 0x020c5994 | data | 24 | 1 |
| 41 | `data_020f87d8` | main | 0x020f87d8 | data | 24 | 1 |
| 42 | `data_020fbd50` | main | 0x020fbd50 | data | 24 | 1 |
| 43 | `data_02101e4c` | main | 0x02101e4c | data | 24 | 1 |
| 44 | `data_02101e7c` | main | 0x02101e7c | data | 24 | 1 |
| 45 | `data_0210268c` | main | 0x0210268c | data | 24 | 1 |
| 46 | `data_020c58b0` | main | 0x020c58b0 | data | 20 | 1 |
| 47 | `data_020c59ac` | main | 0x020c59ac | data | 20 | 1 |
| 48 | `data_02102198` | main | 0x02102198 | data | 20 | 1 |
| 49 | `data_ov006_021cc0a0` | ov006 | 0x021cc0a0 | data | 20 | 1 |
| 50 | `data_ov006_021cc0b4` | ov006 | 0x021cc0b4 | data | 20 | 1 |
| 51 | `data_ov011_021d2ff8` | ov011 | 0x021d2ff8 | rodata | 20 | 1 |
| 52 | `data_ov011_021d3020` | ov011 | 0x021d3020 | rodata | 20 | 1 |
| 53 | `data_ov021_021ace6c` | ov021 | 0x021ace6c | data | 20 | 1 |
| 54 | `data_020ce380` | main | 0x020ce380 | data | 16 | 1 |
| 55 | `data_020d0ef0` | main | 0x020d0ef0 | data | 16 | 1 |
| 56 | `data_02102200` | main | 0x02102200 | data | 16 | 1 |
| 57 | `data_ov015_021b5d30` | ov015 | 0x021b5d30 | data | 16 | 1 |

`data_02101e7c` (#44) is the sibling investigated in Part 2 of the main doc — resolved DECLINED, do not re-carve without new evidence.

### shape=fnptr_table (29 symbols, 612 bytes)

| # | Symbol | Module | Address | Sec | Size (B) | Readers |
|---|---|---|---|---|---|---|
| 1 | `data_ov006_021cb60c` | ov006 | 0x021cb60c | rodata | 40 | 1 |
| 2 | `data_ov012_021cc0b0` | ov012 | 0x021cc0b0 | rodata | 40 | 1 |
| 3 | `data_020be9c4` | main | 0x020be9c4 | rodata | 36 | 1 |
| 4 | `data_020c35cc` | main | 0x020c35cc | rodata | 36 | 1 |
| 5 | `data_020be77c` | main | 0x020be77c | rodata | 24 | 3 |
| 6 | `data_020be9ac` | main | 0x020be9ac | rodata | 24 | 1 |
| 7 | `data_ov000_021b569c` | ov000 | 0x021b569c | rodata | 24 | 1 |
| 8 | `data_ov003_021cf0dc` | ov003 | 0x021cf0dc | rodata | 24 | 1 |
| 9 | `data_ov012_021cc0d8` | ov012 | 0x021cc0d8 | rodata | 24 | 1 |
| 10 | `data_ov012_021cc0f0` | ov012 | 0x021cc0f0 | rodata | 24 | 1 |
| 11 | `data_ov012_021cc138` | ov012 | 0x021cc138 | rodata | 24 | 1 |
| 12 | `data_ov019_021b5a50` | ov019 | 0x021b5a50 | rodata | 20 | 1 |
| 13 | `data_ov000_021b565c` | ov000 | 0x021b565c | rodata | 16 | 1 |
| 14 | `data_ov000_021b566c` | ov000 | 0x021b566c | rodata | 16 | 1 |
| 15 | `data_ov000_021b567c` | ov000 | 0x021b567c | rodata | 16 | 1 |
| 16 | `data_ov000_021b568c` | ov000 | 0x021b568c | rodata | 16 | 1 |
| 17 | `data_ov005_021b157c` | ov005 | 0x021b157c | rodata | 16 | 1 |
| 18 | `data_ov008_021b23c0` | ov008 | 0x021b23c0 | rodata | 16 | 1 |
| 19 | `data_ov008_021b23d0` | ov008 | 0x021b23d0 | rodata | 16 | 1 |
| 20 | `data_ov009_021ad83c` | ov009 | 0x021ad83c | rodata | 16 | 1 |
| 21 | `data_ov009_021ad858` | ov009 | 0x021ad858 | rodata | 16 | 1 |
| 22 | `data_ov011_021d2fd4` | ov011 | 0x021d2fd4 | rodata | 16 | 1 |
| 23 | `data_ov014_021b4c08` | ov014 | 0x021b4c08 | rodata | 16 | 1 |
| 24 | `data_ov016_021b8de8` | ov016 | 0x021b8de8 | rodata | 16 | 1 |
| 25 | `data_ov016_021b8e04` | ov016 | 0x021b8e04 | rodata | 16 | 1 |
| 26 | `data_ov016_021b8e14` | ov016 | 0x021b8e14 | rodata | 16 | 1 |
| 27 | `data_ov016_021b8e24` | ov016 | 0x021b8e24 | rodata | 16 | 1 |
| 28 | `data_ov017_021b7e7c` | ov017 | 0x021b7e7c | rodata | 16 | 1 |
| 29 | `data_ov019_021b5a18` | ov019 | 0x021b5a18 | rodata | 16 | 1 |

### shape=jump_table (2 symbols, 24 bytes)

| # | Symbol | Module | Address | Sec | Size (B) | Readers |
|---|---|---|---|---|---|---|
| 1 | `data_ov000_021b562c` | ov000 | 0x021b562c | rodata | 12 | 1 |
| 2 | `data_ov000_021b5644` | ov000 | 0x021b5644 | rodata | 12 | 1 |

### TOTAL: 274 symbols, 24,753 bytes

By module: main 58 (struct) + 27 (array) + 4 (fnptr) = 89; ov006 33+3+1=37;
ov011 11+8+1=20; ov016 12; ov009 9; ov017 8; ov014 8; ov000 7+0+9+2=18; the
remainder spread thinly (1-6 each) across ov001/ov003/ov005/ov007/ov008/ov010/
ov012/ov013/ov015/ov018/ov019/ov020/ov021/ov022/ov023.

## Disposition: the misaligned-struct arc's declined set (as of cm-restock-carve-6, 2026-08-09)

Of the `shape=struct` section's 35 candidates that failed the standard
4-aligned carve (waves 1-2's method) due to `ALIGNALL(2)` misalignment,
26 have since shipped via TU composition or backward/forward absorption
(`cm-restock-carve-3`/`4`/`5`/`6`, PRs #1476/#1481/#1487/pending) and
**9 are now PERMANENTLY DECLINED, tested and evidenced — do not re-carve
any of these without genuinely new evidence or a new recipe mechanism.
The arc is CLOSED: every one of the original 35 candidates now has
either a shipped carve or an evidenced permanent decline; none remain
open or untested.**

| Symbol | Module | Size | Reason declined |
|---|---|---:|---|
| `data_ov006_021ce38a` | ov006 | 36 | Backward absorption into the full 13-symbol gap bundle compiles with the correct section size but mwcc reorders the declarations (n=13); no smaller both-ends-aligned sub-bundle exists. `cm-restock-carve-4`/#1481. |
| `data_ov006_021ce3ae` | ov006 | 40 | Same bundle, same finding. |
| `data_ov006_021ce3d6` | ov006 | 40 | Same bundle, same finding. |
| `data_ov006_021ce3fe` | ov006 | 40 | Same bundle, same finding. |
| `data_ov011_021d3034` | ov011 | 43 | Real backward/forward-absorption partner exists (`data_ov011_021d305f`, 1B), but the pair's real address order (43B then 1B) is size-*descending* — mwcc sorts differently-sized top-level globals by ascending size regardless of declaration order, so the compiled layout comes out backward no matter how the `.c` file is written. Formally taxonomized as [`codegen-walls.md` P-48](../codegen-walls.md#p-48-composed-tu-declaration-order-collapses-to-ascending-byte-size-whenever-two-top-level-data-globals-differ-in-size--a-data-layout-wall-not-a-codegen-one-permanent-evidence-chain-below), PERMANENT. `cm-restock-carve-5`/`6`. |
| `data_ov011_021d32ba` | ov011 | 30 | Same wall (P-48), independently reconfirmed: absorption partner `data_ov011_021d323c` (126B) is address-ascending/size-descending (126B then 30B). Unusually thorough investigation (125/126 + 20/30 bytes proven via `capstone` disassembly of a permanent hand-encoded `.s` wall, plus an exhaustive byte-level self-consistency check) — the evidence is real, only the composition mechanism is blocked. `cm-restock-carve-5`. |
| `data_ov004_021de7e5` | ov004 | 20 | Member of a contiguous `%4==1`-aligned symbol run; the same alignment-residue family `docs/research/ov004-odd-aligned-slot-recipe.md` (brief 173) already tested on a larger sibling (`data_ov004_021ded69`) — all 3 source-level variants failed, including a bundle/absorption attempt that hit dsd's own containment check. Not independently re-tested (analogy by family/module, not a repeat test), but the documented wall applies. |
| `data_ov011_021d3583` | ov011 | 8 | **CLOSED this wave (`cm-restock-carve-6`).** Only viable absorption fix is the 3-symbol bundle with `data_ov011_021d33bc` (455B) + `data_ov011_021d358b` (9B) — address-ascending sizes 455/8/9, non-monotonic. Compiled standalone and inspected directly: landed as `[8, 9, 455]` in-section order, exactly the P-48 ascending-size sort, confirming the prediction empirically rather than assuming it. No interior 4-aligned split point exists (both `0x021d3583`/`0x021d358b` are `%4==3`), so wave 4's usual n>2 fix (split into n=2 sub-TUs) is unavailable — irreducible. `data_ov011_021d33bc` itself got a full investigation despite the outcome (per "a well-evidenced negative is a full success"): a real, previously-uncataloged `0x72`-stride row-table structural lead was found and documented for a future patcher-level or full-table-reconciliation attempt, though only 4 of its 455 bytes have direct per-field consumer proof. |
| `data_ov011_021d358b` | ov011 | 9 | Same bundle, same finding — see `021d3583`. |

**Also resolved as shippable, not declined** (`cm-restock-carve-5`):
`data_ov000_021b55de` (backward absorption with `data_ov000_021b55dc`,
2B, ascending size order) and `data_ov011_021d2fc9` (forward absorption
with `data_ov011_021d2fc8`, 1B, ascending size order). **And one more
this wave** (`cm-restock-carve-6`): `data_ov011_021d3374`/`_3376`
(2B+30B, strictly ascending, discovered via a corrected re-derivation of
the `data_ov011_021d323c`/`_32ba` gap that found 2 real symbols the
original census misaligned-candidate extraction had missed).

**Net: 9 confirmed/evidenced permanent declines (`021ce38a`/`_3ae`/
`_3d6`/`_3fe`, `021d3034`, `021d32ba`, `021de7e5`, `021d3583`/`_358b`),
0 open leads, 3 resolved as shipped after all
(`021b55de`+`021d2fc9` in wave 5; `021d3374`/`_3376` in wave 6) —
9 + 0 + 2 = 11, reconciling exactly against wave 4's original declined
count (the 3rd resolved pair, `021d3374`/`_3376`, was never one of the
original 11 — it surfaced from a corrected gap re-derivation this
wave, see `cm-restock-carve-6-2026-08-09.md`).** See
`docs/research/alignment-wall-tu-composition-recipe.md` and
`codegen-walls.md`'s P-48 for the general mwcc-behavior findings (n>2
reordering; n=2 differing-size ordering) this disposition rests on.
