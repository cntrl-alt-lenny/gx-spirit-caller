/* CAMPAIGN-PREP candidate for func_02097a4c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     do/while retry loop; hoist next(r5); flags&4 as guard; if-assign bools
 *   risk:       reshape-able-ish: r5 holds o->f8 from BEFORE the loop across all iterations; if mwcc reloads it inside, 1 ldr diverges. Loop-back reg rotation may need permuter.
 *   confidence: med
 */
/* func_02097a4c - flag-guard retry loop over a chain of nodes.
 * Class C: moderate reg-alloc; r5 caches o->f8 (next), r7=0, r8=1 are
 * hoisted bool constants reused across the loop. Recipe: do/while since
 * the loop re-enters via tail 'bne .L_220'; declare next(r5) before the
 * loop so it survives, and keep the (flags&4)!=0 test as the loop guard. */

typedef struct Node {
    char _pad00[0x8];
    struct Node *f8;    /* +0x8 next-on-retry */
    unsigned int fc;    /* +0xc flags */
    int  f10;           /* +0x10 */
    char _pad14[0x18 - 0x14];
    char q18[0x4];      /* +0x18 OSThreadQueue (passed by addr) */
} Node;

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int);
extern void func_02091a0c(void *q);
extern int  func_020965ac(Node *o, int x);
extern Node *func_02097af0(Node *next);

int func_02097a4c(Node *o) {
    Node *next;
    int saved;
    if (o == 0) return 0;
    next = o->f8;
    for (;;) {
        saved = OS_DisableIrq();
        o->fc |= 0x40;
        if ((o->fc & 0x4) != 0) {
            func_02091a0c(&o->q18);
            OS_RestoreIrq(saved);
            return 0;
        }
        o->fc |= 0x8;
        OS_RestoreIrq(saved);
        if (func_020965ac(o, o->f10) == 6) return 0;
        o = func_02097af0(next);
        if (o == 0) return 0;
    }
}
