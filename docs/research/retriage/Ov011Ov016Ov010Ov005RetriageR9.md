[//]: # (markdownlint-disable MD013 MD041)

# ov011 / ov016 / ov010 / ov005 Re-triage — Round 9 (R9)

Mop-up of the FULL remaining residual for 4 overlays: ov011 (14 left after
R7's deep pass), ov016 (17 left after R6/R8), ov010 (12 left after R6/R8),
ov005 (15 left after R6). Each overlay's sub-batch was independently
examined against the current KB (`docs/research/data/OverlayDataGlobs.md`,
`docs/research/constants/OverlayConstants.md`,
`docs/research/constants/OverlayConstantsExtended.md`,
`docs/research/data/Ov004Ov006DataTables.md`, plus each overlay's prior
retriage docs).

---

## Summary

| Overlay | Examined | Newly tractable | Wall |
|---------|----------|------------------|------|
| ov005   | 15       | **15**           | 0    |
| ov010   | 12       | **11**           | 1    |
| ov011   | 14       | **1**            | 13   |
| ov016   | 17       | **17** (15 clean + 2 risk-noted) | 0 |
| **TOTAL** | **58** | **44**         | **14** |

**Hit-rate honesty note:** ov005/ov010/ov016 hit near-100% — this residual
was genuinely fresh territory (ov005's first pass since R6, ov010/ov016's
first deep pass since R6/R8's partial samples). **ov011 is the outlier
(1/14)**: it already got a full deep pass in R7 (`Ov011Deep.md`, 5/19
tractable then), so this round's residual is the SECOND-hardest layer —
the functions R7 didn't reach were the ones with genuine jump-table/loop
topology, not missing KB names. The one upgrade found (`021D1D30`) came
from recognizing a jump table with non-interacting arms is a fundamentally
different (tractable) shape than the topology-is-the-whole-function tables
making up the rest of ov011's residual — not from a new struct fact.

---

## ov005 (15/15 tractable)

All 15 target functions decompose into deterministic control flow: bounded
loops, `bl`-to-fixed-symbol dispatch, or small `addls pc,pc` jump tables
over already-documented state fields. **Zero `blx rN` register-indirect
dispatch found anywhere across all 15 files** — this directly overturns the
prior R6 "blx rN dispatch / genuine scheduling entropy" characterization
applied to `021aa4d0`, `021adf3c`, and `021ae5a4`, which does not match the
actual `.s` content on independent re-read.

| Address | Size | Name | Upgrade reason |
|---|---:|---|---|
| `021AA4D0` | 2500B | `CardList_HitTestAndUpdate` | 6-way bounded jump table on state; 5 fixed leaf-helper callees (`func_02006194/0200617c/02006110/02006164/020b3870`); zero `blx`. Calls `021aa4d0`↔`021ae5a4` mutually confirm calling convention. |
| `021ABE5C` | 1760B | `CardList_SetupScene` | `do{}while` linked-list walk (0x10-stride) + 4-way MMIO tail dispatch (BG2/3 rotation regs); all calls named (`func_020054a4/02001d0c/02001d68/02001c98/020945f4/020a6a00/Task_PostLocked/020a6afc/02004fb8/02001e40/02001e54/02004fe8/021abdb8/021abe04/Task_InvokeLocked`). |
| `021AE5A4` | 2272B | `CardList_Update` | 3-state top-level switch, calls 6 of the OTHER targets in this batch directly (`021aa4d0/af090/af8ec/b018c/b0658/b103c/b1388`) — cross-confirms all their signatures simultaneously. `data_02104bac+0x54` bit-decode (0x80/0x40/0x10/0x20/0x200/0x100/0x400/0x1/0x2/0x8) is the richest input-command enum found this round. |
| `021ADF3C` | 1640B | `CardList_DrawScene` | Mechanical VRAM/BG-layer init cascade: allocate→pack→submit triad repeated 7×, only literal constants differ. Single 5-way `addls pc,pc` glyph-select + one `data_02104f4c.f4` bit-2 branch. |
| `021AFBA0` | 1516B | `CardList_RenderBackground` | Deterministic 3-phase: (1) Shift-JIS range-classify cascade against 6 catalogued scalars, (2) two independent binary-search bisection loops via `func_020aaddc`/`func_020ab054`, (3) bounded 29-way full-width→half-width fold table (`addls pc,pc`). |
| `021B0B30` | 1232B | `CardList_InitObjLayer` | Straight-line VRAM/palette init (4× `func_02094504` DMA, matches `OV006_VRAM_*` family), one 3-way mode dispatch, two fixed-count OAM fill loops. |
| `021B018C` | 1228B | `CardList_RenderCards` | Two copies (mode 0/≠0, gated by `data_02104f4c.f4` bit 2) of an identical 4-way `addls pc,pc` dispatch calling 4 OTHER targets in this batch (`021af090/af2dc/afba0/b0b30`) — mutually reinforcing. |
| `021B0658` | 952B | `CardList_RenderNames` | Straight-line, calls `021af750`/`021af8ec` (both in this batch) + already-matched-shape siblings. `0x66666667` ÷10 magic-mult (already documented) splits a scroll-delta field. |
| `021AF2DC` | 1064B | `CardList_RenderEntry` | 6 small bounded scan/shift loops over `+0x48/0x49/0x68/0x69` parallel byte arrays. Identical channel-bit-mask idiom (`1<<r2` then `&0x19`) to `021af090`. |
| `021AF090` | 588B | `CardList_RenderGlyphs` | 4 small bounded scan/shift loops, same parallel-array idiom as `021af2dc`. Zero `blx`. |
| `021B103C` | 844B | `CardList_RenderScroll` | Pure `cmp`/`beq` 3-mode chain (0/1/2), no jump table at all. Scroll-MMIO write (`0x01ff0000`→`0x04001010`) matches the already-matched `CardList_WriteScrollMMIO` mask. |
| `021B1388` | 480B | `CardList_RenderCursor` | Mode-1 single hit-test + OAM build; mode-2 does the same twice unrolled. Fixed literals (`0xc0614000` palette word, `0x27`/`0x2f` tile IDs). |
| `021AF8EC` | 476B | `CardList_InitGlyphBuf` | 2-way branch on `data_02104f4c.f4` bit 2, each an unsigned-÷10 (`0xcccccccd`, documented) digit-count derivation feeding a glyph-plot loop. |
| `021AF750` | 292B | `CardList_CopyNameToSlot` | Leaf: paired-byte copy from `data_ov005_021b1abc[idx]` until null, then a Shift-JIS-range-classify run-length copy from `data_ov005_021b15b4`, then zero-fill to `0x1a0`. Zero calls. |
| `021B0A10` | 280B | `CardList_BlendPixelRow` | Textbook RGB555 per-channel linear blend (extract/mul/round/clamp/repack). `data_021040ac+0x38` blend-factor byte (documented base, new offset). Zero calls, zero branches beyond the one `factor<0x20` split (hoisted outside the loop). |

**New KB gaps (ov005):**
- `data_ov005_021b224c` — shared dispatch-index/"current channel" global, referenced by `021ae5a4`/`021b018c`/`021b0b30`.
- `data_ov005_021b1a44/1a76/1aa8/1ab2` — 4 small hit-rect tables passed to `CardList_HitTestScreenB` (`021aeefc`).
- `data_ov005_021b1568` — 5×u16 struct, likely a hit-rect/coordinate quintuple.
- `data_ov005_021b17e0`/`021b17e4` — font/glyph-table base pair, language-selected (possible naming collision with `Ov004Ov006DataTables.md`'s existing `021b17e0` scalar entry — flag for reconciliation).
- ~17 "task template" pointers across `021adf3c`/`021afba0`/`021b0b30`, each consumed only as `arg0` to `func_02006c0c` — highest-value consolidated-doc candidate from this batch.
- `0x0000829a`/`0x00008190` — likely Shift-JIS range boundaries (companion to the documented `0x81xx`/`0x82xx` convention).
- `0x000005a5` — bisection-search table size bound.

---

## ov010 (11/12 tractable, 1 wall)

Every tractable function is a top-level orchestration calling only named,
already-matched sibling helpers — no indirect calls, no unbounded loops.
Confirms R5's finding that size doesn't correlate with difficulty: the
largest here (`021b5d88`, 1932B) is exactly as deterministic as the
smallest (`021b8514`, 244B).

| Address | Size | Name | Upgrade reason |
|---|---:|---|---|
| `021B8514` | 244B | `Ov010_OpenMode2Panel` | 8 named calls, 2-way switch (not a table). Mode-2 sibling of the matched mode-1 `021b6514`. |
| `021B7D60` | 332B | `Ov010_UpdateMode2` | Straight-line 4×BGnCNT bic/orr pack + 6 named calls. |
| `021B65E4` | 520B | `Ov010_TeardownManagerBList` | Ground-truth cross-verified against an existing (mislabeled-header, content-accurate) dossier. `mla`-indexed 12-byte-stride array walk is a fixed idiom, not entropy — confirmed identical in sibling `021b8608`. |
| `021B6C4C` | 568B | `Ov010_RenderManagerAList` | 18 named calls, all to matched ov005/ov010 siblings. "Flag-RMW branch web" is 4× unconditional `bic/orr`-same-bit (deterministic, not a toggle). |
| `021B8608` | 576B | `Ov010_TeardownManagerAList` | Structural sibling of `021b65e4` — same opener/closer, 3 bounded loops (4-iter probe, then an 8-iter-bounded outer with two nested bounded sub-loops). |
| `021B6E84` | 640B | `Ov010_HandleInputManagerA` | 6 mutually-exclusive `data_02104bac+0x54`/`+0x56` bit-test arms, byte-for-byte the same shape as the documented manager-B twin `021b4ae0` (R8). |
| `021B5898` | 932B | `Ov010_RenderMode1` | 30 calls, all named. 3-iter mode-table loop + straight-line BG/palette/OAM setup, ending in a documented MMIO tail. |
| `021B799C` | 964B | `Ov010_RenderMode2` | Structural twin of `021b5898` (5-iter loop instead of 3, mode-2 symbol set). |
| `021B7EAC` | 1640B | `Ov010_FrameUpdateMode2` | Bounded 7-arm `addls pc,pc` dispatcher, every callee named. Structural twin of `021b5d88`. |
| `021B72C0` | 1756B | `Ov010_InitMode2Display` | 66 calls, ~2 real branches in 1756B — mechanical init. 3 nested bounded nested-list-walk loops (walk-until-null, same idiom as `021b8608`/`021b65e4`). |
| `021B5D88` | 1932B | `Ov010_FrameUpdateMode1` | Bounded 7-arm dispatcher, mode-1 twin of `021b7eac`. 4 of 7 arms directly documented via R8's `021b4884`/`021b4ae0`/`021b4d58`/`021b5168` dossiers. |

**Wall:**
- `021B3774` (548B) — permuter-class: two near-identical mode arms compute an `mla`-adjacent index via `smull`-based ÷10 magic-divide, with the `smull` result's register allocation interacting with a subsequent branch-dependent field update in a scheduling-sensitive way — matches the already-documented `0x021AA6A4` "dense loop with inter-iteration register dependencies" wall class (`Ov008Ov010Retriage.md`).

**New KB gaps (ov010):** `data_ov010_021b93b4/93b8/93bc/93c0` (4-slot task-pair quad, manager-B side); `data_ov010_021b99ec/99f0/99f4/99f8` (parallel quad, manager-A/mode-2-render side); `data_ov010_021b8c2c` extends R8's `021b534c` finding; `data_02104f4c+0x8b0` (third bitmap plane, alongside documented `+0x888`/`+0x8b8`); `data_021040ac+0xb9c`/`+0xb8c` (card-move-pending flag + compare target); `data_ov010_021b8908` geometry table (mode-2 twin of mode-1's shared `data_02104f4c` role); `data_02102c90+0x20`; `data_02106804` (new bitmap, different base than `data_02104f4c`'s family — needs reconciliation); `data_ov010_021b8d44+0x6c`.

---

## ov011 (1/14 tractable, 13 wall)

**This is the hard-residual outlier of the batch** — R7 already drained the
easy layer (5/19 tractable then); this round's 14 are what R7 explicitly
deferred. Nearly every file now carries a `; whole-function ship-as-.s
(GLOBAL_ASM endgame, brief 302)` header — these are deliberately
byte-verified raw-asm ships, not merely unattempted; a "wall" verdict here
means "still assembly, not yet C," not "unverified."

### Tractable (1)

**`021D1D30`** (468B) — `Ov011_RunStateTable`. Originally WALL in
`Ov011Deep.md` ("case-label-order sensitivity... flagging for a build-time
attempt rather than a confident recipe"). **Upgrade reason:** unlike the
genuine jump-table walls in this batch, all 8 arms of this dispatch are
small and **non-interacting** — no arm shares live registers or a partial
tail with another, and 6 of 8 callees are already-matched `.c` files. The
state-write idiom is proven byte-reproducible by matched sibling
`021d1ce8.c`. This is the rare case where a jump table genuinely IS just a
`switch` in disguise.

Ground-truth pool word: `data_ov011_021d403c` (only pool entry).

Jump table (8 slots, `cmp r0,#0x7`/`addls pc,pc,r0,lsl#2` on signed byte
`act->f284`, verified via precise ARM `pc+8` arithmetic — no dead code):

| State | BL targets | `+0x284` write |
|---|---|---|
| 0 | none | none — bare return |
| 1 | `021ca6ac` (guard: nonzero→return) | `&= ~0xff` |
| 2 | `021cf060` (guard: zero→return) | `&= ~0xff` |
| 3 | guard (see below); `021cf048` | `\|= 4`; `+0x268` bits 5-8 RMW from fresh `+0x284` bits 10-13 |
| 4 | `021ca6ac` guard; `021cb218`; `021ceffc` | `+0x280\|=0x200` before calls; `\|=5` |
| 5 | `021cf060` guard; `021cf048`/`021cc7f8`/`021cdb94`/`021ce344`/`021ccfcc` | `\|=6` |
| 6 | same guard as 3; `021d1b70(arg)` | `\|=7` |
| 7 | `021d1b48` guard; `021ccf3c` | clears bits 0-7 AND 20-27; `+0x270 &= ~0x10000000` |

States 3 and 6 share a byte-identical entry guard on `+0x274`. Corrected
boolean (a missing conjunct was caught and fixed via independent ARM
tracing): `bits912 = (u)(f274<<0x13)>>0x1c`; proceed iff
`(bits912==0 && bits2027==0x14) || (bits912==1 && bits2027==0)` where
`bits2027` is freshly re-extracted (`<<0xb>>0x18`) in each branch.

```c
void func_ov011_021d1d30(void) {
    char *b = data_ov011_021d403c;
    int state = (signed char)(*(int *)(b + 0x284));
    switch (state) {
    case 0: return;
    case 1:
        if (func_ov011_021ca6ac() != 0) return;
        *(int *)(b + 0x284) &= ~0xff;
        return;
    case 2:
        if (func_ov011_021cf060() == 0) return;
        *(int *)(b + 0x284) &= ~0xff;
        return;
    case 3: {
        int bits912 = (unsigned int)(*(int *)(b + 0x274) << 0x13) >> 0x1c;
        if (bits912 == 0) {
            int bits2027 = (unsigned int)(*(int *)(b + 0x274) << 0xb) >> 0x18;
            if (bits2027 != 0x14) return;
        } else {
            if (bits912 != 1) return;
            int bits2027 = (unsigned int)(*(int *)(b + 0x274) << 0xb) >> 0x18;
            if (bits2027 != 0) return;
        }
        func_ov011_021cf048();
        int f284 = *(int *)(b + 0x284);
        int f268 = *(int *)(b + 0x268);
        int f284_1013 = (unsigned int)(f284 << 0x14) >> 0x1c;
        f284 = (f284 & ~0xff) | 0x4;
        f268 = (f268 & ~0x1e0) | (f284_1013 << 5);
        *(int *)(b + 0x268) = f268;
        *(int *)(b + 0x284) = f284;
        return;
    }
    case 4:
        if (func_ov011_021ca6ac() != 0) return;
        *(int *)(b + 0x280) |= 0x200;
        func_ov011_021cb218();
        func_ov011_021ceffc();
        *(int *)(b + 0x284) = (*(int *)(b + 0x284) & ~0xff) | 0x5;
        return;
    case 5:
        if (func_ov011_021cf060() == 0) return;
        func_ov011_021cf048();
        func_ov011_021cc7f8();
        func_ov011_021cdb94();
        func_ov011_021ce344();
        func_ov011_021ccfcc();
        *(int *)(b + 0x284) = (*(int *)(b + 0x284) & ~0xff) | 0x6;
        return;
    case 6: {
        int bits912 = (unsigned int)(*(int *)(b + 0x274) << 0x13) >> 0x1c;
        if (bits912 == 0) {
            int bits2027 = (unsigned int)(*(int *)(b + 0x274) << 0xb) >> 0x18;
            if (bits2027 != 0x14) return;
        } else {
            if (bits912 != 1) return;
            int bits2027 = (unsigned int)(*(int *)(b + 0x274) << 0xb) >> 0x18;
            if (bits2027 != 0) return;
        }
        int arg = (unsigned int)(*(int *)(b + 0x284) << 0xc) >> 0x18;
        func_ov011_021d1b70(arg);
        *(int *)(b + 0x284) = (*(int *)(b + 0x284) & ~0xff) | 0x7;
        return;
    }
    case 7:
        if (func_ov011_021d1b48() != 0) return;
        func_ov011_021ccf3c();
        *(int *)(b + 0x284) &= ~(0xff | 0xff00000);
        *(int *)(b + 0x270) &= ~0x10000000;
        return;
    }
}
```

**Levers:** must be a real `switch` (not if-chain) for the `addls pc,pc`
table shape to match; case 0 must be a bare `return` immediately after
dispatch (not a labeled `case 0: ... break;` block). The guard-condition
correction above is load-bearing — verify via objdiff before considering
validated. Do not factor the shared states-3/6 guard into a helper on the
first attempt (per-call-site register liveness risk).

### Confirmed wall (13)

| Address | Size | Reason |
|---|---:|---|
| `021CBC1C` | 780B | 4-way jump table on `act->f240` bits 29-31 downstream of a 3-band distance cascade RMWing `+0x240/+0x258/+0x25c` with a shared mask register live across branches; TWO struct bases interleaved (`data_ov011_021d426c` + `_021d403c`). |
| `021CCB6C` | 976B | Two parallel 4-branch scroll-clamp trees + a near-duplicate `0x80808081`(÷51)+LUT Q12 rotation block appearing twice with DIVERGENT register assignment between the two copies (`r5`↔`ip`, `lr`↔`r6`). |
| `021CD35C` | 536B | 7 simultaneously-live registers, TWO conditional calls per loop iteration to the same callee differing only in a stride-2 arg. |
| `021CD754` | 492B | Still raw `.word` hex — Track A cross-overlay-BL class (2 unresolvable cross-overlay `bl` targets). Not an ordinary reg-alloc wall. |
| `021CDC68` | 1320B | 0x60-iter outer search loop, nested 64-bit Q12 distance test, 3 structurally-parallel-but-textually-distinct sub-search blocks converging on a shared cleanup loop from 3 entry points; all 9 callee-saved regs live. |
| `021CE50C` | 2480B | 700-line body, ~30 branch labels, overlapping-bit dispatch on an 8-bit flags byte, magic-mult applied independently to 2 scroll-axis pairs. |
| `021CFBCC` | 892B | 6-way jump table where arms perform non-parallel logic (duplicated LUT fade math with different post-shifts in 2/6 arms, partial-tail-sharing across only 3/6). |
| `021CFFE4` | 704B | Outer dispatch (0/0x14/0x15/0x16/else) fanning into 3-6-way nested guard chains per case; return value set in only 2/9 leaf paths. |
| `021D02A4` | 1292B | Still raw `.word` hex — Track A, 2 unresolvable cross-overlay `bl` targets + a data-as-function-pointer call. |
| `021D12C0` | 372B | Shell-sort (gap=3n+1, `0x55555556` ÷3 magic-mult) + insertion sort walking two pointers through a byte-indexed aux buffer — kept WALL per `Ov011Deep.md`'s own conservative final call, no new fact changes the calculus. |
| `021D1514` | 880B | Genuine data-driven dispatch through TWO function-pointer fields loaded from the arg struct at runtime (`blx r4` twice) — not reshapeable to a static call. |
| `021D191C` | 556B | 3-branch dispatch on `arg0` ranges, each a 4-7 call chain interleaving 5 bitfield writes between calls in load-bearing order. |
| `021D2428` | 2100B | 8-neighbour ring-buffer fill; the EXACT register reassignment in block 8 of 8 (`r7/r9/r8`→`r6/r7/r5`) was traced and confirmed via grep — concrete proof a hand-written loop over the 8-entry delta table cannot reproduce the compiled output. |

**New KB gaps (ov011):** `0xffff807f` (new 8-bit-clear mask, `021cbc1c`);
`data_ov011_021d426c+0x0/+0x4` (coordinate pair, extends the R7-flagged
camera struct); `data_ov011_021d403c+0x224/+0x228` (coordinate pair
feeding the sin/cos Q12 rotation math in `021ccb6c`). Hygiene note:
`docs/research/dossiers/021d0214.md` incorrectly claims "no .s ship
exists" for an address inside `021cffe4`'s delinked span.

---

## ov016 (17/17 tractable: 15 clean + 2 risk-noted)

Every callee across all 17 functions resolves to an already-documented/
named function — matches R8's finding "every callee already SHIP/MATCHED."
**Resolved an apparent R6-vs-R8 contradiction**: R6's "still low" verdict
on `021b3650`/`021b3b14` used stale byte sizes (720B/470B) from an earlier
revision; current bodies are 828B/1776B and R8's mention of
`func_ov016_021b6350` as a matched sibling refers to a DIFFERENT function
(`021b6350`, `RenderListOverlay`) that legitimately calls `021b3650`/
`021b8040` as sub-calls — confirmed directly via `bl` instructions inside
`021b6350.s`.

| Address | Size | Name | Upgrade reason |
|---|---:|---|---|
| `021B5188` | 188B | (BCD digit-pair drawer) | 12-iter bounded loop calling one already-matched sibling (`021b5154`, `DrawCellPackedSub`). |
| `021B6F08` | 260B | | Clean 4-way dispatch on arg1, 5 named calls. |
| `021B60CC` | 272B | | Callee-of-record from matched `021b7504.c` — signature pinned by the caller. |
| `021B5424` | 280B | **[risk-noted]** | RGB555 palette-blend loop, zero calls, one documented global. Blend-direction expression phrasing needs 1 objdiff pass to confirm — data fully resolved, not a wall. |
| `021B5DD0` | 472B | (touch-highlight box drawer) | 2-state touch-source-A hit-test + OAM pack, all 4 callees named. |
| `021B700C` | 548B | | Signature-pinned `021b7504` calls in 2 bounded loops (up to 7 iters). |
| `021B8040` | 676B | | 7 near-identical calls to the documented 12-arg `func_0201e964` cell builder — table-driven enumeration. |
| `021B7230` | 724B | | 2 task-creation blocks + signature-pinned `021b7504`/`021b398c` calls in bounded loops. |
| `021B6350` | 824B | `RenderListOverlay` | Every callee named; calls `021b8040` (this batch) as a genuine dependency. `/12`-with-rounding idiom matches the documented cell-index math family. |
| `021B3650` | 828B | (CardList section-init) | 21 named `bl` targets, mechanical VRAM/BG/OAM/palette cascade. |
| `021B5A6C` | 868B | (brightness/zoom controller) | 3-state ramp + touch-source-B hit-test; same shape as `021b5dd0` with source B. |
| `021B83A0` | 980B | (card-info panel renderer) | 6 near-identical "clear band → load SE string → blit centered" blocks + 2 Shift-JIS kana-remap loops (documented idiom family). |
| `021B4C14` | 1160B | (CardDetail nav/confirm dispatcher) | Clean bounded 6-way jump table on documented `+0x168` state byte. |
| `021B5544` | 1252B | (stat-panel graphics init) | Confirmed genuine callee of `021b6f08`/`021b4c14`. 3-way switch + two 9-patch tile-border fill loops (new named idiom). |
| `021B3B14` | 1776B | (full section init) | 29 named externs, 5 task-creation blocks, mechanical VRAM/OAM cascade + digit-accumulation via documented dual-register-return `021b1052ecc`. |
| `021B77CC` | 2032B | | 22 named externs, confirmed genuine callee of `021b83a0`. Bounded 3-iter band-select loop + language-gated 4-way branch. |
| `021B6688` | 2176B | **[risk-noted]** | 4-state FSM, 17 named externs. Every branch is a literal bitmask test or a ≤8-iteration loop calling the pinned `021b7504` signature — no reg-alloc entropy, but size/branch-count (54 calls, ~30 blocks) is the highest iteration-risk in this batch. |

**New KB gaps (ov016):** `data_ov016_021bb3c4` (animation-channel
descriptor, same shape as `_bab44`/`_bb2c4`); `data_ov016_021b8e5c` (16-byte
literal table); 5 task-template globals (`_93c8/_93ec/_921c/_9238/_9258/
_927c/_9298`); `data_ov016_021b9374`/`_937e` (2 HitRect records, confirmed
SHARED between `021b6350` and `021b6688`); `data_020b4728` (main-module
global, confirmed at 3 independent overlay sites); `data_021040ac+0x38`
(blend-alpha byte + 3-bit table index — 2 sites); `data_02104bac+0x52`
(new gate field, extends the HIGH-confidence `GlobalData02104bac.md`);
first full bitmask decode of `data_02104bac+0x54` as a D-pad/button state
word (0x400=open-detail, 0x2=close, 0x40=prev-panel, 0x80=next-panel,
0x10=jump-forward, 0x20=jump-backward); the "9-patch tile-border" 3×3
literal-grid idiom (new, not yet in any KB doc — recurs at 2 sites in this
batch alone).
