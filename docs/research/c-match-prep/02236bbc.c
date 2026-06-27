/* CAMPAIGN-PREP candidate for func_02236bbc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch(state-0x7d)->addls pc table; up-front eor g; 0x7f falls through to 0x7e; coord unpack
 *   risk:       reshape-able: g=A^B is computed up-front (eor before dispatch) and (g&1)*0x868 is RECOMPUTED per case (asm doesn't bind). If mwcc sinks g into cases or binds the product, ldr/eor scheduling diverges; case-order must keep the addls table.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_02236bbc (ov002, class D) — brief 494.
 * UNVERIFIED build-free draft. Jump-table state machine: discriminant
 * (state-0x7d) in [0..3] -> addls pc table; default returns 0. g computed
 * up-front for all cases: g = *(int*)(d016c+0xcec) ^ *(int*)(ce288+0x5ac).
 *   0x80 (idx3): ce288[0x5ac]=0; 021e2b3c(); return 0x7f
 *   0x7f (idx2): t=*(int*)(cf188 + (g&1)*0x868); if(t==0) return 0x7d; else fall-thru
 *   0x7e (idx1): t=*(int*)(cf188 + (g&1)*0x868); if(t==0){021e286c(); return 0x7d;}
 *                e=*(int*)(cf16c + (g&1)*0x868 + 0x5d0 + (t-1)*4);
 *                021d8204(((e>>22)&0xff)<<1 + ((e>>13)&1)); return 0x7e
 *   0x7d (idx0): c=++ce288[0x5ac]; if(c<2) return 0x7f; 021e2c5c(); return 0
 *   default    : return 0
 * NOTE the 0x7f->0x7e fall-through (L_24c falls into L_26c); both recompute the
 * (g&1)*0x868 product separately (asm does NOT bind it). */
extern char data_ov002_022ce288[];   /* state +0x5a8, counter +0x5ac */
extern char data_ov002_022d016c[];   /* +0xcec key */
extern char data_ov002_022cf188[];   /* int table, 0x868 parity stride */
extern char data_ov002_022cf16c[];   /* record base, +0x5d0 entry array */
extern void func_ov002_021d8204(int coord);
extern void func_ov002_021e286c(void);
extern void func_ov002_021e2b3c(void);
extern void func_ov002_021e2c5c(void);

int func_ov002_02236bbc(void) {
    int state = *(int *)(data_ov002_022ce288 + 0x5a8);
    int g = *(int *)(data_ov002_022d016c + 0xcec) ^ *(int *)(data_ov002_022ce288 + 0x5ac);
    int t, e, c;

    switch (state) {
    case 0x80:
        *(int *)(data_ov002_022ce288 + 0x5ac) = 0;
        func_ov002_021e2b3c();
        return 0x7f;
    case 0x7f:
        t = *(int *)(data_ov002_022cf188 + (g & 1) * 0x868);
        if (t == 0)
            return 0x7d;
        /* fall through */
    case 0x7e:
        t = *(int *)(data_ov002_022cf188 + (g & 1) * 0x868);
        if (t == 0) {
            func_ov002_021e286c();
            return 0x7d;
        }
        e = *(int *)(data_ov002_022cf16c + (g & 1) * 0x868 + 0x5d0 + (t - 1) * 4);
        func_ov002_021d8204((((unsigned int)e >> 22 & 0xff) << 1) + ((unsigned int)e >> 13 & 1));
        return 0x7e;
    case 0x7d:
        c = *(int *)(data_ov002_022ce288 + 0x5ac) + 1;
        *(int *)(data_ov002_022ce288 + 0x5ac) = c;
        if (c < 2)
            return 0x7f;
        func_ov002_021e2c5c();
        return 0;
    default:
        return 0;
    }
}
