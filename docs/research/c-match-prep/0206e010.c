/* CAMPAIGN-PREP candidate for func_0206e010 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind &globals in r4/r5 across outer loop; reload value per iter; inner walk break
 *   risk:       loop reg-alloc: orig binds &data_0219ece8/&data_0219ed48 in r4/r5 across the whole outer loop and reads the values once per iter; while/break head shape and the cur-survives-break flow are permuter-class (loop rotation a C reshape may not pin).
 *   confidence: low
 */
/* func_0206e010 (main, class C): IRQ-bracketed list walk. Repeatedly scan
 * the ready list (data_0219ed48) for the first node != active head
 * (data_0219ece8) that lacks flag 0x10; tear it down and restart. */

typedef struct node {
    char         _pad_00[0x70];
    short        m70;        /* +0x70 ldrsh */
    char         _pad_72[0x7c - 0x72];
    struct node *m7c;        /* +0x7c next */
} node_t;

extern int   OS_DisableIrq(void);
extern void  OS_RestoreIrq(int saved);
extern void  func_0206de68(node_t *p);
extern node_t *data_0219ece8;   /* active head */
extern node_t *data_0219ed48;   /* list head   */
extern int    data_0219ed4c;

int func_0206e010(void) {
    node_t *cur;
    int saved;

    for (;;) {
        saved = OS_DisableIrq();
        cur = data_0219ed48;
        if (cur != 0) {
            node_t *n = data_0219ece8;
            while (cur != 0) {
                if (cur != n && !(cur->m70 & 0x10))
                    break;
                cur = cur->m7c;
            }
        }
        OS_RestoreIrq(saved);
        if (cur == 0)
            break;
        func_0206de68(cur);
    }

    if (data_0219ed48 != 0) {
        if (data_0219ed48 != data_0219ece8) return ~0x19;
        if (data_0219ed48->m7c != 0) return ~0x19;
    }
    if (data_0219ed4c == 0) return 0;
    return ~0x19;
}
