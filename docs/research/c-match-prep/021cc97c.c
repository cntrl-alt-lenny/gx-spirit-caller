/* CAMPAIGN-PREP candidate for func_021cc97c (ov004, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: movne/moveq bool-select stores, cached b500 base, msg(66,-1,0,1)
 *   risk:       permuter-class: the `data_022915e8` gate is materialized (movne#1;moveq#0;cmp) by orig but mwcc tends to branch direct (the 'materialized-bool-global' wall in ov004_core.h); the second 0202046c select shares its result reg into either store. Ships as .s.
 *   confidence: low
 */
/* func_ov004_021cc97c: ov004 frame teardown / re-init. Clears b500.9c/.a0,
 * branches on func_0202046c() (active?) to either func_0201d364()+disable or
 * func_0201d384(); then a materialized-bool global gate on data_022915e8; if
 * not locked, a second func_0202046c() select writes b500.54 or b500.48 and
 * fires func_02037208(66,-1,0,1); finally a guarded buffer-clear of the +0x94
 * handle.  Class D: movne/moveq bool selects + store-order. */
extern char data_ov004_0220b500[];
extern char data_ov004_022915e8[];
extern void func_0201d050(int v);
extern void func_0201d364(void);
extern void func_0201d384(void);
extern int  func_0202046c(void);
extern void func_02037208(int a, int b, int c, int d);
extern int  func_0208e0a0(void);
extern void func_02094504(int v, int dst, int n);

void func_ov004_021cc97c(void) {
    char *b = data_ov004_0220b500;
    int h;
    *(int *)(b + 0x9c) = 0;
    *(int *)(b + 0xa0) = 0;
    if (func_0202046c() != 0) {
        func_0201d364();
        func_0201d050(0);
    } else {
        func_0201d384();
    }
    if (*(int *)data_ov004_022915e8 == 0) {
        if (func_0202046c() != 0) {
            *(int *)(b + 0x54) = 1;
        } else {
            *(int *)(b + 0x48) = 0xb;
        }
        func_02037208(66, -1, 0, 1);
    }
    h = *(int *)(b + 0x94);
    if (h == 0) return;
    func_02094504(0, func_0208e0a0() + 0x200, 0x280);
    *(int *)(b + 0x94) = 0;
    *(int *)(b + 0x74) = 0;
}
