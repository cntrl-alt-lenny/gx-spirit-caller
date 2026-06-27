/* CAMPAIGN-PREP candidate for func_0223ab58 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: dual mla bases pa/pb (slot & 1-slot, stride 0x38) computed up-front; ldmia {r1,r2} as pa[0]/pa[1]; shifted-or packed; composed reused
 *   risk:       permuter-class + struct-guessed: pa/pb live across the func_021b3618 call (r4/r5 callee-saved); mwcc may recompute mla after the call or swap r4/r5, diverging the two ldmia. The _LIT2 base (cd420 vs cd3f4) for the [#8] guard is uncertain.
 *   confidence: low
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022cd3f4[];
extern u8 data_ov002_022cd420[];
extern u8 data_ov002_022cf16c[];
extern u8 data_ov002_022d016c[];
extern int func_ov002_021b3618(int a, int b);
extern int func_ov002_021de64c(int a, int b, int c, int d);

int func_ov002_0223ab58(int *self) {
    int slot = *(int*)(data_ov002_022d016c + 0xcec);
    u16 h2 = *(u16*)((char*)self + 2);
    int a0 = (h2 << 31) >> 31 & 1;
    int a5 = (h2 >> 1) & 0x1f;
    int *pa = (int*)(data_ov002_022cd420 + slot * 0x38);
    int *pb = (int*)(data_ov002_022cd420 + (1 - slot) * 0x38);
    int key = func_ov002_021b3618(a0, a5);
    if (*(int*)(data_ov002_022cd420 + 8) != 0) return 0;   /* _LIT2 = data_022cd420? guarded */
    {
        u32 w0 = pa[0], w1 = pa[1];
        int packed = (u16)((w0 & 0xff) | ((w1 & 0xff) << 8));
        if (key != packed) {
            int parity = w0 & 1;
            u32 t = *(u32*)(data_ov002_022cf16c + parity * 0x868 + w1 * 0x14 + 0x30);
            int composed = (((t >> 6) & 0xff) << 1) + ((t >> 13) & 1);
            if (pa[3] == composed) func_ov002_021de64c((int)self, 0, 0, 0);
        }
    }
    {
        u32 w0 = pb[0], w1 = pb[1];
        int packed = (u16)((w0 & 0xff) | ((w1 & 0xff) << 8));
        if (key != packed) {
            int parity = w0 & 1;
            u32 t = *(u32*)(data_ov002_022cf16c + parity * 0x868 + w1 * 0x14 + 0x30);
            int composed = (((t >> 6) & 0xff) << 1) + ((t >> 13) & 1);
            if (pb[3] == composed) func_ov002_021de64c((int)self, 0, 0, 0);
        }
    }
    return 0;
}
