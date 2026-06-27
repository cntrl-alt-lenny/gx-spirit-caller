/* CAMPAIGN-PREP candidate for func_021b0c54 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     [r5+2] :1/:6/:2/:1 bitfields; eor(bit14^bit0)==G[1] gate; flag-accumulator; .L_124 tail call
 *   risk:       permuter-class + struct-guessed: LIT1 compare const unknown (left 0x0); RecC54 widths/word14 offset inferred; the multi-flag movne/moveq + goto layout will likely need permuter or .s.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_021b0c54 (ov002, class D) — brief 494.
 * UNVERIFIED build-free draft. recipe: :N bitfields on the [r5+2] ushort (bit0
 * parity, :6 kind @bit6, :2 @bit12, bit14), validation eor(bit14^bit0)==G[1],
 * &&-guard chain, flag accumulator with movne/moveq verdict, store-order kept.
 * LARGE multi-recipe gate; offsets/widths are inferred from the shift pairs.
 * h.parity == bit0; (h.f12 != 0) early-out; h.kind in {0x1f,0x20,0x21}.
 */
typedef unsigned short u16;

struct RecC54 {                /* the arg0 record */
    u16 key0;                  /* +0  */
    u16 parity : 1;            /* +2 bit0  */
    u16 _b1    : 5;            /* +2 bits1..5 */
    u16 kind   : 6;            /* +2 bits6..11 (0x1f/0x20/0x21 test) */
    u16 f12    : 2;            /* +2 bits12..13 */
    u16 b14    : 1;            /* +2 bit14 */
    u16 _b15   : 1;            /* +2 bit15 */
    char _pad4[0x10];          /* +4 .. +0x13 */
    int  word14;               /* +0x14 (bit9 tested) */
};

extern int  data_ov002_022d016c[];      /* G: [+0x4]=expected, [+0xcec]=cur */
extern int  func_0202b878(int);
extern int  func_0202b8c0(int);
extern void func_ov002_021b0b54(int, int);
extern void func_ov002_021b0c04(int, int);

void func_ov002_021b0c54(struct RecC54 *r, int count) {
    int flag;
    if (*(int *)((char *)data_ov002_022d016c + 0x4) != (r->b14 ^ r->parity))
        return;
    if (func_0202b878(r->key0) != 0x17) {
        func_0202b878(r->key0);
        return;
    }
    func_ov002_021b0b54(0x3a, 1);
    if (r->f12 != 0)
        return;
    func_ov002_021b0c04(0x21, 1);
    if (func_0202b8c0(r->key0) != 1)
        return;
    flag = 0;
    if (count > 0) {
        if ((*(u16 *)((char *)r - 0x16) & 1) != r->parity) {
            flag = 1;
            goto verdict;
        }
    }
    if (r->key0 == 0x0000) {  /* LIT1 const id — placeholder */
        if (*(int *)((char *)data_ov002_022d016c + 0xcec) != r->parity)
            flag = 1;
        else
            flag = 0;
    }
    if (r->kind == 0x1f || r->kind == 0x20 || r->kind == 0x21) {
        if (((r->word14 >> 9) & 1) != r->parity)
            flag = 1;
        else
            flag = 0;
    } else {
        goto verdict;
    }
verdict:
    if (flag == 0)
        return;
    func_ov002_021b0c04(0x22, 1);
}
