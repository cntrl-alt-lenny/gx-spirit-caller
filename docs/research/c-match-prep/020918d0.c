/* CAMPAIGN-PREP candidate for func_020918d0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order locals; dual-epilogue early-return; predicated head/mid splice
 *   risk:       VERIFIED 100% as *.legacy.c (mwcc 1.2/sp2p3). Reshape-able: under default 2.0/sp1p5 it is 19% (Style-B pop{pc} vs orig Style-A pop{lr};bx lr). MUST route .legacy.c.
 *   confidence: high
 */
extern char data_021a63d0[];
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int);
extern void func_02091f88(void);

typedef struct Node {
    char         _pad00[0x68];
    struct Node *next;   /* +0x68 */
    char         _pad6c[0x70 - 0x6c];
    int          key;    /* +0x70 */
} Node;

void func_020918d0(void)
{
    Node *self = *(Node **)(data_021a63d0 + 0x4);
    Node *prev_of_self;
    Node *match;
    int   count;
    int   irq;
    Node *cur;
    Node *last;

    prev_of_self = 0;
    match = 0;
    count = 0;
    irq = OS_DisableIrq();
    cur = *(Node **)(data_021a63d0 + 0x8);
    last = 0;
    if (cur != 0) {
        int self_key = self->key;
        do {
            if (cur == self)
                prev_of_self = last;
            if (self_key == cur->key) {
                match = cur;
                count = count + 1;
            }
            last = cur;
            cur = cur->next;
        } while (cur != 0);
    }
    if (count <= 1 || match == self) {
        OS_RestoreIrq(irq);
        return;
    }
    if (prev_of_self == 0)
        *(Node **)(data_021a63d0 + 0x8) = self->next;
    else
        prev_of_self->next = self->next;
    self->next = match->next;
    match->next = self;
    func_02091f88();
    OS_RestoreIrq(irq);
}
