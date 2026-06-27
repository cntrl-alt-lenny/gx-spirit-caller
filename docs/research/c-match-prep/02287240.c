/* CAMPAIGN-PREP candidate for func_02287240 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield :1 via f2&1; bind r4=e; reload f2 second time as orig does; guard chain
 *   risk:       reshape-able: orig reloads ldrh f2 the 2nd time AND recomputes lsl#31/lsr#31 into cmp — if mwcc CSEs the (f2&1) the second cmp diverges; keep two separate reads.
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

typedef struct Ent { u16 f0; u16 f2; } Ent;

extern struct Glob {
    u8  pad0[0xcec];
    int fcec;
    u8  padcf0[8];
    int fcf8;
} data_ov002_022d016c;

extern int func_ov002_021bae7c(int a, int b, int c);

int func_ov002_02287240(Ent *e)
{
    Ent *p = e;          /* r4 */
    if (func_ov002_021bae7c(p->f2 & 1, 0x1539, -1) != 0) {
        int sel = p->f2 & 1;
        if (data_ov002_022d016c.fcec != sel) {
            if (data_ov002_022d016c.fcf8 == 5) return 1;
        } else {
            if ((unsigned)data_ov002_022d016c.fcf8 <= 1) return 1;
        }
    }
    return 0;
}
