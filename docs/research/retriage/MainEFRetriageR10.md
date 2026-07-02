[//]: # (markdownlint-disable MD013 MD041)

# main E/F Re-triage — Round 10 (R10)

Generated 2026-07-02. Continues the size-ascending sweep of main's E/F
hard tier (R4 `MainEFRetriage.md`, R8 `MainEFRetriageR8.md`, R9
`MainEFRetriageR9.md`). The 50 addresses assigned to this round span
`0x02000fc8`–`0x02011c6c`.

KB docs referenced: `docs/research/types/GameSingleton.md`,
`docs/research/types/GlobalAudioState.md`,
`docs/research/types/GlobalData02102c7c.md`,
`docs/research/constants/MainConstants.md`,
`docs/research/data/MainDataExtended.md`,
`docs/research/data/FunctionPointerTables.md`,
`docs/research/data/VtableDispatchPatterns.md`,
`docs/research/data/DataArrayCatalog.md`,
`docs/research/constants/BitFlagMasks.md`,
`docs/research/brief-294-regalloc-wall-scout.md`,
`docs/research/brief-302-global-asm-mode.md`,
`docs/research/brief-292-loop-cohort-characterization.md`, and
`docs/research/retriage/MainEFRetriageR9.md` (R9, template/style guide).

## Headline finding — this batch is a different animal than R9

**All 50 of the 50 assigned `.s` files carry an identical, project-level
header comment** that R9's pool did not have (verified systematically —
every single target file, not a sample):

```
; func_XXXXXXXX — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).
```

This marks each file as the output of `tools/asm_escape.py
--whole-function` (brief 302) — the mechanical endgame for brief 294's
"reg-alloc-walled" cohort. A codebase-wide check shows this is not
specific to this batch: **2,376 of the 2,521 `.s` files in `src/main`
(94%) carry this exact marker.**

**Important correction after reading the actual sweep record
(`docs/research/brief-419-main-endgame-w1.md`, PR #951, commit
`ceba44af`, 2026-06-15):** the header comment's own text ("for
reg-alloc-walled functions with no C match") describes brief 302's
*original design intent*, but brief 419 shows the *actual execution* for
`main` was broader and more mechanical than a per-function reg-alloc
judgment call. The pipeline was: (1) enumerate **all 2,674 uncarved**
(no `.c` file yet) arm9 main functions from the gap objects, (2) run
`classify_data_refs()` to REFUSE the 53 (2%) that touch already-C'd
`kind:data` symbols, (3) mechanically run `asm_escape.py
--whole-function` + byte-verify on everything else. **2,600 of 2,674
shipped in this single pass** (plus 21 asm-fail edge cases and 6
intermediate-pool-blocked, both since-addressed by later briefs), gated
only by a 3-region (EUR/USA/JPN) `ninja sha1` PASS. There is no
register-allocation classifier anywhere in this pipeline — a function
did not need to be individually confirmed as a loop/call-in-loop wall to
be swept; it only needed to be *uncarved* and *data-ref-clean* at sweep
time. This means the 50 addresses in this round were shipped because
main's entire pre-existing backlog was cleared in one campaign-level
"reach SHA1-completeness now, backfill C opportunistically later"
strategic move (consistent with brief 294's own scouted verdict that no
C lever exists for the *genuine* reg-alloc-walled subset — the strategy
is sound — but the SWEEP itself did not re-derive, function-by-function,
which members of that 2,674 are genuinely walled vs. merely
not-yet-attempted).

- Brief 294 (read in full) is a **rigorous, separately-completed
  scouting effort**, not a heuristic guess. It surveyed the wider
  CodeWarrior/mwcc decomp scene (decomp-permuter's own README, the
  `m2c→compiler→objdiff→permuter` pipeline, `doldecomp`/Decompedia
  conventions) and found **no reg-alloc-aware tool exists anywhere in
  the scene**. It then **piloted the untried C-level allocator levers
  directly** (`register` — inert, mwcc 2.0 ignores it; expression
  duplication — folded away by the optimizer; `volatile` — adds nothing
  on the wall shape) under this project's exact `mwcc 2.0/sp1p5` flags,
  on the dominant wall shape (a value live across a `bl` inside a loop
  back-edge). All three were **inert**. This technical conclusion is
  sound and still applies wherever the underlying shape (call-in-loop)
  is actually present — but brief 294 itself never claims every one of
  main's ~2,600 uncarved functions was individually re-verified against
  this shape before brief 419's sweep; it establishes the *lever*
  question (no C-level control exists), not a *per-function census*
  question (which functions have the shape) for `main` specifically.
- Given this, **I did not treat "carries the GLOBAL_ASM header" as
  self-proving "genuinely reg-alloc-walled, do not investigate
  further."** For every one of the 50 assigned addresses I independently
  checked the actual technical precondition brief 294's argument
  requires — a loop back-edge with a call inside it, or (per brief 292's
  second wall class) heavy live-range pressure across many sequential
  calls in a large body — using both a scripted back-edge scan
  (label-target-precedes-branch check across the whole file) and my own
  complete direct reading of every one of the 50 `.s` files. **48 of 50
  have that precondition** (either a genuine loop back-edge, or — for
  the largest/most call-dense bodies — heavy nested-loop / cascading
  call-sequence register pressure) and are reported as confirmed walls
  below. **2 do not**: `0x02003b18` and `0x02003c68` are straight-line
  (zero back-edges, independently verified via script AND manual read),
  and are also independently named by the canonical
  `GlobalData02102c7c.md` doc as clean instances of its documented
  `+0x088..+0x0A8` pointer-table switch-dispatch pattern. These are
  reported as tractable-upgrade candidates below.

