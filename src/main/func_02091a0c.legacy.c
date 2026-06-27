/* CAMPAIGN-PREP candidate for func_02091a0c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if(head){while(head)...} store-then-reload f7c=f80 and head=f04
 *   risk:       VERIFIED 100% as *.legacy.c (1.2/sp2p3); the f80->f7c and f04->head reload + sub sp,#4 frame only appear under 1.2. Reshape-able: route .legacy.c (default 2.0 = 31%, elides the reloads).
 *   confidence: high
 */
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int);
extern void func_02091f88(void);
extern struct Node *func_020921a8(void *);

typedef struct Node {
    char _pad00[0x64];
    int  f64;   /* +0x64 */
    char _pad68[0x78 - 0x68];
    int  f78;   /* +0x78 */
    int  f7c;   /* +0x7c */
    int  f80;   /* +0x80 */
} Node;

typedef struct Container {
    void *head;   /* +0x00 */
    void *f04;    /* +0x04 */
} Container;

void func_02091a0c(Container *c)
{
    int irq = OS_DisableIrq();
    if (c->head != 0) {
        while (c->head != 0) {
            Node *n = func_020921a8(c);
            n->f64 = 1;
            n->f78 = 0;
            n->f80 = 0;
            n->f7c = n->f80;
        }
        c->f04 = 0;
        c->head = c->f04;
        func_02091f88();
    }
    OS_RestoreIrq(irq);
}
