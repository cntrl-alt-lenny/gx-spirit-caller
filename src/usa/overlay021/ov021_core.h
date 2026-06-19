/* ov021_core.h — ov021 per-overlay vocabulary (brief 335, co-drain wave 1).
 *
 * Scaffolder's drain stream pivoted ov015 -> ov021 (ov015's easy tier drained,
 * brief 333). Direct-mwcc per-pick gate (EUR objdiff 100%); the brain runs the
 * 3-region SHA1 on merge. Own src/overlay021/ + ov021 delinks.txt + this header.
 *
 * ov021's reachable cohort looks like an ov006-style state machine: per-state
 * enter / finalize / step methods over a central state word + two subobjects.
 * Full recipe library (ov005/ov015 §VERIFIED): register-reshape, BIND THE STRUCT
 * BASE to a `char *s` local, divmod r0/r1 (func_020b3870 quotient by name /
 * remainder via long long >>32), bitfield-for-shift (`:N` struct, not &mask),
 * branch-tail-dup.
 *
 * Central state object: data_ov021_021acda0 (the state word; set 1/4/... by the
 * enter/finalize methods). Subobjects: data_ov021_0222cdf4, data_ov021_0222ce64.
 */
#ifndef OV021_CORE_H
#define OV021_CORE_H

extern int  data_ov021_021acda0[];
extern char data_ov021_0222cdf4[];
extern char data_ov021_0222ce64[];

/* ====================================================================== *
 *  §VERIFIED — co-drain wave 1 (brief 335). 12 .c, all EUR objdiff 100% + *
 *  ninja rom OK. ov021 is HIGHLY reshape-able (spot-check verdict = "yes", *
 *  like ov017): 12 of 14 attempts matched, every recipe transferred clean.*
 * ====================================================================== */
/* Picks (per-state methods of the ace80 state machine + setup helpers):
 *  - 021aa8d4 / 021aa898 enter (state[0]=1 / =4); 021ab05c / 021aa9fc guarded
 *    reset (release handle, re-init, toggle); 021aaa40 3-state machine
 *    (+0x38 state / +0x3c frame counter; case 2 returns 1, others bump+return 0).
 *  - 021aa7d8 display-blank "enter" (ov006 family D) — gotcha CONFIRMED for
 *    ov021: write the SUB reg as an INLINE CAST `*(vu32*)0x04001000` (NOT
 *    disp[0x400]); mwcc still folds the address to `add r1,r2,#0x1000` but keeps
 *    value=r0/addr=r1. Derived form = 61%, inline cast = 100%.
 *  - 021abb6c / 021aad5c BGn toggle (ov006 family E; main 0x4000000 bit 0x8 /
 *    sub 0x4001000 bit 0x8, each with a leading flag store).
 *  - 021aa9bc / 021aa514 audio init (ov005 recipe): Fill32/bind + the
 *    func_020373cc(...,-1) deferred-start; the channel is data_02104f4c.chan
 *    (the `:3` bitfield).
 *  - 021aaadc layout constructor (returns 1 — watch the trailing `mov r0,#1`);
 *    021aadbc display-capture arm (split `|0x204 |0x400`; reuse the 0x400100e
 *    base + 0xe offset for the offset-reg store).
 *
 * DEFERRED (NOT shipped):
 *  - 021aa4a0 (0x74) indirect-blx dispatch — PERMUTER class (ov005 021acfb0 /
 *    ov015 021b5a14 kin); catalogue for the Mac lane.
 *  - 021ab9d0 (0x48, 78%) the o[0x48]/o[0x44] load-register swap in the OAM
 *    affine-index compute — register-CHOICE coin-flip; bind-idx + operand-swap
 *    both 78%. (Binding the func_020216bc result to a temp DID fix the tail
 *    extra-mov, 58%->78%.)
 *
 * Wave-2 residue: ~10 funcs (021aba18 / 021abaa0 random-unique loops w/ magic
 * div-by-5, 021ab090/021abd78/021abcac/021abbc8/021aae68 0xb8-0xec render, +
 * the 0x100+ tier). */

/* ====================================================================== *
 *  §VERIFIED — co-drain wave 2 (brief 337). 6 .c, all EUR objdiff 100% +  *
 *  ninja rom OK. The per-state STEP machines + their render bodies.       *
 * ====================================================================== */
/* Picks:
 *  - 021ab090 4-state step machine (jump table on +0x38; case 3 returns 0, the
 *    others bump +0x40 and return 1) — sibling of the wave-1 3-state 021aaa40.
 *  - 021aa908 main frame driver (loop both step machines per +0x30 tick, commit,
 *    latch state=3 on completion).
 *  - 021abbc8 main-engine capture-arm (sibling of wave-1 sub-engine 021aadbc;
 *    split `|0x204 |0x400`, base+0xe reuse, data_02104f4c.chan `:3` bitfield).
 *  - 021abd78 / 021aae68 / 021abcac render bodies: VRAM clear + glyph measure +
 *    centre-clamp + N-arg blit. 021aae68 uses `col % 16` (mwcc's signed-mod-16
 *    idiom matches as written) and a ternary table select + signed `/2`.
 *
 * NEW reshape lever (021aa908, 60%->100%): when a loop function rotates the
 * register assignment of its loop-counter / accumulator / struct-base, declare
 * the COUNTER and ACCUMULATOR locals BEFORE the `char *base` local — mwcc then
 * gives them the low callee-saved regs (r4/r5) and the base the high one (r6),
 * matching the orig.
 *
 * DEFERRED (NOT shipped — Mac lane): 021ab9d0 (78% reg-choice, wave 1);
 * 021aa4a0 (permuter blx); 021aba18 / 021abaa0 / 021aaf5c (random-unique loops —
 * 28%, mwcc strength-reduces the o[0x60+i*4] accesses to a base pointer where
 * the orig recomputes base+index; same SR class as ov015 021af704); the 0x100+
 * bodies (021aab7c 0x1e0 / 021aa5cc / 021ab150 / 021ab3fc / 021ab6c0 — big
 * register-choice-dense state bodies). */

#endif /* OV021_CORE_H */