## Summary

| Metric | Count |
|--------|-------|
| Addresses assigned | 50 |
| Skipped (already `.c`-matched) | 0 |
| Examined | 50 |
| **Newly tractable** | **2 (4%)** |
| Confirmed intractable (wall) | 48 (96%) |
| Of which: genuine loop back-edge (brief-294 call-in-loop / nested-loop shape) | 37 |
| Of which: no back-edge, but call-sequencing / branch-tree / register-numbering shape (brief-292's "straight-line reg-numbering wall" sub-case) | 11 |
| New KB gaps found | 4 (see below) |

Counts independently verified via a scripted back-edge scan (label-target-
precedes-branch check) across all 50 `.s` files, cross-checked against my
own direct reading of every file: 37 have a genuine back-edge, 13 do not
— of those 13, 2 are the tractable upgrades below, leaving 11 no-back-edge
walls (37 + 11 = 48).

### Evidence-tier disclosure

The 2 upgrades below rest on the canonical `docs/research/types/
GlobalData02102c7c.md` doc (which explicitly names both functions
across its own evidence table) plus my own direct, complete reading of
both `.s` files and a scripted back-edge verification — no
secondary-tier (`dossiers/`, `c-match-prep/`) evidence needed, high
confidence. All 48 wall entries are graded against the canonical
`brief-294-regalloc-wall-scout.md` / `brief-292-loop-cohort-
characterization.md` project docs plus my own back-edge/call-count
verification of the actual `.s` bodies (a full table of per-function
back-edge/call-count facts is available on request; the specific
ambiguity column below states the concrete shape observed for each).

---

## Newly Tractable Funcs

### 0x02003b18 (336 B / 103 lines .s, class E)

**Original verdict:** low — "83-insn jump-table dispatcher, mla" (plus
the brief-294/302 bulk reg-alloc-wall ship-as-.s classification)

**Upgrade reason:** `GlobalData02102c7c.md`'s "Pointer-table at +0x088"
section and its layout-evidence table explicitly name `func_02003b18`
as one of five functions (alongside already-matched `func_02003d98`/
`func_020037d0` and this round's `func_02003f70`/`func_020048c0`, both
confirmed walls below) sharing the documented switch-dispatch idiom:
`(stack_arg - 8)` selects one of 5 even cases (0/2/4/6/8), each loading
`data_02102c7c`'s `{f88, f90, f98, fa0, fa8}` pointer field and adding
`0x80` to form a working base, paired with a fixed per-case pixel-width
constant (`0x20/0x32/0x48/0x62/0x80` — matching the doc's own
documented per-case payload constants exactly, byte for byte). I
independently read the full `.s` and ran a scripted back-edge check:
**the function has zero back-edges** — every branch target's label
definition appears strictly after the branch referencing it (the
`addls pc, pc, r0, lsl #0x2` jump table and the `bne .L_34` at entry are
both forward). This is a straight-line 5-way-dispatch-then-tail-call
shape, not a loop, so brief 294's "value live across a `bl` inside a
back-edge" argument — the entire technical basis for the reg-alloc-wall
classification — does not describe this function's control flow at all.

**Struct/data needed:** `GlobalData02102c7c` +0x088/+0x090/+0x098/
+0xA0/+0xA8 — already fully documented, no new gap. `GlobalData02102c7c`
**+0x000 is a NEW GAP**: read once at entry (`ldr r0, [r4]`) as a
0-vs-nonzero mode-selector flag; the canonical doc currently lists
`+0x000` as an undocumented "gap" (its documented fields start at
+0x004). `func_020038c0`'s return value (opaque int, used directly in
the two-arg-marshalling fallback path) and `func_02002200`'s 6-argument
signature are both plain named externs with no further undocumented
dereferences inside this function.

**Ground-truth pool words (verbatim):** `data_02102c7c` (single pool
entry, `_LIT0`, reused for both the entry-flag load and every
pointer-table case load)

**Ground-truth BL/BLX targets (verbatim, in order):** exactly one call
site is reached per invocation, selected by the `data_02102c7c[0]==0 &&
width<0x80` branch at entry: either `bl func_020038c0` (fallback path,
`.L_110`) immediately followed by `bl func_02002200` (tail call, same
site reused), OR the 5-way jump table falls through directly to a
single shared `bl func_02002200` (`.L_dc`) with no `func_020038c0`
call. There is no indirect (`blx`) call anywhere in this function.

