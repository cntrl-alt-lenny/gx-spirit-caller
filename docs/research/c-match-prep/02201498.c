/* CAMPAIGN-PREP candidate for func_02201498 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: bitfield extracts; movs r4,r1;beq for b==0 split; nested base+parity*0x868+field4*0x14 then [+0x30]; low13 mask via :id slot
 *   risk:       reshape-able: kind in {0x1f,0x20,0x21} 3x cmpne chain may compile to a range check (sub#0x1f;cmp#2). struct-guessed: slot offset 0x30 + field4 stride 0x14 inferred from siblings.
 *   confidence: med
 */
/* func_ov002_02201498 (ov002, class D) - two paths: b!=0 -> call gates; b==0 -> nested table walk to slot[+0x30].
 * rec = cf16c + parity*0x868; slot = rec + field4*0x14, word at +0x30 (low13 :id). Pattern from 021c93f0/021bcd80. */
extern unsigned char data_ov002_022cf16c[];
extern int func_0202e234(int id);
extern int func_02031794(int id);

typedef struct {
    unsigned short id0;
    unsigned short cb0  : 1;
    unsigned short cf5  : 5;
    unsigned short kind : 6;
    unsigned short cf12 : 2;
    unsigned short cb14 : 1;
    unsigned short cb15 : 1;
    unsigned char pad4[0x10];
    unsigned int w_0_8   : 9;
    unsigned int w_b9    : 1;
    unsigned int w_10_13 : 4;
} Card;

int func_ov002_02201498(Card *a, Card *b) {
    if (b != 0) {
        if (func_0202e234(b->id0) != 0) return 0;
        if (b->cf5 > 0xa) return 0;
        if (b->cf12 != 0) return 0;
        return func_02031794(b->id0) == 0 ? 1 : 0;
    } else {
        int kind = a->kind;
        if (kind != 0x1f && kind != 0x20 && kind != 0x21) return 0;
        {
            int parity = a->w_b9;
            int field4 = a->w_10_13;
            unsigned int sw = *(unsigned int *)(data_ov002_022cf16c + parity * 0x868 + field4 * 0x14 + 0x30);
            return (sw & 0x1fff) != 0 ? 1 : 0;
        }
    }
}
