/* ov008_core.h — ov008 per-overlay vocabulary (brief 323, co-drain wave 1).
 *
 * The scaffolder's second drain stream pivoted ov000 -> ov008 (ov000 clean-C
 * mined, brief-321 thinning verdict). Collision-free vs the decomper (on
 * ov010): own src/overlay008/, ov008 delinks.txt, this header. Every entry is
 * byte-PROVEN under the build.ninja ov008 cflags vs the delinked gap .o
 * (direct-mwcc; bl/pool reloc modulo). Per-pick gate = EUR objdiff 100%; the
 * brain runs the 3-region SHA1 on merge.
 *
 * ov008 shares sinks with prior overlays: func_0201e5b8 / func_02006e1c
 * (command-record, cf. ov006), func_02037208 (status/notify, cf. ov000/ov004).
 */
#ifndef OV008_CORE_H
#define OV008_CORE_H

/* --- dominant globals (cached-base; byte-proven offsets) ---------------- */

/* *data_ov008_021b25ec -> the ov008 "scene/state" object (int* to a struct).
 * Proven fields (byte offsets): +16 a sub-object, +92 / +104 status flags,
 * +108 a handle. Read via a cached base: `Obj *o = *(Obj**)data_..._021b270c;`*/
extern char data_ov008_021b25ec[];

/* data_ov008_021b2680 / 021b27a4 — parallel stride-52 row arrays (a pair; the
 * second is base+4). row[idx] at byte idx*52. */
extern char data_ov008_021b2680[];
extern char data_ov008_021b2684[];

/* other recurring globals (roles TBD as the wave proves them) */
extern char data_ov008_021b2660[];   /* most-referenced (24x) */
extern char data_ov008_021b2cc4[];   /* 17x */
extern char data_ov008_021b2b60[];   /* config struct; u16 at +90 (021ac590) */
extern char data_ov008_021b2dc0[];   /* 13x */
extern char data_ov008_021b2ca8[];
extern char data_ov008_021b2670[];

/* --- sinks the reachable cohort leans on (extern, already named) -------- */
/* func_0201e5b8 / func_02006e1c — command-record build/commit (cf. ov006).
 * func_02037208(id,a1,a2,a3) — status/notify (cf. ov000/ov004).
 * func_02005dac / func_020944a4 / func_02094504 — VRAM helpers.
 * func_020b3870 — table/scale lookup. func_0201d47c — record alloc.
 * func_ov008_021aa3c0 — 32-bit popcount leaf (called by the stride-52 family).
 * func_ov008_021aedfc / 021aee54 — sibling helpers (call 021aa540). */

/* ====================================================================== *
 *  §VERIFIED — co-drain wave 1 (brief 323). 12 .c, all EUR objdiff 100%   *
 *  + clean re-delink drop-out + EUR `ninja sha1` OK. ov008 matched .c +.s *
 *  12 -> 24. Easy <0x98 tier drained; the 0x98-0xf4 tier remains (medium).*
 * ====================================================================== */

/* Proven this wave:
 *  - *021b270c scene object: fields +0(f0), +4(f4), +16(f16 sub-obj), +12(f12
 *    handle/state), +92/+104 status flags, +108 handle. Some callers RE-READ
 *    *021b270c each access (do NOT cache) — caching adds a callee-saved push.
 *  - 021b27a0 / 021b27a4 stride-52 row pair; 021b2790 stride-52 rows.
 *  - 021b2de4 +168 u16 count, +4 u16 mode; 021b2c80 +90 u16 (clamped to 6).
 *  - func_ov008_021aa460(idx) = popcount(row27a0[idx]) + popcount(row27a4[idx]).
 *    021aa4a0 IS a 32-bit popcount (HIGH-mask form) — DEFERRED as a mask-
 *    scheduling near-miss (27v27, same class as ov000 021ab1b0). */

/* Families banked (recipes proven this wave):
 *  - GUARDED-CALL / DISPATCH: `o=*021b270c; if(o->fN) sink(o->fM);` and the
 *    `if(f()!=0 && a0) g(); h();` short-circuit chain (021b2244/b1ef4/b2028/
 *    b219c). gotcha: a TERMINAL `if(cond) f();` may compile to popeq-return
 *    where the orig branch-skips (021b2200 1-insn near-miss).
 *  - SCAN-LOOP: `for(i;26){k=25-i; if(540(k)){sum-=540(k); if(thr>=sum)return
 *    k;}}` — declare the loop counter BEFORE the accumulator to match reg
 *    numbering (021aedfc/aee54; the latter returns thr-sum).
 *  - INIT-SEQUENCE: chained `g(f(...), ..)` + a small `for(i;6) init(i+1,tbl)`
 *    (021aeeac).
 *  - CLAMP+SCALE+MLA: `v=u16; if(v>N)v=N; r=020b3870(C, v<<1); sink(a0*(r<<1)
 *    +r-K, ..)` — v UNSIGNED so the clamp is `movhi` not `movgt` (021ac590;
 *    021afc2c is a 30v30 scheduling sibling).
 *  - RANGE-MAP div-by-const: `if(x<A)0; else if(x>=B)hi; else (x-A)*(k+1)/63` —
 *    HOIST `x-A` above the branches; mwcc regenerates the /63 magic (021ac06c).
 *  - STRIDE-52 ROW-CLEAR: `for(i;26){row->u16 -= 540(i); zero fields; row+=52;}`
 *    (021aa900). */

