# Candidate dossiers — INDEX

## Overview

Each file in `docs/research/dossiers/` is a C-match candidate dossier produced during the campaign-prep phase (briefs 494-496). A dossier contains: the inferred recipe and risk note for matching the function, a ready-to-compile C prep draft, a struct-context table for any locally inferred types, a pointer to the closest already-matched source file, and a numbered "Try this" checklist for the first objdiff iteration. To use: copy the prep draft into `src/<overlay>/`, run `ninja objdiff`, apply the recipe's reshape tips in order, and escalate to the permuter or `.s` fallback only after the checklist is exhausted. The proposed-name column (where present) comes from `docs/research/map/NAMES.md` and is safe to commit for HIGH-confidence entries.

## By module

### ov006 (30 dossiers)

| addr | class | size | recipe summary | file |
|------|-------|------|----------------|------|
| 021c215c | D | 292B | switch->branch-table, default-first, selector single-ex... | [021c215c.md](021c215c.md) |
| 021c31d0 | C | 220B | guard chain f8/f0/f4 | [021c31d0.md](021c31d0.md) |
| 021c32ac | D | 216B | bind mla base to one local, call-order=source, signed s... | [021c32ac.md](021c32ac.md) |
| 021c34c0 | C | 204B | bind handle r4 + caller-saved r5/r6/r7 across 7 calls | [021c34c0.md](021c34c0.md) |
| 021c426c | D | 220B | explicit pairwise copy loop, store-order kept, stride-8... | [021c426c.md](021c426c.md) |
| 021c43bc | D | 348B | store-order stmia {type,payload}, chained && bound comp... | [021c43bc.md](021c43bc.md) |
| 021c4574 | D | 332B | MMIO RMW two strh in order, capture-then-pass each call... | [021c4574.md](021c4574.md) |
| 021c480c | D | 212B | lsl | [021c480c.md](021c480c.md) |
| 021c52b8 | D | 260B | Store-order copy | [021c52b8.md](021c52b8.md) |
| 021c5a5c | D | 164B | func_02037208(N,N-(N+1),0,1) idiom | [021c5a5c.md](021c5a5c.md) |
| 021c63cc | C | 136B | bind row once (r2) | [021c63cc.md](021c63cc.md) |
| 021c6454 | C | 220B | :1 bitfield for the lsl#31 | [021c6454.md](021c6454.md) |
| 021c669c | D | 252B | MMIO RMW via volatile u16* | [021c669c.md](021c669c.md) |
| 021c6998 | C | 164B | bind base in r4 | [021c6998.md](021c6998.md) |
| 021c6a58 | D | 212B | Paired MMIO RMW in exact store order | [021c6a58.md](021c6a58.md) |
| 021c6c78 | D | 276B | struct-copy for ldmia/stmia | [021c6c78.md](021c6c78.md) |
| 021c6d8c | D | 180B | Linear call dispatch | [021c6d8c.md](021c6d8c.md) |
| 021c6e40 | C | 228B | cmp+cmpeq compound guard | [021c6e40.md](021c6e40.md) |
| 021c6ff8 | D | 280B | Paired MMIO RMW exact store-order | [021c6ff8.md](021c6ff8.md) |
| 021c7110 | D | 208B | :3 bitfield for lsl#29 | [021c7110.md](021c7110.md) |
| 021c71e0 | D | 232B | D: bind base+0x420 (recompute +0x1000/call) | [021c71e0.md](021c71e0.md) |
| 021c7edc | C | 128B | outer i then inner j | [021c7edc.md](021c7edc.md) |
| 021c7f5c | D | 268B | D: switch->(base,count) | [021c7f5c.md](021c7f5c.md) |
| 021c8068 | D | 268B | D: same switch | [021c8068.md](021c8068.md) |
| 021c8e98 | C | 264B | ternary-selected base+mla(20B) | [021c8e98.md](021c8e98.md) |
| 021c9bc8 | C | 140B | void | [021c9bc8.md](021c9bc8.md) |
| 021c9c54 | C | 172B | ternary base+mla(20B) | [021c9c54.md](021c9c54.md) |
| 021ca4b8 | D | 96B | D: single base ptr | [021ca4b8.md](021ca4b8.md) |
| 021ca518 | D | 88B | D: single base ptr | [021ca518.md](021ca518.md) |
| 021cab6c | C | 156B | decl-order = first-use | [021cab6c.md](021cab6c.md) |

### ov007 (1 dossier)

| addr | class | size | recipe summary | file |
|------|-------|------|----------------|------|
| 021b299c | C | 244B | store-order follows source arg-eval | [021b299c.md](021b299c.md) |

### ov008 (32 dossiers)

