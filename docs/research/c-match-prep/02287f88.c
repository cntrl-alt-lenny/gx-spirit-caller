/* CAMPAIGN-PREP candidate for func_02287f88 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     sel=f2&1 (no rsb here); recompute f2&1 each use; mla index; bind base/stride/glob; loop<=4
 *   risk:       struct-guessed + reshape-able: orig re-derives (f2&1) separately for f30 path, f38 path and the fcec cmp (three ldrh+lsl#31); if mwcc CSEs to one value the and/mla sequence collapses — keep distinct reads.
 *   confidence: low
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

typedef struct Ent { u16 f0; u16 f2; } Ent;

typedef struct Slot {
    u8  pad0[0x30];
    u32 f30;
    u8  pad34[4];
    u16 f38;
} Slot;

extern u8 data_ov002_022cf16c[];
extern struct Glob2 {
    u8  pad0[0xcec];
    int fcec;
    u8  padcf0[8];
    int fcf8;
} data_ov002_022d016c;
extern int func_0202f9e8(int x);
extern int func_ov002_021bd948(int a, int b);
extern int func_ov002_021c8470(int a, int b);

int func_ov002_02287f88(Ent *e)
{
    int i;               /* r5 */
    u8 *base;            /* r4 */
    int stride;          /* r8 = 0x868 */
    Ent *ent;            /* r7 */
    int off;             /* r6 = i*0x14 */

    i = 0;
    base = data_ov002_022cf16c;
    ent = e;
    stride = 0x868;
    off = 0;
    for (i = 0; i <= 4; i++, off += 0x14) {
        int sel = ent->f2 & 1;
        Slot *s = (Slot *)(base + sel * stride + off);
        int v = (s->f30 << 0x13) >> 0x13;
        if (func_0202f9e8(v) != 0) {
            Slot *s2 = (Slot *)(base + (ent->f2 & 1) * stride + off);
            if (s2->f38 != 0) {
                if (data_ov002_022d016c.fcec == (ent->f2 & 1)
                    && (unsigned)data_ov002_022d016c.fcf8 <= 2) {
                    if (func_ov002_021bd948(i, 0) != 0) return 1;
                }
                if (func_ov002_021c8470(ent->f2 & 1, i) <= 0x3e8) return 1;
            }
        }
    }
    return 0;
}
