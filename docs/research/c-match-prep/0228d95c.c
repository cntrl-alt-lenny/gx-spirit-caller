/* CAMPAIGN-PREP candidate for func_0228d95c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: id:13 bitfield; share (p&1)*0x868 + idx*0x14 across 16c/1a4 tables; guard chain ret 3/2/1/0
 *   risk:       orig computes (p&1)*0x868 once + idx*0x14 once, reused for both tables; struct-index (16c) vs ptr-arith (1a4) may block CSE -> extra mul. reshape-able: address both as identical char* arithmetic; hoist id before the cell `&&`.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0228d95c (ov002, class D, MED tier) — brief 0113.
 * UNVERIFIED + ITERATION-EXPECTED. Two aliased tables over the same 0x868 block: id from 022cf16c.slot[idx]@+0x30 (id:13), gate cell from 022cf1a4 (+(p&1)*0x868 + idx*0x14), u16.
 *   recipe:     Class D: id:13 bitfield (lsl#19;lsr#19); shared (player&1)*0x868 + idx*0x14 across both tables; guard chain returning 3/2/1/0
 *   risk:       orig computes (player&1)*0x868 ONCE (ip) and idx*0x14 ONCE (lr), reusing both for the 16c id-load and the 1a4 cell-load; mixing a struct-indexed access (16c) with raw ptr-arith (1a4) may stop mwcc CSEing the common mul -> extra mul/add. reshape-able: address BOTH tables with identical char* arithmetic so the (p&1)*0x868 and idx*0x14 subexpressions CSE; also hoist id before the cell `&&`.
 *   confidence: med
 */
typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;
typedef struct { u32 id : 13; u32 : 19; } Ov2Slot;
typedef struct { u8 _pad00[0x30]; Ov2Slot slot[100]; } Ov2Field; /* stride 0x868 */

extern Ov2Field data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_0202e2f8(int id);
extern int func_ov002_0227d400(int id);

int func_ov002_0228d95c(int player, int idx) {
    int id = data_ov002_022cf16c[player & 1].slot[idx].id;
    u16 cell = *(u16 *)(data_ov002_022cf1a4 + (player & 1) * 0x868 + idx * 0x14);
    if (cell != 0 && id == 0x118a) return 3;
    if (func_0202e2f8(id) != 0) return 2;
    return func_ov002_0227d400(id) != 0;
}
