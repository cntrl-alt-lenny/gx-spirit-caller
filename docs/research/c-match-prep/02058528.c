/* CAMPAIGN-PREP candidate for func_02058528 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order f0,f4,f8,f10(cond),fc,f14; homed args a1=sp+0x14,a2,a4=sp+0x20,a5=sp+0x24
 *   risk:       incoming a1/a2/a4/a5 read from homed stack +0x14/+0x18/+0x20/+0x24 (a3 stays r3); f10 store before fc must hold. struct-guessed.
 *   confidence: med
 */
/* func_02058528 (D): alloc 0x18 node, fill fields, append to list. */
extern void *func_020453e8(int sz);
extern void  func_0205ffc0(int ctx, void *lit);
extern unsigned char data_021002a4[];
typedef struct Node { int f0; int f4; int f8; int fc; void *f10; int f14; } Node;
typedef struct Host { int f0; char _4[0x434]; Node *head; Node *tail; } Host;
int func_02058528(Host *h, int a1, int a2, int a3, void *a4, int a5) {
    Host *root = (Host *)*(void **)h;
    Node *n = (Node *)func_020453e8(0x18);
    if (n == 0) {
        func_0205ffc0((int)h, data_021002a4);
        return 1;
    }
    n->f0 = a1;
    n->f4 = a2;
    n->f8 = a3;
    if (a4 != 0)
        n->f10 = *(void **)((char *)a4 + 0x18);
    else
        n->f10 = 0;
    n->fc = a5;
    n->f14 = 0;
    if (root->head == 0)
        root->head = n;
    if (root->tail != 0)
        root->tail->f14 = (int)n;
    root->tail = n;
    return 0;
}
