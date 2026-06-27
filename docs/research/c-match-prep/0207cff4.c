/* CAMPAIGN-PREP candidate for func_0207cff4 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     e=self+off bound once; predicated ldreq/streq/ldrne branches; ordered prev/next zeroing
 *   risk:       orig reads the discriminant e->prev via index form `ldr [r1,ip]` while keeping `lr=self+off` for the rest, and RELOADS off (`ldrh [r0,#0xa]`) on the next-side; mwcc with one `e` ptr emits `[e,#0]` and reuses cached off -> diverges on those 2 loads. permuter-class (mixed index/imm addressing won't come from clean C).
 *   confidence: med
 */
/* func_0207cff4: unlink a node from an intrusive doubly-linked list.
 * r0=hdr, r1=this node's base. off = hdr->off (+0xa, u16).
 * The Link record (prev@+0, next@+4) is embedded at  node_base + off.
 * prev/next/head/tail all store NODE BASE pointers (same off indexes each).
 *   e        = (Link*)(self + off);                 // [r1,ip] / add lr,r1,ip
 *   if (e->prev == 0)  hdr->head(+0) = e->next;
 *   else  ((Link*)(e->prev + off))->next = e->next;  // [ (r3+ip)+4 ]
 *   if (e->next == 0)  hdr->tail(+4) = e->prev;
 *   else  ((Link*)(e->next + off))->prev = e->prev;  // [r3, r1(=off reload)]
 *   e->prev = 0; e->next = 0;
 *   hdr->count(+0x8,u16)--;
 */
typedef struct {
    char *prev;  /* +0x0 : neighbour node base */
    char *next;  /* +0x4 : neighbour node base */
} Link;

typedef struct {
    char *         head;   /* +0x0 */
    char *         tail;   /* +0x4 */
    unsigned short count;  /* +0x8 */
    unsigned short off;    /* +0xa */
} ListHdr;

void func_0207cff4(ListHdr *hdr, char *self) {
    unsigned int off = hdr->off;
    Link *e = (Link *)(self + off);

    if (e->prev == 0) {
        hdr->head = e->next;
    } else {
        ((Link *)(e->prev + off))->next = e->next;
    }

    if (e->next == 0) {
        hdr->tail = e->prev;
    } else {
        ((Link *)(e->next + off))->prev = e->prev;
    }

    e->prev = 0;
    e->next = 0;
    hdr->count = hdr->count - 1;
}
