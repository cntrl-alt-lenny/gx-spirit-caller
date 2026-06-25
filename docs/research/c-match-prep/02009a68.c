/* CAMPAIGN-PREP candidate for func_02009a68 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     non-pow2 (0x1c) array index -> mla; pointer bound in callee-saved across call
 *   risk:       orig forms `sub r2,r0,#1; mov r1,#0x1c; mla r4,r2,r1,r3`. mwcc should emit the same mla for &arr[n-1] with stride 0x1c; only operand-order of the mla could drift. reshape-able.
 *   confidence: med
 */
/* func_02009a68: index an array of 0x1c-byte structs by (n-1), test+clear byte at +0x19.
   e (r4) is computed before bl func_02009968 and survives it (callee-saved). */
extern void func_02009968(int n);

typedef struct E021064b8 { char pad0[0x19]; unsigned char f19; char pad1[2]; } E021064b8; /* size 0x1c */
extern E021064b8 data_021064b8[];

int func_02009a68(int n)
{
    E021064b8 *e;
    if (n <= 0)
        return 0;
    e = &data_021064b8[n - 1];
    func_02009968(n);
    if (e->f19 != 1)
        return 0;
    e->f19 = 0;
    return 1;
}
