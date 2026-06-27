/* CAMPAIGN-PREP candidate for func_021b1fe8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     nibble :4 bitfields; head stride-4 table; store-order +2,+0,+4,+6
 *   risk:       reshape-able: keep store-order packed/field0/field4/next. Likely divergence is head-table elem type: arg0*4 byte stride means u16[arg0*2]; if mwcc picks wrong scale the ldrh index shifts. struct-guessed offsets.
 *   confidence: med
 */
/* func_ov002_021b1fe8 : linked-list tail-insert + nibble pack (class C/D) */
/* struct-guessed: Node size 8, head-table (022d0252) stride 4 inferred. */

extern unsigned short data_ov002_022d0252[];
extern int func_ov002_021b1d48(int a, int b, int c, int d);

typedef struct Node {
    /* 0x0 */ short field0;
    /* 0x2 */ unsigned short lo : 4;
    /* 0x2 */ unsigned short hi : 4;
    /* 0x2 */ unsigned short pad : 8;
    /* 0x4 */ short field4;
    /* 0x6 */ unsigned short next;
} Node;   /* sizeof == 8 */

extern Node data_ov002_022d0650[];

void func_ov002_021b1fe8(int arg0, int arg1, int arg2, int arg3)
{
    Node *node;
    unsigned short *link;
    int cur;
    int newidx;

    newidx = func_ov002_021b1d48(arg0, arg1, arg2, arg3);
    node = &data_ov002_022d0650[newidx];

    link = &data_ov002_022d0252[arg0 * 2];   /* ldrh [022d0252 + arg0*4] */
    cur = *link;
    while (cur != 0) {
        link = &data_ov002_022d0650[cur].next;
        cur = data_ov002_022d0650[cur].next;
    }
    *link = (unsigned short)newidx;

    node->lo = arg1 & 0xf;
    node->hi = (arg1 & 0xf0) >> 4;
    node->field0 = (short)arg2;
    node->field4 = (short)arg3;
    node->next = 0;
}
