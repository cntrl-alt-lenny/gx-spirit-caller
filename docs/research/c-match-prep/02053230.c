/* CAMPAIGN-PREP candidate for func_02053230 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     u64 LCG hi-word; flag-branch picks pair; store-order calls
 *   risk:       permuter-class: ships-as-.s today (reg-alloc/sched-walled). 64x64 keeps mla r2,r4(=0),LIT0 live; if mwcc folds the known-zero hi half it drops one mla. Frame may reorder buf/dst.
 *   confidence: low
 */
/* func_02053230 (main, class D) — temper buffer then 64-bit LCG, return hi32.
 *   func_02093b00(ctx) fills 8 ints at sp+0x14; XOR-fold buf[i]^=buf[i-1] for i=1..7;
 *   func_02044c60(&dst) -> dst.flag picks which 8-byte pair feeds func_020536d0;
 *   then high word of (buf[7] * 0x5D588B656C078965 + 0x269EC3) -> func_020536c8;
 *   func_02053600(this, 1).
 */

typedef struct { int lo, hi; } Pair;
typedef struct { Pair p0; Pair p1; int flag; } Dst;

extern void func_02093b00(void *ctx);              /* fills 8 ints */
extern void func_02044c60(Dst *dst);
extern void func_020536d0(void *self, int a, int b);
extern void func_020536c8(void *self, int value);  /* stores at +0x8 */
extern void func_02053600(void *self, int k);

void func_02053230(void *self) {
    int buf[8];
    Dst dst;
    unsigned long long state;
    int i;

    func_02093b00(buf);
    for (i = 1; i < 8; i++)
        buf[i] = buf[i] ^ buf[i - 1];

    state = (unsigned)buf[7];          /* r5 = buf[7]; r4 = 0 (hi) */
    func_02044c60(&dst);
    if (dst.flag != 0)
        func_020536d0(self, dst.p0.lo, dst.p0.hi);
    else
        func_020536d0(self, dst.p1.lo, dst.p1.hi);

    func_020536c8(self,
        (int)((state * 0x5D588B656C078965ULL + 0x00269EC3ULL) >> 32));
    func_02053600(self, 1);
}
