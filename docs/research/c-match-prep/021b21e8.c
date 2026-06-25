/* CAMPAIGN-PREP candidate for func_021b21e8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     load next before compare; field4 then field0 (asm order); early returns kept
 *   risk:       reshape-able: the cmp r1,r6 then ldreqh/cmpeq short-circuit must stay field4-first. Divergence risk: orig keeps next (r4) live across the call; if mwcc spills, the post-call advance diverges. Mostly callee-saved liveness (low risk). struct-guessed.
 *   confidence: med
 */
/* func_ov002_021b21e8 : linked-list scan + conditional callback (class C) */
/* struct-guessed: Node size 8, fields from asm. */

typedef struct Node {
    /* 0x0 */ short field0;
    /* 0x2 */ unsigned short packed;
    /* 0x4 */ short field4;
    /* 0x6 */ unsigned short next;
} Node;   /* sizeof == 8 */

extern Node data_ov002_022d0650[];
extern void func_ov002_021b1d84(int idx);

void func_ov002_021b21e8(int idx, int arg1, int arg2, int arg3)
{
    Node *node;
    int next;

    if (idx == 0)
        return;
    do {
        node = &data_ov002_022d0650[idx];
        next = node->next;
        if (node->field4 == arg2 && node->field0 == arg1) {
            func_ov002_021b1d84(idx);
            if (arg3 == 0)
                return;
        }
        idx = next;
    } while (next != 0);
}
