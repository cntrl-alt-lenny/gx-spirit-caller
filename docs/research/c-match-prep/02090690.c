/* CAMPAIGN-PREP candidate for func_02090690 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order preserved; (char*)base+idx*12 keeps three distinct bases; idx*12 CSE'd callee-saved
 *   risk:       reshape-able: byte-arith (char*)+idx*12 forces a single mul#0xc that CSEs into a callee-saved reg across the call; if mwcc instead refolds it per-store the 3 muls diverge. Bases are 4 apart (could be one struct) but orig uses 3 literals.
 *   confidence: med
 */
/* func_02090690 (main, cls C): three parallel stride-12 arrays indexed by
 * idx*12 (separate global bases, NOT one struct -> three pool words); the
 * idx*12 product (r4) is CSE'd and held callee-saved across the call.
 * Store order: 6384, 638c, (call), 6388. Shift arg = 1<<(idx+3). */
extern int data_021a6384[];
extern int data_021a6388[];
extern int data_021a638c[];
extern unsigned int func_02090624(unsigned int bit);

void func_02090690(int idx, int a, int b)
{
    *(int *)((char *)data_021a6384 + idx * 12) = a;
    *(int *)((char *)data_021a638c + idx * 12) = b;
    func_02090624(1U << (idx + 3));
    *(int *)((char *)data_021a6388 + idx * 12) = 1;
}
