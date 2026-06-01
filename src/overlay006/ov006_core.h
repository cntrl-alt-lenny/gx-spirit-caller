/* ov006_core.h — STARTER SKETCH of the ov006 per-overlay vocabulary
 * (brief 300, the post-ov002 pre-map). The next overlay to drain after
 * ov002 (196 <0x100 funcs, the richest non-main overlay per brief 278).
 *
 * PROMOTED into src/overlay006/ in brief 304; verification underway (same
 * lifecycle ov002_core.h had: research sketch -> verified -> consolidated).
 * The §VERIFIED block at the bottom is byte-proven (brief 304 wave 1); the
 * entries ABOVE it remain SKETCH — inferred from the gap disassembly
 * (arg-count from call sites / sink prologues), not yet byte-verified.
 * Promote sketch entries into the VERIFIED block as waves prove them.
 *
 * KEY (brief 300): ov006's reachable cohort mostly calls ALREADY-MATCHED
 * local sinks + named main-arm9 utilities, so the prototype-recovery burden
 * is LIGHT — this header is small on purpose. 56% of the 157 reachable
 * <0x100 callers have all-matched ov006-local callees (low-recovery drain);
 * for those, just `extern` the matched sink and write the caller body.
 */
#ifndef OV006_CORE_H
#define OV006_CORE_H

typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

/* --- ov006 per-overlay data tables (the dominant locals) ---------------
 * Declared char[] (opaque) like the ov002 field tables; type a local
 * struct per TU at the offsets each function reads. Counts = # of reachable
 * <0x100 callers referencing each (brief 300 scan).                        */
extern char data_ov006_0225c4dc[];   /* (21) */
extern char data_ov006_0225cb5c[];   /* (21) */
extern char data_ov006_0225de70[];   /* (21) */
extern char data_ov006_0225e068[];   /* (20) */
extern char data_ov006_0224f448[];   /* (19) */
extern char data_ov006_0225df3c[];   /* (13) */
extern char data_ov006_0225e100[];   /* (13) */
extern char data_ov006_0225e138[];   /* (13) */
extern char data_ov006_021cf140[];   /* (12) */

/* --- ov006 local sinks --------------------------------------------------
 * Most top local callees are ALREADY MATCHED — `extern` them straight from
 * the tree (no recovery): func_ov006_021c9ef4, _021c9ed4, _021c1650,
 * _021ba1f0 (small helpers, x8-10 callers each), _021c6a3c (struct
 * accessor: `int f(void *obj){ p=*(void**)(obj+8); if(p) util(p); return 1; }`).
 *
 * The two UNMATCHED top local sinks worth a prototype now [sketch]:        */
extern int func_ov006_021ba0f0(void *self);   /* [sketch] dispatcher on self->f38 (switch); calls main util 0202224c */
extern int func_ov006_021c6998(void *obj);    /* [sketch] struct accessor: reads obj+0x8/+0xc/+0x14 */

/* --- shared main-arm9 utilities (NOT ov006-local; already in the tree) --
 * The reachable cohort leans heavily on these (NitroSDK / engine helpers) —
 * they are named/matched in main; `extern` from the existing decls, do not
 * redeclare here. Top: func_02001d68 (x18), func_0208dd9c (x13),
 * func_02094504 (x11), func_02001d98/_02001d0c/_02005554/_02006c0c/_02006e1c
 * (x9), func_020216b0/_02021660/_02004f58 (x8).
 */

/* =======================================================================
 * §VERIFIED — brief 304 wave 1 (byte-proven: compiled under the build.ninja
 * ov006 cflags and byte-identical vs the delinked gap .o). Recipes +
 * per-pick table in docs/research/brief-304-ov006-wave1-drain.md.
 * ======================================================================= */

/* --- callback-dispatch family (5 members) ------------------------------
 * Per-state machine: cb = table[state[0]]; if (cb) { if (cb()) state[1]=0;
 *   return 0; } return 1;   (021b3f88 variant clears state[4] first.)
 * Each member differs ONLY in the (state, table) pair below — clone by swap.
 * gotcha 5: the `return 1` MUST be the fall-through tail, not an early
 * `if (cb==0) return 1;` (that predicates to moveq/popeq).                 */