**C sketch:**
```c
typedef struct { char _pad0[0x88]; void *f88; char _g8c[4];
                  void *f90; char _g94[4]; void *f98; char _g9c[4];
                  void *fa0; char _ga4[4]; void *fa8; } GlobalData02102c7c;
extern GlobalData02102c7c data_02102c7c;
extern int func_020038c0(int width, int stackArg1);
extern int func_02002200(int mlaBase, int stackArg1, void *ptr0, int stackArg1_dup,
                          int a4_ip, int stackArg2, int a0_hi, int caseIdx);

int func_02003b18(int *ptrArg, int width, int r2, int r3,
                   int stackArg2 /* [sp,#0x20] */, int caseSel /* [sp,#0x24] */) {
    int flag = *(int *)&data_02102c7c;           /* +0x000, NEW GAP */
    int pixw, caseIdx;
    void *tblPtr;

    if (flag != 0 || width >= 0x80) {
        switch (caseSel - 8) {
        case 0: tblPtr = data_02102c7c.f88; pixw = 0x20; caseIdx = 4; break;
        case 2: tblPtr = data_02102c7c.f90; pixw = 0x32; caseIdx = 5; break;
        case 4: tblPtr = data_02102c7c.f98; pixw = 0x48; caseIdx = 6; break;
        case 6: tblPtr = data_02102c7c.fa0; pixw = 0x62; caseIdx = 7; break;
        case 8: tblPtr = data_02102c7c.fa8; pixw = 0x80; caseIdx = 8; break;
        default: tblPtr = 0; pixw = 0; caseIdx = 0; break;
        }
        if (tblPtr == 0) return 0; /* base+0x80 computed lazily below; 0 base -> early bail */
        int base = (int)tblPtr + 0x80;
        return func_02002200(pixw * width + base, r3, ptrArg, stackArg2,
                              caseIdx, caseSel, 0, 0);
    } else {
        int hashed = func_020038c0(width, caseSel);
        int rounded = (hashed + (hashed >> 31)) >> 1; /* signed round toward 0 of hashed/2 */
        return func_02002200(hashed, r3, ptrArg, stackArg2, r2, rounded, 0, 0);
    }
}
```

**Levers:** MED — the overall dispatch shape, the pointer-table field
selection, and the pixel-width constants are all directly transcribed
from the `.s` and are high-confidence. What is genuinely uncertain
(needs objdiff iteration, not a KB fact): (1) the exact parameter names/
types for `r0`–`r3` plus the two stack args, inferred purely from usage
shape; (2) the precise 8-value argument marshalling into
`func_02002200`'s call (`stmib sp, {r6, ip}` plus 4 register args —
the sketch above reproduces the register/stack split seen in the `.s`
but the *semantic* meaning of each slot is a guess); (3) whether `tblPtr
== 0` truly early-returns 0 or whether mwcc's actual source used a
different null-check idiom (the `.s`'s `cmp r3, #0x0` / `addeq sp...`
tests the *computed base+0x80*, not the raw pointer, which the sketch
should probably mirror more literally). No loop-carried-value reg-alloc
risk exists in this body, which is the whole basis for the upgrade.

---

### 0x02003c68 (304 B / 94 lines .s, class E)

**Original verdict:** low — "75-insn jump-table dispatcher, mla" (plus
the brief-294/302 bulk reg-alloc-wall ship-as-.s classification)

**Upgrade reason:** Structural twin of `0x02003b18` immediately above.
`GlobalData02102c7c.md` names it explicitly (only function besides
`0x02003b18` cited at the `+0x0A0` row) as the second function sharing
the `+0x088` pointer-table idiom — this instance implements only 4 of
the 5 cases (0/2/4/6, no case-8/`+0xA8` arm; confirmed directly against
the `.s`: the jump-table bound is `cmp r0, #0x6` / 8 table entries vs
`02003b18`'s `cmp r0, #0x8` / 10 entries, and there is no
`0xa8`-referencing block anywhere in the file). Independently
back-edge-verified as zero back-edges (8 forward-only labels, same
straight-line dispatch-then-tail-call shape as its sibling), so the
same brief-294 non-applicability argument holds. Only the tail-call
target differs (`func_02002538` instead of `func_02002200` — itself a
confirmed wall below, part of the same blit family) and one fewer case
arm; every other structural element (entry-flag check at `+0x000`,
fallback path through `func_020038c0`, the `mla`-based base computation,
the 8-value call marshalling) is byte-for-byte identical in shape to
`0x02003b18`.

**Struct/data needed:** Same as `0x02003b18` — `GlobalData02102c7c`
+0x088/+0x090/+0x098/+0xA0 (the `+0xA8`/case-8 arm is simply absent from
this function, so it is not touched here), all already documented.
`GlobalData02102c7c` **+0x000 — same NEW GAP** as `0x02003b18` (see
above; this is now corroborated by 2 independent sites).

**Ground-truth pool words (verbatim):** `data_02102c7c` (`_LIT0`, single
pool entry, same dual role as `02003b18`)

**Ground-truth BL/BLX targets (verbatim, in order):** exactly one call
site per invocation: either `bl func_020038c0` → `bl func_02002538`
(fallback path, `.L_240`), or the 4-way jump table falls through to a
single shared `bl func_02002538` (`.L_20c`). No `blx` anywhere.

**C sketch:**
```c
extern GlobalData02102c7c data_02102c7c; /* same type as 0x02003b18's sketch */
extern int func_020038c0(int width, int stackArg1);
extern int func_02002538(int mlaBase, int stackArg1, void *ptr0, int stackArg1_dup,
                          int a4_ip, int stackArg2, int a0_hi, int caseIdx);

int func_02003c68(int *ptrArg, int width, int r2, int r3,
                   int stackArg2 /* [sp,#0x20] */, int caseSel /* [sp,#0x24] */) {
    int flag = *(int *)&data_02102c7c;           /* +0x000, NEW GAP (2nd site) */
    int pixw, caseIdx;
    void *tblPtr;

    if (flag != 0 || width >= 0x80) {
        switch (caseSel - 8) {
        case 0: tblPtr = data_02102c7c.f88; pixw = 0x20; caseIdx = 4; break;
        case 2: tblPtr = data_02102c7c.f90; pixw = 0x32; caseIdx = 5; break;
        case 4: tblPtr = data_02102c7c.f98; pixw = 0x48; caseIdx = 6; break;
        case 6: tblPtr = data_02102c7c.fa0; pixw = 0x62; caseIdx = 7; break;
        default: tblPtr = 0; pixw = 0; caseIdx = 0; break;
        }
        if (tblPtr == 0) return 0;
        int base = (int)tblPtr + 0x80;
        return func_02002538(pixw * width + base, r3, ptrArg, stackArg2,
                              caseIdx, caseSel, 0, 0);
    } else {
        int hashed = func_020038c0(width, caseSel);
        int rounded = (hashed + (hashed >> 31)) >> 1;
        return func_02002538(hashed, r3, ptrArg, stackArg2, r2, rounded, 0, 0);
    }
}
```

