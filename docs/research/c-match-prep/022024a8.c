/* CAMPAIGN-PREP candidate for func_022024a8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     x = b0 ^ b14 (eor of two :1 bitfields) kept in r4; movne/moveq→bool +2 compare
 *   risk:       x is held in r4 across 6 calls — if mwcc spills/recomputes b0^b14, the callee-saved bind diverges. The (x!=b0) is recomputed from a fresh ldrh; reshape-able via callee-saved local; near-miss otherwise permuter-class (call scheduling).
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u8 _pad0[2];
    u16 b0 : 1;      /* bit 0 */
    u16 b1_5 : 5;
    u16 kind : 6;
    u16 b12_13 : 2;
    u16 b14 : 1;     /* bit 14 */
    u16 b15 : 1;
} Entity;

extern int func_ov002_021bc8c8(int x, int kindlo);
extern int func_ov002_021c2f24(int x, int tag);
extern int func_ov002_021ca2b8(int x);
extern int func_ov002_021ff2b8(Entity *e, int x);

int func_ov002_022024a8(Entity *e)
{
    int x;
    int n;

    x = e->b0 ^ e->b14;
    if (func_ov002_021bc8c8(x, e->b1_5) == 0)
        return 0;
    n = func_ov002_021ff2b8(e, x);
    if (n < (x != e->b0 ? 1 : 0) + 2)
        return 0;
    if (func_ov002_021ca2b8(x) == 0)
        return 0;
    if (func_ov002_021c2f24(x, 0x1288) == 0)
        return 0;
    if (func_ov002_021c2f24(x, 0x129b) == 0)
        return 0;
    if (func_ov002_021c2f24(x, 0x12b8) == 0)
        return 0;
    return 2;
}
