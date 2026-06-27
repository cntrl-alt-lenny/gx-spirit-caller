/* CAMPAIGN-PREP candidate for func_021f9dac (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     2x bitfield extract (bit0,f5@5); state dispatch; ble pre-guarded do-while; cd744 branch
 *   risk:       loop counter r4 must stay live past the loop into 021ae6d0 arg3 and the n-vs-r ordering; if mwcc re-colours r4/r5 the bl args diverge. reshape-able via decl-order.
 *   confidence: low
 */
/* func_ov002_021f9dac (ov002, cls C): 2-state dispatch on ce288.f1460.
 * State 0: derive (bit0, 5-bit field@5) from self->f2, call 021b9e00 -> n;
 * loop r=1..n storing self->fc and probing 022577dc until nonzero; then a
 * cd744[bit0]==1 branch (store n into d016c+0xd44) else post via 021ae6d0;
 * advance state. State 1: replay using d016c+0xd44 through 021d91e0. */

typedef unsigned short u16;

struct Self21f9dac { u16 f0; u16 b0 : 1; u16 f5 : 5; u16 fc; };
struct Ce21f9dac   { char _a[0x5b4]; int f1460; };

extern struct Ce21f9dac data_ov002_022ce288;
extern int  data_ov002_022cd744[];
extern char data_ov002_022d016c[];   /* +0xd44 scalar slot */

extern int  func_ov002_021b9e00(int bit0, int f5);
extern int  func_ov002_022577dc(struct Self21f9dac *self);
extern void func_ov002_021ae6d0(int a, int b, int c, int d);
extern void func_ov002_021d91e0(int bit0, int f5, int neg);

int func_ov002_021f9dac(struct Self21f9dac *self) {
    if (data_ov002_022ce288.f1460 == 0) {
        int n = func_ov002_021b9e00(self->b0, self->f5);
        int r = 1;
        if (n > 1) {
            do {
                self->fc = (u16)r;
                if (func_ov002_022577dc(self) != 0) break;
            } while (++r < n);
        }
        if (data_ov002_022cd744[self->b0] == 1) {
            *(int *)(data_ov002_022d016c + 0xd44) = n;
        } else {
            func_ov002_021ae6d0(0x13d, 0x13e, r, n);
        }
        data_ov002_022ce288.f1460++;
        return 0;
    }
    if (data_ov002_022ce288.f1460 == 1) {
        self->fc = (u16)*(int *)(data_ov002_022d016c + 0xd44);
        func_ov002_021d91e0(self->b0, self->f5,
                            -*(int *)(data_ov002_022d016c + 0xd44));
        return 1;
    }
    return 1;
}
