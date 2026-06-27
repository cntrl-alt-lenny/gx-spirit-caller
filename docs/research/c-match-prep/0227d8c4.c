/* CAMPAIGN-PREP candidate for func_0227d8c4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     halfword :13 field; sparse switch->compare-BST returns 3; signed; mask=c?0x40:0x10; tst
 *   risk:       struct-guessed AND _LIT1.._LIT5 case values absent from provided asm — campaign must fill real pool words; mwcc's BST pivot/order then follows. struct-guessed
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_0227d8c4 (ov002, class D, MED tier) — brief 0080.
 * UNVERIFIED + ITERATION-EXPECTED. *** LITERAL POOL _LIT1.._LIT5 NOT IN PROVIDED ASM ***
 * The case values below are PLACEHOLDERS that preserve the compare-tree relations
 * (root=L1, then L1-0x3d / L1-4 / {L2-2,L2-1,L2}, and L3 / L3-1 / L3+0x1a8 / L4,
 * L5 in the tst branch). The campaign MUST replace them with the real pool words.
 *   recipe:     halfword :13 field from table[arg1]; sparse switch->BST returns 3; signed cmp; tst-mask branch
 *   confidence: low
 */
/* func_ov002_0227d8c4 (cls D) — fld=(u16 table[b]):13; r=021c38c4(a);
 * if(fld in discrete set) return 3; if(r<=4) return 0; mask=c?0x40:0x10;
 * if(0226eb5c(a,b,2,0)&mask) return (fld==L5)?1:0; return (r<=6)?1:2. */

extern unsigned short data_ov002_022d0250[];
extern int func_ov002_021c38c4(int a);
extern int func_ov002_0226eb5c(int a, int b, int c, int d);

struct Ov002Hw { unsigned int fld : 13; };

int func_ov002_0227d8c4(int a, int b, int c) {
    /* table[b] is a halfword; low 13 bits are the field (lsl#19;lsr#19). */
    int fld = ((struct Ov002Hw *)&data_ov002_022d0250[b * 2])->fld;
    int r = func_ov002_021c38c4(a);
    switch (fld) {
    /* === PLACEHOLDER VALUES — replace from real _LIT1.._LIT4 pool === */
    case 0x100:            /* L1            */
    case 0x100 - 0x3d:     /* L1-0x3d       */
    case 0x100 - 4:        /* L1-4          */
    case 0x080 - 2:        /* L2-2          */
    case 0x080 - 1:        /* L2-1          */
    case 0x080:            /* L2            */
    case 0x140:            /* L3            */
    case 0x140 - 1:        /* L3-1          */
    case 0x140 + 0x1a8:    /* L3+0x1a8      */
    case 0x300:            /* L4            */
        return 3;
    }
    if (r <= 4)
        return 0;
    {
        int mask = (c != 0) ? 0x40 : 0x10;
        if ((func_ov002_0226eb5c(a, b, 2, 0) & mask) != 0)
            return (fld == 0x200 /* L5 placeholder */) ? 1 : 0;
    }
    return (r <= 6) ? 1 : 2;
}
