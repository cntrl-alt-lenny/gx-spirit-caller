/* ov006_core.h — STARTER SKETCH of the ov006 per-overlay vocabulary
 * (brief 300, the post-ov002 pre-map). The next overlay to drain after
 * ov002 (196 <0x100 funcs, the richest non-main overlay per brief 278).
 *
 * SKETCH, NOT YET COMPILE-VERIFIED. Globals + sink sigs are inferred from
 * the gap disassembly (arg-count from call sites / sink prologues), not
 * byte-verified like ov002_core.h. When the decomper opens ov006, copy this
 * into src/overlay006/, verify the first few members byte-identical (the
 * brief-286 loop), and promote proven entries — same lifecycle ov002_core.h
 * had (research sketch -> verified -> consolidated into src/ in brief 298).
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

#endif /* OV006_CORE_H */
