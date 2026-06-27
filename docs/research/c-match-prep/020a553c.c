/* CAMPAIGN-PREP candidate for func_020a553c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     signed off subs+bmi; unsigned count/limit cmp; entry/end pointers held; found flag
 *   risk:       reshape-able: e(r2)/end(r1) base+0x30/+0x70 must stay pointers, off+c overflow uses unsigned cmp; if mwcc reorders the three guard tests, swap to nested-if (as written) — likely matches.
 *   confidence: med
 */
/* func_020a553c — IRQ-guarded linear scan of a 4-entry table at p+0x30.
 *
 *   saved=OS_DisableIrq(); found=0;
 *   for (e = p+0x30; e < p+0x70; e += 0x10) {     // stride 0x10, 4 ents
 *       if (e->count < 2) continue;               // unsigned cmp
 *       off = a - e->base;                         // signed
 *       if (off < 0) continue;                     // bmi
 *       if ((unsigned)(off + c) > e->limit) continue;
 *       func_02094688(e->ptr + off, b, c);
 *       *(int*)p = 0;
 *       found = 1;
 *       break;
 *   }
 *   OS_RestoreIrq(saved); return found;
 */

typedef struct {
    int base;     /* +0x0 */
    int limit;    /* +0x4 */
    int ptr;      /* +0x8 */
    int count;    /* +0xc */
} Ent;

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern void func_02094688(int addr, int b, int c);

int func_020a553c(int p, int a, int b, int c) {
    int  found = 0;
    int  saved = OS_DisableIrq();
    Ent *e   = (Ent *)(p + 0x30);
    Ent *end = (Ent *)(p + 0x70);

    while (e < end) {
        if (e->count >= 2) {
            int off = a - e->base;
            if (off >= 0) {
                if ((unsigned int)(off + c) <= (unsigned int)e->limit) {
                    func_02094688(e->ptr + off, b, c);
                    *(int *)p = 0;
                    found = 1;
                    break;
                }
            }
        }
        e++;
    }

    OS_RestoreIrq(saved);
    return found;
}
