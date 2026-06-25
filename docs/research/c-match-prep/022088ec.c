/* CAMPAIGN-PREP candidate for func_022088ec (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     u8-temp byte-pack (bit0|(b1_5<<8)); movs-guard arg1; counted loop on cnt6
 *   risk:       struct-guessed: node->cnt6 offset (+6, u8) and f0 (+0) inferred from ldrh [r5,#0x6]/[r5]; confirm. Pack idiom is proven (func_ov002_021f4d3c). movs r5,r1 null-guard maps to if(node==0).
 *   confidence: med
 */
/* func_ov002_022088ec: guard(arg1!=0) + func_02031794 reject + func_0202e234,
 * then loop i over arg1->f6count comparing func_ov002_0223de94(arg1,i) against
 * the byte-packed (self->f2.bit0 | (self->f2.b1_5 << 8)). u8 temps force the
 * and #0xff masks before the orr. */
typedef unsigned short u16;
typedef unsigned char u8;

struct F022088ec_F2 { u16 bit0 : 1; u16 b1_5 : 5; u16 rest : 10; };
struct F022088ec_Self { u16 f0; struct F022088ec_F2 f2; };
struct Node022088ec { u16 f0; char _pad4[2]; u8 cnt6; };

extern int func_02031794(u16 a);
extern void func_0202e234(u16 a);
extern int func_ov002_0223de94(struct Node022088ec *node, int i);

int func_ov002_022088ec(struct F022088ec_Self *self, struct Node022088ec *node) {
    int i;
    if (node == 0) return 0;
    if (func_02031794(node->f0) != 0) return 0;
    func_0202e234(node->f0);
    i = 0;
    if ((int)(u8)node->cnt6 <= 0) return 0;
    do {
        u8 lo = self->f2.bit0;
        u8 hi = self->f2.b1_5;
        if ((unsigned int)func_ov002_0223de94(node, i) == (u16)(lo | (hi << 8)))
            return 1;
        i++;
    } while (i < (int)(u8)node->cnt6);
    return 0;
}
