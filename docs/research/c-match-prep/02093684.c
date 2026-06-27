/* CAMPAIGN-PREP candidate for func_02093684 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     64-bit subs/sbc diff; u16 clamp via mvn/lsl/lsr if-assign; MMIO strh in order
 *   risk:       struct-guessed + reshape-able: the two-stage sign test (subs r0,r5,#0 / sbcs r4 then subs #0x10000 / sbcs) compares a 64-bit diff to 0 and to 0x10000; my C condition is a placeholder and the boolean form WILL diverge — needs a 64-bit signed compare rewritten as the exact subs/sbcs pair (likely .s). func_020930b0 r0:r1 return ABI also guessed.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_02093684 (main, class D, MED tier) — EUR .s front-load.
 * UNVERIFIED + ITERATION-EXPECTED: 64-bit subtract + u16 clamp + MMIO strh stores.
 *   recipe:     CLASS D: 64-bit (lo,hi) sub via subs/sbc; clamp to unsigned 16-bit using mvn/lsl#16/lsr#16 if-assign; MMIO halfword writes at 0x04000104/0x106 in asm order
 *   risk:       see header below
 * func_02093684(obj): program a DS hardware timer from a 64-bit deadline.
 *   func_020930b0() -> now (r0=lo, r1=hi)
 *   *(u16*)0x04000106 = 0;                          // stop timer ctrl
 *   d_lo = obj->xc - now_lo;  d_hi = obj->x10 - now_hi (sbc);  // 64-bit diff
 *   func_02090690(1, func_02093294);                // re-arm alarm? (r0=1,r1=cb)
 *   if ((s64)diff < 0) reload = 0xfffe;             // underflow -> max-ish
 *   else { if ((s64)(diff - 0x10000) < 0)           // diff < 0x10000
 *              reload = (u16)(~d_lo);               // 0 - d_lo as u16
 *          else reload = 0; }
 *   *(u16*)0x04000104 = reload;                     // timer reload
 *   *(u16*)0x04000106 = 0xc1;                        // ctrl: enable+irq+presc
 *   func_02090624(0x10);
 * The clamp uses mvnlt r0,r5; lsl#16; lsr#16 => (u16)(~d_lo) only when diff<0x10000.
 */

extern void func_020930b0(void);   /* returns 64-bit now in r0:r1 */
extern void func_02090624(int a);
extern void func_02090690(int a, void *cb);
extern void func_020930b0_dummy(void);
extern void func_02093294(void);

typedef struct Tmr {
    char pad0[0xc];
    unsigned int xc;     /* 0x0c deadline lo */
    unsigned int x10;    /* 0x10 deadline hi */
} Tmr;

/* 64-bit now() helper typed to expose lo/hi */
typedef struct { unsigned int lo; unsigned int hi; } u64pair;
extern u64pair Now_020930b0(void);

void func_02093684(Tmr *obj) {
    u64pair now;
    unsigned int d_lo, d_hi;
    unsigned int reload;

    now = Now_020930b0();
    *(volatile unsigned short *)0x04000106 = 0;
    d_lo = obj->xc - now.lo;
    d_hi = obj->x10 - now.hi - (obj->xc < now.lo ? 1u : 0u);
    func_02090690(1, (void *)func_02093294);
    if ((int)d_hi < 0 || ((int)d_hi == 0 && d_lo == 0 && 0)) {
        reload = 0xfffe;
    } else if ((int)d_hi < 0 ||
               (d_hi == 0 && d_lo < 0x10000) ||
               ((int)d_hi == 0 && d_lo < 0x10000)) {
        reload = (~d_lo) & 0xffff;
    } else {
        reload = 0;
    }
    *(volatile unsigned short *)0x04000104 = (unsigned short)reload;
    *(volatile unsigned short *)0x04000106 = (unsigned short)0xc1;
    func_02090624(0x10);
}
