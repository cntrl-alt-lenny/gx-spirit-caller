/* CAMPAIGN-PREP candidate for func_020322e8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: hoist next=node->f4 (r6) before the guard; const k=2 in r4 outside loop.
 *   risk:       movs r7,r0 fuses the head!=0 test with the load; the `mov r4,#2` loop-invariant const must hoist out of the loop (matches asm). If mwcc sinks the 2 into the call site, one mov moves. reshape-able (hoist invariant).
 *   confidence: med
 */
/* func_020322e8: walk a list; for each node, if (node->f10 & 2) and
 * node->f14==0, call func_02031f70(node, 2) then func_02031ebc(head, node).
 * head=r0(r7); first node = head->f8; next = node->f4; stop when next==0.
 * Early-out if head==0 or head->f8==0.
 */

extern void func_02031f70(void *node, int k);
extern void func_02031ebc(void *head, void *node);

struct LNode_020322e8 {
    char                  _pad0[0x4];
    struct LNode_020322e8 *f4;   /* +0x4 next */
    struct LNode_020322e8 *f8;   /* +0x8 */
    char                  _pad1[0x4];
    int                   f10;   /* +0x10 */
    int                   f14;   /* +0x14 */
};

void func_020322e8(struct LNode_020322e8 *head) {
    struct LNode_020322e8 *node;
    if (head == 0) return;
    node = head->f8;
    if (node == 0) return;
    do {
        struct LNode_020322e8 *next = node->f4;
        if ((node->f10 & 2) && node->f14 == 0) {
            func_02031f70(node, 2);
            func_02031ebc(head, node);
        }
        node = next;
    } while (node != 0);
}
