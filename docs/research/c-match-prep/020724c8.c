/* CAMPAIGN-PREP candidate for func_020724c8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     linked-list find loop (next@0x68), guarded callback, return matching mgr (.legacy.c)
 *   risk:       Offsets 0x68/0xa4 and mgr->f0 guessed; r4-r7 callee-save assignment order may flip; head@+8 of data_021a63d0; sp2p3 routing.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_020724c8 (main, class A).
 * UNVERIFIED build-free draft. Route -> src/main/func_020724c8.legacy.c
 * (mwcc 1.2/sp2p3): stmdb{r4-r7,lr}+sub sp,#4 + 2-step (ldmia{...,lr};
 * bx lr / ldmneia) epilogue => Style A .legacy.c.
 *   recipe:     clean linked-list find loop (next@0x68); per node test
 *               mgr=node->0xa4 && mgr->f0 && func_02072544(a,b,mgr) ->
 *               return mgr; head from data_021a63d0->f8
 */
/* func_020724c8(a, b): walk list, return first node->mgr (@0xa4) whose
 * mgr->f0 != 0 and func_02072544(a,b,mgr) != 0; else NULL. */

typedef struct Mgr {
    int f0;                 /* +0x0 (ldr; != 0 gate) */
} Mgr;

typedef struct Node {
    char _pad68[0x68];
    struct Node *next;      /* +0x68 */
    char _pada4[0xa4 - 0x6c];
    Mgr *mgr;               /* +0xa4 */
} Node;

typedef struct Root {
    char _pad08[0x8];
    Node *head;             /* +0x8 */
} Root;

extern Root data_021a63d0;
extern int func_02072544(int a, int b, Mgr *mgr);

Mgr *func_020724c8(int a, int b) {
    Node *node = data_021a63d0.head;
    while (node != 0) {
        Mgr *mgr = node->mgr;
        if (mgr != 0 && mgr->f0 != 0) {
            if (func_02072544(a, b, mgr) != 0)
                return mgr;
        }
        node = node->next;
    }
    return 0;
}