typedef int (*Ov006StateCb)(void);
extern int          data_ov006_0224f38c[];   /* state[0]=idx,[1]=flag — 021b5614 */
extern Ov006StateCb data_ov006_021cbbb0[];    /* callback table        — 021b5614 */
extern int          data_ov006_0224f2e8[];   /* state — 021b49b4 */
extern Ov006StateCb data_ov006_021cbb74[];    /* table — 021b49b4 */
extern int          data_ov006_0224f330[];   /* state — 021b4f20 */
extern Ov006StateCb data_ov006_021cbb8c[];    /* table — 021b4f20 */
extern int          data_ov006_0224f248[];   /* state — 021b3a1c */
extern Ov006StateCb data_ov006_021cbb38[];    /* table — 021b3a1c */
extern int          data_ov006_0224f290[];   /* state[4]=reset — 021b3f88 variant */
extern Ov006StateCb data_ov006_021cbb50[];    /* table — 021b3f88 */

/* --- guarded-call + clear (021b8d6c) -----------------------------------
 * if (g[1]) { sink(g[1]); g[1]=0; } return 1;  (sink is a main-arm9 util)  */
extern int  data_ov006_0224f3e0[];            /* g[1] = a deferred handle */
extern void func_02006e1c(int);               /* main-arm9 sink (also used by 021cb0a0) */

/* --- singleton globals proven this wave --------------------------------- */
extern char data_ov006_02257548[];            /* u16 fields +0x6c/+0x76 — 021be558 delta-compare */
/* data_ov006_021cf140 (above): the notify-on-truthy status word (021b2b08/2c9c, matched on branch). */

/* =======================================================================
 * §VERIFIED — brief 307 wave 2 (byte-proven, same EUR-objdiff gate). 26 .c:
 * three 8-member clone families (D/E/F) + two dispatch-family variants.
 * Full recipes + per-pick table: docs/research/brief-307-ov006-wave2-drain.md.
 * The D/E/F families and the dispatch family are the per-state methods of the
 * SAME state machine (they share the 0224f1xx/0224f2xx/0224f3xx structs).
 * ======================================================================= */

/* --- family D: display-blank "enter" (8 members) -----------------------
 * Clear both engines' DISPCNT display-mode bits, run the per-frame update,
 * then fire the teardown hook iff the per-state struct's +8 word is live:
 *   *(vu32*)0x04000000 &= ~0x1f00; *(vu32*)0x04001000 &= ~0x1f00;
 *   func_020210b8(); if (state[2]) func_0200ad90(); return 1;
 * Clone by the per-state struct (same structs as the dispatch family).
 * gotcha: write the SUB register as an inline cast `*(vu32*)0x04001000`,
 * NOT derived from the main pointer, or mwcc swaps the r0/r1 value/address
 * allocation (61% vs 100%).
 * Members: 021b2620 021b31d0 021b37bc 021b3d60 021b45f8 021b4cf8 021b52d0
 *          021b5924  (structs 021cf140 0224f1b0 0224f1fc 0224f248 0224f290
 *          0224f2e8 0224f330 0224f38c). */
extern void func_020210b8(void);              /* per-frame display update */
extern void func_0200ad90(void);              /* teardown hook */
extern int  data_ov006_0224f1b0[];            /* per-state struct (also 021b2e58 dispatch state) */
extern int  data_ov006_0224f1fc[];            /* per-state struct */

/* --- family E: sub-DISPCNT BGn toggle (8 members) ----------------------
 *   int f(void *this, int on) {
 *     vu32 *r = (vu32*)0x04001000;
 *     if (on) { u32 mode=(*r&0x1f00)>>8, base=*r&~0x1f00;
 *               *r = base | ((mode |  BIT) << 8); }
 *     else    { ...                       (mode & ~BIT) ...        }
 *     return 1; }
 * gotcha: the RMW is DUPLICATED per branch (cmp at top); compute `mode` then
 * `base` as separate temps IN THAT ORDER, or the allocation diverges.
 * Members by BIT: 0x2 → 021c81c0 021ca400; 0x4 → 021c821c 021ca45c 021cadc8;
 *  0x8 → 021bee68 021c4518 021c6640.  reg 0x04001000 throughout. */

