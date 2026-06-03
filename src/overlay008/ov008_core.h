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

/* *data_ov008_021b270c -> the ov008 "scene/state" object (int* to a struct).
 * Proven fields (byte offsets): +16 a sub-object, +92 / +104 status flags,
 * +108 a handle. Read via a cached base: `Obj *o = *(Obj**)data_..._021b270c;`*/
extern char data_ov008_021b270c[];

/* data_ov008_021b27a0 / 021b27a4 — parallel stride-52 row arrays (a pair; the
 * second is base+4). row[idx] at byte idx*52. */
extern char data_ov008_021b27a0[];
extern char data_ov008_021b27a4[];

/* other recurring globals (roles TBD as the wave proves them) */
extern char data_ov008_021b2780[];   /* most-referenced (24x) */
extern char data_ov008_021b2de4[];   /* 17x */
extern char data_ov008_021b2c80[];   /* config struct; u16 at +90 (021ac590) */
extern char data_ov008_021b2dc0[];   /* 13x */
extern char data_ov008_021b2dc8[];
extern char data_ov008_021b2790[];

/* --- sinks the reachable cohort leans on (extern, already named) -------- */
/* func_0201e5b8 / func_02006e1c — command-record build/commit (cf. ov006).
 * func_02037208(id,a1,a2,a3) — status/notify (cf. ov000/ov004).
 * func_02005dac / func_020944a4 / func_02094504 — VRAM helpers.
 * func_020b3870 — table/scale lookup. func_0201d47c — record alloc.
 * func_ov008_021aa4a0 — 32-bit popcount leaf (called by the stride-52 family).
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
 *  - func_ov008_021aa540(idx) = popcount(row27a0[idx]) + popcount(row27a4[idx]).
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
 *  - 021b2268 guarded-setter: 29v31, a pool-layout offset only (likely matches
 *    on the real link; brain to confirm on merge). */

#endif /* OV008_CORE_H */
