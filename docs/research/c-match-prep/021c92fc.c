/* CAMPAIGN-PREP candidate for func_021c92fc (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     out via &local; ==0x18c7||==0x19ef chain; lsr;and bit masks; field & ~a & ~b tst; mvn order
 *   risk:       permuter-class: the dual-base address split (poff added to each global, b*0x14 as shared index) plus mvn r1/mvn r0 + and/tst ordering; mwcc may fuse one mla or reorder the masks. struct-guessed offsets (cf1a4 u16 @0, cf1ac @+8).
 *   confidence: med
 */
/* func_ov002_021c92fc: r = func_021c8e38(a,b,&out). If out==0 and
 * func_021b9ecc(a,b) is 0x18c7 or 0x19ef, test a packed bit predicate on
 * the struct at cf1ac/cf1a4 + (a&1)*0x868 + b*0x14. Returns (1<<r) | 0x78
 * when the predicate holds, else 1<<r. The predicate clears bit0 of the
 * u16 field per (w>>6)&1 and ((w>>2)|(w>>1))&1 then tests for any set. */
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1ac[];
extern int  func_ov002_021b9ecc(int a, int b);
extern int  func_ov002_021c8e38(int a, int b, int *out);

int func_ov002_021c92fc(int arg0, int arg1) {
    int out;
    int r = func_ov002_021c8e38(arg0, arg1, &out);
    if (out == 0) {
        int x = func_ov002_021b9ecc(arg0, arg1);
        if (x == 0x18c7 || x == 0x19ef) {
            int poff = (arg0 & 1) * 0x868;
            int w = *(int *)((char *)data_ov002_022cf1ac + poff + arg1 * 0x14);
            unsigned int field =
                *(unsigned short *)((char *)data_ov002_022cf1a4 + poff + arg1 * 0x14);
            unsigned int a = (w >> 6) & 1;
            unsigned int b = ((w >> 2) | (w >> 1)) & 1;
            if ((field & ~a) & ~b)
                return (1 << r) | 0x78;
        }
    }
    return 1 << r;
}
