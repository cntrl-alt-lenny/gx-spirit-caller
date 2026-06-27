/* CAMPAIGN-PREP candidate for func_02097f20 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     hoist taken(r5); two do/while spins; distinct return tails
 *   risk:       permuter-class: dual-loop + branch-tail scheduling. The (flags&1)->1/0 and (flags&0x44)==0->1/0 booleans materialize via movne/moveq pairs whose reg/order is a coin-flip a C reshape won't pin.
 *   confidence: low
 */
/* func_02097f20 - IRQ-bracketed dual flag-spin (two while loops) + tail.
 * Class C: branch-tail sensitive. r5 carries a bool decision (which spin
 * was taken / result). Recipe: hoist r5=0; (flags&1) gate; (flags&0x44)==0
 * picks loop A (set bit4, spin until bit6) else loop B (spin until !bit0);
 * keep the two return tails distinct (r5!=0 -> call f02097a04). */

typedef struct Node {
    char _pad00[0xc];
    unsigned int fc;    /* +0xc flags */
    int  f14;           /* +0x14 */
    char _pad18[0x18 - 0x18];
    char q18[0x4];      /* +0x18 OSThreadQueue */
} Node;

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int);
extern void func_02091a8c(void *q);
extern void func_02097a04(Node *o);

int func_02097f20(Node *o) {
    int saved;
    int taken = 0;
    saved = OS_DisableIrq();
    if ((o->fc & 0x1) != 0) {
        if ((o->fc & 0x44) == 0) {
            taken = 1;
            o->fc |= 0x4;
            do {
                func_02091a8c(&o->q18);
            } while ((o->fc & 0x40) == 0);
        } else {
            taken = 0;
            do {
                func_02091a8c(&o->q18);
            } while ((o->fc & 0x1) != 0);
        }
    }
    OS_RestoreIrq(saved);
    if (taken != 0) {
        func_02097a04(o);
        return 0;          /* falls through; r0 undefined-ish, see risk */
    }
    return o->f14 == 0;
}