| addr | class | size | recipe summary | file |
|------|-------|------|----------------|------|
| 021aa5f0 | C | 180B | decl-order: i,row early | [021aa5f0.md](021aa5f0.md) |
| 021ab3ac | C | 216B | 16-byte ldm/stm via 4-elem array copy | [021ab3ac.md](021ab3ac.md) |
| 021ab484 | C | 132B | stack stores in asm order | [021ab484.md](021ab484.md) |
| 021aba3c | D | 204B | D: bind sl base + shifted r8 induction (+0x20<<23/iter) | [021aba3c.md](021aba3c.md) |
| 021abb08 | D | 152B | D: bind shared r4=(a0-1)<<23, reuse in both words | [021abb08.md](021abb08.md) |
| 021ac0b8 | C | 336B | if-assign clamp (movlt/movgt) not ternary-min | [021ac0b8.md](021ac0b8.md) |
| 021ac208 | D | 164B | C: byte-combine index via shifts | [021ac208.md](021ac208.md) |
| 021ac2ac | D | 176B | CLASS D store-order: volatile MMIO RMW in exact asm seq... | [021ac2ac.md](021ac2ac.md) |
| 021ac35c | C | 212B | bind data_021b2790 base once | [021ac35c.md](021ac35c.md) |
| 021ac430 | D | 160B | CLASS D divmod: signed %8 ror idiom | [021ac430.md](021ac430.md) |
| 021ac5d0 | C | 136B | low-3-bits via plain &0x7 won't give lsl | [021ac5d0.md](021ac5d0.md) |
| 021aca14 | C | 360B | if-assign clamp (a0==0/a0==a1 arms) | [021aca14.md](021aca14.md) |
| 021acb7c | D | 392B | CLASS D store-order: stacked-arg marshalling, tst+movne... | [021acb7c.md](021acb7c.md) |
| 021acd04 | D | 204B | CLASS D divmod: /150 smull magic via plain '/' | [021acd04.md](021acd04.md) |
| 021acdd0 | D | 220B | CLASS D store-order/bitfield: high-byte insert (lsl#8) | [021acdd0.md](021acdd0.md) |
| 021acfa0 | D | 120B | CLASS D byte-combine+store-order: index via shifts | [021acfa0.md](021acfa0.md) |
| 021adaa8 | D | 276B | CLASS D divmod: /5 magic via '/' and explicit % | [021adaa8.md](021adaa8.md) |
| 021adbbc | D | 136B | D: u8 read as :8 bitfield (lsl#24 | [021adbbc.md](021adbbc.md) |
| 021ae674 | D | 152B | D: signed:8 +8 (asr), unsigned:8 +4/+6 | [021ae674.md](021ae674.md) |
| 021aef18 | C | 188B | bitset set: row*0x34 base, signed bitno>>5 word, 1<<(po... | [021aef18.md](021aef18.md) |
| 021aefd4 | C | 212B | OAM fill/commit | [021aefd4.md](021aefd4.md) |
| 021af0a8 | C | 172B | 0..5 loop | [021af0a8.md](021af0a8.md) |
| 021afbac | C | 128B | guard branch | [021afbac.md](021afbac.md) |
| 021afc2c | C | 120B | v unsigned -> movhi clamp | [021afc2c.md](021afc2c.md) |
| 021b03b8 | D | 264B | D: div-magic /32 + signed %8 (ror#0x1b) | [021b03b8.md](021b03b8.md) |
| 021b18a4 | C | 244B | reload *270c per access (no caching) | [021b18a4.md](021b18a4.md) |
| 021b1ad8 | C | 316B | two-arm init | [021b1ad8.md](021b1ad8.md) |
| 021b1d08 | D | 260B | D: memcpy 0x50 | [021b1d08.md](021b1d08.md) |
| 021b1e20 | C | 192B | re-read base each access (no cache) | [021b1e20.md](021b1e20.md) |
| 021b1f28 | C | 164B | bind r4=base | [021b1f28.md](021b1f28.md) |
| 021b207c | D | 212B | D: store-order | [021b207c.md](021b207c.md) |
| 021b22bc | C | 200B | decl-order: inner counter j declared before outer i | [021b22bc.md](021b22bc.md) |

### ov009 (1 dossier)

| addr | class | size | recipe summary | file |
|------|-------|------|----------------|------|
| 021b5b7c | C | 312B | CLASS C: double-nested loop | [021b5b7c.md](021b5b7c.md) |

### ov010 (19 dossiers)

| addr | class | size | recipe summary | file |
|------|-------|------|----------------|------|
| 021b3ea0 | D | 168B | D: palette load via LUT | [021b3ea0.md](021b3ea0.md) |
| 021b421c | C | 340B | CLASS C: multi-field init | [021b421c.md](021b421c.md) |
| 021b4764 | C | 196B | CLASS C: bitset write via 1<<(n&7) byte addressing | [021b4764.md](021b4764.md) |
| 021b4a70 | C | 260B | CLASS C: two-loop structure | [021b4a70.md](021b4a70.md) |
| 021b4eac | D | 208B | divmod: plain / and % by 360/255/60 emit smull magic | [021b4eac.md](021b4eac.md) |
| 021b55c8 | C | 244B | CLASS C: conditional store-order | [021b55c8.md](021b55c8.md) |
| 021b625c | C | 216B | CLASS C: three-arg guard chain | [021b625c.md](021b625c.md) |
| 021b65f0 | D | 228B | D: signed>>1 via asr#1 | [021b65f0.md](021b65f0.md) |
| 021b6778 | C | 220B | CLASS C: flag-set pattern | [021b6778.md](021b6778.md) |
| 021b6900 | C | 188B | CLASS C: stride-8 loop | [021b6900.md](021b6900.md) |
| 021b6c44 | D | 200B | D: %7 via smull magic | [021b6c44.md](021b6c44.md) |
| 021b6df4 | C | 204B | CLASS C: struct init sequence | [021b6df4.md](021b6df4.md) |
| 021b6f40 | C | 212B | CLASS C: nested-cmp dispatch | [021b6f40.md](021b6f40.md) |
| 021b70b0 | D | 168B | D: /10 smull magic | [021b70b0.md](021b70b0.md) |
| 021b718c | D | 196B | D: two-pass copy | [021b718c.md](021b718c.md) |
| 021b7218 | C | 212B | CLASS C: loop with accumulate+limit | [021b7218.md](021b7218.md) |
| 021b749c | C | 280B | CLASS C: branch on tag byte | [021b749c.md](021b749c.md) |
| 021b76f4 | D | 244B | D: interleaved ldr/str pairs | [021b76f4.md](021b76f4.md) |
| 021b7c04 | D | 200B | D: smull magic for /N | [021b7c04.md](021b7c04.md) |

### ov011 (43 dossiers)

| addr | class | size | recipe summary | file |
|------|-------|------|----------------|------|
| 021cc664 | C | 316B | CLASS C: two-phase init | [021cc664.md](021cc664.md) |
| 021cc814 | C | 204B | CLASS C: guard+bitfield | [021cc814.md](021cc814.md) |
| 021ccae4 | C | 272B | CLASS C: ternary select on two paths | [021ccae4.md](021ccae4.md) |
| 021ccca0 | D | 152B | D: bic/orr halfword-pair | [021ccca0.md](021ccca0.md) |
| 021ccdb4 | C | 216B | CLASS C: loop with index*stride mla | [021ccdb4.md](021ccdb4.md) |
| 021ccf14 | D | 240B | D: multi-field store in exact asm order | [021ccf14.md](021ccf14.md) |
| 021cd094 | C | 188B | CLASS C: if-assign pattern | [021cd094.md](021cd094.md) |
| 021cd1d4 | D | 204B | D: stride table lookup | [021cd1d4.md](021cd1d4.md) |
| 021cd50c | C | 220B | CLASS C: two-arm switch | [021cd50c.md](021cd50c.md) |
| 021cd740 | D | 248B | D: reload global addr each use (no r4 bind) | [021cd740.md](021cd740.md) |
| 021cd8d8 | C | 196B | CLASS C: ptr-chain load | [021cd8d8.md](021cd8d8.md) |
| 021cdaa0 | D | 300B | D: store-order | [021cdaa0.md](021cdaa0.md) |
| 021cdc84 | C | 208B | CLASS C: conditional ptr guard | [021cdc84.md](021cdc84.md) |
| 021cdde4 | D | 228B | D: mla with stride-12 | [021cdde4.md](021cdde4.md) |
| 021cdfb4 | C | 212B | CLASS C: two-phase guard | [021cdfb4.md](021cdfb4.md) |
| 021ce1ac | D | 264B | D: reload per loop body | [021ce1ac.md](021ce1ac.md) |
| 021ce3a4 | C | 212B | CLASS C: two-sink dispatch | [021ce3a4.md](021ce3a4.md) |
| 021ceebc | C | 232B | CLASS C: multi-field loop | [021ceebc.md](021ceebc.md) |
| 021cf074 | D | 212B | D: bitset clear | [021cf074.md](021cf074.md) |
| 021cf278 | C | 196B | CLASS C: orr-shifted operand first | [021cf278.md](021cf278.md) |
| 021cf454 | D | 308B | D: stride-7 or stride-14 | [021cf454.md](021cf454.md) |
| 021cf638 | C | 228B | CLASS C: two-loop with shared base | [021cf638.md](021cf638.md) |
| 021cf8d0 | D | 244B | D: RMW halfword pair | [021cf8d0.md](021cf8d0.md) |
| 021cfaa4 | C | 216B | CLASS C: ternary flag select | [021cfaa4.md](021cfaa4.md) |
| 021cfc84 | D | 232B | D: stride-20 mla | [021cfc84.md](021cfc84.md) |
| 021cfe68 | C | 220B | CLASS C: ptr-guarded table init | [021cfe68.md](021cfe68.md) |
| 021d0060 | D | 200B | D: conditional-copy | [021d0060.md](021d0060.md) |
| 021d0214 | C | 188B | CLASS C: loop-copy with guard | [021d0214.md](021d0214.md) |
| 021d03cc | D | 196B | D: bitfield-RMW chain | [021d03cc.md](021d03cc.md) |
| 021d059c | C | 212B | CLASS C: if-assign with movle | [021d059c.md](021d059c.md) |
| 021d0760 | D | 228B | D: two-sink with different strides | [021d0760.md](021d0760.md) |
| 021d0940 | C | 200B | CLASS C: function pointer dispatch | [021d0940.md](021d0940.md) |
| 021d0af8 | D | 184B | D: bic-orr halfword pair with interleaved ldrh | [021d0af8.md](021d0af8.md) |
| 021d0cc4 | C | 196B | CLASS C: outer-bind + inner-reload | [021d0cc4.md](021d0cc4.md) |
| 021d0ea8 | D | 220B | D: mla stride-0x14 | [021d0ea8.md](021d0ea8.md) |
| 021d1068 | C | 196B | CLASS C: sign-extend via (s8) cast | [021d1068.md](021d1068.md) |
| 021d1110 | D | 208B | D: halfword pair from two fields | [021d1110.md](021d1110.md) |
| 021d1434 | C | 224B | CLASS C: three-ptr bind | [021d1434.md](021d1434.md) |
| 021d165c | D | 212B | D: stride-8 copy with flag check per element | [021d165c.md](021d165c.md) |
| 021d183c | C | 228B | CLASS C: three-field init sequence | [021d183c.md](021d183c.md) |
| 021d1a18 | D | 220B | D: multi-arm dispatch | [021d1a18.md](021d1a18.md) |
| 021d1bf0 | C | 200B | CLASS C: ldrsh signed table | [021d1bf0.md](021d1bf0.md) |
| 021d2330 | D | 216B | D: stride-12 loop | [021d2330.md](021d2330.md) |

### ov012 (1 dossier)

| addr | class | size | recipe summary | file |
|------|-------|------|----------------|------|
| 021b2390 | C | 184B | CLASS C: conditional field copy | [021b2390.md](021b2390.md) |

### ov013 (1 dossier)

| addr | class | size | recipe summary | file |
|------|-------|------|----------------|------|
| 021b274c | D | 196B | divmod: plain / and % by 360/255/60 | [021b274c.md](021b274c.md) |

### ov014 (6 dossiers)

| addr | class | size | recipe summary | file |
|------|-------|------|----------------|------|
| 021b258c | C | 220B | CLASS C: two-field RMW | [021b258c.md](021b258c.md) |
| 021b280c | C | 244B | CLASS C: loop over array | [021b280c.md](021b280c.md) |
| 021b2980 | D | 208B | D: four-field RMW | [021b2980.md](021b2980.md) |
| 021b2b40 | C | 220B | CLASS C: stride-0x14 loop | [021b2b40.md](021b2b40.md) |
| 021b2ce8 | D | 244B | D: reload global per field access | [021b2ce8.md](021b2ce8.md) |
| 021b2ec0 | C | 208B | CLASS C: if-zero guard | [021b2ec0.md](021b2ec0.md) |

### ov015 (9 dossiers)

| addr | class | size | recipe summary | file |
|------|-------|------|----------------|------|
| 021b2514 | D | 228B | D: conditional-chain | [021b2514.md](021b2514.md) |
| 021b27d8 | C | 244B | CLASS C: Rect struct init | [021b27d8.md](021b27d8.md) |
| 021b3034 | D | 228B | D: HitRect init | [021b3034.md](021b3034.md) |
| 021b31d8 | C | 212B | CLASS C: orr-shifted operand first | [021b31d8.md](021b31d8.md) |
| 021b3340 | C | 224B | CLASS C: Matrix3x4 init | [021b3340.md](021b3340.md) |
| 021b34dc | D | 192B | D: conditional Matrix3x4 set | [021b34dc.md](021b34dc.md) |
| 021b3610 | C | 208B | CLASS C: Box struct fill | [021b3610.md](021b3610.md) |
| 021b37dc | D | 212B | D: stride-0x30 Matrix loop | [021b37dc.md](021b37dc.md) |
| 021b5284 | D | 228B | D: two-arm conditional | [021b5284.md](021b5284.md) |

### ov016 (9 dossiers)

| addr | class | size | recipe summary | file |
|------|-------|------|----------------|------|
| 021b3d1c | C | 212B | CLASS C: Cell struct write | [021b3d1c.md](021b3d1c.md) |
| 021b3fbc | D | 200B | D: OamCtl write | [021b3fbc.md](021b3fbc.md) |
| 021b40d8 | C | 224B | CLASS C: BgCfg conditional init | [021b40d8.md](021b40d8.md) |
| 021b6074 | C | 232B | CLASS C: MMIO sound reg write | [021b6074.md](021b6074.md) |
| 021b647c | D | 228B | D: palette copy via DMA | [021b647c.md](021b647c.md) |
| 021b6814 | C | 220B | CLASS C: NDS tile set | [021b6814.md](021b6814.md) |
| 021b6984 | D | 240B | D: BgCfg field write | [021b6984.md](021b6984.md) |
| 021b6a3c | C | 236B | CLASS C: palette DMA + bg register | [021b6a3c.md](021b6a3c.md) |
| 021b6bb8 | D | 224B | D: tiledim calc | [021b6bb8.md](021b6bb8.md) |

### ov017 (14 dossiers)

| addr | class | size | recipe summary | file |
|------|-------|------|----------------|------|
| 021b3e6c | D | 220B | D: two-Cell update | [021b3e6c.md](021b3e6c.md) |
| 021b41fc | C | 232B | CLASS C: counted copy loops | [021b41fc.md](021b41fc.md) |
| 021b5944 | D | 208B | D: signed /2 (sign>>31+asr) | [021b5944.md](021b5944.md) |
| 021b6204 | D | 220B | D: tst+movne flag merge | [021b6204.md](021b6204.md) |
| 021b6380 | C | 212B | CLASS C: loop-with-dispatch | [021b6380.md](021b6380.md) |
| 021b64a8 | D | 200B | D: mla stride-0x18 | [021b64a8.md](021b64a8.md) |
| 021b65e4 | C | 216B | CLASS C: ptr-chain with null guard | [021b65e4.md](021b65e4.md) |
| 021b672c | D | 244B | D: two-source merge | [021b672c.md](021b672c.md) |
| 021b68c4 | C | 208B | CLASS C: flag-accumulate loop | [021b68c4.md](021b68c4.md) |
| 021b6a48 | D | 224B | D: divmod /6 | [021b6a48.md](021b6a48.md) |
| 021b6bbc | C | 228B | CLASS C: two-stride table | [021b6bbc.md](021b6bbc.md) |
| 021b6d40 | D | 200B | D: s16 table with signed ldrsh | [021b6d40.md](021b6d40.md) |
| 021b7930 | C | 244B | CLASS C: three-sink with pointer guards | [021b7930.md](021b7930.md) |
| 021b7abc | D | 212B | D: bic-orr with lsl shift | [021b7abc.md](021b7abc.md) |

### ov018 (4 dossiers)

| addr | class | size | recipe summary | file |
|------|-------|------|----------------|------|
| 021aa5fc | C | 408B | reload data_021040ac across call | [021aa5fc.md](021aa5fc.md) |
| 021aa9b8 | D | 4B | constant-divisor smull-magic as plain /60 and /30 | [021aa9b8.md](021aa9b8.md) |
| 021ab4f4 | D | 416B | store-order: emit each ldrh/bic/orr/strh halfword pair ... | [021ab4f4.md](021ab4f4.md) |
| 021ace68 | C | 280B | CLASS C: divmod-by-name for /var | [021ace68.md](021ace68.md) |

### ov019 (12 dossiers)

| addr | class | size | recipe summary | file |
|------|-------|------|----------------|------|
| 021aa700 | C | 172B | CLASS C: inline idx*14 + sub*2 word index (don't bind s... | [021aa700.md](021aa700.md) |
| 021aa80c | C | 228B | CLASS C: two counted loops, const args (8,0xf0,0x24) re... | [021aa80c.md](021aa80c.md) |
| 021aa8f0 | D | 248B | plain &mask/asr extract (cmp uses asr, not bitfield) | [021aa8f0.md](021aa8f0.md) |
| 021aaa80 | C | 252B | C: bind r4 base, store-order clamps, if-assign min, inl... | [021aaa80.md](021aaa80.md) |
| 021b2a48 | C | 152B | CLASS C: a5/32 as plain signed '/' | [021b2a48.md](021b2a48.md) |
| 021b3488 | C | 340B | CLASS C/D: mul-mask (c-0x10)*0xd & 0x1ff literal | [021b3488.md](021b3488.md) |
| 021b3cf0 | C | 328B | CLASS C: re-emit mla r1,(c+d),12,obj per case (orig rec... | [021b3cf0.md](021b3cf0.md) |
| 021b40d4 | C | 388B | CLASS D: low-3-bit read as unsigned :3 bitfield (gives ... | [021b40d4.md](021b40d4.md) |
| 021b43a8 | C | 440B | CLASS C: ordered cmp tree (bgt/bge/beq) for 0x34/0x3a/0... | [021b43a8.md](021b43a8.md) |
| 021b4f1c | D | 192B | switch returns input n or const | [021b4f1c.md](021b4f1c.md) |
| 021b4fdc | C | 780B | stack ptrs stored at sp+0x1c..0x28 | [021b4fdc.md](021b4fdc.md) |
| 021b5948 | D | 208B | signed /2 (sign>>31+asr) | [021b5948.md](021b5948.md) |

### ov020 (11 dossiers)

| addr | class | size | recipe summary | file |
|------|-------|------|----------------|------|
| 021aa540 | D | 320B | store-order cmd[0x14]/[0x18] | [021aa540.md](021aa540.md) |
| 021aa6e0 | C | 120B | C: store-order stack pack, <<0x10 zero-extend of the tw... | [021aa6e0.md](021aa6e0.md) |
| 021aab7c | D | 480B | decl-order self-first | [021aab7c.md](021aab7c.md) |
| 021aabe8 | D | 520B | MMIO bic/orr store-order verbatim | [021aabe8.md](021aabe8.md) |
| 021ab330 | C | 192B | C: bind r4 base, store-order clamp, -16-v in two steps ... | [021ab330.md](021ab330.md) |
| 021ab364 | D | 100B | mla index r4*100+1 | [021ab364.md](021ab364.md) |
| 021ab43c | D | 100B | identical clone recipe to 021ab364, palette nibble 0xe000 | [021ab43c.md](021ab43c.md) |
| 021ab4a0 | D | 292B | D divmod: sel%5 and sel/5 via smull magic -> plain / and % | [021ab4a0.md](021ab4a0.md) |
| 021ab5c8 | D | 408B | divmod: plain / and % by 360/255/60 emit the smull magics | [021ab5c8.md](021ab5c8.md) |
| 021adb8c | D | 408B | divmod: plain / and % by 360/255/60 emit smull magics | [021adb8c.md](021adb8c.md) |
| 021add24 | D | 156B | divmod: % 360 emits the 0xb60b60b7 smull+sub | [021add24.md](021add24.md) |

### ov021 (3 dossiers)

| addr | class | size | recipe summary | file |
|------|-------|------|----------------|------|
| 021aa5b8 | C | 204B | CLASS C: BgCfg write | [021aa5b8.md](021aa5b8.md) |
| 021aad3c | D | 288B | D: store-order | [021aad3c.md](021aad3c.md) |
| 021aaf5c | C | 256B | C: precompute reserved ids r4/r5/r6, i in r8, count-1 b... | [021aaf5c.md](021aaf5c.md) |

### ov022 (2 dossiers)

| addr | class | size | recipe summary | file |
|------|-------|------|----------------|------|
| 021aa5b0 | C | 244B | CLASS C: six-call dispatch | [021aa5b0.md](021aa5b0.md) |
| 021ab760 | D | 164B | store-order: keep S on the stack, write after +bias, af... | [021ab760.md](021ab760.md) |

## By recipe pattern

| pattern | count | example addrs |
|---------|-------|---------------|
| store-order | 41 | 021aa540, 021aa6e0, 021aa8f0 |
| other | 29 | 021aa5b0, 021aaf5c, 021aef18 |
| mla/stride | 23 | 021ab364, 021ab43c, 021b2b40 |
| bitfield/bic-orr | 22 | 021aa5fc, 021ac5d0, 021adbbc |
| divmod/smull-magic | 17 | 021aa9b8, 021ab4a0, 021ab5c8 |
| bind-base | 13 | 021aa700, 021aba3c, 021b2ec0 |
| guard/null-check | 12 | 021afbac, 021b1ad8, 021b2390 |
| MMIO-RMW | 9 | 021aa5b8, 021aabe8, 021ab4f4 |
| loop/iteration | 9 | 021aa80c, 021b280c, 021b2a48 |
| if-assign/clamp | 9 | 021ac0b8, 021ac208, 021aca14 |
| decl-order | 8 | 021aa5f0, 021aab7c, 021b22bc |
| switch/branch-table | 5 | 021b4f1c, 021c215c, 021c7f5c |
| ldm/stm struct-copy | 1 | 021c9bc8 |

## Quick-reference

| addr | proposed name | recipe pattern | dossier |
|------|---------------|----------------|---------|
| 021aa540 | Ov022_CreateScrollTask | store-order | [021aa540.md](021aa540.md) |
| 021aa5b0 | — | other | [021aa5b0.md](021aa5b0.md) |
| 021aa5b8 | Ov000_RefreshObjTransform | MMIO-RMW | [021aa5b8.md](021aa5b8.md) |
| 021aa5f0 | Ov008_CalcSlotWeights | decl-order | [021aa5f0.md](021aa5f0.md) |
| 021aa5fc | Ov018_SetupCellLayer | bitfield/bic-orr | [021aa5fc.md](021aa5fc.md) |
| 021aa6e0 | Ov022_AppendSpriteEntry | store-order | [021aa6e0.md](021aa6e0.md) |
| 021aa700 | Ov020_GetCardText | bind-base | [021aa700.md](021aa700.md) |
| 021aa80c | Ov020_GetHitSlot | loop/iteration | [021aa80c.md](021aa80c.md) |
| 021aa8f0 | Ov020_LoadObjSlots | store-order | [021aa8f0.md](021aa8f0.md) |
| 021aa9b8 | Ov021_SubObjDtor | divmod/smull-magic | [021aa9b8.md](021aa9b8.md) |
| 021aaa80 | Ov020_ScrollUpdate | store-order | [021aaa80.md](021aaa80.md) |
| 021aab7c | Ov021_ScrollGlyphList | decl-order | [021aab7c.md](021aab7c.md) |
| 021aabe8 | Ov022_AnimateFadeStep | MMIO-RMW | [021aabe8.md](021aabe8.md) |
| 021aad3c | — | store-order | [021aad3c.md](021aad3c.md) |
| 021aaf5c | Ov021_InitSubObjB | other | [021aaf5c.md](021aaf5c.md) |
| 021ab330 | Ov022_FadeOutMasterBright | store-order | [021ab330.md](021ab330.md) |
| 021ab364 | Ov020_DrawSlotTiles | mla/stride | [021ab364.md](021ab364.md) |
| 021ab3ac | Ov008_SetupBgAffine | store-order | [021ab3ac.md](021ab3ac.md) |
| 021ab43c | Ov020_DrawSlotTilesDark | mla/stride | [021ab43c.md](021ab43c.md) |
| 021ab484 | Ov008_DrawSprite | store-order | [021ab484.md](021ab484.md) |
| 021ab4a0 | Ov020_InitCardArtPanel | divmod/smull-magic | [021ab4a0.md](021ab4a0.md) |
| 021ab4f4 | Ov018_FadeTickOrSetupLayers | MMIO-RMW | [021ab4f4.md](021ab4f4.md) |
| 021ab5c8 | Ov022_HSVToRGB5 | divmod/smull-magic | [021ab5c8.md](021ab5c8.md) |
| 021ab760 | Ov022_PaletteBlend | store-order | [021ab760.md](021ab760.md) |
| 021aba3c | Ov008_DrawLpBar | bind-base | [021aba3c.md](021aba3c.md) |
| 021abb08 | Ov008_DrawLpBarEnd | store-order | [021abb08.md](021abb08.md) |
| 021ac0b8 | Ov008_DrawHpBar | if-assign/clamp | [021ac0b8.md](021ac0b8.md) |
| 021ac208 | Ov008_UpdateTouchTarget | if-assign/clamp | [021ac208.md](021ac208.md) |
| 021ac2ac | Ov008_ClearDuelBg | MMIO-RMW | [021ac2ac.md](021ac2ac.md) |
| 021ac35c | Ov008_DrawCardSlot | store-order | [021ac35c.md](021ac35c.md) |
| 021ac430 | Ov008_DrawAllSlots | divmod/smull-magic | [021ac430.md](021ac430.md) |
| 021ac5d0 | Ov008_DrawCardBack | bitfield/bic-orr | [021ac5d0.md](021ac5d0.md) |
| 021aca14 | Ov008_DrawDuelStatus | if-assign/clamp | [021aca14.md](021aca14.md) |
| 021acb7c | Ov008_DrawDuelFrame | store-order | [021acb7c.md](021acb7c.md) |
| 021acd04 | Ov008_AnimateSlotMove | divmod/smull-magic | [021acd04.md](021acd04.md) |
| 021acdd0 | Ov008_FindSlotByX | store-order | [021acdd0.md](021acdd0.md) |
| 021ace68 | Ov018_RgbToHsv | divmod/smull-magic | [021ace68.md](021ace68.md) |
| 021acfa0 | Ov008_ClearSlotBitmask | store-order | [021acfa0.md](021acfa0.md) |
| 021adaa8 | Ov008_UpdateSlotState | divmod/smull-magic | [021adaa8.md](021adaa8.md) |
| 021adb8c | Ov020_HsvToRgb15 | divmod/smull-magic | [021adb8c.md](021adb8c.md) |
| 021adbbc | Ov008_AdjustSlotColumn | bitfield/bic-orr | [021adbbc.md](021adbbc.md) |
| 021add24 | Ov020_TintPalette | divmod/smull-magic | [021add24.md](021add24.md) |
| 021ae674 | Ov008_BattleAnimTick | bitfield/bic-orr | [021ae674.md](021ae674.md) |
| 021aef18 | Ov008_SelectCardFromSlot | other | [021aef18.md](021aef18.md) |
| 021aefd4 | Ov008_DrawCardPickSprite | store-order | [021aefd4.md](021aefd4.md) |
| 021af0a8 | Ov008_DrawResultCard | store-order | [021af0a8.md](021af0a8.md) |
| 021afbac | Ov008_UpdateBgmTrack | guard/null-check | [021afbac.md](021afbac.md) |
| 021afc2c | Ov008_DrawHandSeparator | if-assign/clamp | [021afc2c.md](021afc2c.md) |
| 021b03b8 | Ov008_UpdateScrollPos | other | [021b03b8.md](021b03b8.md) |
| 021b18a4 | Ov008_SetSpiritMode | other | [021b18a4.md](021b18a4.md) |
| 021b1ad8 | Ov008_LoadSpiritGfx | guard/null-check | [021b1ad8.md](021b1ad8.md) |
| 021b1d08 | Ov008_UpdateSpiritFrame | divmod/smull-magic | [021b1d08.md](021b1d08.md) |
| 021b1e20 | Ov008_SetSpiritDisplay | store-order | [021b1e20.md](021b1e20.md) |
| 021b1f28 | Ov008_SpiritFrameTick | store-order | [021b1f28.md](021b1f28.md) |
| 021b207c | — | store-order | [021b207c.md](021b207c.md) |
| 021b22bc | — | decl-order | [021b22bc.md](021b22bc.md) |
| 021b2390 | — | guard/null-check | [021b2390.md](021b2390.md) |
| 021b2514 | Ov015_SetSubWindowRects | other | [021b2514.md](021b2514.md) |
| 021b258c | — | bitfield/bic-orr | [021b258c.md](021b258c.md) |
| 021b274c | Ov014_InitPaneAObj | divmod/smull-magic | [021b274c.md](021b274c.md) |
| 021b27d8 | Ov015_DrawCellRow | other | [021b27d8.md](021b27d8.md) |
| 021b280c | Ov014_InitPaneBObj | loop/iteration | [021b280c.md](021b280c.md) |
| 021b2980 | — | bitfield/bic-orr | [021b2980.md](021b2980.md) |
| 021b299c | Ov007_RenderCell | store-order | [021b299c.md](021b299c.md) |
| 021b2a48 | — | loop/iteration | [021b2a48.md](021b2a48.md) |
| 021b2b40 | — | mla/stride | [021b2b40.md](021b2b40.md) |
| 021b2ce8 | Ov007_TableGetRow | store-order | [021b2ce8.md](021b2ce8.md) |
| 021b2ec0 | — | bind-base | [021b2ec0.md](021b2ec0.md) |
| 021b3034 | — | other | [021b3034.md](021b3034.md) |
| 021b31d8 | — | bitfield/bic-orr | [021b31d8.md](021b31d8.md) |
| 021b3340 | — | other | [021b3340.md](021b3340.md) |
| 021b3488 | — | loop/iteration | [021b3488.md](021b3488.md) |
| 021b34dc | Ov010_LoadSpriteSheet | other | [021b34dc.md](021b34dc.md) |
| 021b3610 | — | other | [021b3610.md](021b3610.md) |
| 021b37dc | — | mla/stride | [021b37dc.md](021b37dc.md) |
| 021b3cf0 | — | mla/stride | [021b3cf0.md](021b3cf0.md) |
| 021b3d1c | — | mla/stride | [021b3d1c.md](021b3d1c.md) |
| 021b3e6c | — | guard/null-check | [021b3e6c.md](021b3e6c.md) |
| 021b3ea0 | Ov010_FadeInStep | bitfield/bic-orr | [021b3ea0.md](021b3ea0.md) |
| 021b3fbc | — | mla/stride | [021b3fbc.md](021b3fbc.md) |
| 021b40d4 | — | bitfield/bic-orr | [021b40d4.md](021b40d4.md) |
| 021b40d8 | — | other | [021b40d8.md](021b40d8.md) |
| 021b41fc | — | mla/stride | [021b41fc.md](021b41fc.md) |
| 021b421c | Ov010_BuildGlyphEntryB | decl-order | [021b421c.md](021b421c.md) |
| 021b43a8 | Ov015_DrawScrollerContent | other | [021b43a8.md](021b43a8.md) |
| 021b4764 | — | other | [021b4764.md](021b4764.md) |
| 021b4a70 | — | loop/iteration | [021b4a70.md](021b4a70.md) |
| 021b4eac | — | divmod/smull-magic | [021b4eac.md](021b4eac.md) |
| 021b4f1c | — | switch/branch-table | [021b4f1c.md](021b4f1c.md) |
| 021b4fdc | Ov010_AnimScrollBarB | other | [021b4fdc.md](021b4fdc.md) |
| 021b5284 | — | guard/null-check | [021b5284.md](021b5284.md) |
| 021b55c8 | — | store-order | [021b55c8.md](021b55c8.md) |
| 021b5944 | — | store-order | [021b5944.md](021b5944.md) |
| 021b5948 | — | store-order | [021b5948.md](021b5948.md) |
| 021b5b7c | — | mla/stride | [021b5b7c.md](021b5b7c.md) |
| 021b6074 | — | MMIO-RMW | [021b6074.md](021b6074.md) |
| 021b6204 | — | mla/stride | [021b6204.md](021b6204.md) |
| 021b625c | — | bind-base | [021b625c.md](021b625c.md) |
| 021b6380 | — | loop/iteration | [021b6380.md](021b6380.md) |
| 021b647c | — | guard/null-check | [021b647c.md](021b647c.md) |
| 021b64a8 | — | mla/stride | [021b64a8.md](021b64a8.md) |
| 021b65e4 | Ov010_TeardownManagerBList | guard/null-check | [021b65e4.md](021b65e4.md) |
| 021b65f0 | — | bitfield/bic-orr | [021b65f0.md](021b65f0.md) |
| 021b672c | — | other | [021b672c.md](021b672c.md) |
| 021b6778 | — | store-order | [021b6778.md](021b6778.md) |
| 021b6814 | Ov010_CalcManagerAHeight | store-order | [021b6814.md](021b6814.md) |
| 021b68c4 | — | loop/iteration | [021b68c4.md](021b68c4.md) |
| 021b6900 | — | mla/stride | [021b6900.md](021b6900.md) |
| 021b6984 | — | other | [021b6984.md](021b6984.md) |
| 021b6a3c | — | other | [021b6a3c.md](021b6a3c.md) |
| 021b6a48 | — | divmod/smull-magic | [021b6a48.md](021b6a48.md) |
| 021b6bb8 | — | other | [021b6bb8.md](021b6bb8.md) |
| 021b6bbc | — | mla/stride | [021b6bbc.md](021b6bbc.md) |
| 021b6c44 | — | divmod/smull-magic | [021b6c44.md](021b6c44.md) |
| 021b6d40 | — | store-order | [021b6d40.md](021b6d40.md) |
| 021b6df4 | — | guard/null-check | [021b6df4.md](021b6df4.md) |
| 021b6f40 | — | bind-base | [021b6f40.md](021b6f40.md) |
| 021b70b0 | — | divmod/smull-magic | [021b70b0.md](021b70b0.md) |
| 021b718c | Ov010_AnimScrollBarA | mla/stride | [021b718c.md](021b718c.md) |
| 021b7218 | Ov010_AnimScrollBarAB | if-assign/clamp | [021b7218.md](021b7218.md) |
| 021b749c | — | other | [021b749c.md](021b749c.md) |
| 021b76f4 | — | mla/stride | [021b76f4.md](021b76f4.md) |
| 021b7930 | — | guard/null-check | [021b7930.md](021b7930.md) |
| 021b7abc | — | bitfield/bic-orr | [021b7abc.md](021b7abc.md) |
| 021b7c04 | — | divmod/smull-magic | [021b7c04.md](021b7c04.md) |
| 021c215c | Ov006_SubObj_A_UpdateAnim | switch/branch-table | [021c215c.md](021c215c.md) |
| 021c31d0 | Ov006_Hand_PhaseB | bind-base | [021c31d0.md](021c31d0.md) |
| 021c32ac | Ov006_Hand_PhaseC | bind-base | [021c32ac.md](021c32ac.md) |
| 021c34c0 | Ov006_Hand_PhaseE | decl-order | [021c34c0.md](021c34c0.md) |
| 021c426c | Ov006_Hand_HelperC | store-order | [021c426c.md](021c426c.md) |
| 021c43bc | Ov006_Hand_HelperE | store-order | [021c43bc.md](021c43bc.md) |
| 021c4574 | Ov006_Hand_HelperG | MMIO-RMW | [021c4574.md](021c4574.md) |
| 021c480c | Ov006_Hand_HelperJ | bitfield/bic-orr | [021c480c.md](021c480c.md) |
| 021c52b8 | Ov006_SubObj_B_HandleInput | store-order | [021c52b8.md](021c52b8.md) |
| 021c5a5c | Ov006_SpellTrap_PhaseA | other | [021c5a5c.md](021c5a5c.md) |
| 021c63cc | Ov006_SpellTrap_HelperA | if-assign/clamp | [021c63cc.md](021c63cc.md) |
| 021c6454 | Ov006_SpellTrap_HelperB | bitfield/bic-orr | [021c6454.md](021c6454.md) |
| 021c669c | Ov006_SpellTrap_HelperE | MMIO-RMW | [021c669c.md](021c669c.md) |
| 021c6998 | Ov006_SubObj_C_Poll | bitfield/bic-orr | [021c6998.md](021c6998.md) |
| 021c6a58 | Ov006_SubObj_C_Render | MMIO-RMW | [021c6a58.md](021c6a58.md) |
| 021c6c78 | Ov006_SubObj_C_ProcessInput | divmod/smull-magic | [021c6c78.md](021c6c78.md) |
| 021c6d8c | Ov006_SubObj_C_UpdateAnim | other | [021c6d8c.md](021c6d8c.md) |
| 021c6e40 | Ov006_SubObj_C_AnimEnd | guard/null-check | [021c6e40.md](021c6e40.md) |
| 021c6ff8 | Ov006_SubObj_C_Deactivate | MMIO-RMW | [021c6ff8.md](021c6ff8.md) |
| 021c7110 | Ov006_SubObj_C_RenderFull | bitfield/bic-orr | [021c7110.md](021c7110.md) |
| 021c71e0 | Ov006_SubObj_C_RenderAlt | bitfield/bic-orr | [021c71e0.md](021c71e0.md) |
| 021c7edc | Ov006_SubObj_D_Query | other | [021c7edc.md](021c7edc.md) |
| 021c7f5c | Ov006_Filter_LookupCriteriaA | switch/branch-table | [021c7f5c.md](021c7f5c.md) |
| 021c8068 | Ov006_Filter_LookupCriteriaB | switch/branch-table | [021c8068.md](021c8068.md) |
| 021c8e98 | Ov006_AI_Step | store-order | [021c8e98.md](021c8e98.md) |
| 021c9bc8 | Ov006_AI_UpdateScore | ldm/stm struct-copy | [021c9bc8.md](021c9bc8.md) |
| 021c9c54 | Ov006_AI_GetScore | bind-base | [021c9c54.md](021c9c54.md) |
| 021ca4b8 | Ov006_SubObj_E_Update | store-order | [021ca4b8.md](021ca4b8.md) |
| 021ca518 | Ov006_SubObj_E_Step | bind-base | [021ca518.md](021ca518.md) |
| 021cab6c | Ov006_SubObj_E_Render | decl-order | [021cab6c.md](021cab6c.md) |
| 021cc664 | Ov011_ConfigCellsFromTable | other | [021cc664.md](021cc664.md) |
| 021cc814 | Ov011_UpdateBlendRegs | store-order | [021cc814.md](021cc814.md) |
| 021ccae4 | — | decl-order | [021ccae4.md](021ccae4.md) |
| 021ccca0 | — | bitfield/bic-orr | [021ccca0.md](021ccca0.md) |
| 021ccdb4 | — | mla/stride | [021ccdb4.md](021ccdb4.md) |
| 021ccf14 | — | loop/iteration | [021ccf14.md](021ccf14.md) |
| 021cd094 | — | if-assign/clamp | [021cd094.md](021cd094.md) |
| 021cd1d4 | — | store-order | [021cd1d4.md](021cd1d4.md) |
| 021cd50c | — | switch/branch-table | [021cd50c.md](021cd50c.md) |
| 021cd740 | — | bind-base | [021cd740.md](021cd740.md) |
| 021cd8d8 | — | bitfield/bic-orr | [021cd8d8.md](021cd8d8.md) |
| 021cdaa0 | — | store-order | [021cdaa0.md](021cdaa0.md) |
| 021cdc84 | — | guard/null-check | [021cdc84.md](021cdc84.md) |
| 021cdde4 | — | store-order | [021cdde4.md](021cdde4.md) |
| 021cdfb4 | — | guard/null-check | [021cdfb4.md](021cdfb4.md) |
| 021ce1ac | — | loop/iteration | [021ce1ac.md](021ce1ac.md) |
| 021ce3a4 | Ov011_UnkActorAnim_3a4 | bind-base | [021ce3a4.md](021ce3a4.md) |
| 021ceebc | Ov011_UnkLayoutInit_ebc | mla/stride | [021ceebc.md](021ceebc.md) |
| 021cf074 | — | other | [021cf074.md](021cf074.md) |
| 021cf278 | — | bitfield/bic-orr | [021cf278.md](021cf278.md) |
| 021cf454 | — | mla/stride | [021cf454.md](021cf454.md) |
| 021cf638 | — | mla/stride | [021cf638.md](021cf638.md) |
| 021cf8d0 | — | other | [021cf8d0.md](021cf8d0.md) |
| 021cfaa4 | — | store-order | [021cfaa4.md](021cfaa4.md) |
| 021cfc84 | — | store-order | [021cfc84.md](021cfc84.md) |
| 021cfe68 | — | bind-base | [021cfe68.md](021cfe68.md) |
| 021d0060 | — | mla/stride | [021d0060.md](021d0060.md) |
| 021d0214 | — | mla/stride | [021d0214.md](021d0214.md) |
| 021d03cc | — | bitfield/bic-orr | [021d03cc.md](021d03cc.md) |
| 021d059c | — | if-assign/clamp | [021d059c.md](021d059c.md) |
| 021d0760 | — | store-order | [021d0760.md](021d0760.md) |
| 021d0940 | — | other | [021d0940.md](021d0940.md) |
| 021d0af8 | — | bitfield/bic-orr | [021d0af8.md](021d0af8.md) |
| 021d0cc4 | — | bind-base | [021d0cc4.md](021d0cc4.md) |
| 021d0ea8 | — | mla/stride | [021d0ea8.md](021d0ea8.md) |
| 021d1068 | — | other | [021d1068.md](021d1068.md) |
| 021d1110 | Ov011_GetActorCoordAlt | bitfield/bic-orr | [021d1110.md](021d1110.md) |
| 021d1434 | Ov011_SpawnMoveTask | decl-order | [021d1434.md](021d1434.md) |
| 021d165c | — | store-order | [021d165c.md](021d165c.md) |
| 021d183c | — | if-assign/clamp | [021d183c.md](021d183c.md) |
| 021d1a18 | — | other | [021d1a18.md](021d1a18.md) |
| 021d1bf0 | — | store-order | [021d1bf0.md](021d1bf0.md) |
| 021d2330 | Ov011_GridPointQuery | mla/stride | [021d2330.md](021d2330.md) |