/* --- family F: per-state "enter"+probe (8 members) ---------------------
 *   int f(void){ int a=021ba0f0(0225c4dc), b=021c15a4(0225cb5c);
 *     021c6998(0225de70); INIT_A();
 *     021ba1f0(0225c4dc); 021c1650(0225cb5c); 021c6a3c(0225de70); INIT_B();
 *     int ok = a && b; if (ok) status[0] = VAL; return ok; }
 * gotcha: store `a && b` to a temp so mwcc materialises the branchless
 * cmp/cmpne/movne/moveq bool the orig uses. VAL varies per member (mostly 3).
 * Members (INIT_A, INIT_B, status, VAL):
 *   021b2804 (2668,2690,021cf140,3)   021b2de0 (2668,2690,021cf140,0xf)
 *   021b33c4 (3218,3240,0224f1b0,3)   021b39a4 (3804,382c,0224f1fc,3)
 *   021b3f10 (3da8,3dd0,0224f248,3)   021b493c (4640,4668,0224f290,6)
 *   021b4ea8 (4d40,4d68,0224f2e8,3)   021b559c (5318,5340,0224f330,6) */
extern int  func_ov006_021c15a4(void *);      /* probe B (returns status) */

/* --- dispatch-family variants (extend brief-304 family A, 2 members) ---
 * Same  cb = table[state[0]]; if (cb){ if(cb()) state[1]=0; return 0; }  core,
 * but the no-callback tail does work (a real bl ⇒ no gotcha-5 predication):
 *   021b2e58: state 0224f1b0 / table 021cbb08 — else func_020057dc(
 *             func_0201261c); return 0;
 *   021b4048: state 0224f290 / table 021cbb50, state[4]=2 prologue — else
 *             func_020071a4(4, 1, &data_ov006_021cb518); return 1; */
extern int (*data_ov006_021cbb08[])(void);     /* dispatch table — 021b2e58 */
extern void func_020057dc(void (*cb)(void));   /* default-handler register */
extern void func_0201261c(void);
extern void func_020071a4(int, int, void *);

/* =======================================================================
 * §VERIFIED — brief 309 wave 3 (byte-proven, same EUR-objdiff gate). 27 .c.
 * The SAME 8-state machine, drained much deeper: this wave banks the per-state
 * "full init" (0x220), "enter" (0x44/0x80), "step" (0x70/short), "finalize"
 * (0x40), "audio init" (0xa4/0xc4) methods + the main-engine BGn toggle and two
 * more dispatch variants. Structs: 021cf140 0224f1b0 0224f1fc 0224f248 0224f290
 * 0224f2e8 0224f330 0224f38c (+ audio sub-structs 0224f1c0 0224f20c 0224f254
 * 0224f2f4). Full recipes: docs/research/brief-309-ov006-wave3-drain.md.
 * ======================================================================= */

/* --- "full init" family (7 members, the headline) ----------------------
 * int f(int a): bind 4 VRAM banks via func_02094504, reset engines, configure
 * the 2D engines one of two ways per `a`, blank main DISPCNT mode, switch the
 * sub engine into display mode, prime two render flags, arm frame/HBlank IRQs,
 * then `state[2] = a; return 1`. ~0x220 each; CLONE-BY-ONE-WORD — members differ
 * ONLY in the trailing per-state struct pointer. mwcc reproduces every quirk
 * (mov r2,r0/r1 const-reuse, the `a==0` branchless bool, the 5-arg stack call)
 * with no coaxing. Members↔struct: 021b2400·021cf140 021b2fb0·0224f1b0
 * 021b359c·0224f1fc 021b3b40·0224f248 021b43d8·0224f290 021b4ad8·0224f2e8
 * 021b50b0·0224f330. (Each member's end = the state's family-D enter start.) */
