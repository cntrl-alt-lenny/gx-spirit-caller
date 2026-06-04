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

#endif /* OV003_CORE_H */