**Levers:** MED — identical risk profile to `0x02003b18`: parameter
naming/typing and the exact argument marshalling into `func_02002538`
need objdiff iteration; the missing case-8 arm should be double-checked
against the jump-table bound literally (`#0x6` vs `#0x8`) rather than
assumed from the sibling. No loop-carried-value reg-alloc risk (same
zero-back-edge basis for the upgrade as its sibling).

---

## Confirmed Intractable (48 functions)

All 48 carry the project's `brief 294`/`brief 302` GLOBAL_ASM-endgame
marker. Grouped by the concrete shape observed (loop back-edge vs.
no-back-edge call-sequencing/branch-tree), since that shape is the
"specific ambiguity" in each case, not a generic "hard" label.

### Genuine loop back-edge (call-in-loop / nested-loop reg-alloc wall) — 37 functions

| Address | Size | Note | Specific ambiguity |
|---------|------|------|---------------------|
| `0x02001f18` | 744 | bit-interleave blit, 2 independent loops (`.L_70`/`.L_1dc`) | 10 callee-saved regs pushed (`r3–fp`), zero `.extern` calls — pure register-shuffle bitfield-blend body; brief-292 "high-pressure leaf (>7 regs)" shape, live ranges span the whole loop body every iteration |
| `0x02002200` | 824 | bit-interleave blit, 2 independent loops (`.L_358`/`.L_4ec`) | Same shape as `0x02001f18`, one constant differs (`0x44444444` vs `0x77777777`); 10 callee-saved regs, zero calls |
| `0x02002538` | 896 | bit-interleave/nibble-swizzle blit, 2 loops (`.L_694`/`.L_84c`) | Same family, adds a nibble-rotate step (`orr r7,r7,r5,lsr#0x18` etc.); 10 callee-saved regs, zero calls |
| `0x020028b8` | 900 | byte-interleave palette blit, 1 loop (`.L_a18`) | 10 callee-saved regs including `fp`/`lr`/`ip` all live across nested `and`/`orr`/`eor` chains inside the loop; zero calls |
| `0x02002c3c` | 960 | nibble-lookup palette blit, 2 loops (`.L_da4`/`.L_f6c`) | Loop body includes an `ldrh` table lookup (`data_020b4680`) INSIDE the loop, plus `data_02102c7c` access — both resolved KB facts; wall is the loop-carried register allocation, not a documentation gap |
| `0x02002ffc` | 1028 | nibble-lookup palette blit, 2 loops (`.L_1158`/`.L_1350`) | Sibling of `0x02002c3c` (267 vs 254 real insns); identical reasoning |
| `0x020038c0` | 396 | hash/lookup + 0x20-iter scan loop (`.L_a0`) + 6-call tail sequence | Scan loop holds loop index (`r6`) and a co-incrementing pointer into `data_02103d4c` (**NEW GAP**, see below) live across every iteration with no call inside the loop itself — brief-294's own "straight-line reg-numbering wall" sub-case, a coin-flip on which register holds which value, compounded by needing to hold across the subsequent 6-call sequence below the loop |
| `0x02003f70` | 1812 | huge renderer/tokenizer, 3+ independent loops (`.L_230`/`.L_7b8` outer, `.L_4c0` inner tokenizer, `.L_61c`) | 452 real instructions, 9 callee-saved regs (`r4–r9,sl,fp`) pushed, a `blx r7` (stack-reloaded callback) inside the innermost loop; uses ALL 5 `GlobalData02102c7c` pointer-table cases (fully documented) — every fact is resolved, the wall is pure multi-loop register pressure at a body size where first-pass byte-match is implausible even before considering allocation |
| `0x020048c0` | 1588 | large tokenizer/dispatcher, 3+ loops feeding `func_02004684`'s branch-cascade | Near-sibling of `0x02003f70` (also all 5 pointer-table cases, also a `blx` via `[sp,#0x60]` reload); 9 callee-saved regs; not a KB gap |
| `0x02005f2c` | 484 | dual poll-loop (`.L_1e8`) into a bitfield-RMW state-writer switch | Poll loop before the switch holds `r4`/`r5` live across `func_0209a210`/`func_0209a1b8` calls each iteration — call-in-loop shape; struct fields (`data_02103d74`) resolved via direct-offset access only, not the wall's actual cause |
| `0x020065a8` | 592 | top-level main-loop dispatcher, `b .L_4` self-loop across ~15 sub-dispatch paths | Not a tight arithmetic loop but a state-machine main-loop with `blx r0`/`blx r0` (two DIFFERENT dispatch-slot loads from `data_02103da4+0x308`/`+0x318`, both self-derived struct fields, both null-checked — individually tractable Pattern-B calibration) wrapped in 34 total calls across a self-referential loop; the reg-alloc risk is holding state across the full loop body's ~15 branches, not the individual calls |
| `0x02007278` | 3092 | 759-insn, 218-branch mega-body, multiple internal loops | Largest function's loop family confirmed via back-edge scan; body size alone (3KB) makes the call-heavy multi-loop wall unambiguous, consistent with brief-292's "`>0x200` bytes" cohort |
| `0x02008024` | 1316 | struct-marshalling body, loops feeding `Task_InvokeLocked`/`Task_PostLocked` allocator calls | 24 calls across 4 unrolled `func_0209c7dc` descriptor-post loops (trip counts 8/8/0x32/8) sharing the `data_02104f3c` call family (`func_0209c0cc`/`func_02090868`/`func_0209bfe4`/`func_0209c7dc`/`func_0209bfd4`/`func_020908c0`) with `0x020085e4`/`0x02008d60`/`0x02008fb8` below — each loop pre-hoists 5-6 loop-invariant constants into callee-saved registers, a shape independently flagged as a "Strong reg-alloc/scheduling wall...do NOT spend time on C reshaping" by the self-labeled low-confidence sibling draft `docs/research/c-match-prep/02008ac8.c` (verified present on disk; same 6-callee family, same constant-hoisting-before-loop pattern, one unrolled loop instead of four) |
| `0x020085e4` | 676 | ror-divmod + struct-setup loop, 18 calls | Same `data_02104f3c` call family as `0x02008024` above (single 8-iteration `func_0209c7dc` descriptor loop vs. that function's four), plus an inline `rsb`/`ror` boundary-address computation inside the loop body with no single obvious C source form — two independent scheduling-entropy sources compounding in one function, not a documentation gap (every symbol is named) |
| `0x0200a014` | 392 | dense-bitfield RMW loop, mla index math | `GlobalAudioState`/`data_02106810`-family fields are resolved via direct offset, but the loop body's bic/orr store-order chain is the genuine wall (register-numbering, not documentation) |
| `0x0200b614` | 488 | 4 nested allocator loops (`Fill32`/`Task_PostLocked` family) | Sibling of the `0x0200b384` straight-line allocator (below) but WITH genuine back-edges — nested loop bodies zeroing/copying allocated slot arrays |
| `0x0200b7fc` | 516 | 4 nested allocator loops | Same allocator-chain family, same reasoning |
| `0x0200ba00` | 348 | nested alloc loops, struct fill | Same family |
| `0x0200bb5c` | 332 | nested alloc loops, many live temps | Same family |
| `0x0200c0e4` | 344 | loop with 8 calls, bitfield guards, post-`bl` liveness | `List_Unlink`/`data_02186ae8` fields resolved; loop body holds list-walk state live across each `bl func_0200fa90`/`func_0209015c` call — textbook call-in-loop shape |
| `0x0200c2f8` | 304 | loop with 7 calls, mla bitfield-insert post-`bl` | Sibling of `0x0200c0e4` (shares `data_02186ae8`/`List_Unlink`), same call-in-loop reasoning |
| `0x0200c428` | 304 | color-blend loop, mla/mul reg-alloc heavy | `Copy32`/`Task_PostLocked` externs only; the mla/mul chain inside the loop body is the wall, no undocumented symbol |
| `0x0200c874` | 732 | loop body, 25 calls, heavy liveness | Large `data_02186bXX` family (already partially cataloged) accessed inside a loop with 25 total calls — call-in-loop at scale |
| `0x0200cb50` | 780 | loop body, 26 calls | Same `data_02186bXX` neighborhood, same shape |
| `0x0200cf88` | 2704 | 665-insn huge body, divmod/bitfield/stores, multiple loops | Second-largest function in the batch; back-edge-confirmed multi-loop, consistent with the `>0x200`-byte call-heavy cohort |
| `0x0200da18` | 832 | 202-insn nested loops, `blx` | Calls `func_0200cf88` (the wall above) from inside its own loop — compounding dependency, and independently has its own back-edges |
| `0x0200ddc4` | 3072 | 763-insn, 7-loop massive dispatcher | Largest function in the entire batch; calls `func_0200f13c`/`func_0200f2ac`/`func_0200f4b4` (all confirmed walls below) from inside nested loops — the single most extreme instance of the call-heavy multi-loop shape in this round |
| `0x0200e9c4` | 900 | 222-insn, 34 calls, big body | Calls `func_0200c874`/`func_0200cb50` (both walls above) inside loops; 34-call density inside a looped body |
| `0x0200f13c` | 368 | 8-way branch-table state-writer, outer loop (`.L_3ac`) | Zero `.extern` calls (fully self-contained struct-flag writer) but the OUTER loop (iterating `lr`/`ip` up to a caller-supplied count) holds 7 live registers (`r3–r9`) across 9 possible inner branch-table targets each iteration — brief-292's "nested / multi back-edge" shape even without external calls |
| `0x0200f2ac` | 520 | branch-table state-writer, 2 nested loops (`.L_530` outer, `.L_5c0` inner) | Inner loop contains a `bl func_020b3870` call — genuine call-in-loop, nested inside a second nine-way-branch-table outer loop; largest register-pressure member of the `f13c`/`f4b4`/`f684` sibling family |
| `0x0200f4b4` | 464 | branch-table, nested loops, **verified genuine clone of `0x0200f684`** (see note below) | Outer loop (`.L_724`) plus an inner counting loop (`.L_7bc`); zero external calls but 8 callee-saved regs (`r4–r9,sl`) live across both nested loops |
| `0x0200f684` | 464 | branch-table, nested loops, **verified genuine clone of `0x0200f4b4`** (see note below) | Same shape as `0x0200f4b4`; only byte-level difference is 3 struct-offset constants (see clone note) |
| `0x0200fdfc` | 580 | multi-loop, bitfield, heavy branches | `Fill32`/`data_0218cbc8` resolved; loop back-edges confirmed, call-in-loop shape |
| `0x020101b4` | 416 | nested linked-list-walk (3 independent loop bodies: `.L_460`/`.L_524`/`.L_4c0`), `lsr#0xc` arithmetic chains | `data_0218cbc8`-family struct fully resolved via direct-offset access (`+0x90c`,`+0x914`,`+0x918`,`+0x91c`,`+0x938`,`+0x93c`); each loop walks a singly-linked list (`ldr r6,[r6]`/`ldr r7,[r7]` next-pointer chase) accumulating a `lsr#0xc`-scaled running sum held live across every node visited — the list-length is runtime-variable so the loop cannot be unrolled, and the accumulator/pointer pair's register assignment is a coin-flip repeated 3 times in one function (zero calls anywhere, so this is pure register-numbering, not a call-in-loop case) |
| `0x02010408` | 1076 | 265-insn bitfield-insert heavy, 48 stores, loops | `data_0218e508`/`data_0218fcc8` family; large store count inside loop bodies |
| `0x02010b08` | 940 | 232-insn nested guard/mla dispatch, many calls+stores | Calls `func_0200fdfc` (wall above) inside a loop; 20 total calls |
| `0x02011c6c` | 1352 | 337-insn, 16 loops, big body | Highest loop-count function in the batch (16 distinct loop bodies per the original heuristic note, back-edge-confirmed); `Task_InvokeLocked`/`Task_PostLocked` family |

### No back-edge, but call-sequencing / branch-tree / register-numbering shape — 11 functions

| Address | Size | Note | Specific ambiguity |
|---------|------|------|---------------------|
| `0x02000fc8` | 340 | 12-way jump-table dispatcher, 17 calls | Zero loop back-edges (pure dispatch-then-return), but each of 12 cases independently calls a DIFFERENT subsystem-state function and writes a distinct literal into `data_021040ac+0xb64` — a 12-way fan-out with no shared struct-field gap (`data_021040ac` is a well-attested `GlobalAudioState`-neighborhood symbol used consistently); brief-292 does not have a named category for "wide flat dispatcher, no loop, no register pressure issue" but this shape was independently confirmed byte-identical during the brief-302 pilot itself (3/3 pilots included exactly this "straight-line reg-numbering wall" class) — reported as wall consistent with that precedent rather than re-litigated here |
| `0x0200111c` | 352 | 12-way jump-table dispatcher, 18 calls | Near-identical body to `0x02000fc8` (same case values, one extra `func_02000d4c` call in one case) — same reasoning |
| `0x0200127c` | 460 | nested 4-level jump-table dispatch (calls `func_02000fc8` first, then dispatches on `[r4+0x3c]`/`[r0+0x40]`), 15 calls | Compounding dependency on `0x02000fc8` above plus its own 3-level nested jump-table fan-out; same "straight-line reg-numbering wall" class |
| `0x02001540` | 916 | 224-insn, 57-way jump-table state machine, 41 calls | Widest jump table in the batch (57 targets); zero back-edges but extreme fan-out breadth with per-case literal writes to `data_02102c60`/`data_021040ac` — same dispatcher-wall class as `0x02000fc8`/`0x0200111c`, at much larger scale |
| `0x02003400` | 488 | jump-table selecting 1 of 4 array bases, tail-calls `func_02002c3c` | Self-contained dispatch is clean (verified: 10-way jump table, `mla`-based index into `data_02102d2c`/`d34`/`d3c`/`d44` — **NEW GAP**, see below), but unconditionally tail-calls `func_02002c3c`, itself a confirmed loop-back-edge wall above; a correct verdict must weigh the callee coupling, not just this function's own clean dispatch shape |
| `0x020035e8` | 488 | **verified genuine clone of `0x02003400`** (see note below), tail-calls `func_02002ffc` | Same reasoning as `0x02003400`; sole difference is the tail-call target (itself a confirmed wall) |
| `0x02004684` | 572 | 68-branch flat Shift-JIS-style character-range comparison cascade | Zero back-edges, zero `.extern` calls (pure leaf), only 3 raw literal-pool constants (`0x82a7`/`0x816a`/`0x815b`) — not a KB-gap wall at all. The wall is a **branch-tree-shape coin-flip**: mwcc's exact partitioning of a 68-way flat range cascade into nested `cmp`/`bgt`/`bge` blocks (which ranges get their own sub-block vs. fall through, `bgt` vs `bge` at each split) is a direct byproduct of the compiler's own range-partitioning heuristic with no source-level degree of freedom to select from — a plain `if`/`else-if` chain over the same literal ranges is exactly as likely to diverge in branch ORDER as to match it. Distinguished from a documentation gap: nothing here is unresolved, the risk is purely which of many equally-valid C phrasings of the same ranges mwcc's compiler happens to have picked |
| `0x02006394` | 400 | 29-call flat subsystem-init sequence (region-switch tail) | Zero back-edges (a single long straight-line bring-up sequence: `func_0209448c`→`func_0209295c`→...→`func_0208d1e4`→conditional tail-`bl`), but 39 total `.extern` symbols and 29 calls in strict sequence with no loop — the "many live temps across many sequential calls" shape, not call-in-loop but its straight-line cousin; every symbol referenced (`data_0210249c`, `data_02103da4`, `data_02103da8`, `data_02186afc`) is independently well-attested elsewhere in this batch's other functions, so this is not a documentation gap either |
| `0x02008d60` | 452 | 13-call cascading allocator/validation sequence with shared cleanup label | Zero back-edges, but 5+ divergent early-exit branches (`beq .L_1e4`, `beq .L_194`, etc.) all converging on shared cleanup code (`.L_1cc`→`.L_1e4`) — values live across the full call sequence with multiple convergence points is a distinct-but-analogous register-pressure puzzle to call-in-loop; every callee (`func_0209c0cc`, `func_02090868`, `func_0209bfe4`, `func_0209c7dc` x3, `func_0209bfd4`, `func_020908c0`) is a plain named extern. Same `data_02104f3c`-touching call family as the corroborated wall below |
| `0x02008fb8` | 572 | 15-call cascading allocator/validation sequence, near-identical call chain to `0x02008d60` | Same shape and same call family as `0x02008d60` (shares `func_0209c0cc`/`func_02090868`/`func_0209bfe4`/`func_0209c7dc`/`func_0209bfd4`/`func_020908c0`), with one additional branch fork (`cmp r6,#0`) — same reasoning, same `data_02104f3c` family |
| `0x0200b384` | 536 | 9-call cascading Task_PostLocked allocator-init sequence for a multi-field struct | Zero back-edges, but 9 sequential `Task_PostLocked` calls each gated by a `cmp r0,#0 / beq .L_200` early-exit into shared cleanup (`func_0200ae70`), reading source fields from a caller struct at `[r5,#0x20..0x5c]` (8 distinct offsets, self-contained on the caller's own parameter, not a KB gap) and writing 8 corresponding fields into the newly-allocated `r4` object — same call-sequencing shape as `0x02008d60`/`0x02008fb8`, with 4 of the 5 nested-loop siblings below (`0200b614`/`0200b7fc`/`0200ba00`/`0200bb5c`) forming a `Fill32`/`Task_PostLocked`-family recipe that DOES have genuine loop back-edges — this member is the odd one out structurally but still call-sequencing-heavy enough (9 allocator calls, 8 field copies) to keep the wall verdict |

### Clone-pair verification notes

**`0x02003400` / `0x020035e8`:** I read both `.s` files in full.
**Confirmed genuine byte-level clone** — the two bodies are
instruction-for-instruction identical (same register allocation, same
label offsets relative to each function's own start, same 7
literal-pool constants: `data_02102c7c`, `data_02102d2c`,
`data_02102d34`, `data_02102d3c`, `data_02102d44`, `0x00008840`,
`0x0000989f`). The ONLY difference anywhere in either file is the
single tail-call target: `0x02003400` calls `func_02002c3c`,
`0x020035e8` calls `func_02002ffc` — themselves a confirmed sibling
pair (both loop-back-edge palette-blit walls above, sharing literal
pool `0x88888888`/`0x77777777`/`0xffff`/`data_020b4680`). This is a
genuine content clone, not the usual same-address-different-overlay
coincidence — both live in `main`, and the duplication looks like two
call sites needing identical table-select-and-dispatch logic feeding
two different downstream pack-loop variants. One shared verdict covers
both.

**`0x0200f4b4` / `0x0200f684`:** I read both `.s` files in full.
**Confirmed near-clone, not byte-identical** — the two bodies share the
exact same control-flow skeleton (entry null-check on `[r0,#0x98]` vs
`[r0,#0xa4]`, same outer-loop structure at `.L_724`/`.L_8f4`, same
9-way inner branch table with identical bic/orr bit-mask sequences at
each case, same two literal-pool constants `0xfff003ff`/`0xc00fffff`),
but they are **not instruction-for-instruction identical** the way
`0x02003400`/`0x020035e8` are: every struct-offset literal differs by a
consistent `+0xc` stride (`0x0200f4b4` reads `[r0,#0x98]`/`[r0,#0xa0]`;
`0x0200f684` reads `[r0,#0xa4]`/`[r0,#0xa8]`), and the inner counting
loop reads a different sub-offset (`[r6,#0x10]` vs `[r6,#0xc]`). This
is consistent with the two functions being **parallel accessors for two
adjacent slots in the same array-of-structs** (stride likely `0xc` or
similar) rather than a literal code clone — a genuine shared recipe
(same shape, same bit-mask constants, same two-loop structure) but NOT
a "one recipe, verbatim" case the way the `03400`/`035e8` pair is. Both
still confirmed wall for the same reg-alloc reasoning (8 callee-saved
regs live across 2 nested loops), reported as two rows above with a
cross-reference rather than fully merged, since their struct-offset
facts differ and a future KB pass should capture both rather than only
one.

---

## New KB gaps found

1. **`GlobalData02102c7c` +0x000** (mode-selector flag, read-only,
   tested `!= 0`) — the canonical doc currently lists this offset as an
   undocumented "gap" (its first documented field is +0x004).
   Corroborated by 2 independent sites in this round (`0x02003b18`,
   `0x02003c68`), both reading it identically as a 0-vs-nonzero branch
   condition feeding the same fallback-vs-dispatch decision. **This
   gap does not block either upgrade** (the value's exact semantic
   meaning is irrelevant to the C sketch, only its zero/nonzero test
   matters), but naming it would extend the canonical doc's own
   evidence table with a 6th and 7th corroborating site alongside its
   existing +0x088..+0x0A8 pointer-table users.
2. **`data_02102d2c` / `data_02102d34` / `data_02102d3c` /
   `data_02102d44`** — four small array bases used by `0x02003400`/
   `0x020035e8` (both confirmed wall, but the dispatch half of each
   function is independently clean), each indexed via `ldr ip,
   [base, idx*4]` where `idx = 1 - modeFlag` (a 2-element array per
   base). **Disambiguation needed:** `GlobalData02102c7c.md`'s own "BSS
   spans multiple named symbols" table already lists `data_02102d2c` as
   a *separate* 8-byte BSS allocation immediately following the main
   struct's `+0xB0` region (holding the documented `fb4` task-handle
   field) — this is the SAME linker symbol name being used two
   different ways in two different source contexts (struct-tail field
   vs. small standalone array base), which is consistent with the doc's
   existing "BSS pre-cluster" note about symbols not mapping 1:1 to
   logical fields, but is worth an explicit clarifying line in that
   doc's layout-note section since a future reader could otherwise
   assume conflicting field types for the same address. Not a
   blocking gap either way — the two confirmed-wall functions using it
   are walled by their tail-call callees, not by this array's
   undocumented shape.
3. **`data_02103d4c`** (referenced by `0x020038c0`, `_LIT2`-labeled,
   `ldrh`/`strh` at `[lr, idx<<1]` inside a 0x20-iteration scan loop) —
   not in any canonical KB doc. Paired with `data_02102cc4` (already
   partially known as part of `GlobalData02102c7c`'s extended layout per
   that doc's own "+0x03C..+0x087 gap" note) in the same loop. This is
   self-contained (only ever indexed, never further dereferenced) and
   does not block `0x020038c0`'s own tractability — the wall on that
   function is the scan loop's register-allocation shape, not this
   array's name — but recording it would complete the picture for a
   future pass over this neighborhood, alongside gap #2 above.
4. **`func_02097ff0`** — called by `0x020038c0` as the final call in its
   post-loop 6-call sequence (`add r0, sp, #0; bl func_02097ff0`, return
   value unused in this function). No dossier, `c-match-prep` draft, or
   name-catalog entry exists anywhere in the KB for this address, while
   its 5 siblings in the same call chain (`func_02098388`,
   `func_02098038`, `func_02097ea4`, `func_02092904`, `func_02038ad4`)
   are all independently well-documented elsewhere at MED/HIGH
   confidence. This is a documentation gap on an otherwise fully
   resolved call chain — flagged for completeness, though it does not
   change `0x020038c0`'s own wall verdict (which rests on the scan
   loop's register allocation, unrelated to this call).

---

## Notes for the campaign

This round's 4% hit rate is not comparable to R9's 68% or R8's 100% —
those rounds' residuals were genuinely gated by missing struct/global
documentation, exactly what this campaign's KB-building work resolves.
This round's residual had already been through a *different, more
recent* triage pass (brief 292's shape census → brief 294's reg-alloc
scouting → brief 302's mechanical ship-as-.s tooling) that specifically
targets a failure mode — mwcc register allocation not being
source-expressible — that no amount of struct/global documentation can
fix. Brief 294's own scouting (permuter survey, `register`/duplication/
`volatile` A/B pilots under this project's exact compiler flags) already
rules out the C-level levers that would matter here; this round's fresh
`.s` reads corroborate that verdict for 48 of 50 addresses by directly
confirming the loop-back-edge or heavy-call-sequencing precondition
brief 294's argument requires.

The 2 upgrades are not new KB-driven discoveries so much as a **shape
audit** of an already-completed bulk classification: `0x02003b18` and
`0x02003c68` are the only 2 of 50 that are provably NOT loops (zero
back-edges, confirmed both by script and by hand), and are also the
only 2 independently named by a canonical struct doc as instances of an
already-fully-documented dispatch pattern. Their presence in the
GLOBAL_ASM-endgame set looks like a straight-line "reg-numbering wall"
classification (the class brief-302's own pilot explicitly includes,
separate from the loop class) rather than a mis-sweep — brief 302's 3
pilots included exactly one straight-line reg-numbering-wall pick
(`021d8128`) alongside 2 loop picks, so a straight-line function
*can* legitimately land in this bucket without a loop. Whether these
two specific functions are truly uncrossable straight-line
reg-numbering walls, or whether their fully-documented, low-branching,
single-call-site shape makes them more tractable than the typical
straight-line member of that bucket, is exactly the kind of
per-function judgment call a decomper with build access should make —
this write-up provides the C sketch and the "no loop, fully-documented
struct" case for why they are worth a first build attempt, not a
guarantee of a match.

**Recommended follow-up for a future round:** the campaign's next `main`
retriage batch should expect the GLOBAL_ASM-endgame marker to dominate
future residual samples (94% of `src/main`'s `.s` files already carry
it) — future briefs assigning `main` addresses may want to pre-filter
for the marker's absence, or explicitly re-scope to "check whether the
brief-294 precondition (loop back-edge / heavy call-sequencing) actually
holds" rather than "find an undocumented struct," since that is now the
dominant question this tier of `main` residual poses.

## Summary table (repeated for convenience)

| Metric | Count |
|--------|-------|
| Examined | 50 |
| Newly tractable | 2 |
| Wall (genuine loop back-edge) | 37 |
| Wall (no back-edge, call-sequencing/branch-tree/reg-numbering) | 11 |
| New KB gaps found | 4 |
