/* CAMPAIGN-PREP candidate for func_021b1f20 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     nibble :4 bitfields; store-order +2,+0,+4,+6; head walk then *link store
 *   risk:       reshape-able if stores reorder: emit packed(+2) then field0 then field4 then next exactly. Main divergence risk: mla index (arg1*0x14 + parity*0x868) reg-alloc vs orig's r1/r3/r6 juggling (permuter-class). struct-guessed offsets.
 *   confidence: med
 */
/* func_ov002_021b1f20 : linked-list tail-insert + nibble pack (class C/D) */
/* struct-guessed: Node size 8, head-table layout inferred from asm. */

extern unsigned short data_ov002_022cf16c[];
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

void func_ov002_021b1f20(int arg0, int arg1, int arg2, int arg3, int arg4)
{
    Node *node;
    unsigned short *link;
    int cur;
    int newidx;

    newidx = func_ov002_021b1d48(arg0, arg1, arg2, arg3);
    node = &data_ov002_022d0650[newidx];

    link = (unsigned short *)((unsigned char *)data_ov002_022cf16c
                              + (arg0 & 1) * 0x868 + 0x3a + arg1 * 0x14);
    cur = *link;
    while (cur != 0) {
        link = &data_ov002_022d0650[cur].next;
        cur = data_ov002_022d0650[cur].next;
    }
    *link = (unsigned short)newidx;

    node->lo = arg2 & 0xf;
    node->hi = (arg2 & 0xf0) >> 4;
    node->field0 = (short)arg3;
    node->field4 = (short)arg4;
    node->next = 0;
}
