/* CAMPAIGN-PREP candidate for func_0207d12c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D store-order; load tail twice (asm re-ldr +0x4) and linkoff twice; u16 count++
 *   risk:       struct-guessed: relies on tail at +0x4 reloaded twice and {next@off, prev@off+4} node layout; confirm +0x4 is tail and the off/off+4 split matches node link struct.
 *   confidence: med
 */
/* func_0207d12c (main, class D, 0x60) — list-insert at tail, store-order.
 * Same List manager. If head==0 -> func_0207d18c(list). Otherwise append
 * node r1 after the current tail (list->tail at +0x4): set node {next=tail,
 * prev=0}, link old-tail.next? -> node, update tail, bump u16 count, in the
 * asm's exact store order.
 */
typedef struct List_12c {
    void           *head;    /* +0x00 */
    void           *tail;    /* +0x04 */
    unsigned short  count;   /* +0x08 */
    unsigned short  linkoff; /* +0x0a */
} List_12c;

extern void func_0207d18c(List_12c *list);

void func_0207d12c(List_12c *list, void *node) {
    unsigned int off;
    void *oldtail;
    if (list->head == 0) {
        func_0207d18c(list);
        return;
    }
    off = list->linkoff;
    oldtail = list->tail;
    *(void **)((char *)node + off) = oldtail;          /* str r3,[r1,ip] */
    *(void **)((char *)node + off + 4) = 0;            /* str r2(0),[r3,#4] */
    off = list->linkoff;
    oldtail = list->tail;
    *(void **)((char *)oldtail + off + 4) = node;      /* str r1,[r2,#4] */
    list->tail = node;
    list->count++;
}
