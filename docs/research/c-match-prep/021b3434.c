/* CAMPAIGN-PREP candidate for func_021b3434 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     flag=(lo>=0xa) cmp+movcs/movcc; OR-in via if(...)flag=1; :4 bitfields
 *   risk:       permuter-class: orig materialises constants 1 (r3),0 (r2),1 (r6) in three regs for the movcs/movcc/movgt selects; mwcc may reuse one '1' reg, shifting the select sequence. flag-assign reshape is correct shape; reg-dup is the coin-flip. struct-guessed.
 *   confidence: low
 */
/* func_ov002_021b3434 : list scan with nibble-class select, match field0 bytes (class C/D) */
/* struct-guessed: head table 022cf1a6, Node 022d0650 size 8. */

typedef struct Node {
    /* 0x0 */ short field0;
    /* 0x2 */ unsigned short lo : 4;
    /* 0x2 */ unsigned short hi : 4;
    /* 0x2 */ unsigned short pad : 8;
    /* 0x4 */ short field4;
    /* 0x6 */ unsigned short next;
} Node;   /* sizeof == 8 */

extern unsigned short data_ov002_022cf1a6[];
extern Node data_ov002_022d0650[];

int func_ov002_021b3434(int arg0, int arg1, int arg2, int arg3)
{
    Node *node;
    int cur;
    int lo;
    int flag;

    cur = *(unsigned short *)((unsigned char *)data_ov002_022cf1a6
                              + arg3 * 0x14 + (arg2 & 1) * 0x868);
    if (cur == 0)
        return 0;
    do {
        node = &data_ov002_022d0650[cur];
        cur = node->next;
        lo = node->lo;
        flag = (lo >= 0xa);
        if (lo == 6 || lo == 7) {
            if ((node->hi & 1) != 0)
                flag = 1;
        }
        if (flag != 0) {
            if ((node->field0 & 0xff) == arg0 && ((node->field0 >> 8) & 0xff) == arg1)
                return 1;
        }
    } while (cur != 0);
    return 0;
}
