/* ov003_core.h — ov003 per-overlay vocabulary (brief 339, co-drain wave 1).
 *
 * Scaffolder's drain stream pivoted ov021 -> ov003 (ov021's tractable tier
 * drained, brief 337). Direct-mwcc per-pick gate (EUR objdiff 100%); the brain
 * runs the 3-region SHA1 on merge. Own src/overlay003/ + ov003 delinks.txt +
 * this header. Decomper brief-336 census: 8 clone families.
 *
 * ov003 looks ov006-style again — per-state methods over a central struct +
 * a per-state struct array (data_ov003_021cf6xx). Full recipe library applies
 * (ov006 family-D/E + ov005 teardown/audio + register-reshape + bind-struct-base
 * + divmod r0/r1 + bitfield-for-shift + declaration-order).
 *
 * Central struct: data_ov003_021cf6c0 (9 refs); per-state structs 021cf6xx.
 */
#ifndef OV003_CORE_H
#define OV003_CORE_H

extern char data_ov003_021cf6c0[];
extern char data_ov003_021cf72c[];

/* ====================================================================== *
 *  §VERIFIED — co-drain wave 1 (brief 339). 11 .c, all EUR objdiff 100% + *
 *  ninja rom OK. ov006-style again — the recipe library transferred clean *
 *  (11 of 14 attempts). Two clone pairs + the dispatch/state/bounds vein.  *
 * ====================================================================== */
/* Picks:
 *  - 021ca0c8 teardown (ov005 recipe verbatim); 021ca1fc dispatch step (ov006
 *    family A, blx) -- KEY: a CLEAN blx dispatch (no-handler tail just returns 1)
 *    MATCHES; the permuter-class blx near-misses (ov005 021acfb0 etc.) were
 *    specifically the ones that did WORK in the no-cb tail.
 *  - 021cefec / 021cf064 hit-test bounds-check (ov005 &&-chain, clone-by-2-funcs);
 *    021ccd80 / 021ccdb8 cell-addr lookup (clone-by-2-tables; ARG IS THE 2ND
 *    PARAM r1 -- declare `(int dummy, int arg)`).
 *  - 021cce58 progress gate -- the per-case `return v>=K` must be `if(v>=K)
 *    return 1; break;` with a SHARED `return 0`, so mwcc branches to the shared
 *    default (the orig) instead of a branchless movhs/movlo bool.
 *  - 021ceeb4 gesture poll (multi-guard + jump-table over 021cf6c0); 021ca254
 *    4-stream FIFO push; 021cef78 button-event (branch-dup stack packet);
 *    021ccdf0 cursor-glyph (data_02104f4c.chan `:3` bitfield + bits[30:25] code).
 *
 * DEFERRED (NOT shipped): 021cbe8c (0x7c, 87%) 3-state machine -- the switch
 * discriminant lands in r0 not r1 (allocator coin-flip, same as ov005 021ad284;
 * the state-temp does not move it). Residue: the sprite-build LOOPS w/ bit-packing
 * (021ceb84 / 021cbdf4 / 021cc010) and the big render setups (021cd358 / 021cedf8
 * / 021cd420 / 021cd628 / 021cc8b8 ... -- register/stack-arg-dense). */

/* ====================================================================== *
 *  §VERIFIED — co-drain wave 2 (brief 341). 2 .c, EUR objdiff 100% + ninja *
 *  rom OK. TIER TRANSITION: wave 1 drained the clean per-state-method vein; *
 *  the wave-2 residue is uniformly Mac-lane (SR / scheduling / coin-flip /  *
 *  permutation). Only the two below were direct-mwcc-tractable.            *
 * ====================================================================== */
/* Picks:
 *  - 021ccd20 BG-map rect fill (h*w cells, (tile|pal<<12), tile wrapping at 16
 *    bits, rows step 0x20). KEY: the tile wrap must be UNSIGNED --
 *    `tile = (unsigned)(tile + 1) << 16 >> 16;` emits `lsr` (the orig); a signed
 *    `(tile+1)<<16>>16` emits `asr` and misses (95.8%).
 *  - 021ca10c full scene teardown (0xf0; matched first try). Inline-cast display
 *    blank `*(vu32*)0x04000000 &= ~0x1f00` on both engines; bind `b=(vu32*)
 *    0x04001010` so `(int)b - 0xfc0` derives via `sub`; -0x10 materialized from
 *    func_0208e2f4(addr,0x3f,-0x10); XOR-mix data_021040ac[0xc48] ^= [0xc3c] ^
 *    021cf6c0[0x4c]; func_020057dc(func_0201261c) re-registers vblank. Returns 1.
 *
 * DEFERRED this wave (attempted + catalogued -> Mac lane), by miss-class:
 *  - SR (strength-reduction): 021cc010 / 021cbf08 sprite-band loops (clone pair,
 *    48%). The orig lowers one row base as a 2-step `lr<<5; +<<1` and keeps the
 *    other as a decrementing counter; mwcc folds the first to a single `<<6`. No
 *    C form blocks the fold (same wall as the ov005 byte-sum SR).
 *  - SCHEDULING: 021cd358 dense func_0201ef90 marshalling (43%). TWO reshapes DID
 *    land here (see notes below) but the residue is genuine instruction schedule
 *    (batched stmia vs split str; the r4-r8 vs r3-r7 spread; address-add order).
 *  - CALLER-SAVED COIN-FLIP: 021cbdf4 logo composite (87-89.5%). Escaping stack
 *    struct {int hi; short attr}; mwcc puts const->r2 / computed->r3 regardless of
 *    assignment OR store order (tried both) -- the orig is the reverse because the
 *    trailing func_02005dac(1,0) reserves r0/r1. Not C-steerable (= 021cbe8c class).
 *  - CALLEE-SAVED PERMUTATION: 021ceb84 (62%) 4-iter sprite build, kind/fmt/affine/
 *    ybase permuted across r6-r9; declaration-order made it worse.
 *  - STACK-LAYOUT: 021cedf8 (64%) 11-arg func_0201e964 builder; frame split + an
 *    extra r3 save diverge.
 *
 * Two NEW reshape levers learned on 021cd358 (portable, even though the func
 * itself stays Mac-lane):
 *  (1) AVOID mla base-fusion: a shared `char *row = o + i*S;` local fuses to one
 *      `mla`; when the orig keeps `i*S` (mul) and `o` separate (each pointer
 *      `o + off + i*S`), DO NOT bind the base -- inline `i*S` into every pointer
 *      expr so only that product is CSE'd (22% -> 25%, and unlocked the r7/r8
 *      base-batching the orig wants).
 *  (2) SWITCH BLOCK ORDER follows source case order: an out-of-line `default`
 *      after the cases is emitted LAST; add an explicit `case 0:` (sharing the
 *      default value) FIRST so mwcc lays the jump-table bodies out ascending like
 *      the orig (25% -> 43%). */

#endif /* OV003_CORE_H */
