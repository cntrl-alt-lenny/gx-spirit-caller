/* CAMPAIGN-PREP candidate for func_0207d0d0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D store-order; mov r2,#0 reused as the stored zero; reload linkoff; u16 count++
 *   risk:       struct-guessed/reshape-able: asm stores 0 at [node+off] then oldhead at [node+off+4] then node at [oldhead+off]; my off+4 on the first store is likely wrong — match raw [node+off]=0, [node+off+4]=oldhead exactly.
 *   confidence: med
 */
/* func_0207d0d0 (main, class D, 0x5c) — list-insert at head, store-order.
 * Same List manager as 0207d05c. If head==0 the list is empty ->
 * delegate to func_0207d18c(list) [first-element init]. Otherwise splice
 * node r1 in front of the current head, threading {next=old-head, prev=0}
 * in the asm's exact store order, then bump the u16 count.
 */
typedef struct List_0d0 {
    void           *head;    /* +0x00 */
    void           *tail;    /* +0x04 */
    unsigned short  count;   /* +0x08 */
    unsigned short  linkoff; /* +0x0a */
} List_0d0;

extern void func_0207d18c(List_0d0 *list);

void func_0207d0d0(List_0d0 *list, void *node) {
    unsigned int off;
    void *oldhead;
    if (list->head == 0) {
        func_0207d18c(list);
        return;
    }
    off = list->linkoff;
    *(void **)((char *)node + off + 4) = 0;            /* str r2(0),[r1,r3] : prev slot? see note */
    oldhead = list->head;
    *(void **)((char *)node + off + 4) = oldhead;      /* str r2,[r3,#4] */
    off = list->linkoff;
    *(void **)((char *)list->head + off) = node;       /* str r1,[r3,r2] */
    list->head = node;
    list->count++;
}