/* Deferred / medium tier (0x98-0xf4, ~20 funcs) — wave-2 / RE / permuter:
 *  - COMMAND-RECORD pack (021abba0/abb08/aba3c): `buf[0]=((a1-K)&0xff)|FLAG|
 *    (((a0-K)<<23)>>7); strh CONST,buf+4; 020944a4(buf, 02005dac(2,0), 8);` —
 *    the two `sub #K` + pack ops SCHEDULE differently from C (20v20 near-miss);
 *    permuter or wave-2.
 *  - FIXED-POINT / div-magic (021ac430/ac4d0/af4c4): `(x<<29)..ror#29` mod and
 *    asr-round divides — m2c/permuter.
 *  - BYTE-COMBINE stride-52 builders (021acfa0/ac208/aceac/adbbc): index =
 *    byte0+byte1 of a u16, then row[idx*52] writes + a bitfield store.
 *  - 021b2268 guarded-setter: 29v31 — NOT a pool artifact (wave-2 sha1 gate
 *    FAILED); a real codegen diff. Needs RE/permuter. */

/* ====================================================================== *
 *  §VERIFIED — co-drain wave 2 (brief 325). 1 .c (medium tier). 24 -> 25.  *
 *  YIELD-DROP FLAG: the 0x98-0xf4 tier is PERMUTER/M2C-BOUND, not direct-  *
 *  mwcc. 7 funcs probed, 1 clean. The blockers are mwcc CODEGEN choices    *
 *  (reg-alloc, scheduling, peephole), not modelling — see brief 325.       *
 * ====================================================================== */
/* Pick: 021aa578 bounds-check — `func_02006110(&A,&B)` (2 out-ptrs) then a
 *   4-way comparison. RECIPE: a 0/1-returning compare chain must be
 *   `if (A && B && C && D) return 1; return 0;` — the && short-circuits each
 *   clause to a SHARED `return 0` (orig's forward branches); separate
 *   `if(x)return 0;` get predicated (popgt) and a boolean `return A&&B&&..;`
 *   computes booleans — both diverge.
 * Walls confirmed permuter/m2c (do NOT spend more direct-mwcc here):
 *   - command-record packs 021abba0/abb08/aba3c: 20v20 REG-ALLOC (orig puts
 *     a0-K in a fresh reg + reuses for the word; mwcc subtracts a0 in-place).
 *     Stable across 4 operand orderings.
 *   - byte-combine builders 021acfa0/ac208/aceac/adbbc: mwcc PEEPHOLEs
 *     (hw<<24)>>24 -> `and #0xff` so it can't fold into the index add (orig
 *     keeps the shift) -> count + reg-pressure diverge (23v30).
 *   - fixed-point 021ac430/ac4d0/af4c4: signed %8 via (x<<29)..ror#29 + loops.
 *   - 021aafa4 indirect-dispatch: 22v25, BLOCK instruction-scheduling (orig
 *     interleaves the global-load between the two field-clears) after fixing
 *     popeq/beq + offset-fold + caching. Emblematic of the tier. */

/* ====================================================================== *
 *  §VERIFIED — brief 403 route-w1 (diagnose-and-route; 3-region sha1 OK). *
 * ====================================================================== */
/* Shipped:
 *  - 021aa4a0 SWAR popcount: MATCHED as C — instruction-identical twin of
 *    ov017 021b2280; the COMMUTATIVE-OPERAND-ORDER lever (HIGH-mask term
 *    first in each `+` so mwcc pool-loads the high constant and derives
 *    the low via `lsr` in operand-2). See ov017_core.h §brief-403.
 *  - command-record packs 021aba3c/abb08/abba0 (20v20 reg-alloc, stable
 *    across operand orders) + fixed-point 021ac430/ac4d0/af4c4 (signed-%8
 *    ror idiom): shipped whole-function .s (kind:data-clean, asm_escape
 *    byte-identical + link-proven).
 * PARKED (kind:data(any) refs — .s would Undefined-fail the link):
 *  - 021aafa4 (block-sched wall; refs data_ov008_021b2440 kind:data);
 *  - 021b2268 guarded-setter (refs data_ov008_021b25ec/275c kind:data).
 * Byte-combine builders (peephole-split class): 021acfa0 PERMUTER-PROBED
 * this wave (900s/~7k iters, base 1890 -> best 765, NO match) then shipped
 * whole-function .s. The permuter DID find the peephole dodge direction —
 * a variable shift amount (`b0 = 24; b0 = v << b0;`) survives where the
 * literal dead-var (`b0 = v << 24;` then `b0 >> 24`) copy-propagates away
 * — but the residual load-hoist/store-sink + r4-r6 spill cascade did not
 * close. Siblings ac208/aceac/adbbc stay catalogued: same root cause;
 * route them .s (all kind:data-clean) unless a longer/seeded permuter run
 * is worth it. */

#endif /* OV008_CORE_H */
