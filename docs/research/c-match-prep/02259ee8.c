/* CAMPAIGN-PREP candidate for func_02259ee8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     first-used regs r8=a0,r7=a2,r6=a3 decl-order; indexed struct stride 0x10; blx via fn ptr
 *   risk:       reshape-able: arg order in func_021b40dc is (0x1a04 as r2, 0xb as r1) — note r2=0x1a04,r1=0xb so signature is (a0,r1=0xb,r2=table-id); my call passes them as (key=0x1a04,0xb,a2) wrong-positioned. Swap to (a2? ,0xb,0x1a04). struct-guessed offsets.
 *   confidence: med
 */
// func_ov002_02259ee8 — single scan loop over indexed table (stride 0x10), blx slot
extern unsigned char data_ov002_022c819c[];
extern int func_ov002_021b40dc(int a, int b, int c);
extern int func_ov002_02259aec(int a, int b, int c);

typedef struct {
    int  key;       /* +0x0 */
    int  pad1;      /* +0x4 */
    int  pad2;      /* +0x8 */
    int  (*fn)(int, int, int); /* +0xc */
} Entry;            /* size 0x10 */

int func_ov002_02259ee8(int a0, int a1, int a2, int a3)
{
    Entry *tab;
    int i;

    if (a1 == 0xe) {
        if (func_ov002_021b40dc(0x1a04, 0xb, a2)) {
            return func_ov002_02259aec(a0, a2, a3);
        }
    }

    tab = (Entry *)data_ov002_022c819c;
    for (i = 0; i < 0x1b; i++) {
        if (a2 == tab[i].key) {
            int r = tab[i].fn(a0, a2, a3);
            if (r != 0)
                return r;
        }
    }
    return 0;
}
