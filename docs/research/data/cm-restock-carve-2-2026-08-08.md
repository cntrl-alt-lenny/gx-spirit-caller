# cm-restock-carve-2 — second restock-census wave, 58/58 of main's struct candidates shipped (2026-08-08)

Second wave of the restock-census carve series. Wave 1
([`cm-restock-carve-1`](cm-restock-carve-1-2026-08-06.md)) scoped `ov006`;
this wave scopes all 58 struct-shaped candidates the census
(`cm-data-restock-census-2026-08-03.md`) found in `main`. Unlike `ov006`,
`main` has no single consolidated research header (`ov006_core.h`'s
equivalent) — candidates were cross-referenced against the scattered
`docs/research/dossiers*/`, `docs/research/c-match-prep/`, and
`docs/research/xref/` corpus instead.

Wave 1's alignment finding was applied as an upfront **pre-filter, not a
rediscovery**: every candidate's start/end alignment was checked against
`delinks.txt` before investigation began. Result: all 58 addresses are
4-byte aligned — zero declines from this specific check, a valid, honestly
reported outcome (`ov004-odd-aligned-slot-recipe.md`'s wall simply didn't
recur here).

CANARY discipline followed: Group A2 (8 text-literal symbols) carved
first and taken through a full 3-region gate before any further batching.

## Result

