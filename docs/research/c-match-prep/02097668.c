/* CAMPAIGN-PREP candidate for func_02097668 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order under irq; two distinct global externs (2 pool words)
 *   risk:       struct-guessed: data_021a830c modeled as bare-ptr+(+4/+6/+8) struct so r2 base is reused for str f8/strh f6/f4. If layout wrong, the 3 tail stores' base/offset diverge.
 *   confidence: med
 */
/* func_02097668 - IRQ-bracketed list unlink + global control-block fixup.
 * Class C: store ordering under irq. f4/f8 are the two link fields.
 * Recipe: emit stores in exact asm order (f0=0, f8=0, f4=f8-reload,
 * then f1c&=~1). The list head (data_021a8308) and tail-block
 * (data_021a830c) are SEPARATE externs => two pool words; data_021a830c
 * is addressed both bare and at +6/+8 so it is a struct variable. */

typedef struct Node {
    struct Node *f0;    /* +0x0 active/handler */
    struct Node *f4;    /* +0x4 prev link */
    struct Node *f8;    /* +0x8 next link */
    char _pad0c[0x1c - 0x0c];
    unsigned int f1c;   /* +0x1c flags */
} Node;

typedef struct ListCtl {
    Node *tail;         /* +0x0 (== data_021a830c) */
    short h4;           /* +0x4 */
    short h6;           /* +0x6 */
    int   c8;           /* +0x8 */
} ListCtl;

extern Node *data_021a8308;   /* list head, separate pool word */
extern ListCtl data_021a830c; /* tail-control block */
extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int);

void func_02097668(Node *o) {
    int saved;
    if (o->f0 == 0) return;
    saved = OS_DisableIrq();
    if (o->f4 != 0) o->f4->f8 = o->f8;
    if (o->f8 != 0) o->f8->f4 = o->f4;
    o->f0 = 0;
    o->f8 = 0;
    o->f4 = o->f8;
    o->f1c &= ~0x1u;
    if (data_021a830c.tail == o) {
        data_021a830c.c8 = 0;
        data_021a830c.tail = data_021a8308;
        data_021a830c.h6 = 0;
        data_021a830c.h4 = 0;
    }
    OS_RestoreIrq(saved);
}
