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

#endif /* OV006_CORE_H */
