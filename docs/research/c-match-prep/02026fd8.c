/* CAMPAIGN-PREP candidate for func_02026fd8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class C: bind r4=&data for Fill32+reloads; write arg via separate (slot-B) read; reload data.arg.
 *   risk:       reshape-able: orig holds &data in r4 across both Fill32s and the post-store reload [r4,#4], but uses a SECOND literal pool for the str; if mwcc folds both pools to one base or reuses arg0 instead of reloading, ldr/str layout diverges.
 *   confidence: med
 */
/* func_02026fd8: init for pool data_0219a924. Fill32(0,&data,8); data.arg=arg0;
 * if data.handle==0: alloc handle=Task_PostLocked(arg*0xe0,4,0), store, Fill32(0,handle,size).
 * Returns 1. Twin of 0x23f7c. NOTE: after storing arg via slot B, the size is
 * recomputed by RELOADING data.arg through the bound r4 (not reusing arg0). */

extern void Fill32(int v, void *dst, int size);
extern void *Task_PostLocked(int size, int a, int b);
extern char data_0219a924[];

struct Pool2 { void *handle; int arg; };

int func_02026fd8(int arg0) {
    struct Pool2 *a = (struct Pool2 *)data_0219a924;
    Fill32(0, a, 8);
    ((struct Pool2 *)(char *)data_0219a924)->arg = arg0;
    if (((struct Pool2 *)(char *)data_0219a924)->handle == 0) {
        int size = a->arg * 0xe0;
        void *h = Task_PostLocked(size, 4, 0);
        a->handle = h;
        Fill32(0, h, size);
    }
    return 1;
}
