/* ov002_core.h — canonical ov002 per-player core types + shared-sink
 * signatures for the Cluster-A batch drain (brief 286; band extension
 * brief 296; consolidated to this single build copy in brief 298).
 *
 * THE canonical header — include it from ov002 TUs and trim per file.
 * Brief 298 merged the brief-296 research copy here and deleted the
 * docs/research/ duplicate; future edits go straight to this file.
 *
 * Every type / signature below is PROVEN: compiled into a sample family
 * member under the exact build.ninja ov002 cflags (mwcc 2.0/sp1p5) and
 * byte-compared against the delinked orig .o (bl/pool relocs modulo).
 * Provenance per entry: [memberN] = N sample members byte-verified
 * (briefs 286/296); [shipped] = already a matched .c/.s on main. See
 * docs/research/brief-286-ov002-core-header.md + brief-296 for the tables.
 */
#ifndef OV002_CORE_H
#define OV002_CORE_H

typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

/* --- per-player core: 0x868 bytes/player, indexed (player & 1) ---------
 * The dominant Cluster-A globals. Stride between players is 0x868; index
 * a player's region with (player & 1) * 0x868 as a BYTE offset.            */
extern char data_ov002_022cf16c[];   /* row table (0x868/player) [member3] */
extern int  data_ov002_022cf17c[];   /* per-player count table (0x260 list) [member2] */
extern int  data_ov002_022cf184[];   /* per-player count table (0x3a0 list) [shipped 021ba1e8] */
extern char data_ov002_022ce950[];   /* per-player field table (+0x80c scalar) [member1] */
extern char data_ov002_022d016c[];   /* per-player field table (+0xcec scalar) [member1*] */
extern char data_ov002_022cf1a4[];   /* per-player field table */
extern char data_ov002_022ce288[];   /* per-player field table */
extern char data_ov002_022cd3f4[];   /* per-player field table */

/* 20-byte (0x14) sub-row array starts at (row + 0x30); slot.id is a 13-bit
 * field read lsl#19;lsr#19 — type it as a BITFIELD, never (v<<19)>>19
 * (mwcc folds that to & 0x1fff; gotcha 6/16).  [member3]                   */
struct Ov002Slot { unsigned int id : 13; };

/* Accessor "self" pointer: a u16 at +2 carries a bit0 "player" flag, read
 * as a 1-bit field (lsl#31;lsr#31 — bitfield, not & 1).  [member5]         */
struct Ov002Self { u16 f0; u16 b0 : 1; };

/* --- shared-sink signatures --------------------------------------------
 * The batch lever (brief 282): forward the incoming args THROUGH to the
 * sink so they stay live in r0/r1/r2 (reserving those regs); a sink call
 * is what anchors register colouring across the family (gotcha 9/15/26).  */

/* 0x868 sub-row accessors — pass (self, player, idx) straight through.     */
extern int  func_ov002_021c1ef0(struct Ov002Self *self, int player, int idx); /* [member2] */
extern int  func_ov002_021c1e44(struct Ov002Self *self, int player, int idx); /* [member1] */

/* command sink: r0 = command id, r1..r3 = (often packed) payload.          */
extern int  func_ov002_0229ade0(int cmd, int a, int b, int c);   /* [member1] */

/* list sink: (player, kind=13, 0) is the dominant call shape.              */
extern int  func_ov002_02253458(int a, int b, int c);            /* [member2] */

/* arg-pack sink: r0 is a packed u16 built by the caller.                   */
extern int  func_ov002_021d479c(int packed, int a, int b, int c);/* [member2] */

/* --- sinks already matched on main (signatures are ground-truth) -------- */
extern int  func_ov002_021bc288(int player, int idx);            /* [shipped 021bcfe4] slot-ready */
extern int  func_ov002_021ff3bc(struct Ov002Self *self);         /* [shipped .s] bool query */
extern int  func_ov002_021ca2b8(int a, int unused, int c, int d);/* [shipped] thunk → 021ca0d4(a,0,c,d) */
extern void func_ov002_021b91c4(int *dst, const int *src);       /* [shipped] *dst = *src */

/* =======================================================================
 * 0x100-0x200 BAND extension (brief 296)
 *
 * The band largely reuses the <0x100 vocabulary above; these are the extra
 * top sinks + globals it needs. Band members are COMPOSITE (multi-sink
 * orchestrators, not pure wrappers), so the header gives shared types/sigs
 * — the bodies are still per-function hand-RE. Sigs marked [shipped …] are
 * ground-truth from a matched .c on main; [member 021ea1b4] are verified
 * here by byte-compile. See brief-296.
 * ======================================================================= */

/* per-something flag/state tables the band's tickers + hub key off. */
extern int  data_ov002_022cd744[];   /* flag table, indexed by a small id [shipped 021ae400] */
extern u16  data_ov002_022ce720[];   /* node fallback ring (mod 128) [shipped 0223de94] */

/* d016c / ce288 are per-player FIELD tables (declared char[] above); the
 * band reads scalar state at fixed offsets — type a local struct per TU,
 * e.g. d016c.f3300 (+0xce4), .f3308 (+0xcec), .f3340 (+0xd0c), .f_d50,
 * .f_d64; ce288.f1484/.f1488/.f1492/.f1496/.f1672. [shipped 021e2b3c/2c5c] */

/* hub: gate on a flag table, then post a command (84 band callers). */
extern void func_ov002_021ae400(int a, int b);                   /* [shipped] cd744[a]?ret:0229ade0(0x31,0,b,0) */

/* d016c-state boolean query (no args). */
extern int  func_ov002_022593f4(void);                           /* [shipped] */

/* d016c-field → 021d479c arg-pack wrapper. */
extern int  func_ov002_021e286c(int arg0);                       /* [shipped] → 021d479c(packed,...) */

/* game-state tickers (no args) — read ce288/d016c, may post via 021b1570. */
extern void func_ov002_021e2c5c(void);                           /* [shipped] */
extern void func_ov002_021e2b3c(void);                           /* [shipped] */

/* node / VBits accessor: arr8[idx] for idx<5 else ce720 ring. */
extern u16  func_ov002_0223de94(void *node, int idx);            /* [shipped] */

/* event-send sink (id, arg, out-ptr, kind). */
extern void func_ov002_021b1570(int a, int b, u16 *out, int kind);/* [shipped via 021e2c5c] */

/* accessor guard + sink used by band-sized 0x868 accessors (pass-through). */
extern int  func_ov002_021b8fcc(int player, int idx);            /* [member 021ea1b4] accessor guard */
extern int  func_ov002_021c2084(struct Ov002Self *self, int player, int idx, int d); /* [member 021ea1b4] */

#endif /* OV002_CORE_H */
