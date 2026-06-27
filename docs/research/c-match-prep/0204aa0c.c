/* CAMPAIGN-PREP candidate for func_0204aa0c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     outer branch-table sets (cls=r4,off=r5) pair; inner cmp/beq dispatch on func_020469b4(); per-mode base+off add; cls/off held callee-saved
 *   risk:       cls(r4)/off(r5) must survive the func_020469b4() call in callee-saved regs across the inner switch; mwcc will keep them callee-saved here, but the inner-switch base+off folding (each (int)BASE+~K) may collapse the mvn+add split to a pooled literal per arm. permuter-class (split-vs-pool per helper).
 *   confidence: low
 */
/* func_0204aa0c - main - class D (outer switch sets (cls,off) pair held in
 * r4/r5, then inner dispatch on func_020469b4() picks helper + base offset).
 * a0==0 -> 0. Outer switch on a0 (1..5) sets cls=6 and off=~K; case0/default
 * leave cls,off uninitialised. Inner: mode2->func_020480b4(cls, off-0xfa00);
 * mode4->func_0204931c(cls, 0xfffedef0+off); mode5->func_02050054(cls,
 * 0xfffeb7e0+off); else->func_0204525c(cls, 0xfffe90d0+off). Returns a0. */

extern int  func_020469b4(void);
extern void func_020480b4(int cls, int msg);
extern void func_0204931c(int cls, int msg);
extern void func_02050054(int cls, int msg);
extern void func_0204525c(int cls, int msg);

int func_0204aa0c(int a0) {
    int cls;            /* r4 - uninitialised in case0/default */
    int off;            /* r5 - uninitialised in case0/default */

    if (a0 == 0)
        return 0;

    switch (a0) {
    case 1: cls = 6; off = ~0x31; break;
    case 2: cls = 6; off = ~0x3b; break;
    case 3: cls = 6; off = ~0x1d; break;
    case 4: cls = 6; off = ~0x4f; break;
    case 5: cls = 6; off = ~0x13; break;
    }

    switch (func_020469b4()) {
    case 2:
        func_020480b4(cls, off - 0xfa00);
        break;
    case 4:
        func_0204931c(cls, (int)0xfffedef0 + off);
        break;
    case 5:
        func_02050054(cls, (int)0xfffeb7e0 + off);
        break;
    default:
        func_0204525c(cls, (int)0xfffe90d0 + off);
        break;
    }
    return a0;
}
