/* CAMPAIGN-PREP candidate for func_021bca00 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla-base (p&1)*0x868 parallel arrays; bit6 mask; switch->compare-tree
 *   risk:       switch on v emits a balanced bgt/blt/beq compare-tree; if mwcc orders the 6 cases differently the branch tree diverges. reshape-able (reorder/adjust case labels).
 *   confidence: low
 */
/* func_ov002_021bca00: gate a (player,row) move. fail(0) if flags bit6 set;
 * if player!=arg0 also require cap field nonzero; then look up an id via
 * func_ov002_021b9ecc and accept only if it is one of a fixed set, in which
 * case compare two normalized ids via func_0202b890. */
extern unsigned char data_ov002_022cf1a4[]; /* u16 cap field, parallel array */
extern unsigned char data_ov002_022cf1ac[]; /* u32 flags field, parallel array */
extern int func_0202b890(int a);
extern int func_ov002_021b9ecc(int a, int b);

int func_ov002_021bca00(int arg0, int arg1, int player, int row) {
    int v;
    unsigned int flags = *(unsigned int *)(data_ov002_022cf1ac + (player & 1) * 0x868 + row * 20);
    if ((flags >> 6) & 1)
        return 0;
    if (player != arg0) {
        if (*(unsigned short *)(data_ov002_022cf1a4 + (player & 1) * 0x868 + row * 20) == 0)
            return 0;
    }
    v = func_ov002_021b9ecc(player, row);
    switch (v) {
    case 0x1521:
    case 0x1798:
    case 0x17e8:
    case 0x17e9:
    case 0x1873:
    case 0x1874: {
        int a = func_0202b890(arg1);
        return a == func_0202b890(func_ov002_021b9ecc(player, row));
    }
    default:
        return 0;
    }
}
