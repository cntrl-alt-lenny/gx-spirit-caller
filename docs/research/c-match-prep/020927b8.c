/* CAMPAIGN-PREP candidate for func_020927b8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C decl-order: save then cur then owner; bind cur(r7) once; reload owner each iter; break-on-claim
 *   risk:       mwcc may not keep cur live in a callee-saved reg across the loop (orig holds it in r7) — if spilled, extra ldr/str diverge. permuter-class.
 *   confidence: med
 */
// func_020927b8 — IRQ-guarded mutex/lock acquire spin loop
// r5=mtx param; r4=saved IRQ state; r7=data_021a63d0[1] (current thread/ctx, held); r6=0

extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int);
extern void *data_021a63d0[];
extern void func_02091a8c(void *mtx);            // block on lock
extern void func_02092668(void *cur, void *mtx); // first-acquire hook

typedef struct Thread Thread;

typedef struct Mtx {
    int  pad0;       // 0x0
    int  pad4;       // 0x4
    Thread *owner;   // 0x8
    int  count;      // 0xc
} Mtx;

struct Thread {
    char pad[0x84];
    Mtx *waiting;    // 0x84
};

void func_020927b8(Mtx *mtx) {
    int save;
    Thread *cur;
    Thread *owner;

    save = OS_DisableIrq();
    cur = (Thread *)data_021a63d0[1];
    while (1) {
        owner = mtx->owner;
        if (owner == 0) {
            mtx->owner = cur;
            mtx->count = mtx->count + 1;
            func_02092668(cur, mtx);
            break;
        }
        if (owner == cur) {
            mtx->count = mtx->count + 1;
            break;
        }
        cur->waiting = mtx;
        func_02091a8c(mtx);
        cur->waiting = 0;
    }
    OS_RestoreIrq(save);
}