**58 of 58 candidates shipped (16,412 B), zero declined.** A mid-session
context compaction lost the verbatim byte data for 4 of 8 investigation
groups (31 symbols) — re-derived fresh via targeted re-verification agents
rather than reconstructed from the compacted prose summary, per the
project's standing never-hand-transcribe rule (see "Re-verification after
compaction" below). A real, previously-undocumented mwcc compiler-fold bug
was found and fixed during the final gate (see "The .bss/.data
compiler-fold bug" below) — the only non-research-methodology defect this
wave produced.

## Per-symbol reconciliation table (built incrementally as groups land)

All symbols, module `main`. Every row is non-const (`main`'s `.data` span
is `0x020c3bc0`-`0x02102c60` per `delinks.txt` line 4; placement is
delinks.txt ground truth, never asserted from the C side) and non-static.

| Symbol | Address | Size | Section | Type | Evidence |
|---|---:|---:|---|---|---|
| `data_020c5934` | `0x020c5934` | 16 | `.data` | `unsigned char[16]` | Shift-JIS literal, consumer `func_02012cc8.s:614` (_LIT17), relocs.txt from:0x02013874 |
| `data_020c5944` | `0x020c5944` | 8 | `.data` | `unsigned char[8]` | Shift-JIS literal "あり", same consumer family |
| `data_020c594c` | `0x020c594c` | 8 | `.data` | `unsigned char[8]` | Shift-JIS literal "なし", same consumer family |
| `data_020c5954` | `0x020c5954` | 12 | `.data` | `unsigned char[12]` | Shift-JIS format string "制限時間:%s", `func_02012cc8.s:629` (_LIT18) |
| `data_020c5960` | `0x020c5960` | 12 | `.data` | `unsigned char[12]` | Shift-JIS format string "乱数:%05d", `func_02012cc8.s:650` (_LIT21) |
| `data_020c596c` | `0x020c596c` | 8 | `.data` | `unsigned char[8]` | Shift-JIS format string "形式:%s", `func_02012cc8.s:666` (_LIT23) |
| `data_020c5974` | `0x020c5974` | 8 | `.data` | `unsigned char[8]` | Shift-JIS format string "場所:%s", `func_02012cc8.s:684` (_LIT25) |
| `data_020c597c` | `0x020c597c` | 16 | `.data` | `unsigned char[16]` | Shift-JIS format string "詰めデュエル:%s", `func_02012cc8.s:703` (_LIT26) |
| `data_020c3bc0` | `0x020c3bc0` | 232 | `.data` | `int[58]` | StateMain handler-index table; relocs.txt 19348 (elem[0] = real fn ptr to `func_02000c44`); sole reader `func_02000c4c.c` |
| `data_020c3f4c` | `0x020c3f4c` | 8 | `.data` | `DebugFileRef` | relocs.txt 19367 (field 0 -> `data_020c3f70` path string); consumer `func_ov010_021b72c0.s:168-172` |
| `data_020c44c4` | `0x020c44c4` | 12 | `.data` | `unsigned char[12]` | Shift-JIS UI hint "START:決定"; relocs.txt 937; consumer `func_0200aa60.c:12,21` |
| `data_020c58c4` | `0x020c58c4` | 8 | `.data` | `unsigned char[8]` | Shift-JIS "あなた"; relocs.txt 1556; consumer `func_02012cc8.s:510` (_LIT7) |
| `data_020c58cc` | `0x020c58cc` | 16 | `.data` | `unsigned char[16]` | Shift-JIS "あなたのデッキ"; relocs.txt 1558; consumer `func_02012cc8.s:513` (_LIT9) |
| `data_020c58f0` | `0x020c58f0` | 20 | `.data` | `unsigned char[20]` | Shift-JIS fixed string, mode-0 trio member; relocs.txt 1562; `func_02012cc8.s:580` (_LIT13) |
| `data_020c5904` | `0x020c5904` | 20 | `.data` | `unsigned char[20]` | Shift-JIS fixed string, mode-1 trio member; relocs.txt 1563; `func_02012cc8.s:585` (_LIT14) |
| `data_020c5918` | `0x020c5918` | 20 | `.data` | `unsigned char[20]` | Shift-JIS fixed string, mode-2 trio member; relocs.txt 1564; `func_02012cc8.s:590` (_LIT15) |
| `data_020c592c` | `0x020c592c` | 8 | `.data` | `unsigned char[8]` | Shift-JIS format string "先攻:%d"; relocs.txt 1565; `func_02012cc8.s:610` (_LIT16) |
| `data_020c59ec` | `0x020c59ec` | 68 | `.data` | `data_020c59ec_t` | Packed key word (consumer-proven, `func_0201af80.s`) + 16-pointer table (all 16 relocs.txt-proven, targets unread) |
| `data_020c78f0` | `0x020c78f0` | 24 | `.data` | `data_020c78f0_t` | 2 of 6 fields relocs.txt-proven pointers; consumer `func_ov021_021aaadc.c:12,22` (opaque base-pointer use only) |
| `data_020c7ac4` | `0x020c7ac4` | 124 | `.data` | `data_020c7ac4_rec[31]` | Sorted `{key,idx}` binary-search table; count = `data_020c7ac0`; consumer `func_ov002_022bdf30.s` via `func_020059b0` |
| `data_020c9694` | `0x020c9694` | 14764 | `.data` | `data_020c9694_t` | 615-record table, stride 0x18 proven by 6 independent real-code sites; ~17% resolved (id/idx/3 pointers), rest opaque but byte-exact (script-generated from ROM, never hand-transcribed) |
| `data_0210135c` | `0x0210135c` | 16 | `.data` | `signed char[16]` | XOR-decrypt key ("\0ameSpy3D" effective); consumer `func_02060728.s:49-50`; relocs.txt from:0x020607a8 |
| `data_0210136c` | `0x0210136c` | 16 | `.data` | `signed char[16]` | Sibling XOR key ("\0rojectAphex" effective); consumer `func_02060520.s:76-77`; relocs.txt from:0x020605fc |
| `data_02101598` | `0x02101598` | 8 | `.data` | `unsigned char[8]` | NATNEG magic fingerprint; 5 readers matching census exactly; relocs.txt x5 |
| `data_02101dcc` | `0x02101dcc` | 8 | `.data` | `unsigned char[8]` | All-0xFF invalid-ID sentinel; consumer `func_0206a31c.s:59-64`; relocs.txt from:0x0206a448 |
| `data_02101ea4` | `0x02101ea4` | 8 | `.data` | `unsigned char[8]` | Broadcast-MAC sentinel route record; consumer `func_02073838.s:37-43,80`; relocs.txt from:0x02073910 |
| `data_02101eb8` | `0x02101eb8` | 12 | `.data` | `unsigned char[12]` | IEEE 802.2 LLC/SNAP header + EtherType(IPv4); 3 readers matching census; relocs.txt x3 |
| `data_020fe904` | `0x020fe904` | 84 | `.data` | `unsigned char[84]` | HTTP POST format string; relocs.txt 6628; consumer `func_020417e8` (dossier + c-match-prep ground truth) |
| `data_020f7a00` | `0x020f7a00` | 56 | `.data` | resource manifest (6-entry) | `ResTableEntry` family (matches shipped `data_020fb5c0.c`); consumer `func_ov007_021b2d0c.c` -> `func_020211c8`/`func_02021a3c`; 6/6 entry ptrs relocs.txt-proven |
| `data_020fdb90` | `0x020fdb90` | 48 | `.data` | resource manifest (5-entry) | Same family; consumer `func_ov006_021c52b8.c`; 5/5 entry ptrs relocs.txt-proven |
| `data_020f85d0` | `0x020f85d0` | 40 | `.data` | resource manifest (4-entry) | Same family; consumer `func_ov008_021b2064.c`; 4/4 entry ptrs relocs.txt-proven |
| `data_020f8b30` | `0x020f8b30` | 40 | `.data` | resource manifest (4-entry) | Same family; consumer `func_ov009_021ab848.c`; 4/4 entry ptrs relocs.txt-proven |
| `data_020fe958` | `0x020fe958` | 32 | `.data` | `unsigned char[32]` | HTTP GET format string, sibling of `data_020fe904`; relocs.txt 6629 |
| `data_020fe8f8` | `0x020fe8f8` | 12 | `.data` | `unsigned char[12]` | HTTP header-line format string "%s: %s\r\n"; relocs.txt from:0x020417e0; consumer `func_020416f8.s` |
| `data_020fe7f0` | `0x020fe7f0` | 8 | `.data` | `unsigned char[8]` | "\r\n\r\n" header/body boundary needle; 4 readers matching census; consumer incl. landed `func_02041fd0.c` |
| `data_020fe45c` | `0x020fe45c` | 12 | `.data` | `unsigned char[12]` | Plain byte lookup table (not ResTable, not text); relocs.txt 4791; consumer `func_020318b8` (dossier ground truth) |
| `data_021024a0` | `0x021024a0` | 16 | `.data` | `unsigned short[8]` | IRQ bit-shift table; relocs.txt 16279; consumer `OSi_PostIrqEvent.legacy.c:90` (pre-existing extern, never defined) |
| `data_021024c8` | `0x021024c8` | 192 | `.data` | `unsigned int[48]` | MD5 round-2/3/4 message-schedule table; formulas g/h/k independently verified exact; consumer `func_02098cf8` (MD5_Transform) |
| `data_021026a4` | `0x021026a4` | 52 | `.data` | `int[13]` | Cumulative days-before-month table (non-leap); consumer `func_0209bf34`; relocs.txt 17385 |
| `data_0210283c` | `0x0210283c` | 8 | `.data` | `unsigned char[8]` | IEEE-754 +Infinity bit pattern; consumer `func_020ab130` (strtod overflow path); relocs.txt 18563 |
| `data_02102aa4` | `0x02102aa4` | 12 | `.data` | `unsigned short[6]` | UTF-16LE "0x0p0", 1/9 wide-string family (Group F1 tail, see F2 below); relocs.txt 18608 |
| `data_02102ab0` | `0x02102ab0` | 12 | `.data` | `unsigned short[6]` | UTF-16LE "-INF", 2/9 family member; relocs.txt 18609, 18634 |
| `data_02102abc` | `0x02102abc` | 12 | `.data` | `unsigned short[6]` | UTF-16LE "-inf", 3/9 family member; relocs.txt 18610, 18635 |
| `data_02102ac8` | `0x02102ac8` | 8 | `.data` | `unsigned short[4]` | UTF-16LE "INF", 4/9 family member; relocs.txt 18611, 18636 |
| `data_02102ad0` | `0x02102ad0` | 8 | `.data` | `unsigned short[4]` | UTF-16LE "inf", 5/9 family member; relocs.txt 18612, 18637 |
| `data_02102ad8` | `0x02102ad8` | 12 | `.data` | `unsigned short[6]` | UTF-16LE "-NAN", 6/9 family member; region-variance verified (USA/JPN: unrelated ASCII digit table); relocs.txt 18613, 18638 |
| `data_02102ae4` | `0x02102ae4` | 12 | `.data` | `unsigned short[6]` | UTF-16LE "-nan", 7/9 family member; relocs.txt 18614, 18639 |
| `data_02102af0` | `0x02102af0` | 8 | `.data` | `unsigned short[4]` | UTF-16LE "NAN", 8/9 family member; region-variance verified; relocs.txt 18615, 18640 |
| `data_02102af8` | `0x02102af8` | 8 | `.data` | `unsigned short[4]` | UTF-16LE "nan", 9/9 family member (family complete); region-variance verified; relocs.txt 18616, 18641 |
| `data_02102138` | `0x02102138` | 24 | `.data` | `DuelHeapSlot` | Slot 1, sibling of shipped `data_02102120` (slot 0); consumer `func_0207df20.s`/`func_0207e0a8.s`; relocs.txt from:0x0207e098 |
| `data_02102150` | `0x02102150` | 24 | `.data` | `DuelHeapSlot` | Slot 2, same family; consumer `func_0207df20.s`/`func_0207e0a8.s`; relocs.txt from:0x0207e094 |
| `data_02102254` | `0x02102254` | 8 | `.data` | `GxMtxPopMode` | GX FIFO MTX_POP/MTX_MODE args for handler `func_02083aa8` (dispatch slot 7); relocs.txt from:0x02083dc8 |
| `data_0210229c` | `0x0210229c` | 8 | `.data` | `GxMtxPopMode` | Twin of `data_02102254` for mirror handler `func_02083718` (dispatch slot 8); relocs.txt from:0x02083a9c |
| `data_02102280` | `0x02102280` | 12 | `.data` | `VecFx32`-shaped, shipped `.s` | Write-only GX scratch (translation row), `func_02083aa8`; all-zero in ROM; cross-region contradiction verified (USA/JPN hold pointer data here); relocs.txt from:0x02083dac; hand-written `.s` (see compiler-fold bug below) |
| `data_0210228c` | `0x0210228c` | 12 | `.data` | `VecFx32`-shaped, shipped `.s` | Write-only GX scratch (scale row), `func_02083aa8`; all-zero in ROM; relocs.txt from:0x02083db0; hand-written `.s` |
| `data_021022c8` | `0x021022c8` | 12 | `.data` | `VecFx32`-shaped, shipped `.s` | Twin of `data_02102280` for `func_02083718`; all-zero in ROM; relocs.txt from:0x02083a7c; hand-written `.s` |
| `data_021022d4` | `0x021022d4` | 12 | `.data` | `VecFx32`-shaped, shipped `.s` | Twin of `data_0210228c` for `func_02083718`; all-zero in ROM; relocs.txt from:0x02083a80; hand-written `.s` |
| `data_021022e0` | `0x021022e0` | 128 | `.data` | `Handler_02084dc0[32]` | 14/32 populated fn-ptr dispatch table for `func_02084dc0`; corroborates `docs/research/dossiers/02084dc0.md`; cross-region contradiction verified; relocs.txt from:0x02084e08 |

**All 58 of 58 candidates resolved.** Groups C and F1 each refuted part of
their own lost-and-recovered prior hypothesis on fresh re-verification
(Group C: 4 of 9 confirmed as a `ResTableEntry` resource-manifest family, 5
of 9 turned out to be unrelated HTTP request/header format strings; Group
F1: 2 of 7 were marked "investigate fresh" and resolved independently, an
IRQ bit-shift table and an IEEE-754 +Infinity constant). Group E corrected
its own incoming hypothesis too: the 6 GX-block addresses are two parallel
per-handler groups (slots 7 and 8 of the `data_021022e0` dispatch table),
not one coherent 6-member block, and two of its symbols (`data_02102280`,
`data_021022e0`) carry independently-verified real cross-region content
contradictions (harmless: `src/main/*.c` is EUR-only per `configure.py`).
Direct evidence, across 3 of 4 re-verified groups, that re-deriving from
ROM bytes rather than trusting the compacted summary was the right call.

## Byte-count deltas

```
Typed-array:   162,884 -> 178,932 bytes  (+16,048 B,  3.41% -> 3.75%)
Named-struct:   57,076 ->  72,440 bytes  (+15,364 B,  1.19% -> 1.52%)
```

Measured from `docs/state-table.md` against `origin/main` (pre-wave
baseline, matching wave 1's own "after" numbers exactly: `162,884` /
`57,076`). The two deltas differ by 684 B — reconciled by running the
project's own classifier (`tools/progress.py`'s
`_has_file_scope_array_decl` / `_tu_has_named_struct_decl`) directly
against all 58 new files rather than hand-tracing the regex: 16,048 B
qualify as Typed-array, 15,364 B as Named-struct, 15,048 B count in
*both* buckets (an array of a named-struct/typedef'd type, e.g.
`data_020c7ac4_rec[31]`). The remainder splits as primitive-array-only
(e.g. `unsigned char[N]` text literals — Typed-array only) vs.
bracket-less named-struct/typedef instances (e.g. `DebugFileRef
data_020c3f4c`, `data_020c9694_t data_020c9694` — Named-struct only,
since a scalar instance carries no `[N]`). The 4 hand-written `.s`
files (48 B, the compiler-fold fix below) count in *neither* bucket —
both classifiers only walk `.c`/`.cpp` TU source text, and a `.s` file
has no C type declaration for either regex to match. Independently
confirmed: my script's own +16,048 / +15,364 outputs match the real
`docs/state-table.md` delta exactly.

