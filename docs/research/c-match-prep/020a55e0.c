/* CAMPAIGN-PREP candidate for func_020a55e0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     infinite loop w/ OOB guard-call; store order f0,f4,f8,used; e/end pointers held
 *   risk:       reshape-able: store order is load-bearing (arg5 stack-load sits between f4 and f8); if mwcc hoists the [sp,#0x20] load, keep the four field stores in source order — as written they should match.
 *   confidence: med
 */
/* func_020a55e0 — IRQ-guarded "claim first free slot" in a 4-entry table.
 *
 *   saved=OS_DisableIrq();
 *   for (e = p+0x30; ; e += 0x10) {
 *       if (!(e < p+0x70)) func_02093bfc();   // OOB guard (panic-ish)
 *       if (e->used == 0) {                    // +0xc == 0 -> free
 *           e->f0 = a; e->f4 = b; e->f8 = c; e->used = arg5;
 *           break;
 *       }
 *   }
 *   OS_RestoreIrq(saved);
 *
 * 5th arg comes off the stack ([sp,#0x20]); store order is f0,f4,f8,used
 * with the arg5 load wedged between f4 and f8 in the orig.
 */

typedef struct {
    int f0;     /* +0x0 */
    int f4;     /* +0x4 */
    int f8;     /* +0x8 */
    int used;   /* +0xc */
} Slot;

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern void func_02093bfc(void);

void func_020a55e0(int p, int a, int b, int c, int arg5) {
    int   saved = OS_DisableIrq();
    Slot *e   = (Slot *)(p + 0x30);
    Slot *end = (Slot *)(p + 0x70);

    while (1) {
        if (e >= end) {
            func_02093bfc();
        }
        if (e->used == 0) {
            e->f0   = a;
            e->f4   = b;
            e->f8   = c;
            e->used = arg5;
            break;
        }
        e++;
    }

    OS_RestoreIrq(saved);
}