extern int func_ov006_021b2400(int);          /* full-init seed; clone for the rest */

/* --- "enter" families (call the full-init, then per-subobject setup) ----
 * 0x44 (2): f43d8/f50b0(arg); 2nd-subsystem(dataX, state[3]); 3rd(dataY);
 *           state[0]=4; return 1.   021b46b8·0224f290  021b5390·0224f330.
 * 0x80 (3): f359c/f3b40/f4ad8(1); func_ov006_021b9ef8(0225c4dc, K, 0); then 6
 *           fixed per-subobject calls; state[0]=4; return 1. K (mode) varies:
 *           021b387c(0224f1fc,K=2) 021b3e20(0224f248,K=3) 021b4db8(0224f2e8,K=5). */
extern void func_ov006_021b9ef8(void *, int, int);

/* --- "step" family (7 fixed per-subobject updates + enter, 0x70 / short) -
 * func_ov006_021cb0a0/_021cac30/_021c9ef4/_021c757c/_021c6990/_021c159c/_021ba090
 * over the seven 0225xxxx subobjects, then the state's family-D enter, then
 * `state[0]=1; return 1` (the mov #1 is reused as both the store and the return).
 *  021b3ea0(0224f248,enter 021b3d60)  021b4e38(0224f2e8,enter 021b4cf8).
 *  021b5a2c: the 8th state's trimmed step (one update + enter 021b5924, state
 *  0224f38c). */

/* --- "finalize" family (0x40, 2 members) -------------------------------
 *   f64d0/f6694(data448, state[3]); 4 fixed shutdown calls; state[0]=5; return 1.
 *   021b2f70·0224f1b0  021b355c·0224f1fc.  (data_ov006_0224f448 is the shared arg.) */
extern char data_ov006_0224f448[];            /* shared "enter"/"finalize" arg ptr */

/* --- main-engine DISPCNT BGn toggle (0x58, 3 leaf members) --------------
 * The MAIN-engine (0x04000000) twin of wave-2 family E — same dup-RMW-per-branch
 * recipe, `int f(void *this, int on)`, leaf (`bx lr`). Toggled bits: 0x2 →
 * 021c1770 021c5d98; 0xc → 021c6fa0. */

/* --- "audio init" family (0xa4 plain / 0xc4 channel-gated) --------------
 * Open the per-state sound bank, program the active channel into the mixer
 * stages, set master volume, bind the wave archive (func_0200197c(4, 021cf1b0,
 * 0x80000)), route the channel, prime the handle, fire func_020373cc(0x24,1,0,-1),
 * then `status[0] = 2; return 1`. The channel is the low 3 bits of word[1] of the
 * global mode object data_02104f4c — read it through an unsigned :3 bitfield so
 * mwcc emits the `lsl #29; lsr #29` extraction (an `& 7` would emit `and`). The
 * -1 arg materialises as `sub r3,r2,#1` (reusing the 0) with no coaxing.
 * 0xa4 (3): 021b2324(bank 021cf174,status 021cf140) 021b3a64(0224f254,0224f248)
 *           021b49fc(0224f2f4,0224f2e8).
 * 0xc4 (2): adds `if (chan==0) func_020018d4(0xa0); else func_02001b18(0xa2);`
 *   — write the test as `==0` so the ==0 path is the fall-through the orig uses.
 *   021b2eac(bank 0224f1c0,status 0224f1b0) 021b3498(0224f20c,0224f1fc). */
extern struct { int w0; unsigned chan : 3; } data_02104f4c;  /* global mode; chan=word[1]&7 */

/* --- dispatch variants (extend family A, 0x5c, 2 members) ---------------
 * Same  cb = table[state[0]]; if (cb){ if(cb()) state[1]=0; return 0; }  core;
 * no-cb tail does func_020071a4(4, 1, data) then returns a per-member constant:
 *   021b22c8: state 021cf140 / table 021cbac0 / data 021d6ed0 — tail returns 1.
 *   021b343c: state 0224f1fc / table 021cbb20 / data 021cb518 — tail returns 0. */

#endif /* OV006_CORE_H */