## The .bss/.data compiler-fold bug

The final full-scope gate caught a real defect, not a research error:
EUR SHA1 FAILED (USA/JPN passed, as expected for EUR-only `src/main/`
files) after Group E's 9 files were added. Byte-diffing the built
`arm9.bin` against pristine (`extract/eur/arm9/arm9.bin`) at every one
of the 58 candidates' own address ranges found 19 symbols mismatched,
all starting exactly at `data_02102280` — the module's built length
was 32 bytes short.

Root cause, found via direct ELF section-header inspection of the
compiled `.o` files (`sh_type`/`sh_size`, not just file size): the 4
all-zero-initialized `VecFx32 data_X = {0, 0, 0};` globals
(`data_02102280`, `data_0210228c`, `data_021022c8`, `data_021022d4`)
each compiled to a **`.bss` section**, not `.data`, despite
`delinks.txt` declaring them `.data`. This is mwcc folding a
whole-object-is-zero global into BSS — a standard compiler
optimization, but one that's fatal here: dsd's gap/TU model expects
each TU's compiled section to match its delinks.txt-declared kind, and
a `.bss`-kind object contributes zero literal file bytes to the `.data`
image, silently dropping 12 bytes per affected symbol (48 B total —
the remaining discrepancy from the measured 32 B module-length delta
is the linker's own re-packing of what followed, not a separate bug).

No precedent existed in this codebase for a *genuinely* all-zero
`.data`-resident global — every existing "mostly-zero" struct has at
least one non-zero field, so the fold's precondition never fired
before. Fixed using this project's own established recipe for
fighting mwcc's section-placement decisions
(`docs/research/dtcm-section-attribute.md`): hand-written `.s` files
(`.section .data` + `.global` + `.byte 0x00 x12`) for the 4 affected
symbols — mwasmarm is a literal assembler with no zero-fold pass, so
`.byte` always emits real PROGBITS bytes regardless of value. Re-gated
clean afterward (all 3 regions SHA1 PASS, all 58 symbols individually
byte-verified against pristine via a standalone script). Worth
carrying forward: any future all-zero `.data` scratch-field carve
should go straight to hand-written `.s`, not `.c`, to avoid hitting
this the same way.
