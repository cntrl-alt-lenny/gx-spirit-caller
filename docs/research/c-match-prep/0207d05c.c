/* CAMPAIGN-PREP candidate for func_0207d05c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D store-order; reload linkoff twice (asm re-ldrh #0xa); count++ as u16
 *   risk:       struct-guessed: linkoff (+0xa) used as raw byte offset and node-relative {next@off,prev@off+4} layout inferred from asm; confirm node link struct & +0x8/+0xa field types.
 *   confidence: med
 */
/* func_0207d05c (main, class D, 0x74) — list-insert dispatch, store-order.
 * Doubly-linked list manager: +0x0 head, +0x4 tail, +0x8 u16 count,
 * +0xa u16 link-offset (byte offset of {next,prev} pair inside each node).
 *   r1==0      -> insert at tail  (func_0207d12c(list, ref=r2))
 *   r1==head   -> insert at head  (func_0207d0d0(list, node=r2))
 *   else       -> insert node r2 BEFORE node r1.
 * The general path threads next/prev pointers in the asm's exact store order.
 */
typedef struct List_05c {
    struct List_05c *head;   /* +0x00 */
    void            *tail;   /* +0x04 */
    unsigned short   count;  /* +0x08 */
    unsigned short   linkoff;/* +0x0a */
} List_05c;

extern void func_0207d0d0(List_05c *list, void *node);
extern void func_0207d12c(List_05c *list, void *ref);

void func_0207d05c(List_05c *list, void *node, void *ins) {
    unsigned int off;
    void *nxt;
    if (node == 0) {
        func_0207d12c(list, ins);
        return;
    }
    if (node == (void *)list->head) {
        func_0207d0d0(list, ins);
        return;
    }
    off = list->linkoff;
    nxt = *(void **)((char *)node + off);              /* ldr r3,[r1,lr] */
    *(void **)((char *)ins + off) = nxt;               /* str r3,[r2,lr] */
    *(void **)((char *)ins + off + 4) = node;          /* str r1,[ip,#4] */
    *(void **)((char *)nxt + off + 4) = ins;           /* str r2,[r3,#4] */
    off = list->linkoff;
    *(void **)((char *)node + off) = ins;              /* str r2,[r1,r3] */
    list->count++;
}
